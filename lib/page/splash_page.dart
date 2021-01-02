import 'package:flutter/material.dart';
import 'package:flutter_shop/dao/sp_util.dart';
import 'package:flutter_shop/page/index_page.dart';
import 'package:flutter_shop/page/login_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _loadConfig();
  }

  _loadConfig() async {
    debugPrint(" start ");
    var token = await SpUtil.getToken();
    debugPrint(" end ");
    WidgetBuilder builder;
    if (null != token) {
      builder = (ctx) {
        return IndexPage();
      };
    } else {
      builder = (ctx) {
        return LoginPage();
      };
    }
    Future.delayed(Duration(milliseconds: 1500), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: builder));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      body: Container(
        margin: EdgeInsets.only(top: 200),
        alignment: Alignment.center,
        width: double.infinity,
        child: Column(children: [
          Text(
            "Flutter",
            style: TextStyle(fontSize: 60, color: Colors.white),
          ),
          Text(
            "Shop",
            style: TextStyle(fontSize: 60, color: Colors.white),
          )
        ]),
      ),
    );
  }
}
