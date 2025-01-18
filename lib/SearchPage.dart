import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedOption = '경영·사무';
  final List<Map<String, dynamic>> dummyData = [
    {
      '이름': '이름이름이름',
      '직무': '직무직무직무',
      '기업': '기업기업기업',
      '경력': '경력경력경력',
      '업무': '업무업무업무',
      '경험': '경험 내용 예시입니다.',
    },
    {
      '이름': '홍길동',
      '직무': '소프트웨어 엔지니어',
      '기업': 'ABC 회사',
      '경력': '5년',
      '업무': '모바일 앱 개발',
      '경험': 'Flutter 프로젝트 경험 상세 설명.',
    },
    {
      '이름': '김철수',
      '직무': '데이터 분석가',
      '기업': '데이터랩',
      '경력': '3년',
      '업무': '데이터 시각화 및 분석',
      '경험': '파이썬을 활용한 데이터 분석 경험.',
    },
  ];

  void _showExperienceDialog(BuildContext context, Map<String, dynamic> item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text('${item['이름'] ?? 'N/A'}'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('직무: ${item['직무'] ?? 'N/A'}'),
                const SizedBox(height: 8),
                Text('기업: ${item['기업'] ?? 'N/A'}'),
                const SizedBox(height: 8),
                Text('경력: ${item['경력'] ?? 'N/A'}'),
                const SizedBox(height: 8),
                Text('업무: ${item['업무'] ?? 'N/A'}'),
                const SizedBox(height: 8),
                Text('경험: ${item['경험'] ?? 'N/A'}'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('닫기'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: '검색어를 입력하세요',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    final query = _searchController.text;
                    print('검색어: $query');
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12), // 내부 여백
              decoration: BoxDecoration(
                color: Colors.white, // 배경색
                border: Border.all(
                  color: const Color(0xFFDADADA), // 테두리 색상
                  width: 1, // 테두리 두께
                ),
                borderRadius: BorderRadius.circular(8), // 테두리 둥글게
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selectedOption,
                  isExpanded: true, // 드롭다운 버튼을 컨테이너 너비에 맞게 확장
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Color(0xFF4F4F4F), // 아이콘 색상
                  ),
                  dropdownColor: Colors.white,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF4F4F4F), // 텍스트 색상
                  ),
                  items: <String>[
                    '경영·사무',
                    '마케팅·광고·홍보',
                    'IT·인터넷',
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        _selectedOption = newValue; // 선택된 값 업데이트
                      });
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            dummyData.isEmpty
                ? const Expanded(
              child: Center(
                child: Text('검색 결과가 없습니다.'),
              ),
            )
                : Expanded(
              child: ListView.builder(
                itemCount: dummyData.length,
                itemBuilder: (context, index) {
                  final item = dummyData[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 0.1,
                          color: Colors.black,
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // 하단 배치 설정
                      children: [
                        // 상단 정보
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['이름'] ?? 'N/A',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text('직무: ${item['직무'] ?? 'N/A'}'),
                            Text('기업: ${item['기업'] ?? 'N/A'}'),
                            Text('경력: ${item['경력'] ?? 'N/A'}'),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text('업무: ${item['업무'] ?? 'N/A'}'),
                                GestureDetector(
                                  onTap: () {
                                    _showExperienceDialog(
                                        context, item); // 전체 데이터를 전달
                                  },
                                  child: const Text(
                                    "경험 보러 가기 >",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Floating button pressed!');
        },
        backgroundColor: Color(0xFFD9D9D9),
        child: const Icon(Icons.chat_bubble),
        shape: const CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
