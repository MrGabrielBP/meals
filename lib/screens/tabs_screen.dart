import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/meal.dart';
import './categories_screens.dart';
import './favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const TabsScreen(this.favoriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  List<Map<String, Object>> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      {
        'title': 'Lista de Categorias',
        'screen': CategoriesScreen(),
      },
      {
        'title': 'Meus Favoritos',
        'screen': FavoriteScreen(widget.favoriteMeals),
      },
    ];
  }

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _screens[_selectedScreenIndex]['title'],
        ),
      ),
      drawer: MainDrawer(),
      //Menu lateral.
      body: _screens[_selectedScreenIndex]['screen'],
      //cria uma tabbar na parte inferior.
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        //funçao para item selecionado. Retorna o index desse item.
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        //para saber qual item está selecionado.
        currentIndex: _selectedScreenIndex,
        //type: BottomNavigationBarType.shifting,
        //    animação ao mudar. Padrão: fixed.
        items: [
          //item do BottomNavigationBar.
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}

/*
//Usado para controle de abas.
return DefaultTabController(
  length: 2, //quantas abas estão sendo definidas.
  child: Scaffold(
    appBar: AppBar(
      title: Text('Vamos Cozinhar?'),
      //parte inferior do Scaffold.
      //TabBar
      bottom: TabBar(
        tabs: [
          //Item do TabBar
          Tab(
            icon: Icon(Icons.category),
            text: 'Categorias',
          ),
          Tab(
            icon: Icon(Icons.star),
            text: 'Favoritos',
          )
        ],
      ),
    ),
    //creates a view with one child per tab.
    body: TabBarView(
      children: [
        CategoriesScreen(),
        FavoriteScreen(),
      ],
    ),
  ),
);
*/
