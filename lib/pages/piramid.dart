import 'package:flutter/material.dart';
import 'package:kuis/pages/landing_page.dart';

class Piramid extends StatefulWidget {
  const Piramid({super.key});

  @override
  State<Piramid> createState() => _PiramidState();
}

class _PiramidState extends State<Piramid> {
  final TextEditingController panjangController = TextEditingController();
  final TextEditingController lebarController = TextEditingController();
  final TextEditingController tinggiController = TextEditingController();

  String hasil = "";

  String formatNumber(double value) {
  if (value % 1 == 0) {
    return value.toInt().toString();
  } else {
    return value.toStringAsFixed(2);
  }
}
  
  void hitung() {
    double? panjang = double.tryParse(panjangController.text);
    double? lebar = double.tryParse(lebarController.text);
    double? tinggi = double.tryParse(tinggiController.text);

    if (panjang != null && lebar != null && tinggi != null) {
      double luasAlas = panjang * lebar;
      double volume = (1 / 3) * luasAlas * tinggi;
      double keliling = 2 * (panjang + lebar);

      setState(() {
        hasil =
            "Volume: ${formatNumber(volume)} cm³ \nKeliling Alas: ${formatNumber(keliling)} cm²";
      });
    } else {
      setState(() {
        hasil = "Input tidak valid! Masukkan angka.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 34, 72),
      appBar: AppBar(
        title: const Text(
          "Hitung Piramid",
          style: TextStyle(
            color: Color.fromARGB(255, 2, 34, 72),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context){
                  return const LandingPage();
                }),
              );
            },
            icon: const Icon(
              Icons.people,
              color: Color.fromARGB(255, 2, 34, 72),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: panjangController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Panjang alas (dalam cm)",
                labelStyle: TextStyle(
                  color: Colors.black
                ),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: lebarController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Lebar alas (dalam cm)",
                labelStyle: TextStyle(
                  color: Colors.black
                ),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: tinggiController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Tinggi piramid (dalam cm)",
                labelStyle: TextStyle(
                  color: Colors.black
                ),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: hitung,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 25, 129, 190),
              ),
              child: const Text(
                "Hitung",
                style: TextStyle(
                  color: Colors.white
                ),
                ),
            ),
            const SizedBox(height: 20),
            Text(
              hasil,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}