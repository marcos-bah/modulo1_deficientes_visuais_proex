import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void showMessageError({required BuildContext context, required String text}) {
  final snackBar = SnackBar(
    content: Text(
      text,
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.red,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showMessageSucess({required BuildContext context, required String text}) {
  final snackBar = SnackBar(
    content: Text(
      text,
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.green,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
