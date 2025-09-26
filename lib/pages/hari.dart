import 'package:flutter/material.dart';
import 'package:kuis/pages/landing_page.dart';

class Hari extends StatefulWidget {
  const Hari({super.key});

  @override
  State<Hari> createState() => _HariState();
}

class _HariState extends State<Hari> {
  final TextEditingController inputController = TextEditingController();

  String hasil = "";

void hari(){
  int? input = int.tryParse(inputController.text);
  List<String> hari = ["Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu", "Minggu"];
  setState(() {
    if (input != null && input >= 1 && input <= 7) {
      hasil = "Hari ${hari[input - 1]}";
    } else {
      hasil = "Input harus berupa angka 1 sampai 7";
    }
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 34, 72),
      appBar: AppBar(
        title: Text(
          "Cek Hari",
          style: TextStyle(
            color: const Color.fromARGB(255, 2, 34, 72),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context){
                  return LandingPage();
                }
                )
                );
            },
            icon: Icon(
              Icons.people,
              color: const Color.fromARGB(255, 2, 34, 72),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
          SizedBox(height: 30),
          TextFormField(
            controller: inputController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: "Masukkan angka (1-7)",
                labelStyle: TextStyle(
                  color: Colors.black
                ),
                border: OutlineInputBorder(),
                fillColor: Colors.white,
                filled: true
              ),
          ),
          SizedBox(height: 15),
          ElevatedButton(onPressed: (){
            setState(() {
              hari();
            });
          },
          child: const Text(
            "Cek Hari",
            style: TextStyle(
            color: Colors.white
          ),
          ),
          style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
          const Color.fromARGB(255, 25, 129, 190),
          ),
          ),
          ),
          SizedBox(height: 20),
          Text(
            hasil,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
        ),
      ),
    );
  }
}