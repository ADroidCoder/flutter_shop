import 'package:flutter/material.dart';
import 'package:flutter_shop/utils/app_size.dart';
import 'package:flutter_shop/widget/app_topbar.dart';
import 'package:flutter_shop/widget/customize_appbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: ShopAppBar(
        height: AppSize.height(55),
        child: HomeTopBar(),
      ),
      body: Container(
        color: Color(0xfff5f6f7),
        child: Center(child: Text("home")),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
