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
      title: Text(
        title,
        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      actions: [
        onDelete != null ?
        IconButton(onPressed: onDelete, icon: const Icon(Icons.delete)) : Container()
      ],
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
