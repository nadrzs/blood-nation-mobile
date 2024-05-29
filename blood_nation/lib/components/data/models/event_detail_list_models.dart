class EventDetailListModels {
    final String id;
    final String name;
    final String location;
    final int quota;
    final String requirements;
    final String date;
    final String imageUrl;
    final String createdAt;
    final String updatedAt;

    EventDetailListModels({
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

    factory EventDetailListModels.fromJson(Map<String, dynamic> json) => EventDetailListModels(
        id: json["id"],
        name: json["name"],
        location: json["location"],
        quota: json["quota"],
        requirements: json["requirements"],
        date: json["date"],
        imageUrl: json["image_url"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    // Map<String, dynamic> toJson() => {
    //     "id": id,
    //     "name": name,
    //     "location": location,
    //     "quota": quota,
    //     "requirements": requirements,
    //     "date": date.toIso8601String(),
    //     "imageUrl": imageUrl,
    //     "createdAt": createdAt.toIso8601String(),
    //     "updatedAt": updatedAt.toIso8601String(),
    // };
}
