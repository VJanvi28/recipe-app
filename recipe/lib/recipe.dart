class Recipe {
  final String title;
  final String? summary;
  final String imageUrl;

  Recipe({
    required this.title,
    this.summary,
    required this.imageUrl,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      title: json['title'],
      summary: json['summary'],
      imageUrl: json['image'],
    );
  }
}
