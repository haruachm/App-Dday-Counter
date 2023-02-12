// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffa3bc),
      body: SafeArea(
        bottom: false,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              _dayPart(
                selectedDate: selectedDate,
                onPressed: onHeartPressed, // 아래에 함수 따로 정의해서 한눈에 보이도록
              ),
              _dayPicturePart(),
            ],
          ),
        ),
      ),
    );
  }

  onHeartPressed() {
    final DateTime now = DateTime.now();
    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              color: Colors.white,
              height: 300,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: selectedDate,
                maximumDate: DateTime(
                  now.year,
                  now.month,
                  now.day,
                ),
                onDateTimeChanged: (DateTime date) {
                  setState(() {
                    selectedDate = date;
                  });
                },
              )),
        );
      },
    );
  }
}

class _dayPart extends StatelessWidget {
  final DateTime selectedDate;
  final VoidCallback onPressed; //onPressed 부분 외부의 상위위젯에서 받아오기

  _dayPart({
    required this.selectedDate,
    required this.onPressed, //onPressed 부분 받아오기
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'I Love You',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Cookie',
              fontSize: 70,
            ),
          ),
          Column(
            children: [
              Text(
                '우리의 사랑이 시작된',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'HiMelody',
                  fontSize: 30,
                ),
              ),
              Text(
                '${selectedDate.year}.${selectedDate.month}.${selectedDate.day}',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'HiMelody',
                  fontSize: 30,
                ),
              ),
            ],
          ),
          IconButton(
            iconSize: 50,
            color: Colors.red,
            onPressed: onPressed, //외부에서 onPressed 받아오기
            icon: Icon(Icons.favorite),
          ),
          Text(
            'D+${DateTime(
                  now.year,
                  now.month,
                  now.day,
                ).difference(selectedDate).inDays + 1}',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'HiMelody',
              fontSize: 60,
            ),
          ),
        ],
      ),
    );
  }
}

class _dayPicturePart extends StatelessWidget {
  const _dayPicturePart({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Image.asset('asset/img/couple_picture.jpg'));
  }
}
