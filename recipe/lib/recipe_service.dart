import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../recipe.dart';

class RecipeService with ChangeNotifier {
  List<Recipe> recipes = [];

  Future<void> fetchRecipes() async {
    final apiKey = '8d2642d067ad49e1b7493901dd869080';
    final url = 'https://api.spoonacular.com/recipes/complexSearch?apiKey=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List recipesJson = data['results'];
      recipes = recipesJson.map((json) => Recipe.fromJson(json)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load recipes');
    }
  }
}
