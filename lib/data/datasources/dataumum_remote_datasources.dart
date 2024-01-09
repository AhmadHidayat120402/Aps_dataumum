import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tasklist_app/data/models/dataumum_model.dart';

class DataumumRemoteDatasource {
  static const String baseUrl = 'http://app2.tppkk-bitung.com/api';

  Future<DataUmum> postDataUmum(DataUmum taskResponseModel) async {
    final url = Uri.parse('$baseUrl/add-data-umum');
    final response = await http.post(
      url,
      body: jsonEncode(taskResponseModel.toJson()),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      // jika request berhasil
      final responseData = jsonDecode(response.body)['data'];
      return DataUmum(
          idKel: responseData['id_kel'],
          idKec: responseData['id_kec'],
          namaLing: responseData['nama_ling']);
    } else {
      throw Exception(
          'Gagal menambahkan data. Status code: ${response.statusCode}');
    }
  }
}
