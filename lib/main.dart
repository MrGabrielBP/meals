import 'package:flutter/material.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/settings_screen.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'utils/app_routes.dart';
import './data/dummy_data.dart';
import './models/meal.dart';
import './models/settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings(
    isGlutenFree: false,
    isLactoseFree: false,
    isVegan: false,
    isVegetarian: false,
  );
  List<Meal> _availableMeals = DUMMY_MEALS;
  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;

      _availableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        //só vai filtrar se a configuração pedir sem gluten e a refeição não for livre de glúten.
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        //A reifeição só será exibida se nenhum filtros acima for aplicado for aplicado.
        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

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
        AppRoutes.HOME: (ctx) => TabsScreen(),
        AppRoutes.CATEGORIES_MEALS: (ctx) =>
            CategoriesMealsScreen(_availableMeals),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(settings, _filterMeals),
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
