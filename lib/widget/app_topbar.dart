import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/utils/app_size.dart';

class HomeTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 48,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.qr_code,
                color: Colors.white,
                size: AppSize.width(68),
              )
            ],
          ),
        ),
        Expanded(
            child: Container(
          height: AppSize.height(32),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  CupertinoIcons.search,
                  color: Color(0xff999999),
                  size: AppSize.width(40),
                ),
                Text("请输入商品名称",
                    style: TextStyle(
                        fontSize: AppSize.sp(35), color: Color(0xff999999)))
              ],
            ),
          ),
        )),
        SizedBox(
          width: 48,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.location_on,
                color: Colors.white,
                size: AppSize.width(56),
              ),
              Text("黑龙江",
                  style:
                      TextStyle(fontSize: AppSize.sp(28), color: Colors.white))
            ],
          ),
        )
      ],
    );
  }
}
