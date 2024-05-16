class UserModels {
    final String username;
    final String email;
    final String phoneNumber;

    UserModels({
        required this.username,
        required this.email,
        required this.phoneNumber,
    });

    factory UserModels.fromJson(Map<String, dynamic> json) => UserModels(
        username: json["username"],
        email: json["email"],
        phoneNumber: json["phone_number"],
    );

    // Map<String, dynamic> toJson() => {
    //     "username": username,
    //     "email": email,
    //     "phoneNumber": phoneNumber,
    // };
}