import 'package:flutter/material.dart';
import 'package:sheep_care/config.dart';

class LayerOne extends StatelessWidget {
  const LayerOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 854,
      decoration: const BoxDecoration(
        color: layerOneBg,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(60.0),
          bottomRight: Radius.circular(60.0)
        ),
      ),
    );
  }
}