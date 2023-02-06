// To parse this JSON data, do
//
//     final testModel = testModelFromJson(jsonString);

import 'dart:convert';

TestModel testModelFromJson(String str) => TestModel.fromJson(json.decode(str));

String testModelToJson(TestModel data) => json.encode(data.toJson());

class TestModel {
  TestModel({
    required this.success,
    required this.data,
  });

  bool success;
  List<Datum> data;

  factory TestModel.fromJson(Map<String, dynamic> json) => TestModel(
    success: json["success"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.caption,
    required this.videoUrl,
    required this.createdAt,
  });

  int id;
  String caption;
  String videoUrl;
  DateTime createdAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    caption: json["caption"],
    videoUrl: json["video_url"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "caption": caption,
    "video_url": videoUrl,
    "created_at": createdAt.toIso8601String(),
  };
}
