import 'package:flutter/material.dart';

class CustomPopScope extends StatelessWidget {
  final Widget child;

  const CustomPopScope({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true, 
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) {
          return;
        }

        // retour à la page précédente
        Navigator.of(context).pop(result);
      },
      child: child,
    );
  }
}
