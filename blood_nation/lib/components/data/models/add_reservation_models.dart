class AddReservationModels {
    final String address;
    final int age;
    final int weight;
    final String bloodType;

    AddReservationModels({
        required this.address,
        required this.age,
        required this.weight,
        required this.bloodType,
    });

    factory AddReservationModels.fromJson(Map<String, dynamic> json) => AddReservationModels(
        address: json["address"],
        age: json["age"],
        weight: json["weight"],
        bloodType: json["bloodType"],
    );

    // Map<String, dynamic> toJson() => {
    //     "address": address,
    //     "age": age,
    //     "weight": weight,
    //     "bloodType": bloodType,
    // };
}
