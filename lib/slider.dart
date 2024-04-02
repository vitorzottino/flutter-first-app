import 'package:flutter/material.dart';

class ColorSlider extends StatelessWidget {
  final Color color;
  final double value;
  final void Function(double value) fn;
  const ColorSlider(
      {super.key, required this.color, required this.value, required this.fn});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Slider(
            activeColor: color,
            value: value,
            min: 0,
            max: 255,
            onChanged: fn,
          ),
        ),
        Text(
          '${value.toInt()}',
          style: const TextStyle(
              color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ],
    );
  }
}
