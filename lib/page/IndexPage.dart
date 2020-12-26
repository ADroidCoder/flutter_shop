import 'package:flutter/material.dart';
import 'package:flutter_shop/page/FindePage.dart';
import 'package:flutter_shop/page/HomePage.dart';
import 'package:flutter_shop/page/MInePage.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "主页"),
    BottomNavigationBarItem(icon: Icon(Icons.find_in_page), label: "发现"),
    BottomNavigationBarItem(icon: Icon(Icons.people), label: "我的"),
  ];

  final List<Widget> children = [
    HomePage(),
    FindPage(),
    MinePage()
  ];

  PageController _pageController = PageController();

  var _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Shop"),
      ),
      body: PageView(
        children: children,
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: _items,
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
      ),
    );
  }
}
