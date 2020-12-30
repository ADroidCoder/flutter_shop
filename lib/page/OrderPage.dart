import 'package:flutter/material.dart';
import 'package:flutter_shop/dao/LoginDao.dart';
import 'package:flutter_shop/model/user_entity.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        child: Center(child: Text("order")),
    ),
    );
  }
}
