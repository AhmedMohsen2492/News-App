import 'package:flutter/material.dart';
import 'package:news_route/data/model/category_dm.dart';

class CategoriesTab extends StatefulWidget {
  Function(CategoryDM) onCategoryClick ;
  CategoriesTab(this.onCategoryClick);

  @override
  State<CategoriesTab> createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
              "Pick your category of interest",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          SizedBox(height: 12,),
          Expanded(
            child: GridView.builder(
              itemCount: CategoryDM.categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        widget.onCategoryClick(CategoryDM.categories[index]);
                      },
                      child: buildCategoryWidget(
                          CategoryDM.categories[index]
                      ));
                },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategoryWidget(CategoryDM categoryDM) {
    return Container(
      margin: categoryDM.isLeftSide ? EdgeInsets.only(
        right: 8,
        bottom: 8,
        top: 8,
      ):
      EdgeInsets.only(
        left: 8,
        bottom: 8,
        top: 8,
      ),
      decoration: BoxDecoration(
        color: categoryDM.backgroundColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
            bottomLeft: categoryDM.isLeftSide ? Radius.zero : Radius.circular(24),
            bottomRight: !categoryDM.isLeftSide ? Radius.zero : Radius.circular(24)
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * .17,
              child: Image.asset(categoryDM.imagePath)),
          Text(categoryDM.title, style: TextStyle(color: Colors.white),),
          SizedBox(height: 4,),
        ],
      ),
    );
  }
}
