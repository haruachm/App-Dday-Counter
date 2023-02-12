# Couple D-Day APP
![image](https://user-images.githubusercontent.com/85959639/218298110-53fbfdeb-698e-47c7-8ff3-60817d958977.png)

</br>

---

## **앱 위젯들 적절한 위치에 배치**

### **MediaQuery.of(context).size.width**

**MediaQuery**의 경우 화면 크기를 얻을 수 있는데, 이는 보통 앱을 사용하는 디바이스의 가로나 세로 크기가 다르기 때문에 디바이스에 맞게 앱을 구성하는 '반응형'을 위해 사용하는 앱 내의 패키지이다.

아래의 코드를 사용해 디바이스 가로크기에 해당하는 부분을 모두 사용한다.

```dart
width: MediaQuery.of(context).size.width,
```

![https://blog.kakaocdn.net/dn/Cy7vJ/btrYSNotpIP/nKbx19C3FbCF8czskcsB80/img.png](https://blog.kakaocdn.net/dn/Cy7vJ/btrYSNotpIP/nKbx19C3FbCF8czskcsB80/img.png)

```dart
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Text('I Love You'),
            Text('우리의 사랑이 시작된'),
            Text('2022.12.22'),
            IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
            Text('D+365')
          ],
        ),
      ),
    );
  }
}
```

그러나 중앙에 배치 했음에도 위에 상단 노치에 가려서 해당 컨텐츠가 보이지 않는다. 이때 **SafeArea**를 사용한다.

### **SafeArea**

![https://blog.kakaocdn.net/dn/bMp3BX/btrYSOVgwIl/wWaWQX0KqkJnnBVSLcLHV1/img.png](https://blog.kakaocdn.net/dn/bMp3BX/btrYSOVgwIl/wWaWQX0KqkJnnBVSLcLHV1/img.png)

```dart
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Text('I Love You'),
              Text('우리의 사랑이 시작된'),
              Text('2022.12.22'),
              IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
              Text('D+365')
            ],
          ),
        ),
      ),
    );
  }
}
```

---

## **배경과 텍스트에 해당하는 위젯 꾸미기**

### **배경 색상 지정하기**

![https://blog.kakaocdn.net/dn/cqS037/btrYRQF20bv/JAcCeBBuvikjy0iimHKor0/img.png](https://blog.kakaocdn.net/dn/cqS037/btrYRQF20bv/JAcCeBBuvikjy0iimHKor0/img.png)

```dart
backgroundColor: Color(0xfff59db5),
```

### **폰트 및 위젯 색상 지정하기**

![https://blog.kakaocdn.net/dn/cQJGgb/btrYSq77qUP/7kVd65C1qRv9CLlKDT6tdK/img.png](https://blog.kakaocdn.net/dn/cQJGgb/btrYSq77qUP/7kVd65C1qRv9CLlKDT6tdK/img.png)

```dart
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffa3bc),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Text(
                'I Love You',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Cookie',
                  fontSize: 70,
                ),
              ),
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
              IconButton(
                iconSize: 50,
                color: Colors.red,
                onPressed: () {},
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
        ),
      ),
    );
  }
}
```

---

## **'_dayPart()' 로 위젯 코드 분리하기**

코드를 작성하다보니 main.dart에서 사용하는 HomeScreen 클래스의 코드가 너무 길어져서 관리하고 코드를 읽기가 어려워졌다. 그래서 위에서 다룬 디데이 화면을 따로 클래스를 분리하고 해당 클래스를 사용하는 방식을 해보도록 하겠다.

길어진 코드를 분리한 클래스는 main.dart에 사용되지 않고, 해당 파일에서만 사용하기 때문에 이름에 ' **_** '를 붙여 구분을 해준다.

'**_dayPart()**'를 새로 생성해 작성해주었다.

```dart
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
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: _dayPart(),
        ),
      ),
    );
  }
}

class _dayPart extends StatelessWidget {
  const _dayPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'I Love You',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Cookie',
            fontSize: 70,
          ),
        ),
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
        IconButton(
          iconSize: 50,
          color: Colors.red,
          onPressed: () {},
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
    );
  }
}
```

---

## **예쁜 커플 사진 넣어주기**

![https://blog.kakaocdn.net/dn/OCqY6/btrYT9dpjCk/LK7XqZCFaJqt6eQGgOFr30/img.png](https://blog.kakaocdn.net/dn/OCqY6/btrYT9dpjCk/LK7XqZCFaJqt6eQGgOFr30/img.png)

```dart
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffa3bc),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              _dayPart(),
              Image.asset('asset/img/couple_picture.jpg'),
            ],
          ),
        ),
      ),
    );
  }
}
```

---

## **크기가 큰 사진 첨부 시 'RenderFlex overflowed' 오류 메시지 해결**

![https://blog.kakaocdn.net/dn/Gki2k/btrYSOnpUNb/b0YKR8DH2DoduYvZXAPEw0/img.png](https://blog.kakaocdn.net/dn/Gki2k/btrYSOnpUNb/b0YKR8DH2DoduYvZXAPEw0/img.png)

아래와 같이 에러 메시지가 뜨는데, **403 픽셀만큼 디바이스 화면에서 넘어갔다**는 것을 알려준다.

이는 개발자 모드이기 때문에 나타나는 것이지, 실제로 배포했을 때는 노란 줄무늬는 뜨지 않는다.

```dart
A RenderFlex overflowed by 403 pixels on the bottom.
```

![https://blog.kakaocdn.net/dn/RNHG6/btrYRSxdrsM/RV1AElg9h6kkmms29P97OK/img.png](https://blog.kakaocdn.net/dn/RNHG6/btrYRSxdrsM/RV1AElg9h6kkmms29P97OK/img.png)

---

해당 에러를 해결하기 위해서는 위젯에서 나머지 부분을 차지하라는 위젯인 '**Expanded**'를 사용해줘야 한다.

### **Expanded 사용하기**

```dart
Expanded(child: Image.asset('asset/img/couple_picture.jpg')),
```

```dart
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffa3bc),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              _dayPart(),
              Expanded(child: Image.asset('asset/img/couple_picture.jpg')),
            ],
          ),
        ),
      ),
    );
  }
}
```

---

## **'_dayPicturePart()'로 위젯 코드 분리하기**

```dart
children: [
              _dayPart(),
              _dayPicturePart(),
            ],
```

```dart
class _dayPicturePart extends StatelessWidget {
  const _dayPicturePart({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Image.asset('asset/img/couple_picture.jpg'));
  }
}
```

---

## **화면에 위젯들 예쁘게 배치해보기**

### **Expanded 사용해 동일하게 공간 분배**

우선 동일하게 **Expanded**로 묶어 2개의 위젯이 화면의 절반씩 차지하도록 한다.

![https://blog.kakaocdn.net/dn/bKaET0/btrYSDGhlEY/U1xbgj2yVJawHz2uxKgTvK/img.png](https://blog.kakaocdn.net/dn/bKaET0/btrYSDGhlEY/U1xbgj2yVJawHz2uxKgTvK/img.png)

![https://blog.kakaocdn.net/dn/bHvQMD/btrYT86BqkG/nBGUqVp6lkg8UvuOvRWnEK/img.png](https://blog.kakaocdn.net/dn/bHvQMD/btrYT86BqkG/nBGUqVp6lkg8UvuOvRWnEK/img.png)

---

mainAxisAlignment

### **mainAxisAlignment 위젯들 간의 간격 조절**

```dart
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
```

### **위젯을 Column으로 묶어 위젯들 간의 간격 조절**

```dart
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
```

