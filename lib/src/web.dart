import 'dart:ui';
import 'dart:html' as html;

import 'impl.dart';

class NativeColorPicker extends ColorPickerImpl {
  @override
  void pickColor(Function(Color) onChanged, [Color value]) async {
    final element = html.InputElement(type: "color");
    if (value != null) {
      element.value = ColorPickerImpl.colorToString(value.value);
    } else {
      element.value = '#0000ff';
    }
    element.click();
    String _selectedColor;
    element.addEventListener('input', (event) {
      _updateColor(_selectedColor, event, onChanged);
    });
    element.addEventListener("change", (event) {
      _updateColor(_selectedColor, event, onChanged);
    });
  }

  void _updateColor(
      String _selectedColor, html.Event event, onChanged(Color value)) {
    try {
      _selectedColor = (event.target as dynamic).value;
    } catch (e) {
      print('Error Picking Color: $e');
    }
    if (_selectedColor != null) {
      onChanged(ColorPickerImpl.colorFromString(_selectedColor));
    }
  }
}
