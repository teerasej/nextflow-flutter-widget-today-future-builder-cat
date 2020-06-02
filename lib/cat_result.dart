// To parse this JSON data, do
//
//     final catResult = catResultFromJson(jsonString);

import 'dart:convert';

List<CatResult> catResultFromJson(String str) => List<CatResult>.from(json.decode(str).map((x) => CatResult.fromJson(x)));

String catResultToJson(List<CatResult> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CatResult {
    CatResult({
        this.breeds,
        this.id,
        this.url,
        this.width,
        this.height,
    });

    List<dynamic> breeds;
    String id;
    String url;
    int width;
    int height;

    factory CatResult.fromJson(Map<String, dynamic> json) => CatResult(
        breeds: json["breeds"] == null ? null : List<dynamic>.from(json["breeds"].map((x) => x)),
        id: json["id"] == null ? null : json["id"],
        url: json["url"] == null ? null : json["url"],
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
    );

    Map<String, dynamic> toJson() => {
        "breeds": breeds == null ? null : List<dynamic>.from(breeds.map((x) => x)),
        "id": id == null ? null : id,
        "url": url == null ? null : url,
        "width": width == null ? null : width,
        "height": height == null ? null : height,
    };
}
