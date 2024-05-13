// Object Model 
class EventModels {
    final String id;
    final String name;
    final String location;
    final int quota;
    final String requirements;
    final String date;
    final String imageUrl;
    final String createdAt;
    final String updatedAt;

    EventModels({
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

    factory EventModels.fromJson(Map<String, dynamic> json) => EventModels(
        id: json["id"],
        name: json["name"],
        location: json["location"],
        quota: json["quota"],
        requirements: json["requirements"],
        date: json["date"],
        imageUrl: json["imageUrl"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
    );
}
