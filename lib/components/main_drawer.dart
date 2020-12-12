import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget _createItem(IconData icon, String label) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomRight,
            //Alinhar o filho.
            color: Theme.of(context).accentColor,
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            height: 120,
            child: Text(
              'Vamos Cozinhar?',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(height: 20),
          _createItem(Icons.restaurant, 'Refeições'),
          _createItem(Icons.settings, 'Configurações'),
        ],
      ),
    );
  }
}
