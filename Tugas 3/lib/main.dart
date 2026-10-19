import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalkulator BMI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      home: const BMIScreen(),
    );
  }
}

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  final _bbController = TextEditingController(); // _ = private
  final _tbController = TextEditingController();

  static const String _pesanAwal = "Masukkan Data Anda!!!";

  double? _hasilBMI; // ? apakah terisi atau tidak
  String _keterangan = _pesanAwal;
  String _jenisKelamin = 'Laki-laki'; // pilihan gender

  // Kategori BMI dibedakan berdasarkan jenis kelamin
  String _tentukanKategori(double hasil) {
    if (_jenisKelamin == 'Laki-laki') {
      if (hasil < 18) {
        return "Kurusss";
      } else if (hasil <= 25) {
        return "Mantap Euy Ideal";
      } else if (hasil <= 27) {
        return "Kelebihan Berat Badan";
      } else {
        return "Obesitas";
      }
    } else {
      // Perempuan
      if (hasil < 17) {
        return "Kurusss";
      } else if (hasil <= 23) {
        return "Mantap Euy Ideal";
      } else if (hasil <= 27) {
        return "Kelebihan Berat Badan";
      } else {
        return "Obesitas";
      }
    }
  }

  void _hitungBMI() {
    final double bb = double.tryParse(_bbController.text) ?? 0;
    final double tbCm = double.tryParse(_tbController.text) ?? 0;

    setState(() {
      if (bb > 0 && tbCm > 0) {
        final double tbM = tbCm / 100;
        final double hasil = bb / (tbM * tbM);

        _hasilBMI = hasil;
        _keterangan = _tentukanKategori(hasil);
      } else {
        _hasilBMI = null;
        _keterangan = "Data Tidak Valid!!!";
      }
    });
  }

  // Tombol Reset: kosongkan TextField & hapus hasil
  void _resetData() {
    FocusScope.of(context).unfocus(); // tutup keyboard
    _bbController.clear();
    _tbController.clear();

    setState(() {
      _hasilBMI = null;
      _keterangan = _pesanAwal;
      _jenisKelamin = 'Laki-laki';
    });
  }

  @override
  void dispose() {
    _bbController.dispose();
    _tbController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kalkulator BMI',
          style: TextStyle(fontWeight: .bold, letterSpacing: 5),
        ),
        centerTitle: true,
        backgroundColor: Colors.brown,
        leading: Icon(Icons.accessibility),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: .stretch,
            children: [
              // Pilihan jenis kelamin
              SegmentedButton<String>(
                segments: const [
                  ButtonSegment(
                    value: 'Laki-laki',
                    label: Text('Laki-laki'),
                    icon: Icon(Icons.male),
                  ),
                  ButtonSegment(
                    value: 'Perempuan',
                    label: Text('Perempuan'),
                    icon: Icon(Icons.female),
                  ),
                ],
                selected: {_jenisKelamin},
                onSelectionChanged: (pilihan) {
                  setState(() {
                    _jenisKelamin = pilihan.first;
                    // kalau hasil sudah ada, perbarui kategorinya
                    if (_hasilBMI != null) {
                      _keterangan = _tentukanKategori(_hasilBMI!);
                    }
                  });
                },
              ),

              SizedBox(height: 15),
              TextField(
                controller: _bbController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  icon: Icon(Icons.monitor_weight, size: 30),
                  labelText: 'Berat Badan',
                  labelStyle: TextStyle(letterSpacing: 5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              SizedBox(height: 15),
              TextField(
                controller: _tbController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  icon: Icon(Icons.height, size: 30),
                  labelText: 'Tinggi Badan',
                  labelStyle: TextStyle(letterSpacing: 5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _hitungBMI,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 20),
                      ),
                      child: Text('Hitung BMI', style: TextStyle(fontSize: 20)),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _resetData,
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 20),
                      ),
                      child: Text('Reset', style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 15),
              Text('Hasil : ', textAlign: .center),

              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text(
                      _hasilBMI?.toStringAsFixed(1) ?? 'Nilai Kosong',
                      style: TextStyle(fontSize: 50, fontWeight: .bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      _hasilBMI != null
                          ? '$_jenisKelamin: $_keterangan'
                          : _keterangan,
                      style: TextStyle(fontSize: 20, color: Colors.red),
                      textAlign: .center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
