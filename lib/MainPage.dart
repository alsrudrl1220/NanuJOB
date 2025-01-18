import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'SearchPage.dart';
import 'MyPage.dart';
import 'LoginPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const SearchPage(),
    const MyPage(),
  ];

  void _onNavItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/AppLogoForLogin.png',
              width: 100,
              height: 140,
            ),
            IconButton(
              icon: const Icon(
                Icons.arrow_forward, // 오른쪽 화살표 아이콘
                color: Colors.black, // 아이콘 색상 설정
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
          ],
        ),
        backgroundColor: Colors.white, // 앱바 배경을 하얀색으로 설정
        elevation: 0,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16), // 왼쪽 상단 둥글기
          topRight: Radius.circular(16), // 오른쪽 상단 둥글기
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onNavItemTapped,
          backgroundColor: const Color(0xFFD9D9D9), // 네브바 배경 색
          showSelectedLabels: false, // 선택된 아이템의 레이블 숨김
          showUnselectedLabels: false, // 선택되지 않은 아이템의 레이블 숨김
          items: [
            BottomNavigationBarItem(
              icon: Image.asset('assets/HomeIcon.png'),
              label: '', // 레이블 제거
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/SearchIcon.png"),
              label: '', // 레이블 제거
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/IconPage.png'),
              label: '', // 레이블 제거
            ),
          ],
        ),
      ),
    );
  }
}
