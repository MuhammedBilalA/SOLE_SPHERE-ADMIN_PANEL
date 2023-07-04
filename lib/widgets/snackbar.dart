import 'package:flutter/material.dart';

import 'package:sole_sphere_admin/core/colors/colors.dart';

snackbarFailed({
  required String text,
  required BuildContext context,
}) {
  return ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        // width: 250,
        duration: const Duration(seconds: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: kred,
        content: Center(
            child: Text(
          text,
          style: TextStyle(color: kwhite, fontWeight: FontWeight.bold),
        ))));
}

snackbarSuccess({
  required String text,
  required BuildContext context,
}) {
  return ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        // width: 250,
        duration: const Duration(seconds: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: const Color.fromARGB(255, 11, 188, 17),
        content: Center(
            child: Text(
          text,
          style: const TextStyle(color: kwhite, fontWeight: FontWeight.bold),
        ))));
}
