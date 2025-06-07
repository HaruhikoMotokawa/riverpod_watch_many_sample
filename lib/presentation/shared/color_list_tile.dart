import 'package:flutter/material.dart';

class ColorListTile extends StatelessWidget {
  const ColorListTile({
    required this.color,
    this.enabled = true,
    super.key,
  });

  final MaterialColor color;
  final bool enabled;

  String get _colorName => switch (color) {
        Colors.red => 'Red',
        Colors.blue => 'Blue',
        Colors.yellow => 'Yellow',
        _ => 'Unknown Color',
      };

  String get _subtitle => switch (color) {
        Colors.red => '取得までに1秒かかります',
        Colors.blue => '取得までに5秒かかります',
        Colors.yellow => '取得までに10秒かかります',
        _ => 'unSupported Color',
      };

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enabled: enabled,
      leading: const Icon(Icons.color_lens),
      title: Text('Color: $_colorName'),
      subtitle: Text(_subtitle),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Color: $_colorName'),
            duration: const Duration(milliseconds: 500),
          ),
        );
      },
      tileColor: color,
    );
  }
}
