import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  final int index;
  const CategoryItem({super.key, required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint(category.name);
      },
      child: Container(
        decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(35),
            topEnd: Radius.circular(35),
            bottomStart: index.isEven ? Radius.circular(35) : Radius.zero,
            bottomEnd: index.isOdd ? Radius.circular(35) : Radius.zero,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/${category.imageName}.png',
              height: 110,
              width: 110,
              fit: BoxFit.cover,
            ),
            Text(
              category.name,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
