import 'package:flutter/material.dart';
import 'package:shopbox_task/models/product.dart';

class ProductCard extends StatelessWidget {
  final Product _product;
  void Function(Product)? onTap;

  ProductCard(this._product,this.onTap);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        this.onTap?.call(this._product);
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 140,
                child: Image.network(
                  _product.imageURL,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Text(
                _product.name,
                style: TextStyle(fontSize: 16),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    _product.sellingPrice.toString() + " DKK",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
