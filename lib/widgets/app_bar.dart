import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget titleWidget;
  final List<Widget> actions;
  final bool showBackButton;

  const CustomAppBar({
    super.key,
    required this.titleWidget,
    this.actions = const [],
    required this.showBackButton,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent, 
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/appBar.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      elevation: 0,
      title: titleWidget,
      centerTitle: false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0); 
}