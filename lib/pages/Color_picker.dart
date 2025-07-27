import 'dart:math';

import 'package:colorpickerapp/constant/colors.dart';
import 'package:colorpickerapp/widgets/color_display.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ColorPickerPage extends StatefulWidget {
  const ColorPickerPage({super.key});

  @override
  State<ColorPickerPage> createState() => _ColorPickerPageState();
}

class _ColorPickerPageState extends State<ColorPickerPage> {
  Color selectedColor = Colors.blue;
  bool isCircular = false;
  bool isShowColorname = true;
  void _randomcolorpick() {
    final colors = renklerr.keys.toList();
    final randomvariable = Random().nextInt(colors.length);
    final randomcolor = colors[randomvariable];
    setState(() {
      selectedColor = randomcolor;
    });
  }

  void _showcolorscode() {
    Fluttertoast.showToast(
      msg:
          "RGB : (${selectedColor.red}, ${selectedColor.blue}, ${selectedColor.green})",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: selectedColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void _containershapechange() {
    setState(() {
      isCircular = !isCircular;
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Picker',
        ),
        
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              setState(() {
                isShowColorname = !isShowColorname;
              });
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: 'a',
                  child: Row(
                    children: [
                      Icon(
                        isShowColorname
                            ? Icons.visibility_off
                            : Icons.visibility,
                        size: 20,
                        color: Colors.black54,
                      ),
                      SizedBox(width: 8),
                      Text(isShowColorname ? 'Hide name' : 'Show name'),
                    ],
                  ),
                ),
              ];
            },
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),

      body: Center(
        child: Column(
          children: [
            SizedBox(height: 25),
            ColorDisplay(selectedColor: selectedColor, isCircular: isCircular),

            SizedBox(height: 30),
            isShowColorname
                ? Text(renklerr[selectedColor] ?? 'Seçilen Renk')
                : SizedBox(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DropdownButton<Color>(
                  value: selectedColor,
                  items: renklerr.entries.map((entry) {
                    return DropdownMenuItem(
                      value: entry.key,
                      child: Row(
                        children: [
                          Container(width: 20, height: 20, color: entry.key),
                          SizedBox(width: 5),
                          Text(entry.value),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedColor = value!;
                    });
                  },
                ),
                ElevatedButton(
                  onPressed: _randomcolorpick,
                  child: Text('Random'),
                ),
                IconButton(onPressed: _showcolorscode, icon: Icon(Icons.info)),
                IconButton(
                  onPressed: () {
                    _containershapechange();
                  },
                  icon: Icon(
                    isCircular ? Icons.square_outlined : Icons.circle_outlined,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

