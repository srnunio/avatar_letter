library avatar_letter;

import 'package:flutter/material.dart';

enum LetterType { Rectangle, Circular, None }

Color parseColor({required String hexCode}) {
  String hex = hexCode.replaceAll("#", "");
  if (hex.isEmpty) hex = "000000";
  if (hex.length == 3) {
    hex =
        '${hex.substring(0, 1)}${hex.substring(0, 1)}${hex.substring(1, 2)}${hex.substring(1, 2)}${hex.substring(2, 3)}${hex.substring(2, 3)}';
  }
  Color col = Color(int.parse(hex, radix: 16));
  return col;
}

class AvatarLetter extends StatelessWidget {
  final LetterType letterType;
  final String? text;
  final double fontSize;
  final FontWeight fontWeight;
  final String? fontFamily;
  late final Color backgroundColor;
  final String? backgroundColorHex;
  late final Color textColor;
  final String? textColorHex;
  late final double size;
  final int numberLetters;
  final bool upperCase;

  AvatarLetter(
      {Key? key,
      this.letterType = LetterType.Rectangle,
      required this.text,
      required this.textColor,
      required this.textColorHex,
      required this.backgroundColor,
      required this.backgroundColorHex,
      this.size = 32,
      this.numberLetters = 1,
      this.fontWeight = FontWeight.bold,
      this.fontFamily,
      this.fontSize = 16,
      this.upperCase = false}) {
    assert(numberLetters > 0);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    size = (size < 30.0) ? 50.0 : size;
    backgroundColor = _colorBackgroundConfig();
    textColor = _colorTextConfig();
    return _leeterView();
  }

  Color _colorBackgroundConfig() {
    if (backgroundColorHex == null)
      return Colors.black;
    else if (backgroundColorHex != null)
      return parseColor(hexCode: backgroundColorHex!);
    return backgroundColor;
  }

  Color _colorTextConfig() {
    if (textColorHex == null)
      return Colors.white;
    else if (textColorHex != null) return parseColor(hexCode: textColorHex!);
    return textColor;
  }

  String _runeString({required String value}) {
    return String.fromCharCodes(value.runes.toList());
  }

  String _textConfig() {
    var newText = text == null ? '?' : _runeString(value: text!);
    newText = upperCase ? newText.toUpperCase() : newText;
    var arrayLeeters = newText.trim().split(' ');
    if (arrayLeeters.length > 1 && arrayLeeters.length == numberLetters) {
      return '${arrayLeeters[0][0].trim()}${arrayLeeters[1][0].trim()}';
    }
    return '${newText[0]}';
  }

  Widget _buildText() {
    final _textStyle = TextStyle(
      color: textColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
    );

    return Text(
      _textConfig(),
      style: fontFamily == null
          ? _textStyle
          : _textStyle.copyWith(fontFamily: fontFamily),
    );
  }

  _buildTypeLeeter() {
    switch (letterType) {
      case LetterType.Rectangle:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        );
      case LetterType.Circular:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size / 2),
        );
      case LetterType.None:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        );
    }
  }

  Widget _leeterView() {
    return Container(
      child: Material(
        shape: _buildTypeLeeter(),
        color: backgroundColor,
        child: Container(
          height: size,
          width: size,
          child: Center(
            child: _buildText(),
          ),
        ),
      ),
    );
  }
}
