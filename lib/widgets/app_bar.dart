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
          gradient: LinearGradient(
            colors: [
              Color(0xFF47B2A3), // Une couleur verte douce
              Color(0xFF70D4B4), // Une couleur plus claire pour créer un effet de dégradé
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
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
  Size get preferredSize => const Size.fromHeight(150.0);
}
