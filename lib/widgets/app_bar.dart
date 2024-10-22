import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget titleWidget;
  final bool showBackButton;
  final List<Widget> actions;
  final VoidCallback? onBackPressed;

  const CustomAppBar({
    required this.titleWidget,
    required this.showBackButton,
    required this.actions,
    this.onBackPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                if (onBackPressed != null) {
                  onBackPressed!(); 
                } else {
                  Navigator.pop(context);
                }
              },
            )
          : null,
      title: Row(
        mainAxisAlignment: showBackButton ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
        children: [
          if (showBackButton) const SizedBox(width: 48), 
          Expanded(
            child: Center(child: titleWidget), 
          ),
          if (actions.isNotEmpty) const SizedBox(width: 48), 
        ],
      ),
      actions: actions,
      backgroundColor: const Color.fromARGB(255, 11, 94, 89),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
