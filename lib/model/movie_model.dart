
import 'dart:convert';

Movie movieFromJson(String str) => Movie.fromJson(json.decode(str));

String movieToJson(Movie data) => json.encode(data.toJson());

class Movie {
  List<Adventure> foryou;
  List<Adventure> action;
  List<Adventure> drama;
  List<Adventure> comedy;
  List<Adventure> adventure;
  List<Adventure> animation;

  Movie({
    required this.foryou,
    required this.action,
    required this.drama,
    required this.comedy,
    required this.adventure,
    required this.animation,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    foryou: List<Adventure>.from(json["foryou"].map((x) => Adventure.fromJson(x))),
    action: List<Adventure>.from(json["action"].map((x) => Adventure.fromJson(x))),
    drama: List<Adventure>.from(json["drama"].map((x) => Adventure.fromJson(x))),
    comedy: List<Adventure>.from(json["comedy"].map((x) => Adventure.fromJson(x))),
    adventure: List<Adventure>.from(json["Adventure"].map((x) => Adventure.fromJson(x))),
    animation: List<Adventure>.from(json["Animation"].map((x) => Adventure.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "foryou": List<dynamic>.from(foryou.map((x) => x.toJson())),
    "action": List<dynamic>.from(action.map((x) => x.toJson())),
    "drama": List<dynamic>.from(drama.map((x) => x.toJson())),
    "comedy": List<dynamic>.from(comedy.map((x) => x.toJson())),
    "Adventure": List<dynamic>.from(adventure.map((x) => x.toJson())),
    "Animation": List<dynamic>.from(animation.map((x) => x.toJson())),
  };
}

class Adventure {
  String title;
  int year;
  String director;
  double rating;
  String summary;
  String cover;
  String video;
  String duration;

  Adventure({
    required this.title,
    required this.year,
    required this.director,
    required this.rating,
    required this.summary,
    required this.cover,
    required this.video,
    required this.duration,
  });

  factory Adventure.fromJson(Map<String, dynamic> json) => Adventure(
    title: json['title'] ?? '', // provide a default value if 'title' is null
    cover: json['cover'] ?? '', // provide a default value if 'cover' is null
    rating: json['rating'] ?? 0.0, // provide a default value if 'rating' is null
    year: json['year'] ?? 0, // provide a default value if 'year' is null
    duration: json['duration'] ?? '', // provide a default value if 'duration' is null
    summary: json['summary'] ?? '', // provide a default value if 'summary' is null
    director: json['director'] ?? '', // provide a default value if 'director' is null
    video: json['video'] ?? '', // provide a default value if 'video' is null
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "year": year,
    "director": director,
    "rating": rating,
    "summary": summary,
    "cover": cover,
    "video": video,
    "duration": duration,
  };
}
