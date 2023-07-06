import 'package:flutter/material.dart';
import 'package:sole_sphere_admin/core/colors/colors.dart';

class TitleTexFormField extends StatelessWidget {
  TitleTexFormField(
      {super.key,
      required this.title,
      required this.height,
      required this.inputType,
      required this.textEditingController,
      this.maxLength});
  String title;
  double height;
  TextInputType inputType;
  TextEditingController textEditingController;
  int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(color: kwhite, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: height,
          child: TextFormField(
            maxLength: maxLength,
            controller: textEditingController,
            keyboardType: inputType,
            expands: true,
            maxLines: null,
            cursorColor: kwhite,
            style: TextStyle(color: kwhite),
            decoration: InputDecoration(
              counterStyle: TextStyle(color: Colors.white),
              helperText: '',
              label: Text(
                title,
                style: TextStyle(color: kwhite),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: kwhite,
                  // width: 2.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: kwhite,
                  // width: 2.0,
                ),
              ),
              hintText: '  enter ${title.toLowerCase()}',
              hintStyle: const TextStyle(color: kwhite),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: kwhite,
                ),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'this field is requierd';
              } else {
                return null;
              }
            },
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
