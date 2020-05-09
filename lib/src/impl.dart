import 'package:flutter/material.dart';
import 'package:color/color.dart' as color;

abstract class ColorPickerImpl {
  Function(Color) get onChanged;
  String get id;

  void pickColor([Color value]);

  static String colorToString(int val) {
    final c = Color(val);
    if (val == Colors.transparent.value) {
      return null;
    }
    return color.Color.rgb(c.red, c.green, c.blue).toHexColor().toCssString();
  }

  static Color colorFromString(String val) {
    if (val == null || val.isEmpty) return null;
    // if (val == colorToString(Colors.transparent.value)) return null;
    final c = color.HexColor(val);
    return Color.fromRGBO(c.r, c.g, c.b, 1.0);
  }
}
