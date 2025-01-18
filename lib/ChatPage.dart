import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [
    {'sender': 'gpt', 'message': '안녕하세요!'},
    {'sender': 'gpt', 'message': '직무와 관련된 경험을 저에게 공유해주세요.'}
  ]; // 초기 메시지 추가
  final Dio _dio = Dio();

  Future<void> sendMessage(String message) async {
    try {
      // 사용자 메시지 추가
      setState(() {
        _messages.add({'sender': 'user', 'message': message});
      });

      print('Sending data: {"content": "$message", "user_id": "add test"}');

      // POST 요청
      final response = await _dio.post(
        'http://192.168.185.169:8000/ai',
        data: {
          'content': message,
          'user_id': 'add test',
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json', // JSON 형식 명시
          },
        ),
      );
      if (response.statusCode == 200) {
        setState(() {
          _messages.add({'sender': 'gpt', 'message': response.data});
        });
      } else {
        setState(() {
          _messages.add({'sender': 'gpt', 'message': 'Error: ${response.statusCode}'});
        });
      }
    } catch (e) {
      // 에러 메시지 출력
      setState(() {
        _messages.add({'sender': 'gpt', 'message': 'Error: $e'});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/AppLogoForLogin.png',
              width: 100,
              height: 140,
            ),
          ],
        ),
        backgroundColor: Colors.white, // 앱바 배경을 하얀색으로 설정
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isUser = message['sender'] == 'user';
                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isUser ? Color(0xFF3B3B3B) : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      message['message'] ?? '',
                      style: TextStyle(
                        color: isUser ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // 입력 필드 및 전송 버튼
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: '메시지를 입력하세요',
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          final message = _controller.text.trim();
                          if (message.isNotEmpty) {
                            sendMessage(message); // 메시지 전송
                            _controller.clear(); // 입력 필드 초기화
                          }
                        },
                        icon: const Icon(
                          Icons.send,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16), // 왼쪽 상단 둥글기
        topRight: Radius.circular(16), // 오른쪽 상단 둥글기
      ),
      child: BottomNavigationBar(
        currentIndex: 0,
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
