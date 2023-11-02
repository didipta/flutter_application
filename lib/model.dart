// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<postdata> welcomeFromJson(String str) =>
    List<postdata>.from(json.decode(str).map((x) => postdata.fromJson(x)));

String welcomeToJson(List<postdata> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class postdata {
  int userId;
  int id;
  String title;
  String body;

  postdata({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory postdata.fromJson(Map<String, dynamic> json) => postdata(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
