import 'dart:convert';

Tennant tennantFromJson(String str) => Tennant.fromJson(json.decode(str));

String tennantToJson(Tennant data) => json.encode(data.toJson());

class Tennant {
  Tennant({
    this.tennantId,
    this.tennantName,
    this.address,
    this.zipcode,
    this.city,
    this.businessId,
  });

  String tennantId;
  String tennantName;
  String address;
  String zipcode;
  String city;
  String businessId;

  static fromJson(Map<String, dynamic> json) => Tennant(
    tennantId: json["tennant_id"],
    tennantName: json["tennant_name"],
    address: json["address"],
    zipcode: json["zipcode"],
    city: json["city"],
    businessId: json["business_id"],
  );

  Map<String, dynamic> toJson() => {
    "tennant_id": tennantId,
    "tennant_name": tennantName,
    "address": address,
    "zipcode": zipcode,
    "city": city,
    "business_id": businessId,
  };
}
