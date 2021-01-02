import 'package:flutter/material.dart';
import 'package:flutter_shop/dao/login_dao.dart';
import 'package:flutter_shop/model/user_entity.dart';
import 'package:flutter_shop/utils/app_size.dart';
import 'package:flutter_shop/widget/app_topbar.dart';
import 'package:flutter_shop/widget/customize_appbar.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {


  String _profileInfo = "";

  @override
  void initState() {
    super.initState();

    _loadProfile();

  }

  _loadProfile() async {
    User user = await LoginDao.getProfile();
    setState(() {
      _profileInfo = user.toJson().toString();
    });
    debugPrint(user.toJson().toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ShopAppBar(
        height: AppSize.height(55),
        child: CommonTopBar(title: "我的"),
      ),
      body: Container(
        child: Center(child: Text(_profileInfo)),
      ),
    );
  }
}
