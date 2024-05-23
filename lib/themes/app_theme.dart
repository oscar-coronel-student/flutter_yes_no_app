import 'package:flutter/material.dart';


const Color _customColor = Color(0xFF49149F);

const List<Color> _colorThemes = <Color>[
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];


class AppTheme {

  final int selectedColor;

  const AppTheme({
    this.selectedColor = 0
  }):
    assert( selectedColor >= 0 && selectedColor <= _colorThemes.length - 1, 'Longitud inválida');

  ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      // brightness: Brightness.dark,
      colorSchemeSeed: _colorThemes[selectedColor],
      appBarTheme: AppBarTheme(
        backgroundColor: _colorThemes[selectedColor],
        titleTextStyle: const TextStyle( fontSize: 20, color: Colors.white )
      )
    );
  }

}