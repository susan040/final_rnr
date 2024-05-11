class OtpMail {
  int? customer;
  int? otp;

  OtpMail({this.customer, this.otp});

  OtpMail.fromJson(Map<String, dynamic> json) {
    customer = json['customer'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customer'] = customer;
    data['otp'] = otp;
    return data;
  }
}