List<Vehicle> vehicleListFromJson(List<dynamic> vehicleJson) =>
    List<Vehicle>.from(vehicleJson
        .map((vehicleJsonList) => Vehicle.fromJson(vehicleJsonList)));

class Vehicle {
  int? id;
  int? userId;
  int? categoryId;
  String? vehicleName;
  String? brandName;
  String? color;
  String? mileage;
  String? image;
  String? trasmissionType;
  String? seat;
  String? vehicleNumber;
  String? status;
  String? fuelType;
  String? vehicleDescription;
  String? documentRequired;
  int? costPerHour;
  String? createdAt;
  String? updatedAt;
  String? imageUrl;
  Vendor? vendor;

  Vehicle(
      {this.id,
      this.userId,
      this.categoryId,
      this.vehicleName,
      this.brandName,
      this.color,
      this.mileage,
      this.image,
      this.trasmissionType,
      this.seat,
      this.vehicleNumber,
      this.status,
      this.fuelType,
      this.vehicleDescription,
      this.costPerHour,
      this.createdAt,
      this.updatedAt,
      this.imageUrl,
      this.vendor});

  Vehicle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    categoryId = json['category_id'];
    vehicleName = json['vehicle_name'];
    brandName = json['brand_name'];
    color = json['color'];
    mileage = json['mileage'];
    image = json['image'];
    trasmissionType = json['transmission_type'];
    seat = json['seat'];
    vehicleNumber = json['vehicle_number'];
    status = json['status'];
    fuelType = json['fuel_type'];
    vehicleDescription = json['vehicle_description'];
    documentRequired = json['document_required'];
    costPerHour = json['cost_per_hour'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageUrl = json['image_url'];
    vendor = json['user'] != null ? Vendor.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['category_id'] = categoryId;
    data['vehicle_name'] = vehicleName;
    data['brand_name'] = brandName;
    data['color'] = color;
    data['mileage'] = mileage;
    data['image'] = image;
    data['transmission_type'] = trasmissionType;
    data['seat'] = seat;
    data['vehicle_number'] = vehicleNumber;
    data['status'] = status;
    data['fuel_type'] = fuelType;
    data['vehicle_description'] = vehicleDescription;
    data['document_required'] = documentRequired;
    data['cost_per_hour'] = costPerHour;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['image_url'] = imageUrl;
    if (vendor != null) {
      data['user'] = vendor!.toJson();
    }
    return data;
  }
}

class Vendor {
  int? id;
  String? name;
  String? phoneNumber;
  String? email;
  String? emailVerifiedAt;
  String? type;
  String? shopAddress;
  String? profileImage;
  String? createdAt;
  String? updatedAt;

  String? profileImageUrl;

  Vendor(
      {this.id,
      this.name,
      this.phoneNumber,
      this.email,
      this.emailVerifiedAt,
      this.type,
      this.profileImage,
      this.createdAt,
      this.shopAddress,
      this.updatedAt,
      this.profileImageUrl});

  Vendor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    type = json['type'];
    shopAddress = json['shop_address'];
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
    data['shop_address'] = shopAddress;
    data['profile_image'] = profileImage;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['profile_image_url'] = profileImageUrl;
    return data;
  }
}
