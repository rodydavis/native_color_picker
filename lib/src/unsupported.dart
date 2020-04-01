import 'dart:ui';

import 'impl.dart';

class NativeColorPicker extends ColorPickerImpl {
  @override
  void pickColor(Function(Color) onChanged, [Color value]) async {
    throw UnimplementedError('pickColor not supported');
  }
}
