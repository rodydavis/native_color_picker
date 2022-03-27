import 'dart:ui';

// import 'package:color_panel/color_panel.dart';

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
    // if (Platform.isMacOS || Platform.isLinux || Platform.isWindows) {
    //   final _panel = ColorPanel.instance;
    //   if (_panel.showing) _panel.hide();
    //   _panel.show(onChanged, showAlpha: false);
    //   return;
    // }
    throw UnimplementedError('pickColor not supported');
  }
}
