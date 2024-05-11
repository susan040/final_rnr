class AboutUs {
  int? vehicles;
  int? users;
  int? category;

  AboutUs({this.vehicles, this.users, this.category});

  AboutUs.fromJson(Map<String, dynamic> json) {
    vehicles = json['vehicles'];
    users = json['users'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['vehicles'] = vehicles;
    data['users'] = users;
    data['category'] = category;
    return data;
  }
}
