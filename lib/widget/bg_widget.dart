import 'package:flutter/material.dart';

/// 曲线背景
class CurveBgWidget extends StatelessWidget {

  final Color color;

  CurveBgWidget({this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      color: color,
      child: ClipPath(
        //路径裁切组件
        clipper: CurveClipper(), //路径
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue, Colors.deepOrangeAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          height: 320.0,
        ),
      ),
    );
  }
}

/// 曲线路径
class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path()..lineTo(0, size.height - 60.0);

    var firstControlPoint = Offset(size.width / 2, size.height);
    var firstEdnPoint = Offset(size.width, size.height - 60.0);

    path.quadraticBezierTo(
        firstControlPoint.dx,
        firstControlPoint.dy,
        firstEdnPoint.dx,
        firstEdnPoint.dy);

    path..lineTo(size.width, size.height - 60.0)
      ..lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}