import 'package:flutter/material.dart';
import 'MainPage.dart';
import 'RegisterPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _selectedRole = ""; // 선택된 버튼 상태 저장

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if ((username == 'senior' || username == 'junior') && password == 'password') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('로그인 실패! 아이디와 비밀번호를 확인하세요.'),
        ),
      );
    }
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
            const SizedBox(height: 50),
            const Text("로그인", style: TextStyle(fontSize: 20)),
            const SizedBox(height: 32),
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
            const SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF100A6C),
                minimumSize: const Size(235, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              onPressed: _login,
              child: const Text('로그인',
              style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const RegisterPage())
                );
              },
              child: const Text("  회원가입      |       비밀번호 찾기"),
            ),
          ],
        ),
      ),
    );
  }
}
