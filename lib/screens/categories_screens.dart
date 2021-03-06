import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../components/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //semelhante ao ListView, mas em forma de grade
    return GridView(
      padding: const EdgeInsets.all(25),
      //GridDelegate é uma forma de delegar como a Grid será renderizada
      //Vai extender o CrossAxis
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        //Sliver é uma área que tem scroll
        //Cada elemento vai ter umae extensão de no máximo 200 pxs.
        maxCrossAxisExtent: 200,
        //Proporção do tamanho de cada elemento (Largo / alto).
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20, //espaçamento no eixo cruzado.
        mainAxisSpacing: 20, //espaçamento no eixo principal.
      ),
      children: DUMMY_CATEGORIES.map((cat) {
        return CategoryItem(cat);
      }).toList(),
    );
  }
}
