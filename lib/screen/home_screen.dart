// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              _dayPart(),
              _dayPicturePart(),
            ],
          ),
        ),
      ),
    );
  }
}

class _dayPart extends StatefulWidget {
  const _dayPart({super.key});

  @override
  State<_dayPart> createState() => _dayPartState();
}

class _dayPartState extends State<_dayPart> {
  DateTime selectedDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

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
            onPressed: () {
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
                          onDateTimeChanged: (DateTime date) {
                            setState(() {
                              selectedDate = date;
                            });
                          },
                        )),
                  );
                },
              );
            },
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
