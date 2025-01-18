import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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
    Container(
      margin: EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xffDEE2E6), width: 1.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text('내가 시니어라면?'
                '\n생성형 AI와 대화를 나누며'
                '\n나의 경력을 자랑해보세요!', style: TextStyle(fontSize: 20),),
          ],
        ),
      ),
    ),
    Container(
      color: Colors.green,
      child: Center(child: Text("슬라이드 2", style: TextStyle(fontSize: 24, color: Colors.white))),
    ),
    Container(
      color: Colors.red,
      child: Center(child: Text("슬라이드 3", style: TextStyle(fontSize: 24, color: Colors.white))),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // 상단 문구
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('OO님,', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),),
              Text('경험을 나누고,', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),),
              Text('같이 성장해볼까요?', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),),
            ],
          ),
          SizedBox(height: 25,),

          // 슬라이더 위젯
          Column(
            children: [
              // CarouselSlider 구현
              CarouselSlider(
                carouselController: _controller,  // CarouselSliderController 사용
                options: CarouselOptions(
                  aspectRatio: 2.0,  // 화면 비율
                  enlargeCenterPage: true,  // 가운데 슬라이드를 크게 표시
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
          SizedBox(height: 25,),

          // 최근에 조회한 시니어
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('최근에 조회한 시니어', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
              Text('나의 관심 직무 시니어 경험 확인하기', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),
              Container(
                margin: EdgeInsets.only(bottom: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xffDEE2E6), width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/ic-smile.png', width: 32, height: 32,),
                          Text('시니어 1', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
                        ],
                      ),
                      Text('ㅇㅇㅇ 직무', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
                    ],
                  ),
                ),
              ),
            ],
          ),



        ],
      ),
    );
  }
}