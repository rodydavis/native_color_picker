import 'package:flutter/material.dart';
import 'package:native_color_picker/native_color_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Native Color Picker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      darkTheme: ThemeData.dark(),
      home: MyHomePage(title: 'Color Picker Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Color> _colors = [Colors.red];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Wrap(
        children: [
          for (var i = 0; i < _colors.length; i++)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                elevation: 10,
                color: _colors[i],
                child: InkWell(
                  child: Icon(Icons.palette),
                  onTap: () {
                    NativeColorPicker(
                      id: 'color_picker_$i',
                      onChanged: (color) {
                        if (mounted)
                          setState(() {
                            _colors[i] = color;
                          });
                      },
                    ).pickColor(_colors[i]);
                  },
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (mounted)
            setState(() {
              _colors.add(Colors.blue);
            });
        },
        tooltip: 'Add Color',
        child: Icon(Icons.add),
      ),
    );
  }
}
