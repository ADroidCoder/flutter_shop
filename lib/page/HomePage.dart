import 'package:flutter/material.dart';
import 'package:flutter_shop/utils/app_size.dart';
import 'package:flutter_shop/widget/customize_appbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ShopAppBar(
        height: AppSize.height(160),
        child: SizedBox(
            height:150,child: Text("shop bar",style: TextStyle(color: Colors.blue),)),
      ),
      body: Container(
        child: Center(child: Text("home")),
      ),
    );
  }
}
