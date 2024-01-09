// data_umum_model.dart
class DataUmum {
  final int idKec;
  final int idKel;
  final String namaLing;

  DataUmum({
    required this.idKec,
    required this.idKel,
    required this.namaLing,
  });

  factory DataUmum.fromJson(Map<String, dynamic> json) {
    return DataUmum(
      idKec: json['id_kec'],
      idKel: json['id_kel'],
      namaLing: json['nama_ling'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id_kec": idKec,
      "id_kel": idKel,
      "nama_ling": namaLing,
    };
  }
}
