import 'package:flutter_shop/generated/json/base/json_convert_content.dart';
import 'package:flutter_shop/generated/json/base/json_field.dart';

class TokenEntity with JsonConvert<TokenEntity> {
	@JSONField(name: "access_token")
	String accessToken;
	@JSONField(name: "token_type")
	String tokenType;
	@JSONField(name: "expires_in")
	int expiresIn;
	@JSONField(name: "refresh_token")
	String refreshToken;
	String scope;
}
