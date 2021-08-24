import 'package:shopbox_task/models/product.dart';

class CartProduct{
  int count = 1;
  Product product;

  CartProduct(this.product);

  bool compare(Product newProduct){
    return (product.uid == newProduct.uid);
  }
  
}