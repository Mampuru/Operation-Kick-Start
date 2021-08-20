import 'dart:convert';

NewsFeed newsFeedFromJson(String str) => NewsFeed.fromJson(json.decode(str));

String newsFeedToJson(NewsFeed data) => json.encode(data.toJson());

class NewsFeed {
  NewsFeed({
    required this.id,
    required this.title,
    required this.description,
    required this.url,
  });

  String id;
  String title;
  String description;
  String url;

  factory NewsFeed.fromJson(Map<String, dynamic> json) => NewsFeed(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "url": url,
  };
}