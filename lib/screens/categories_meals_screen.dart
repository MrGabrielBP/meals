import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import '../components/meal_item.dart';
import '../models/meal.dart';

class CategoriesMealsScreen extends StatelessWidget {
  final List<Meal> meals;
  const CategoriesMealsScreen(this.meals);
  @override
  Widget build(BuildContext context) {
/*
    Vai pegar o dado da categoria a partir da navegação da rota.
    Vai receber o argumento que foi passado por essa rota. 
*/
    final category = ModalRoute.of(context).settings.arguments as Category;

    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(categoryMeals[index]);
        },
      ),
    );
  }
}
