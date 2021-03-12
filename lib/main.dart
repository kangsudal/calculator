import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter로 만드는 계산기앱',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _resultText = '계산결과22'; //출력화면-결과값
  String _formulaText; //출력화면-계산식

  void _changeFormulaText() {
    //
    setState(() {});
  }

  void _changeResultText() {
    //
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          OutputContainer(screenHeight, screenWidth), //출력화면
          DeleteButton(), //삭제버튼
          Divider(),
          Expanded(child: InputContainer()), //입력키버튼
        ],
      ),
    );
  }

  Widget OutputContainer(double screenHeight, screenWidth) {
    return Container(
      height: screenHeight * 0.3,
      width: screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          //입력계산식 보여주는 화면
          TextField(
            onChanged: (String val) => _formulaText = val,
          ),
          //입력계산결과 보여주는 화면
          Text(_resultText),
        ],
      ),
    );
  }

  Widget DeleteButton() {
    return IconButton(icon: Icon(Icons.backspace), onPressed: () {});
  }

  Widget InputContainer() {
    List val_list = List.generate(10, (index) => index);
    List keyboard_list = ([
      1,2,3,4,5,6,7,8,9,0,
    ].map((val) =>
        TextButton(onPressed: _changeFormulaText, child: Text("$val")))).toList();
    return GridView.count(
      physics: new NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      children: keyboard_list,
    );
  }
}
