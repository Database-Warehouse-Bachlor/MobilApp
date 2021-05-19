import 'dart:convert';

Tennant tennantFromJson(String str) => Tennant.fromJson(json.decode(str));

// Model class to get tennant objects
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

}
