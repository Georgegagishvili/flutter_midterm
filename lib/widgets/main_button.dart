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
    return InkWell(
      onTap: action,
      child: Ink(
        child: Container(
            alignment: Alignment.center,
            width: width ?? MediaQuery.of(context).size.width * 0.35,
            height: height ?? 45,
            decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xff1D4350),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(2),
                color: Colors.transparent),
            child: Text(
              title,
              style: const TextStyle(
                  color: Colors.black,
                  fontFamily: "Monospace",
                  fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}
