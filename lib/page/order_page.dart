import 'package:flutter/material.dart';
import 'package:flutter_shop/dao/login_dao.dart';
import 'package:flutter_shop/model/user_entity.dart';
import 'package:flutter_shop/utils/app_size.dart';
import 'package:flutter_shop/widget/app_topbar.dart';
import 'package:flutter_shop/widget/customize_appbar.dart';

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
      appBar: ShopAppBar(
        height: AppSize.height(55),
        child: CommonTopBar(title: "订单"),
      ),
      body: Container(
        child: Center(child: Text("order")),
      ),
    );
  }
}
