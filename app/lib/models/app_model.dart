class AppModel {
  final int id;
  final String title;
  final String image;

  AppModel({required this.id, required this.title, required this.image});

  factory AppModel.fromJson(Map<String, dynamic> json) {
    return AppModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
    );
  }
}
