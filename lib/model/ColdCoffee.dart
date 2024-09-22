class Coldcoffee {
  final int id;
  final String title;
  final String description;
  final List<String> ingredients;
  final String image;

  Coldcoffee({
    required this.id,
    required this.title,
    required this.description,
    required this.ingredients,
    required this.image,
  });

  factory Coldcoffee.fromJson(Map<String, dynamic> json) {
    return Coldcoffee(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      ingredients: List<String>.from(json['ingredients']),
      image: json['image'],
    );
  }
}
