import 'package:flutter/material.dart';
import 'package:kuis/pages/landing_page.dart';

class Waktu extends StatefulWidget {
  const Waktu({super.key});

  @override
  State<Waktu> createState() => _WaktuState();
}

class _WaktuState extends State<Waktu> {
  final TextEditingController jamController = TextEditingController();
  final TextEditingController menitController = TextEditingController();

  String hasilWIB = "";
  String hasilWITA = "";
  String hasilWIT = "";

  void konversi() {
    // Validasi input
    if (jamController.text.isEmpty || menitController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Harap isi jam dan menit terlebih dahulu")),
      );
      return;
    }

    try {
      int jam = int.parse(jamController.text);
      int menit = int.parse(menitController.text);

      if (jam < 0 || jam > 23 || menit < 0 || menit > 59) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Jam harus 0–23 dan menit 0–59")),
        );
        return;
      }

      // Waktu WIB dari input user
      DateTime waktuWIB = DateTime(2025, 9, 26, jam, menit);

      // Konversi ke WITA dan WIT
      DateTime waktuWITA = konversiZonaWaktu(waktuWIB, 1);
      DateTime waktuWIT = konversiZonaWaktu(waktuWIB, 2);

      setState(() {
        hasilWIB = "WIB  : ${formatWaktu(waktuWIB)}";
        hasilWITA = "WITA : ${formatWaktu(waktuWITA)}";
        hasilWIT = "WIT  : ${formatWaktu(waktuWIT)}";
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Masukkan angka yang valid")),
      );
    }
  }

  DateTime konversiZonaWaktu(DateTime waktuWIB, int selisihJam) {
    return waktuWIB.add(Duration(hours: selisihJam));
  }

  String formatWaktu(DateTime dt) {
    return "${dt.hour.toString().padLeft(2, '0')}:"
        "${dt.minute.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 34, 72),
      appBar: AppBar(
        title: const Text(
          "Konversi Waktu",
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
                MaterialPageRoute(builder: (context) {
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
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Konversi Zona Waktu (WIB → WITA/WIT)",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 20),

            // Input jam & menit
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: jamController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Jam (0–23)",
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: menitController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Menit (0–59)",
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Tombol konversi
            Center(
              child: ElevatedButton(
                onPressed: konversi,
                child: const Text(
                  "Konversi Waktu",
                  style: TextStyle(
                    color: Colors.white
                  ),),
                style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 25, 129, 190),
          ),
          ),
              ),
            ),

            const SizedBox(height: 20),

            // Hasil konversi
            Text(hasilWIB, style: const TextStyle(color: Colors.white, fontSize: 16)),
            Text(hasilWITA, style: const TextStyle(color: Colors.white, fontSize: 16)),
            Text(hasilWIT, style: const TextStyle(color: Colors.white, fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
