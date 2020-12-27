import 'package:flutter/material.dart';
import 'package:flutter_shop/dao/LoginDao.dart';
import 'package:flutter_shop/model/user_entity.dart';

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
      body: Container(
        child: Center(child: Text(_profileInfo)),
      ),
    );
  }
}
