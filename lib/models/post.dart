class Post {
  String who;
  String date;
  String text;

  Post({
    this.who,
    this.date,
    this.text,
  });

  factory Post.fromJson(dynamic json) {
    return Post(
      who: json["who"],
      date: json["date"],
      text: json["text"],
    );
  }
}
