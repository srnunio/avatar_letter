import 'package:avatar_letter/avatar_letter.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
  String _input = "avatar letter";
  Color _colorBackgroundHex = Colors.blueGrey;
  Color _colorText = Colors.white;
  int _numberLetters = 1;
  LetterType _letterType = LetterType.None;

  String _selectLetterTypes = 'None';
  String _selectNumberTypes = '1';
  String _selectColorBackground = 'blueGrey';
  String _selectColorText = 'white';
  bool _upperCase = false;

  static const letterTypes = <String>[
    'Rectangle',
    'Circular',
    'None',
  ];

  static const numberLetters = <String>[
    '1',
    '2',
  ];

  static const colors = <String>[
    'blueGrey',
    'white12',
    'green',
    'white',
    'amber',
    'black',
  ];

  final List<DropdownMenuItem<String>> _letterMenu = letterTypes
      .map((String value) => DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          ))
      .toList();
  final List<DropdownMenuItem<String>> _letterNumbersMenu = numberLetters
      .map((String value) => DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          ))
      .toList();

  final List<DropdownMenuItem<String>> _letterColorBackgroundMenu = colors
      .map((String value) => DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          ))
      .toList();

  final List<DropdownMenuItem<String>> _letterColorTextMenu = colors
      .map((String value) => DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
            margin: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AvatarLetter(
                  size: 200,
                  backgroundColor: _colorBackgroundHex,
                  textColor: _colorText,
                  fontSize: 100,
                  upperCase: _upperCase,
                  numberLetters: _numberLetters,
                  letterType: _letterType,
                  text: _input,
                ),
                SizedBox(
                  height: 50,
                ),
                ListTile(
                  title: Text('UpperCase'),
                  trailing: Switch(value: _upperCase, onChanged: (bool value){
                    setState(() {
                      _upperCase = value;
                    });
                  }),
                ),
                ListTile(
                  title: Text('Letter Type'),
                  trailing: DropdownButton<String>(
                    value: _selectLetterTypes,
                    items: _letterMenu,
                    onChanged: (String value) {
                      _selectLetterTypes = value;
                      setState(() {
                        if (letterTypes[0] == value) {
                          _letterType = LetterType.Rectangle;
                        } else if (letterTypes[1] == value) {
                          _letterType = LetterType.Circular;
                        } else if (letterTypes[2] == value) {
                          _letterType = LetterType.None;
                        }
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Number letter '),
                  trailing: DropdownButton<String>(
                    value: _selectNumberTypes,
                    items: _letterNumbersMenu,
                    onChanged: (String value) {
                      _selectNumberTypes = value;
                      setState(() {
                        if (numberLetters[0] == value) {
                          _numberLetters = 1;
                        } else if (numberLetters[1] == value) {
                          _numberLetters = 2;
                        }
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Color background '),
                  trailing: DropdownButton<String>(
                    value: _selectColorBackground,
                    items: _letterColorBackgroundMenu,
                    onChanged: (String value) {
                      _selectColorBackground = value;
                      setState(() {
                        if (colors[0] == value) {
                          _colorBackgroundHex = Colors.blueGrey;
                        } else if (colors[1] == value) {
                          _colorBackgroundHex = Colors.white12;
                        } else if (colors[2] == value) {
                          _colorBackgroundHex = Colors.green[800];
                        } else if (colors[3] == value) {
                          _colorBackgroundHex = Colors.white;
                        } else if (colors[4] == value) {
                          _colorBackgroundHex = Colors.amber;
                        }else if (colors[5] == value) {
                          _colorBackgroundHex = Colors.black;
                        }
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Color text '),
                  trailing: DropdownButton<String>(
                    value: _selectColorText,
                    items: _letterColorTextMenu,
                    onChanged: (String value) {
                      _selectColorText = value;
                      setState(() {
                        if (colors[0] == value) {
                          _colorText = Colors.blueGrey;
                        } else if (colors[1] == value) {
                          _colorText = Colors.white12;
                        } else if (colors[2] == value) {
                          _colorText = Colors.green[800];
                        } else if (colors[3] == value) {
                          _colorText = Colors.white;
                        } else if (colors[4] == value) {
                          _colorText = Colors.amber;
                        }else if (colors[5] == value) {
                          _colorText = Colors.black;
                        }
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: _input,
                    ),
                    onChanged: (value) {
                      setState(() {
                        print('${_input}');
                        _input = value.isEmpty ? '?' : value;
                      });
                    },
                  ),
                )
              ],
            )),
      ),
    );
  }
}
