import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'ChatPage.dart';
import 'MainPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;  // 현재 페이지를 추적할 변수
  final CarouselSliderController _controller = CarouselSliderController(); // CarouselSliderController 사용

  // 슬라이드로 보여줄 아이템
  final List<Widget> carouselWidgets = [
    // 슬라이더 위젯 컨테이너
    Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0xffDEE2E6), width: 1.4),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(45, 35, 45, 0),
          child: Column(
            children: [
              Text('내가 시니어라면?', style: TextStyle(fontSize: 20, height: 1.2),
              ),
              Text('생성형 AI와 대화를 나누며', style: TextStyle(fontSize: 20, height: 1.2),
              ),
              Text('나의 경력을 자랑해보세요!', style: TextStyle(fontSize: 20, height: 1.2),
              ),
              SizedBox(height: 25,),
              Image.asset(
                'assets/HomeChat.png',
                height: 45,
              ),
            ],
          ),
        ),
      ),
    ),
    Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0xffDEE2E6), width: 1.4),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(45, 35, 45, 0),
          child: Column(
            children: [
              Text('내가 주니어라면?', style: TextStyle(fontSize: 20, height: 1.2),
              ),
              Text('시니어의 경험을 보며', style: TextStyle(fontSize: 20, height: 1.2),
              ),
              Text('나의 역량을 키워보세요!', style: TextStyle(fontSize: 20, height: 1.2),
              ),
              SizedBox(height: 25,),
              Image.asset(
                'assets/HomeChat.png',
                height: 45,
              ),
            ],
          ),
        ),
      ),
    ),
    Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0xffDEE2E6), width: 1.4),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(45, 35, 45, 0),
          child: Column(
            children: [
              Text('내가 주니어라면?', style: TextStyle(fontSize: 20, height: 1.2),
              ),
              Text('시니어의 경험을 보며', style: TextStyle(fontSize: 20, height: 1.2),
              ),
              Text('나의 역량을 키워보세요!', style: TextStyle(fontSize: 20, height: 1.2),
              ),
              SizedBox(height: 25,),
              Image.asset(
                'assets/HomeChat.png',
                height: 45,
              ),
            ],
          ),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ChatPage()),
          );
        },
        backgroundColor: Color(0xFFD9D9D9),
        child: const Icon(Icons.chat_bubble),
        shape: const CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. 상단 문구
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'OO님,',
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '경험',
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: Color(0xff0A00C0)),
                        ),
                        TextSpan(
                          text: '을 나누고,',
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '같이 ',
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                        ),
                        TextSpan(
                          text: '성장',
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xff0A00C0)),
                        ),
                        TextSpan(
                          text: '해볼까요?',
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25,),
        
              // 2. 슬라이더 위젯
              Column(
                children: [
                  // CarouselSlider 구현
                  CarouselSlider(
                    carouselController: _controller,  // CarouselSliderController 사용
                    options: CarouselOptions(
                      aspectRatio: 1.5,  // 화면 비율
                      enlargeCenterPage: true,  // 가운데 슬라이드를 크게 표시
                      viewportFraction: 1.0,  // 각 슬라이드가 화면을 가득 채우도록 설정
                      scrollDirection: Axis.horizontal,  // 슬라이드 방향
                      autoPlay: true,  // 자동 재생
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;  // 페이지 변경 시 현재 인덱스 업데이트
                        });
                      },
                    ),
                    items: carouselWidgets,  // 슬라이드에 표시할 아이템들
                  ),
                  SizedBox(height: 10,),
        
                  // 페이지 인덱스 표시
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: carouselWidgets.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.jumpToPage(entry.key),
                        child: Container(
                          width: 8.0,
                          height: 8.0,
                          margin: EdgeInsets.symmetric(horizontal: 4.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current == entry.key
                                ? Color(0xff1C159D)
                                : Color(0xffC8C8C8),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
              SizedBox(height: 30,),
        
              // 3. 최근에 조회한 시니어
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('최근에 조회한 시니어', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),),
                      Text('나의 관심 직무 시니어 경험 확인하기', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),
                    ],
                  ),
                  IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              // 카드
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,  // 가로 스크롤
                // padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Container(
                      width: 140,
                      margin: EdgeInsets.only(bottom: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0xffDEE2E6), width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center, // Row 내부 아이콘과 텍스트를 가운데 정렬
                              children: [
                                Image.asset('assets/ic-smile.png', width: 27, height: 27,),
                                SizedBox(width: 7,),
                                Text('시니어 1', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
                              ],
                            ),
                            SizedBox(height: 5,),
                            Text('ㅇㅇㅇ 직무', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
                            SizedBox(height: 15,),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff0F0A6B),
                                surfaceTintColor: Color(0xff0F0A6B),
                              ),
                              onPressed: () {},
                              child: Text('조회', style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 15,),
                    Container(
                      width: 140,
                      margin: EdgeInsets.only(bottom: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0xffDEE2E6), width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center, // Row 내부 아이콘과 텍스트를 가운데 정렬
                              children: [
                                Image.asset('assets/ic-smile.png', width: 27, height: 27,),
                                SizedBox(width: 7,),
                                Text('시니어 1', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
                              ],
                            ),
                            SizedBox(height: 5,),
                            Text('ㅇㅇㅇ 직무', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
                            SizedBox(height: 15,),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff0F0A6B),
                                surfaceTintColor: Color(0xff0F0A6B),
                              ),
                              onPressed: () {},
                              child: Text('조회', style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 15,),
                    Container(
                      width: 140,
                      margin: EdgeInsets.only(bottom: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0xffDEE2E6), width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center, // Row 내부 아이콘과 텍스트를 가운데 정렬
                              children: [
                                Image.asset('assets/ic-smile.png', width: 27, height: 27,),
                                SizedBox(width: 7,),
                                Text('시니어 1', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
                              ],
                            ),
                            SizedBox(height: 5,),
                            Text('ㅇㅇㅇ 직무', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
                            SizedBox(height: 15,),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff0F0A6B),
                                surfaceTintColor: Color(0xff0F0A6B),
                              ),
                              onPressed: () {},
                              child: Text('조회', style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}