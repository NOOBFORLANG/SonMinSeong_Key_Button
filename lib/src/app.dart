import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:bank/src/pages/key_button.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  String value = "0";
  final List _key = [
    ["7", "8", "9"],
    ["4", "5", "6"],
    ["1", "2", "3"],
    ["AC", "0", Icons.arrow_back]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: Text("송금하기"),
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "보낼 금액을 입력하세요!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            _resultView(),
            _keyButtonView(),
          ],
        ),
      ),
    );
  }

  Widget _resultView() {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "$value 원",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),
    );
  }

  Widget _keyButtonView() {
    return Column(
      children: List.generate(
          _key.length,
          (y) => Row(
                children: List.generate(
                  _key[y].length,
                  (x) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: KeyButton(
                        label: _key[y][x],
                        onTap: () {
                          if (x == 0 && y == 0) {
                            // 7 눌렀을때
                            print("7번 클릭됨");
                            value = "7" + value;
                            print("value 값 : $value");
                            _resultView();
                            _keyButtonView();
                          } else if (x == 1 && y == 0) {
                            // 8 눌렀을때
                            print("8번 클릭됨");
                            value = "8" + value;
                            print("value 값 : $value");
                            _resultView();
                            _keyButtonView();
                          } else if (x == 2 && y == 0) {
                            // 9 눌렀을때
                            print("9번 클릭됨");
                            value = "9" + value;
                            print("value 값 : $value");
                          } else if (x == 0 && y == 1) {
                            // 4 눌렀을때
                            print("4번 클릭됨");
                            value = "4" + value;
                            print("value 값 : $value");
                          } else if (x == 1 && y == 1) {
                            // 8 눌렀을때
                            print("5번 클릭됨");
                            value = "5" + value;
                            print("value 값 : $value");
                          } else if (x == 0 && y == 3) {
                            // AC 눌렀을때 초기화
                            value = "0";
                            print("value 값 : $value");
                          } else if (value is String) {
                            value = "A" + value;
                            print("value 의 값 $value");
                          }
                          //if (value is String) {
                          //switch (Void) {
                          //case 6:
                          //print("6이 눌렸음");
                          //value = "6" + value;
                          //case
                          //}
                          //} else {
                          //print(" 123");
                          //}
                        },
                      ),
                    ),
                  ),
                ),
              )),
    );
  }
}
