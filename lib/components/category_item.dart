import 'package:flutter/material.dart';
import '../models/category.dart';
import '../screens/categories_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem(this.category);

  void _selectedCategory(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) {
        return CategoriesMealsScreen(category);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    //widget clicavel.
    return InkWell(
      onTap: () => _selectedCategory(context),
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          //borda arredondada.
          borderRadius: BorderRadius.circular(15),
          //cria um gradiente de cores.
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.5),
              category.color,
            ],
            //orientação.
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}
