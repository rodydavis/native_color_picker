[![Buy Me A Coffee](https://img.shields.io/badge/Donate-Buy%20Me%20A%20Coffee-yellow.svg)](https://www.buymeacoffee.com/rodydavis)
[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=WSH3GVC49GNNJ)
[![native_color_picker](https://img.shields.io/pub/v/native_color_picker.svg)](https://pub.dev/packages/native_color_picker)

# native_color_picker

A native color picker for Flutter.

Online Demo: https://rodydavis.github.io/native_color_picker/

Currently only supports web!

## Getting Started

### Web

Add this line to the body so that the color picker will work in safari:

```
<input type="color" style="visibility:hidden;" id="color-picker" />
```

You will receive an event for every time the color changes.

```dart
NativeColorPicker().pickColor((color) => print("New Color: $color"));
```

## Example

```dart
import 'package:flutter/material.dart';
import 'package:native_color_picker/native_color_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Color _color = Colors.white;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _color,
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.palette),
            onPressed: () {
              NativeColorPicker().pickColor((color) {
                if (mounted)
                  setState(() {
                    _color = color;
                  });
              }, _color);
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

```
