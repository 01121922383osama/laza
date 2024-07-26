import 'package:flutter/material.dart';
import 'package:laza/Core/Constant/images_app.dart';
import 'package:laza/Core/extension/extension_navigator.dart';
import 'package:laza/Core/models/category_models.dart';
import 'package:laza/Pages/Home/show_details.dart';

class CustomListViewArraival extends StatefulWidget {
  const CustomListViewArraival({super.key});

  @override
  State<CustomListViewArraival> createState() => _CustomListViewArraivalState();
}

class _CustomListViewArraivalState extends State<CustomListViewArraival> {
  List<CategoryModels> categorys = [];
  @override
  void initState() {
    super.initState();
    categorys = generateRandomCategories(20);
  }

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: screenSize(context),
        childAspectRatio: 0.7,
      ),
      itemCount: categorys.length,
      itemBuilder: (context, index) {
        final category = categorys[index];
        return GestureDetector(
          onTap: () {
            context.push(
              page: const ShowDetails(imagesDetails: ImagesApp.image),
            );
          },
          child: Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    Image.asset(ImagesApp.image),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite),
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: Text(
                    category.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Flexible(
                  child: Text(
                    '\$ ${category.price.floorToDouble()}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
/*
mobile = 450
tablet = 600
descktop = 750
*/

int screenSize(BuildContext context) {
  final size = MediaQuery.of(context).size.width;
  if (size < 450) {
    return 2;
  } else if (size < 600) {
    return 3;
  } else {
    return 4;
  }
}
