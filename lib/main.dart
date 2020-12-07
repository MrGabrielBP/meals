import 'package:flutter/material.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import './screens/categories_screens.dart';
import 'utils/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        //quando a tela tá branca:
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      //Cria rotas nomeadas.
      routes: {
        // rota '/': inicial
        AppRoutes.HOME: (ctx) => CategoriesScreen(),
        AppRoutes.CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen(),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(),
      },
    );
  }
}

/*
//Vai entrar aqui caso a rota não seja encontrada. (Rotas dinâmicas)

    onGenerateRoute: (settings) {
      if (settings.name == '/alguma-coisa') {
        return null;
      } else if (settings.name == 'outra-coisa') {
        return null;
      } else {
        return MaterialPageRoute(builder: (_) {
          return CategoriesScreen();
        });
      }
    }

//Caso nenhuma dessas outras rotas forem encontradas.

    onUnknownRoute: (settings) {
      return MaterialPageRoute(builder: (_) {
        return CategoriesScreen();
      });
    }
*/
