import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      //인덱스드 스택은 0번지가보임
      //bottom네비게이션이랑 무조건 같이 만드는 거
      body: IndexedStack(
        //벨류랑 연결시켜주면 됨
        index: _selectedIndex,
        children: [
          Center(child: Text("indexedStack1")),
          Center(child: Text("indexedStack2")),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        //현재 index 알려주기
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.black54,
        //손가락으로 터치하니까
        onTap: (value) {
          print("선택된 바텀 메뉴 $value");

          setState(() {
            _selectedIndex = value;
          });
          //setstate는 빌드를 다시해주는 거
          //값이 바뀌면서 리빌드 해주는 거
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "",
          ),
        ],
      ),
    );
  }
}
