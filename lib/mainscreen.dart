import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'aistorypage.dart';
import 'loginscreen.dart';
import 'mypagescreen.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  bool _bearMoved = false;
  final List<Widget> _pages = [
    const Center(child: Text('홈 화면')),
    const AIStoryPage(),
    const Center(child: Text('육아 용품')),
    const MyPageScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFECA666),
        leadingWidth: 100,
        leading: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => setState(() => _currentIndex = 0),
            splashColor: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(70),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(
                'assets/logo.png',
                width: 80,
                height: 80,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        title: const SizedBox.shrink(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: TextButton(
              onPressed: () {
                // 로그인 버튼 터치 시 LoginScreen으로 이동
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                );
              },
              child: const Text(
                'LOGIN',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
        elevation: 0,
      ),
      body: _currentIndex == 0
          ? AnimatedAlign(
        alignment:
        _bearMoved ? Alignment.topCenter : Alignment.center,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        child: GestureDetector(
          onTap: () => setState(() => _bearMoved = !_bearMoved),
          child: Image.asset(
            'assets/bear.png',
            width: 400,
            height: 400,
          ),
        ),
      )
          : _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (idx) => setState(() => _currentIndex = idx),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: '홈화면'),
          BottomNavigationBarItem(
              icon: Icon(Icons.auto_stories), label: 'AI동화 구현'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag), label: '육아용품'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: '마이페이지'),
        ],
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        backgroundColor: const Color(0xFFECA666),
        elevation: 0,
      ),
    );
  }
}