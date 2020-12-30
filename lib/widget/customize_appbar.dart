import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget child;
  double height;

  ShopAppBar({Key key, @required this.child, @required this.height});

  @override
  Widget build(BuildContext context) {
    double _statusHeight = ScreenUtil().statusBarHeight;
    return Container(
      padding: EdgeInsets.only(left: 6, right: 6, top: _statusHeight),
      child: this.child,
      height: _statusHeight + this.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.blueAccent[400]],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
