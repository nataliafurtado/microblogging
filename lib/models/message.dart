class Message {
  String content;
  String createdAt;

  Message({
    this.content,
    this.createdAt,
  });

  factory Message.fromJson(dynamic json) {
    return Message(
      content: json["content"],
      createdAt: json["created_at"],
    );
  }

  Map toJson() => {
        'content': content ?? "",
        'created_at': createdAt ?? "",
      };
}
