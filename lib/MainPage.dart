import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'SearchPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  // 각 탭에 해당하는 실제 페이지 위젯 추가
  final List<Widget> _pages = [
    const HomePage(),
    const SearchPage(),
    const SettingsPage(),
  ];

  void _onNavItemTapped(int index) {
    setState(() {
      _currentIndex = index; // 선택된 탭 인덱스 업데이트
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Image.asset(
            'assets/AppLogoForLogin.png',
            height: 60,
          ),
        ),
        leadingWidth: 120,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: _pages[_currentIndex], // 선택된 페이지 표시
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onNavItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '검색',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '설정',
          ),
        ],
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('검색 페이지'),
      ),
      body: const Center(
        child: Text('여기는 검색 페이지입니다.'),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('설정 페이지'),
      ),
      body: const Center(
        child: Text('여기는 설정 페이지입니다.'),
      ),
    );
  }
}
