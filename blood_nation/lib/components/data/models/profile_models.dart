class ProfileModels {
    final String id;
    final String username;
    final String email;
    final String password;
    final String phoneNumber;
    final DateTime createdAt;
    final DateTime updatedAt;

    ProfileModels({
        required this.id,
        required this.username,
        required this.email,
        required this.password,
        required this.phoneNumber,
        required this.createdAt,
        required this.updatedAt,
    });

    factory ProfileModels.fromJson(Map<String, dynamic> json) => ProfileModels(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        phoneNumber: json["phone_number"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );
}
