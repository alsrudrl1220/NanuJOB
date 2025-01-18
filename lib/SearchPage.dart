import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import "ChatPage.dart";

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedOption = '경영·사무';
  List<Map<String, dynamic>> actualData = [];

  // 필터링 API 호출
  Future<void> fetchFilteredData(int filterId) async {
    try {
      final dio = Dio();
      final response = await dio.get('http://192.168.185.169:8000/api/filter-senior/$filterId');
      if (response.statusCode == 200) {
        setState(() {
          actualData = (response.data as List)
              .map((data) => {
            '이름': data['name'] ?? 'N/A',
            '직무': data['job'] ?? 'N/A',
            '기업': data['company'] ?? 'N/A',
            '경력': '${data['career'] ?? 'N/A'}년',
            '업무': data['stack']?.join(', ') ?? 'N/A',
            '경험': data['experience'] ?? 'N/A',
          })
              .toList();
        });
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

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
  // 검색 API 호출
  Future<void> fetchData({String? keyword}) async {
    try {
      final dio = Dio();
      Response response;

      if (keyword == null || keyword.isEmpty) {
        response = await dio.get('http://192.168.185.169:8000/api/get-all-seniors');
      } else {
        response = await dio.post(
          'http://192.168.185.169:8000/api/search-senior',
          data: {'keyword': keyword},
          options: Options(
            headers: {'Content-Type': 'application/json'},
          ),
        );
      }

      if (response.statusCode == 200) {
        setState(() {
          actualData = (response.data as List)
              .map((data) => {
            '이름': data['name'] ?? 'N/A',
            '직무': data['job'] ?? 'N/A',
            '기업': data['company'] ?? 'N/A',
            '경력': '${data['career'] ?? 'N/A'}년',
            '업무': data['stack']?.join(', ') ?? 'N/A',
            '경험': data['experience'] ?? 'N/A',
          })
              .toList();
        });
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  // 드롭다운 선택에 따른 필터링
  void _onFilterChanged(String? newValue) {
    if (newValue == null) return;

    setState(() {
      _selectedOption = newValue;
    });

    // 드롭다운 값에 따라 필터 ID 매핑
    final filterMapping = {
      '경영·사무': 1,
      '마케팅·광고·홍보': 2,
      'IT·인터넷': 3,
      '무역·유통': 4,
      '생산·제조': 5,
      '영업·고객상담': 6,
      '건설': 7,
      '금융': 8,
      '연구개발·설계': 9,
      '디자인': 10,
      '미디어': 11,
      '전문·특수직': 12,
    };

    final filterId = filterMapping[newValue];
    if (filterId != null) {
      fetchFilteredData(filterId); // 필터링된 데이터 가져오기
    }
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
                    final query = _searchController.text.trim();
                    fetchData(keyword: query.isNotEmpty ? query : null);
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xFFDADADA), width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selectedOption,
                  isExpanded: true,
                  icon: const Icon(Icons.arrow_drop_down, color: Color(0xFF4F4F4F)),
                  dropdownColor: Colors.white,
                  style: const TextStyle(fontSize: 16, color: Color(0xFF4F4F4F)),
                  items: [
                    '경영·사무',
                    '마케팅·광고·홍보',
                    'IT·인터넷',
                    '무역·유통',
                    '생산·제조',
                    '영업·고객상담',
                    '건설',
                    '금융',
                    '연구개발·설계',
                    '디자인',
                    '미디어',
                    '전문·특수직',
                  ].map((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: _onFilterChanged,
                ),
              ),
            ),
            const SizedBox(height: 16),
            actualData.isEmpty
                ? const Expanded(
              child: Center(
                child: Text('검색 결과가 없습니다.'),
              ),
            )
                : Expanded(
              child: ListView.builder(
                itemCount: actualData.length,
                itemBuilder: (context, index) {
                  final item = actualData[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 0.1, color: Colors.black),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('업무: ${item['업무'] ?? 'N/A'}'),
                                GestureDetector(
                                  onTap: () {
                                    _showExperienceDialog(context, item);
                                  },
                                  child: const Text(
                                    "경험 보러 가기 >",
                                    style: TextStyle(color: Colors.black),
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ChatPage()),
          );
        },
        backgroundColor: const Color(0xFFD9D9D9),
        child: const Icon(Icons.chat_bubble),
        shape: const CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
