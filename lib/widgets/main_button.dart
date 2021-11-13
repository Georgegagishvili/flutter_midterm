import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton(
      {Key? key,
      required this.title,
      required this.action,
      this.width,
      this.height})
      : super(key: key);
  final String title;
  final VoidCallback action;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width * 0.25,
        height: height ?? 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.blue),
        child: ElevatedButton(onPressed: action, child: Text(title)));
  }
}
