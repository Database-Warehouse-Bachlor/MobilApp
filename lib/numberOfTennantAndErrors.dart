
import 'dart:convert';

NumberOfTennantAndErrors numberOfTennantAndErrors( String str) => NumberOfTennantAndErrors.fromJson(json.decode(str));

class NumberOfTennantAndErrors {
  NumberOfTennantAndErrors({this.numberOfTennants, this.numberOfErrors});

  int numberOfTennants;
  int numberOfErrors;

  factory NumberOfTennantAndErrors.fromJson(Map<String, dynamic> json) => NumberOfTennantAndErrors(
    numberOfTennants: json["numberOfTennants"],
    numberOfErrors: json["numberOfErrors"]
  );
}