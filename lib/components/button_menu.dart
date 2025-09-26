import 'package:flutter/material.dart';

Widget buttonmenu(
  BuildContext context, 
  String text, Widget route) {
  return Container(
    width: 200,
    height: 200,
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 25, 129, 190),
      borderRadius: BorderRadius.circular(20)
    ),
    child: TextButton(
      onPressed: (){
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context){
            return route;
          }
          )
          );
      }, 
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
      )
      ),
  );
}