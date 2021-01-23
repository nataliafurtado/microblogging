class User {
  String login;
  String password;
  String name;
  String profilePicture;

  User({
    this.login,
    this.password,
    this.name,
    this.profilePicture,
  });

  factory User.fromJson(dynamic json) {
    return User(
      name: json["name"],
      profilePicture: json["profile_picture"],
    );
  }
}
