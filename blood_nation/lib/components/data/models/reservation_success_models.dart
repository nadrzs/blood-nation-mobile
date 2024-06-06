class ReservationSuccessModels {
    final String message;
    final ReservationModels reservation;
    final String eventId;

    ReservationSuccessModels({
        required this.message,
        required this.reservation,
        required this.eventId,
    });

    factory ReservationSuccessModels.fromJson(Map<String, dynamic> json) => ReservationSuccessModels(
        message: json["message"],
        reservation: ReservationModels.fromJson(json["reservation"]),
        eventId: json["eventId"],
    );

    // Map<String, dynamic> toJson() => {
    //     "message": message,
    //     "reservation": reservation.toJson(),
    //     "eventId": eventId,
    // };
}

class ReservationModels {
    final String id;
    final String address;
    final int age;
    final int weight;
    final String bloodType;
    final String userId;
    final String eventId;
    final DateTime updatedAt;
    final DateTime createdAt;

    ReservationModels({
        required this.id,
        required this.address,
        required this.age,
        required this.weight,
        required this.bloodType,
        required this.userId,
        required this.eventId,
        required this.updatedAt,
        required this.createdAt,
    });

    factory ReservationModels.fromJson(Map<String, dynamic> json) => ReservationModels(
        id: json["id"],
        address: json["address"],
        age: json["age"],
        weight: json["weight"],
        bloodType: json["blood_type"],
        userId: json["user_id"],
        eventId: json["event_id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
    );

    // Map<String, dynamic> toJson() => {
    //     "id": id,
    //     "address": address,
    //     "age": age,
    //     "weight": weight,
    //     "blood_type": bloodType,
    //     "user_id": userId,
    //     "event_id": eventId,
    //     "updated_at": updatedAt.toIso8601String(),
    //     "created_at": createdAt.toIso8601String(),
    // };
}
