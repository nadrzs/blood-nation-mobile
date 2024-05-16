class LogInModels {
  final String token;
  final String user_id;
  final String username;

  LogInModels(
    {
      required this.token,
      required this.user_id,
      required this.username
    }
  );

  factory LogInModels.fromJson(Map<String, dynamic> json) =>
      LogInModels(
        token: json["token"],
        user_id: json["user_id"],
        username: json["username"]
      );

  // Map<String, dynamic> toJson() => {
  //     "email": email,
  //     "password": password,
  // };
}
