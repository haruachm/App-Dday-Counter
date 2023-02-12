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

class _dayPart extends StatelessWidget {
  const _dayPart({super.key});

  @override
  Widget build(BuildContext context) {
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
                '2022.12.22',
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
                          onDateTimeChanged: (DateTime date) {},
                        )),
                  );
                },
              );
            },
            icon: Icon(Icons.favorite),
          ),
          Text(
            'D+365',
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
