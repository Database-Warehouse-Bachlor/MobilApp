import 'dart:convert';

Tennant tennantFromJson(String str) => Tennant.fromJson(json.decode(str));

class Tennant {
  Tennant({
    this.id,
    this.tennantName,
    this.businessId,
    this.apiKey
  });

  int id;
  String tennantName;
  String businessId;
  String apiKey;

  static fromJson(Map<String, dynamic> json) => Tennant(
    id: json["id"],
    tennantName: json["tennantName"],
    businessId: json["businessId"],
    apiKey: json["apiKey"],
  );

//   Map<String, dynamic> toJson() => {
//     "tennant_id": tennantId,
//     "tennant_name": tennantName,
//     "address": address,
//     "zipcode": zipcode,
//     "city": city,
//     "business_id": businessId,
//   };
}
