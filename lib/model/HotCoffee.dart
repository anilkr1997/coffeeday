class Hotcoffee {
  final String title;
  final String description;
  final List<String> ingredients;
  final String image;
  final int id;

  Hotcoffee({
    required this.title,
    required this.description,
    required this.ingredients,
    required this.image,
    required this.id,
  });

  factory Hotcoffee.fromJson(Map<String, dynamic> json) {
    return Hotcoffee(
      title: json['title'],
      description: json['description'],
      ingredients: List<String>.from(json['ingredients']),
      image: json['image'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'ingredients': ingredients,
      'image': image,
      'id': id,
    };
  }
}
