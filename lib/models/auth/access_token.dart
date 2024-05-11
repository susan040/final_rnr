class Accesstoken {
  String? accessToken;
  String? tokenType;
  String? expiresAt;

  Accesstoken({this.accessToken, this.tokenType, this.expiresAt});

  Accesstoken.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresAt = json['expires_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    data['expires_at'] = expiresAt;
    return data;
  }

  @override
  String toString() {
    return "$tokenType $accessToken";
  }
}