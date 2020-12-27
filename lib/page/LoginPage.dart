import 'package:flutter/material.dart';
import 'package:flutter_shop/dao/LoginDao.dart';
import 'package:flutter_shop/dao/SpUtil.dart';
import 'package:flutter_shop/model/token_entity.dart';
import 'package:flutter_shop/model/user_entity.dart';
import 'package:flutter_shop/page/IndexPage.dart';
import 'package:flutter_shop/widget/bg_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

enum PageType { login, register }

class _LoginPageState extends State<LoginPage> {
  PageType _pageType = PageType.login;

  User _user = User();

  TextEditingController _controller = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey();
  GlobalKey<ScaffoldState> _gk = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _gk,
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: [
          CurveBgWidget(
            color: const Color(0xfff5f6f7),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: Colors.white),
              child: Form(
                key: _formKey,
                onWillPop: _showHint,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: _buildContentByType(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _buildContentByType() {
    if (_pageType == PageType.login) {
      return <Widget>[
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          maxLines: 1,
          maxLength: 30,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.email),
              hintText: "请输入邮箱号",
              contentPadding: EdgeInsets.symmetric(vertical: 10)),
          validator: (val) {
            return val.length == 0 ? "账号不能为空" : null;
          },
          onSaved: (val) {
            // todo
          },
        ),
        SizedBox(
          height: 16,
        ),
        TextFormField(
          maxLines: 1,
          maxLength: 28,
          obscureText: true,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock_outline),
              hintText: "请输入登录密码",
              contentPadding: EdgeInsets.symmetric(vertical: 10),
              suffixIcon: Icon(
                Icons.remove_red_eye,
              )),
          validator: (val) {
            return val.length >= 6 ? null : "密码长度必须大于6位";
          },
          onSaved: (val) {
            // todo
          },
        ),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          Text(
            '忘记密码?',
            style: TextStyle(fontSize: 16, color: Color(0xff333333)),
          )
        ]),
        InkWell(
          onTap: _submit,
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: 12),
            padding: EdgeInsets.symmetric(vertical: 6),
            child: Text(
              '登录',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blue[500], Colors.blue[300]]),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(1.0, 5.0),
                    color: Colors.blue[200].withOpacity(0.4),
                    blurRadius: 5.0,
                  )
                ]),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('账号登录',
                style: TextStyle(fontSize: 16, color: Color(0xff333333))),
            Container(
                height: 12,
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: VerticalDivider(
                  width: 0.0,
                  color: Color(0xFFDEDEDE),
                  thickness: 1,
                )),
            InkWell(
              onTap: () {
                setState(() {
                  _pageType = PageType.register;
                });
              },
              child: Text(
                '新用户注册',
                style: TextStyle(fontSize: 16, color: Color(0xFF02A9FF)),
              ),
            ),
          ],
        ),
      ];
    } else {
      return <Widget>[
        TextFormField(
          keyboardType: TextInputType.phone,
          maxLines: 1,
          maxLength: 30,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.email),
              hintText: "请输入邮箱号",
              contentPadding: EdgeInsets.symmetric(vertical: 10)),
          validator: (val) {
            return val.length > 0 ? null : "账号不能为空";
          },
          onSaved: (val) {
            _user.username = val;
            debugPrint("- ${_user.username} -");
          },
        ),
        SizedBox(
          height: 16,
        ),
        TextFormField(
          controller: _controller,
          maxLines: 1,
          maxLength: 32,
          obscureText: true,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock_outline),
              hintText: "请输入登录密码",
              contentPadding: EdgeInsets.symmetric(vertical: 10),
              suffixIcon: Icon(
                Icons.remove_red_eye,
              )),
          validator: (val) {
            return val.length >= 6 ? null : "密码长度必须大于6位";
          },
          onSaved: (val) {
            _user.password = val;
          },
        ),
        TextFormField(
          maxLines: 1,
          maxLength: 32,
          obscureText: true,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock_outline),
              hintText: "请再次确认密码",
              contentPadding: EdgeInsets.symmetric(vertical: 10),
              suffixIcon: Icon(
                Icons.remove_red_eye,
              )),
          validator: (val) {
            if (val.length < 6) {
              return "密码长度必须大于6位";
            }
            if (val != _controller.text) {
              return "请确认两次输入的密码是否相同";
            }
            return null;
          },
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: TextFormField(
                maxLines: 1,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: "请输入验证码",
                    contentPadding: EdgeInsets.symmetric(vertical: 10)),
                // validator: (val) {
                //   return val.toLowerCase() == _verifyCode?.text?.toLowerCase()
                //       ? null
                //       : "验证码错误";
                // },
              ),
            ),
            // _verifyCode == null
            //     ? Container()
            //     : InkWell(
            //         onTap: () => _refreshVerifyCode(),
            //         child: Image.memory(_verifyCode.img)),
          ],
        ),
        InkWell(
          onTap: _submit,
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: 12),
            padding: EdgeInsets.symmetric(vertical: 6),
            child: Text(
              '注册',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blue[500], Colors.blue[300]]),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(1.0, 5.0),
                    color: Colors.blue[200].withOpacity(0.4),
                    blurRadius: 5.0,
                  )
                ]),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
                onTap: () {
                  setState(() {
                    _pageType = PageType.login;
                  });
                },
                child: Text('账号登录',
                    style: TextStyle(fontSize: 16, color: Color(0xFF02A9FF)))),
            Container(
                height: 12,
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: VerticalDivider(
                  width: 0.0,
                  color: Color(0xFFDEDEDE),
                  thickness: 1,
                )),
            Text(
              '新用户注册',
              style: TextStyle(fontSize: 16, color: Color(0xff333333)),
            ),
          ],
        ),
      ];
    }
  }

  _submit() {
    FormState state = _formKey.currentState;
    if (state.validate()) {
      state.save();

      _register() async {
        _user.createTime = DateTime.now().toString();
        var isSuc = await LoginDao.register(_user) ?? false;
        _gk.currentState
            .showSnackBar(SnackBar(content: Text(isSuc ? "注册成功" : "注册失败")));
      }

      _login() async {
        TokenEntity token = await LoginDao.login(_user);
        if (token != null) {
          SpUtil.saveToken(token);
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (ctx) => IndexPage()));
        } else {
          _gk.currentState.showSnackBar(SnackBar(content: Text("登陆失败")));
        }
      }

      if (PageType.login == _pageType) {
        _login();
      } else {
        _register();
      }
    }
  }

  Future<bool> _showHint() {
    return showDialog<bool>(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text("提示"),
            content: Text("您确定要退出当前页面吗？"),
            actions: [
              RaisedButton(
                  child: Text("确定"),
                  onPressed: () {
                    Navigator.of(ctx).pop(true);
                  }),
              RaisedButton(
                  child: Text("取消"),
                  onPressed: () {
                    Navigator.of(ctx).pop(false);
                  }),
            ],
          );
        });
  }
}
