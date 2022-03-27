import 'dart:ui';

import 'package:flutter/material.dart';

import 'impl.dart';

class NativeColorPicker extends ColorPickerImpl {
  @override
  final Function(Color color) onChanged;

  @override
  final String id;

  NativeColorPicker({
    required this.id,
    required this.onChanged,
  });

  @override
  void pickColor([Color? value]) async {
    throw UnimplementedError('pickColor not supported');
  }
}
