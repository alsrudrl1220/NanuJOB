import 'package:flutter/material.dart';
import 'MainPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordAckController = TextEditingController();
  String? _selectedJob;

  void _showJobDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('직종 선택'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text('경영·사무'),
                  onTap: () {
                    setState(() {
                      _selectedJob = '경영·사무';
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('마케팅·광고·홍보'),
                  onTap: () {
                    setState(() {
                      _selectedJob = '마케팅·광고·홍보';
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('무역·유통'),
                  onTap: () {
                    setState(() {
                      _selectedJob = '무역·유통';
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('IT·인터넷'),
                  onTap: () {
                    setState(() {
                      _selectedJob = 'IT·인터넷';
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('상담·제조'),
                  onTap: () {
                    setState(() {
                      _selectedJob = '상담·제조';
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('영입·고객상담'),
                  onTap: () {
                    setState(() {
                      _selectedJob = '영입·고객상담';
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('건설'),
                  onTap: () {
                    setState(() {
                      _selectedJob = '건설';
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('금융'),
                  onTap: () {
                    setState(() {
                      _selectedJob = '금융';
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('연구개발·설계'),
                  onTap: () {
                    setState(() {
                      _selectedJob = '연구개발·설계';
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('디자인'),
                  onTap: () {
                    setState(() {
                      _selectedJob = '디자인';
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('미디어'),
                  onTap: () {
                    setState(() {
                      _selectedJob = '미디어';
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('전문·특수직'),
                  onTap: () {
                    setState(() {
                      _selectedJob = '전문·특수직';
                    });
                    Navigator.pop(context);
                  },
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

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username == 'admin' && password == 'password') {
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/AppLogoForLogin.png'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text("시니어")),
                const SizedBox(width: 30),
                ElevatedButton(onPressed: () {}, child: const Text("청년")),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text("직종"),
                const SizedBox(width: 16),
                _selectedJob == null
                    ? ElevatedButton(
                  onPressed: _showJobDialog,
                  child: const Icon(Icons.add),
                )
                    : ElevatedButton(
                  onPressed: _showJobDialog,
                  child: Text(_selectedJob!),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: '이름',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: '아이디',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: '비밀번호',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordAckController,
              decoration: const InputDecoration(
                labelText: '비밀번호 확인',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _login,
              child: const Text('회원가입'),
            ),
          ],
        ),
      ),
    );
  }
}
