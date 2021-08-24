import 'package:shopbox_task/models/product.dart';

class Category{
  final int uid;
  final String name;
  List<Product>? products;

  Category(this.uid, this.name);

  factory Category.fromJson(json){
    return Category(json['uid'], json['name']);
  }
}