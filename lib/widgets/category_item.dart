import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:my_architecture/models/category.dart';
import 'package:my_architecture/themes/color_codes.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.category,
    this.onPressed,
  }) : super(key: key);

  final Category category;
  final ValueChanged<String>? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: context.theme.primaryColor,
          shape: BoxShape.rectangle,
          image: DecorationImage(
              image: NetworkImage(category.url!), fit: BoxFit.cover),
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 0.5,
              blurRadius: 10,
              offset: const Offset(0, 0),
            ),
          ]),
      margin: const EdgeInsets.all(5),
      child: InkWell(
        onTap: () {
          onPressed!(category.category!);
        },
        child: Column(
          children: [
            Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 0.0, right: 0.0, top: 10.0, bottom: 5),
                  child: Text(
                    category.category!.toUpperCase(),
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                        color: ThemeColor.lightModeColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
