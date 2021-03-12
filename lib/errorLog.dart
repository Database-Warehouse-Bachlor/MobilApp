import 'dart:convert';

ErrorLog errorLogFromJson(String str) => ErrorLog.fromJson(json.decode(str));

class ErrorLog {
  ErrorLog({
    this.tennantId,
    this.tennantName,
    this.log,
    this.date,
  });

  String tennantId;
  String tennantName;
  String log;
  DateTime date;

  factory ErrorLog.fromJson(Map<String, dynamic> json) => ErrorLog(
    tennantId: json["tennant_id"],
    tennantName: json["tennantName"],
    log: json["log"],
    date: DateTime.parse(json["date"]),
  );
}