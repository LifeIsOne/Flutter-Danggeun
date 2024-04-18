import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '01_home/HomeScreen.dart';
import '02_neighborhood_life/eighborhoodLifeScreen.dart';
import '03_near_me/NearMeScreen.dart';
import '04_chatting/ChattingScreen.dart';
import '05_my_carrot/my_carrot_screen.dart';

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
          HomeScreen(),
          /* index: 1, 동네생활*/
          NeighborhoodLifeScreen(),
          /* index: 2, 내 근처*/
          NearMeScreen(),
          /* index: 3, 채팅*/
          ChattingScreen(),
          /* index: 4, 나의 당근*/
          MyCarrotScreen(),
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