import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
  });

  @override
  State<MainScreen> createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          /* index: 0*/
          Center(
            child: Text("홈 화면"),
          ),
          /* index: 1*/
          Center(
            child: Text("동네생활 화면"),
          ),
          /* index: 2*/
          Center(
            child: Text("내 근처 화면"),
          ),
          /* index: 3*/
          Center(
            child: Text("채팅 화면"),
          ),
          /* index: 4*/
          Center(
            child: Text("나의 당근 화면"),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar( /* 하단 아이콘 셀렉 바*/
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (i) {
          setState(() {
            _selectedIndex = i;
          });
        },
        items: const [
          BottomNavigationBarItem(label: "홈", icon: Icon(CupertinoIcons.home)),
          BottomNavigationBarItem(label: "동네생활", icon: Icon(CupertinoIcons.square_on_square)),
          BottomNavigationBarItem(label: "내 근처", icon: Icon(CupertinoIcons.placemark)),
          BottomNavigationBarItem(label: "채팅", icon: Icon(CupertinoIcons.chat_bubble_2)),
          BottomNavigationBarItem(label: "나의 당근", icon: Icon(CupertinoIcons.person)),
        ],
      ),
    );
  }
}
