import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar(
    this.title,
    this.onDelete, {
    Key? key,
  }) : super(key: key);
  final String title;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 10,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: <Color>[Color(0xff232526), Color(0xff414345)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
      ),
      title: Text(
        title,
        style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.06,
            fontWeight: FontWeight.bold,
            fontFamily: 'Monospace'),
      ),
      actions: [
        onDelete != null
            ? IconButton(onPressed: onDelete, icon: const Icon(Icons.delete))
            : Container()
      ],
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
