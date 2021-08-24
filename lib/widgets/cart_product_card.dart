import 'package:flutter/material.dart';
import 'package:shopbox_task/models/cart_product.dart';

class CartProductCard extends StatelessWidget {
  CartProduct _cartProduct;

  CartProductCard(this._cartProduct);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ThemeData theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${_cartProduct.count}X ${_cartProduct.product.name}",
              style: theme.textTheme.headline2!.copyWith(
                fontSize: 16,
              ),
            ),
            Text(
              "${_cartProduct.product.sellingPrice}",
              style: theme.textTheme.bodyText2!.copyWith(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
