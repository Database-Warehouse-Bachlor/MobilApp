import 'dart:convert';

ErrorLog errorLogFromJson(String str) => ErrorLog.fromJson(json.decode(str));

class ErrorLog {
  ErrorLog({
    this.errorMessage,
    this.date,
    this.errorType,
  });

  String errorMessage;
  DateTime date;
  String errorType;

  // Converts a JSON object to a Map list
  factory ErrorLog.fromJson(Map<String, dynamic> json) => ErrorLog(
    errorMessage: json["errorMessage"],
    date: DateTime.parse(json["timeOfError"]),
    errorType: json["errorType"],
  );
}