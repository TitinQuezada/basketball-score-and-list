import 'package:flutter/material.dart';

class ApplicationAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool centerTitle;

  const ApplicationAppBar(this.title, {this.centerTitle = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: centerTitle,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.0);
}
