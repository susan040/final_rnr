List<OnGoingOrder> onGoingListFromJson(List<dynamic> onGoingOrderJson) =>
    List<OnGoingOrder>.from(onGoingOrderJson.map(
        (onGoingOrderJsonList) => OnGoingOrder.fromJson(onGoingOrderJsonList)));

class OnGoingOrder {
  int? id;
  int? userId;
  int? vendorId;
  int? vehicleId;
  String? startDate;
  String? endDate;
  String? status;
  int? totalPrice;
  int? quantity;
  String? paymentMethod;
  String? orderTime;
  String? createdAt;
  String? updatedAt;
  OnGoingVehicle? vehicle;
  OnGoingVendor? vendor;

  OnGoingOrder(
      {this.id,
      this.userId,
      this.vendorId,
      this.vehicleId,
      this.startDate,
      this.endDate,
      this.status,
      this.totalPrice,
      this.quantity,
      this.paymentMethod,
      this.orderTime,
      this.createdAt,
      this.updatedAt,
      this.vehicle,
      this.vendor});

  OnGoingOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    vendorId = json['vendor_id'];
    vehicleId = json['vehicle_id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    status = json['status'];
    totalPrice = json['total_price'];
    quantity = json['quantity'];
    paymentMethod = json['payment_method'];
    orderTime = json['order_time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    vehicle = json['vehicle'] != null
        ? OnGoingVehicle.fromJson(json['vehicle'])
        : null;
    vendor =
        json['vendor'] != null ? OnGoingVendor.fromJson(json['vendor']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['vendor_id'] = vendorId;
    data['vehicle_id'] = vehicleId;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['status'] = status;
    data['total_price'] = totalPrice;
    data['quantity'] = quantity;
    data['payment_method'] = paymentMethod;
    data['order_time'] = orderTime;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (vehicle != null) {
      data['vehicle'] = vehicle!.toJson();
    }
    if (vendor != null) {
      data['vendor'] = vendor!.toJson();
    }
    return data;
  }
}

class OnGoingVehicle {
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
  int? costPerHour;
  String? createdAt;
  String? updatedAt;
  String? imageUrl;

  OnGoingVehicle(
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
      this.imageUrl});

  OnGoingVehicle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    categoryId = json['category_id'];
    vehicleName = json['vehicle_name'];
    brandName = json['brand_name'];
    color = json['color'];
    mileage = json['mileage'];
    image = json['image'];
    trasmissionType = json['trasmission_type'];
    seat = json['seat'];
    vehicleNumber = json['vehicle_number'];
    status = json['status'];
    fuelType = json['fuel_type'];
    vehicleDescription = json['vehicle_description'];
    costPerHour = json['cost_per_hour'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageUrl = json['image_url'];
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
    data['trasmission_type'] = trasmissionType;
    data['seat'] = seat;
    data['vehicle_number'] = vehicleNumber;
    data['status'] = status;
    data['fuel_type'] = fuelType;
    data['vehicle_description'] = vehicleDescription;
    data['cost_per_hour'] = costPerHour;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['image_url'] = imageUrl;
    return data;
  }
}

class OnGoingVendor {
  int? id;
  String? name;
  String? phoneNumber;
  String? email;
  String? emailVerifiedAt;
  String? otp;
  String? type;
  String? profileImage;
  String? createdAt;
  String? updatedAt;
  String? profileImageUrl;

  String? shopAddress;

  OnGoingVendor(
      {this.id,
      this.name,
      this.phoneNumber,
      this.email,
      this.emailVerifiedAt,
      this.otp,
      this.type,
      this.shopAddress,
      this.profileImage,
      this.createdAt,
      this.updatedAt,
      this.profileImageUrl});

  OnGoingVendor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    otp = json['otp'].toString();
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
    data['otp'] = otp;
    data['type'] = type;
    data['shop_address'] = shopAddress;
    data['profile_image'] = profileImage;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['profile_image_url'] = profileImageUrl;
    return data;
  }
}
