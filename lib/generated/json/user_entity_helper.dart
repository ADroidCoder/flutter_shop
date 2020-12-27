import 'package:flutter_shop/model/user_entity.dart';

userFromJson(User data, Map<String, dynamic> json) {
	if (json['password'] != null) {
		data.password = json['password']?.toString();
	}
	if (json['nickName'] != null) {
		data.nickName = json['nickName']?.toString();
	}
	if (json['avatar'] != null) {
		data.avatar = json['avatar']?.toString();
	}
	if (json['createTime'] != null) {
		data.createTime = json['createTime']?.toString();
	}
	if (json['username'] != null) {
		data.username = json['username']?.toString();
	}
	return data;
}

Map<String, dynamic> userToJson(User entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['password'] = entity.password;
	data['nickName'] = entity.nickName;
	data['avatar'] = entity.avatar;
	data['createTime'] = entity.createTime;
	data['username'] = entity.username;
	return data;
}