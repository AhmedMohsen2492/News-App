// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:news_route/data/model/category_dm.dart';

class CategoriesTab extends StatefulWidget {
  Function(CategoryDM) onCategoryClick;

  CategoriesTab(this.onCategoryClick, {super.key});

  @override
  State<CategoriesTab> createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "Pick your category of interest",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Expanded(
            child: GridView.builder(
              itemCount: CategoryDM.categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      widget.onCategoryClick(CategoryDM.categories[index]);
                    },
                    child: buildCategoryWidget(CategoryDM.categories[index]));
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategoryWidget(CategoryDM categoryDM) {
    return Container(
      margin: categoryDM.isLeftSide
          ? const EdgeInsets.only(
              right: 8,
              bottom: 8,
              top: 8,
            )
          : const EdgeInsets.only(
              left: 8,
              bottom: 8,
              top: 8,
            ),
      decoration: BoxDecoration(
        color: categoryDM.backgroundColor,
        borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(24),
            topRight: const Radius.circular(24),
            bottomLeft:
                categoryDM.isLeftSide ? Radius.zero : const Radius.circular(24),
            bottomRight: !categoryDM.isLeftSide
                ? Radius.zero
                : const Radius.circular(24)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * .17,
              child: Image.asset(categoryDM.imagePath)),
          Text(
            categoryDM.title,
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 4,
          ),
        ],
      ),
    );
  }
}
