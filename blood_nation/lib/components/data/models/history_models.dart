import 'dart:convert';

List<HistoryModels> historyModelsFromJson(String str) => List<HistoryModels>.from(json.decode(str).map((x) => HistoryModels.fromJson(x)));
String historyModelsToJson(List<HistoryModels> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HistoryModels {
    final String id;
    final String address;
    final int age;
    final int weight;
    final String bloodType;
    final String? userId;
    final String? eventId;
    final DateTime createdAt;
    final DateTime updatedAt;
    final User? user;
    final Event? event;

    HistoryModels({
        required this.id,
        required this.address,
        required this.age,
        required this.weight,
        required this.bloodType,
        required this.userId,
        required this.eventId,
        required this.createdAt,
        required this.updatedAt,
        required this.user,
        required this.event,
    });

    factory HistoryModels.fromJson(Map<String, dynamic> json) => HistoryModels(
        id: json["id"],
        address: json["address"],
        age: json["age"],
        weight: json["weight"],
        bloodType: json["blood_type"],
        userId: json["user_id"],
        eventId: json["event_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        event: json["event"] == null ? null : Event.fromJson(json["event"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "address": address,
        "age": age,
        "weight": weight,
        "blood_type": bloodType,
        "user_id": userId,
        "event_id": eventId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user": user?.toJson(),
        "event": event?.toJson(),
    };
}

class Event {
    final String id;
    final String name;
    final String location;
    final int quota;
    final String requirements;
    final DateTime date;
    final String imageUrl;
    final DateTime createdAt;
    final DateTime updatedAt;

    Event({
        required this.id,
        required this.name,
        required this.location,
        required this.quota,
        required this.requirements,
        required this.date,
        required this.imageUrl,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"],
        name: json["name"],
        location: json["location"],
        quota: json["quota"],
        requirements: json["requirements"],
        date: DateTime.parse(json["date"]),
        imageUrl: json["image_url"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "location": location,
        "quota": quota,
        "requirements": requirements,
        "date": date.toIso8601String(),
        "image_url": imageUrl,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class User {
    final String id;
    final String username;
    final String email;
    final String password;
    final String phoneNumber;
    final DateTime createdAt;
    final DateTime updatedAt;

    User({
        required this.id,
        required this.username,
        required this.email,
        required this.password,
        required this.phoneNumber,
        required this.createdAt,
        required this.updatedAt,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        phoneNumber: json["phone_number"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "password": password,
        "phone_number": phoneNumber,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
