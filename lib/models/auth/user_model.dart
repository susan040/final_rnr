class User {
  int? id;
  String? name;
  String? phoneNumber;
  String? email;
  String? emailVerifiedAt;
  String? type;
  String? profileImage;
  String? createdAt;
  String? updatedAt;
  String? profileImageUrl;

  User(
      {this.id,
      this.name,
      this.phoneNumber,
      this.email,
      this.emailVerifiedAt,
      this.type,
      this.profileImage,
      this.createdAt,
      this.updatedAt,
      this.profileImageUrl});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    type = json['type'];
    profileImage = json['profile_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profileImageUrl = json['profile_image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone_number'] = phoneNumber;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['type'] = type;
    data['profile_image'] = profileImage;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['profile_image_url'] = profileImageUrl;
    return data;
  }
}
