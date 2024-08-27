import 'package:flutter/material.dart';

Widget customTextformFiled({
  required String labelText,
  required String? Function(String?)? validateFun,
  required void Function(String?)? onSavedFun,
}) {
  return Container(
    height: 40,
    padding: EdgeInsets.only(left: 20),
    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
    decoration: BoxDecoration(
        color: const Color.fromARGB(255, 220, 219, 219),
        borderRadius: BorderRadius.circular(20)),
    child: TextFormField(
      validator: validateFun,
      onSaved: onSavedFun,
      decoration: InputDecoration(
        border: InputBorder.none,
        label: Text(
          labelText,
        ),
      ),
    ),
  );
}
