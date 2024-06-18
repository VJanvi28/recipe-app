import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../recipe_service.dart';

class RecipeListScreen extends StatelessWidget {
  const RecipeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final recipeService = Provider.of<RecipeService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes'),
      ),
      body: FutureBuilder(
        future: recipeService.fetchRecipes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: recipeService.recipes.length,
              itemBuilder: (context, index) {
                final recipe = recipeService.recipes[index];
                return ListTile(
                  leading: Image.network(
                    recipe.imageUrl,
                    fit: BoxFit.cover,
                    width: 50,
                  ),
                  title: Text(recipe.title),
                  subtitle: Text(recipe.summary ?? ''),
                );
              },
            );
          }
        },
      ),
    );
  }
}
