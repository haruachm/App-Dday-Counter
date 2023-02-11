import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff3e0e6),
        body: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: _DayPart(),
          ),
        ));
  }
}

class _DayPart extends StatelessWidget {
  const _DayPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Minsu 💌 Yunghui',
          style:
              TextStyle(fontFamily: 'Cookie', fontSize: 50, color: Colors.pink),
        ),
        Text(
          '우리의 사랑이 시작된',
          style: TextStyle(fontFamily: 'HiMelody', fontSize: 30),
        ),
        Text('2022. 12. 22',
            style: TextStyle(
              fontFamily: 'HiMelody',
              fontSize: 30,
            )),
        IconButton(
          iconSize: 60,
          onPressed: () {},
          icon: Icon(Icons.favorite),
          color: Colors.red,
        ),
        Text('D+365',
            style: TextStyle(
              fontFamily: 'HiMelody',
              fontSize: 70,
            )),
      ],
    );
  }
}
