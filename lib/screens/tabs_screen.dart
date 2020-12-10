import 'package:flutter/material.dart';
import './categories_screens.dart';
import './favorite_screen.dart';

class TabsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        ));
  }
}
