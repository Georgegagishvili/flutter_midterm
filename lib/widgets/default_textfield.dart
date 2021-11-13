import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField({
    Key? key,
    required this.controller,
    required this.label,
    this.isNumeric = false,
  }) : super(key: key);
  final TextEditingController controller;
  final String label;
  final bool isNumeric;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xff1D4350)),
        borderRadius: BorderRadius.circular(6)
      ),
      child: TextFormField(controller: controller,decoration: InputDecoration(
        labelText: label,
        contentPadding: const EdgeInsets.only(left: 10),
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
      ),keyboardType: isNumeric ? TextInputType.number : TextInputType.text,),
    );
  }
}
