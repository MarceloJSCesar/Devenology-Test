import 'package:devnology_testapp/app/components/categories.dart';
import 'package:flutter/material.dart';

import '../../category_component.dart';

class CategoriesItems extends StatelessWidget {
  const CategoriesItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: CategoriesDB.categories.length,
        itemBuilder: (context, index) {
          return CategoryComponent(
            index: index,
            marginLeft: 25,
            label: CategoriesDB.categories[index].label,
            decoration: CategoriesDB.categories[index].decoration,
          );
        },
      ),
    );
  }
}
