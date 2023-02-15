import 'package:flutter/cupertino.dart';
import 'package:idigitech/Models/CategoryModel.dart';
import 'package:idigitech/Services.dart/Functions.dart';

class CategoryCard extends StatelessWidget {
  final CategoryData category;
  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(5.0),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: category.color,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                image: DecorationImage(
                  image: NetworkImage(
                    category.img,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          decoration: BoxDecoration(
            color: category.color,
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: Text(
            category.title,
            style: cstmTxtStyle(fw: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
