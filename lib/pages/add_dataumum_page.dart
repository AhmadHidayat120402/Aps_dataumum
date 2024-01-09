import 'package:flutter/material.dart';
import 'package:tasklist_app/data/datasources/dataumum_remote_datasources.dart';
import 'package:tasklist_app/data/models/dataumum_model.dart';

class DataUmumPage extends StatefulWidget {
  const DataUmumPage({super.key});

  @override
  State<DataUmumPage> createState() => _DataUmumPageState();
}

class _DataUmumPageState extends State<DataUmumPage> {
  // buatkan controller untuk menangkap value inputan
  final idKelController = TextEditingController();
  final namaLingController = TextEditingController();
  final idKecController = TextEditingController();
  final DataumumRemoteDatasource apiService = DataumumRemoteDatasource();

  Future<void> _postDataUmum() async {
    final dataUmum = DataUmum(
      idKel: int.parse(idKelController.text),
      namaLing: namaLingController.text,
      idKec: int.parse(idKecController.text),
    );

    try {
      final result = await apiService.postDataUmum(dataUmum);
      // Tindakan setelah berhasil
      print('Data berhasil ditambahkan: ${result.namaLing}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Data berhasil ditambahkan: ${result.namaLing}'),
          duration: const Duration(seconds: 2),
        ),
      );
    } catch (e) {
      // Tindakan jika terjadi kesalahan
      print('Gagal menambahkan data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Stack(
          children: [
            ClipPath(
              clipper: CLipPathClass(),
              child: Container(
                height: 350,
                color: Colors.blue,
                width: double.infinity,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  margin: const EdgeInsets.only(top: 52),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 600,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                "Input Data",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Container(
                              width: 320,
                              height: 350,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 4,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(18),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextField(
                                      controller: idKecController,
                                      decoration: InputDecoration(
                                        prefixIcon:
                                            const Icon(Icons.date_range),
                                        hintText: 'ID Kecamatan',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    TextField(
                                      controller: idKelController,
                                      decoration: InputDecoration(
                                        prefixIcon:
                                            const Icon(Icons.date_range),
                                        hintText: 'ID Kelurahan',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    TextField(
                                      controller: namaLingController,
                                      decoration: InputDecoration(
                                        prefixIcon:
                                            const Icon(Icons.edit_document),
                                        hintText: 'Nama Lingkungan',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Center(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: const Size(100, 40),
                                          backgroundColor: Colors.blue,
                                          foregroundColor: Colors.white,
                                        ),
                                        onPressed: () {
                                          _postDataUmum();
                                        },
                                        child: const Text('Simpan'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CLipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 60);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 60,
    );
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
