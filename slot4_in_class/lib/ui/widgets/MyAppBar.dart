import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(Icons.menu),

      centerTitle: true,

      title: const Text("My Flutter App"),

      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.settings))],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
