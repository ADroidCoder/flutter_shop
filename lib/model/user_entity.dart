import 'package:flutter_shop/generated/json/base/json_convert_content.dart';

class User with JsonConvert<User> {
	String password;
	String nickName;
	String avatar;
	String createTime;
	String username;
}
