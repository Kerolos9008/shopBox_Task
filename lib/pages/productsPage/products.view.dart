import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';
import 'package:shopbox_task/widgets/cart_product_card.dart';
import 'package:shopbox_task/widgets/categories_bar.dart';
import 'package:shopbox_task/widgets/product_card.dart';

import 'products.viewModel.dart';

class ProductsPage extends StatelessWidget {
  final String clientId;
  final String crId;

  const ProductsPage(this.clientId, this.crId);

  @override
  Widget build(BuildContext context) {
    return MVVM(
      view: (context, viewModel) => ProductsView(),
      viewModel: ProductsViewModel(this.clientId, crId),
    );
  }
}

class ProductsView extends HookView<ProductsViewModel> {
  @override
  Widget render(BuildContext context, ProductsViewModel viewModel) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Row(
          children: [
            Flexible(
              flex: 3,
              child: Stack(
                children: [
                  viewModel.loadingProducts
                      ? Center(
                          child: SizedBox(
                            child: CircularProgressIndicator(
                              strokeWidth: 3,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Color.fromRGBO(160, 92, 147, 1.0),
                              ),
                            ),
                            height: 30.0,
                            width: 30.0,
                          ),
                        )
                      : GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                          ),
                          itemBuilder: (context, index) => ProductCard(
                              viewModel.categories[viewModel.selectedCategory]
                                  .products![index],
                              viewModel.selectProduct),
                          itemCount: viewModel.categories.isEmpty
                              ? 0
                              : viewModel.categories[viewModel.selectedCategory]
                                  .products!.length,
                        ),
                  Positioned(
                    child: CategoriesBar(
                      categories: viewModel.categories,
                      onTap: viewModel.selectCategory,
                      selectedIndex: viewModel.selectedCategory,
                    ),
                    bottom: 0,
                    left: 0,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.white,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Cart',
                          style: theme.textTheme.headline1,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) =>
                          CartProductCard(viewModel.cart[index]),
                      itemCount: viewModel.cart.length,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
