List<VehicleCategory> categoryListFromJson(List<dynamic> categoryJson) =>
    List<VehicleCategory>.from(categoryJson
        .map((categoryJsonList) => VehicleCategory.fromJson(categoryJsonList)));

class VehicleCategory {
  int? id;
  String? name;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? imageUrl;

  VehicleCategory(
      {this.id,
      this.name,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.imageUrl});

  VehicleCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['image_url'] = imageUrl;
    return data;
  }
}
