// Home Page Event List
class EventListModels {
    final String id;
    final String name;
    final String location;
    final int quota;
    final String requirements;
    final DateTime date;
    final String imageUrl;
    final String createdAt;
    final String updatedAt;

    EventListModels({
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

    // Change data to class Object
    factory EventListModels.fromJson(Map<String, dynamic> json) => EventListModels(
        id: json["id"],
        name: json["name"],
        location: json["location"],
        quota: json["quota"],
        requirements: json["requirements"],
        date: DateTime.parse(json["date"]),
        imageUrl: json["image_url"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );
}
