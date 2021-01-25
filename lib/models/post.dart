import 'dart:io';

class Post {
  String who;
  String date;
  String text;
  String imageString;
  File imageFile;

  Post({
    this.who,
    this.date,
    this.text,
    this.imageString,
    this.imageFile,
  });

  factory Post.fromJson(dynamic json) {
    return Post(
      who: json["who"] ?? "",
      date: json["date"] ?? "",
      text: json["text"] ?? "",
      imageString: json["image"] ?? "",
    );
  }
}
