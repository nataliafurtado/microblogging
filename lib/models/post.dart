class Post {
  String who;
  String date;
  String text;
  String image;

  Post({
    this.who,
    this.date,
    this.text,
    this.image,
  });

  factory Post.fromJson(dynamic json) {
    return Post(
      who: json["who"],
      date: json["date"],
      text: json["text"],
      image: json["image"],
    );
  }
}
