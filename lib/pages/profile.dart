import 'package:flutter/material.dart';
import 'package:kuis/pages/landing_page.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color.fromARGB(255, 2, 34, 72),
      appBar: AppBar(
        title: Text(
          "Halo",
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
              Icons.home,
              color: const Color.fromARGB(255, 2, 34, 72),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(
                  "assets/img/FotoBiru.jpeg"
                ), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _infoRow("Nama", "Alfiyan Masduqi"),
            _infoRow("NIM", "124230070"),
            _infoRow("Tempat & Tanggal Lahir", "Bantul, 8 Desember 2002"),
            _infoRow("Hobi", "Basket"),
          ],
        ),
      ),
    );
  }
  Widget _infoRow(String label, String value) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: double.infinity,
      decoration: BoxDecoration(
      ),
      child: Row(
        children: [
          
          Text(
            "$label : ",
            style: const TextStyle(fontWeight: FontWeight.bold,
            color: Colors.white),
          ),
          Expanded(
            child: Text(
              value, 
              style: TextStyle(
                color: Colors.white
                ),
                ),
          ),
        ],
      ),
    );
  }
}