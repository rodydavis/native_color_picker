import 'dart:ui';
import 'dart:html' as html;

import 'package:flutter/material.dart';

import 'impl.dart';

class NativeColorPicker extends ColorPickerImpl {
  @override
  final Function(Color) onChanged;

  @override
  final String id;

  NativeColorPicker({
    @required this.id,
    @required this.onChanged,
  });

  html.InputElement element;
  String _selectedColor;

  @override
  void pickColor([Color value]) async {
    element = null;
    html.InputElement _colorElement = html.querySelector('#color-picker');
    element = _colorElement ?? html.InputElement(type: "color");
    element.id = id;
    if (value != null) {
      _selectedColor = ColorPickerImpl.colorToString(value.value);
    } else {
      _selectedColor = '#0000ff';
    }
    element.value = _selectedColor;
    element.click();
    element.select();
    element.style.visibility = 'hidden';

    element.addEventListener('input', _watch, false);
    element.addEventListener("change", _watch, false);
  }

  void _watch(html.Event event) {
    _updateColor(_selectedColor, event, onChanged);
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
