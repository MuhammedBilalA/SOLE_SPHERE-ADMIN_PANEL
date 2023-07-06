
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';



  Future<dynamic> loadingPopUp(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: Colors.transparent),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   
                    LoadingAnimationWidget.waveDots(
                      color: Colors.white,
                      size: 45,
                    ),
                  ],
                ),
              ),
            ));
  }

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