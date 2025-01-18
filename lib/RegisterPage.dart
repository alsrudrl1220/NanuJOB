import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'MainPage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordAckController = TextEditingController();
  String? _selectedJob;
  String? _selectedRole;

  void _showJobDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('직종 선택'),
          backgroundColor: Colors.white,
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFFD9D9D9), // 테두리 색상
                      width: 1, // 테두리 두께
                    ),
                    borderRadius: BorderRadius.circular(8), // 테두리 모서리 둥글게
                  ),
                  child: ListTile(
                    title: const Text('경영·사무'),
                    onTap: () {
                      setState(() {
                        _selectedJob = '경영·사무';
                      });
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFFD9D9D9), // 테두리 색상
                      width: 1, // 테두리 두께
                    ),
                    borderRadius: BorderRadius.circular(8), // 테두리 모서리 둥글게
                  ),
                  child: ListTile(
                    title: const Text('마케팅·홍보·홍보'),
                    onTap: () {
                      setState(() {
                        _selectedJob = '마케팅·홍보·홍보';
                      });
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFFD9D9D9), // 테두리 색상
                      width: 1, // 테두리 두께
                    ),
                    borderRadius: BorderRadius.circular(8), // 테두리 모서리 둥글게
                  ),
                  child: ListTile(
                    title: const Text('무역·유통'),
                    onTap: () {
                      setState(() {
                        _selectedJob = '무역·유통';
                      });
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFFD9D9D9), // 테두리 색상
                      width: 1, // 테두리 두께
                    ),
                    borderRadius: BorderRadius.circular(8), // 테두리 모서리 둥글게
                  ),
                  child: ListTile(
                    title: const Text('IT·인터넷'),
                    onTap: () {
                      setState(() {
                        _selectedJob = 'IT·인터넷';
                      });
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFFD9D9D9), // 테두리 색상
                      width: 1, // 테두리 두께
                    ),
                    borderRadius: BorderRadius.circular(8), // 테두리 모서리 둥글게
                  ),
                  child: ListTile(
                    title: const Text('생산·제조'),
                    onTap: () {
                      setState(() {
                        _selectedJob = '생산·제조';
                      });
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFFD9D9D9), // 테두리 색상
                      width: 1, // 테두리 두께
                    ),
                    borderRadius: BorderRadius.circular(8), // 테두리 모서리 둥글게
                  ),
                  child: ListTile(
                    title: const Text('영업·고객상담'),
                    onTap: () {
                      setState(() {
                        _selectedJob = '영업·고객상담';
                      });
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFFD9D9D9), // 테두리 색상
                      width: 1, // 테두리 두께
                    ),
                    borderRadius: BorderRadius.circular(8), // 테두리 모서리 둥글게
                  ),
                  child: ListTile(
                    title: const Text('건설'),
                    onTap: () {
                      setState(() {
                        _selectedJob = '건설';
                      });
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFFD9D9D9), // 테두리 색상
                      width: 1, // 테두리 두께
                    ),
                    borderRadius: BorderRadius.circular(8), // 테두리 모서리 둥글게
                  ),
                  child: ListTile(
                    title: const Text('금융'),
                    onTap: () {
                      setState(() {
                        _selectedJob = '금융';
                      });
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFFD9D9D9), // 테두리 색상
                      width: 1, // 테두리 두께
                    ),
                    borderRadius: BorderRadius.circular(8), // 테두리 모서리 둥글게
                  ),
                  child: ListTile(
                    title: const Text('연구개발·설계'),
                    onTap: () {
                      setState(() {
                        _selectedJob = '연구개발·설계';
                      });
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFFD9D9D9), // 테두리 색상
                      width: 1, // 테두리 두께
                    ),
                    borderRadius: BorderRadius.circular(8), // 테두리 모서리 둥글게
                  ),
                  child: ListTile(
                    title: const Text('디자인'),
                    onTap: () {
                      setState(() {
                        _selectedJob = '디자인';
                      });
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFFD9D9D9), // 테두리 색상
                      width: 1, // 테두리 두께
                    ),
                    borderRadius: BorderRadius.circular(8), // 테두리 모서리 둥글게
                  ),
                  child: ListTile(
                    title: const Text('미디어'),
                    onTap: () {
                      setState(() {
                        _selectedJob = '미디어';
                      });
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFFD9D9D9), // 테두리 색상
                      width: 1, // 테두리 두께
                    ),
                    borderRadius: BorderRadius.circular(8), // 테두리 모서리 둥글게
                  ),
                  child: ListTile(
                    title: const Text('전문·특수직'),
                    onTap: () {
                      setState(() {
                        _selectedJob = '전문·특수직';
                      });
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/AppLogoForLogin.png'),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedRole = "senior"; // "시니어" 선택
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedRole == "senior" ? const Color(0xFFBBBBBB) : Colors.white,
                    minimumSize: const Size(87, 87),
                    fixedSize: const Size(87, 87),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: _selectedRole == "senior" ? Color(0xFF5F5F5F) : Color(0xFFA2A2A2),
                        width: 3,
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
                    children: [
                      Image.asset(
                        'assets/SeniorEmoji.png',
                        width: 25, // 이미지 크기
                        height: 25,
                      ),
                      const SizedBox(height: 8), // 이미지와 텍스트 사이 간격
                      const Text(
                        "시니어",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 30),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedRole = "junior"; // "주니어" 선택
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedRole == "junior" ? const Color(0xFFBBBBBB) : Colors.white,
                    minimumSize: const Size(87, 87),
                    fixedSize: const Size(87, 87),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: _selectedRole == "junior" ? Color(0xFF5F5F5F) : Color(0xFFA2A2A2),
                        width: 3,
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
                    children: [
                      Image.asset(
                        'assets/JuniorEmoji.png',
                        width: 25, // 이미지 크기
                        height: 25,
                      ),
                      const SizedBox(height: 8), // 이미지와 텍스트 사이 간격
                      const Text(
                        "주니어",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const SizedBox(width: 55),
                _selectedJob == null
                    ? ElevatedButton(
                  onPressed: _showJobDialog,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(
                      width: 1,
                      color: Color(0xFFA2A2A2)
                    )
                  ),
                  child: const Text("직종 선택",
                  style: TextStyle(
                    color: Colors.black
                  ),),
                )
                    : ElevatedButton(
                  onPressed: _showJobDialog,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(
                          width: 1,
                          color: Color(0xFFA2A2A2)
                      )
                  ),
                  child: Text(_selectedJob!,
                      style: const TextStyle(
                      color: Colors.black
                  ),),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 235,
              child: TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: '이름',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 235,
              child: TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: '아이디',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 235,
              child: TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: '비밀번호',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 235,
              child: TextField(
                controller: _passwordAckController,
                decoration: const InputDecoration(
                  labelText: '비밀번호 확인',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
            ),
            const SizedBox(height: 55),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF100A6C),
                minimumSize: const Size(235, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text(
                '회원가입',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
