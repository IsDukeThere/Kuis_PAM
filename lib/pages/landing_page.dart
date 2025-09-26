import 'package:flutter/material.dart';
import 'package:kuis/components/button_menu.dart';
import 'package:kuis/pages/hari.dart';
import 'package:kuis/pages/piramid.dart';
import 'package:kuis/pages/profile.dart';
import 'package:kuis/pages/waktu.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

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
                  return Profile();
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
      body: Container(
        margin: EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buttonmenu(context, 'Piramid', const Piramid()),
                buttonmenu(context, 'Konversi Waktu', const Waktu()),
              ],
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsetsGeometry.only(left: 28)),
                buttonmenu(context, 'Cek Hari', const Hari()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
