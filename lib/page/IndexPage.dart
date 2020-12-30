import 'package:flutter/material.dart';
import 'package:flutter_shop/page/FindePage.dart';
import 'package:flutter_shop/page/HomePage.dart';
import 'package:flutter_shop/page/MInePage.dart';
import 'package:flutter_shop/page/OrderPage.dart';
import 'package:flutter_shop/utils/app_size.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

///
/// Flutter切换tab后保留tab状态 概述 Flutter中为了节约内存不会保存widget的状态,widget都是临时变量。当我们使用TabBar,TabBarView是我们就会发现,切换tab，initState又会被调用一次。
/// 怎么为了让tab一直保存在内存中，不被销毁？
/// 添加AutomaticKeepAliveClientMixin，并设置为true,这样就能一直保持当前不被initState了。
/// 如果不起作用  super.build(context);//必须添加
///
class _IndexPageState extends State<IndexPage>
    with AutomaticKeepAliveClientMixin {

  final List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(icon: Icon(Icons.home,size: AppSize.width(55),), label: "主页"),
    BottomNavigationBarItem(icon: Icon(Icons.find_in_page,size: AppSize.width(55)), label: "发现"),
    BottomNavigationBarItem(icon: Icon(Icons.list,size: AppSize.width(55)), label: "订单"),
    BottomNavigationBarItem(icon: Icon(Icons.people,size: AppSize.width(55)), label: "我的"),
  ];

  final List<Widget> pages = [HomePage(), FindPage(), OrderPage(),MinePage()];

  PageController _pageController = PageController();

  var _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: _getPageBody(context),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: _items,
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
      ),
    );
  }

  _getPageBody(BuildContext context) {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      children: pages,
      controller: _pageController,
      onPageChanged: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
