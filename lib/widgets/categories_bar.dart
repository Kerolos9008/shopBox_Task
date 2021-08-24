import 'package:flutter/material.dart';
import 'package:shopbox_task/models/category.dart';

class CategoriesBar extends StatelessWidget {
  final List<Category> categories;
  int selectedIndex;
  void Function(int)? onTap;

  CategoriesBar({required this.categories, required this.selectedIndex, this.onTap});

  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.grey[900],
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            this.onTap?.call(index);
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            decoration: BoxDecoration(
              color: (index != selectedIndex)
                  ? Colors.grey[900]
                  : Colors.grey[800],
              border: Border(
                left: (index != 0)
                    ? BorderSide(
                        color: Colors.white30,
                        width: 1,
                      )
                    : BorderSide.none,
                right: (index == categories.length - 1)
                    ? BorderSide(
                        color: Colors.white30,
                        width: 1,
                      )
                    : BorderSide.none,
              ),
            ),
            child: Center(
              child: Text(
                categories[index].name,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: (index == selectedIndex)
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
