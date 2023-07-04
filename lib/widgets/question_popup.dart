
import 'package:flutter/material.dart';

Future<dynamic> questionPopUp({required BuildContext context,required String title, void Function()? function,required String yes,required String no}) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
         title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                no,
                style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              )),
          TextButton(
              onPressed:function,
              child: Text(
                yes,
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }