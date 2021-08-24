import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pmvvm/view_model.dart';
import 'package:shopbox_task/models/cart_product.dart';
import 'package:shopbox_task/models/category.dart';
import 'package:shopbox_task/models/product.dart';
import 'package:shopbox_task/pages/productsPage/products.repo.dart';

class ProductsViewModel extends ViewModel {
  final String _clientId;
  final String _crId;
  ProductsViewModel(this._clientId, this._crId);

  ProductsRepo _repo = ProductsRepo();

  List<Category> _categories = [];
  int _selectedCategory = 0;
  bool _loadingProducts = false;
  List<CartProduct> _cart = [];

  List<Category> get categories => _categories;
  int get selectedCategory => _selectedCategory;
  bool get loadingProducts => _loadingProducts;
  List<CartProduct> get cart => _cart;

  @override
  void init() {
    // TODO: implement init
    EasyLoading.show();
    _repo.getCategories(_clientId).then((response) {
      final Iterable categories = response.data['data'];
      _categories = categories.map((e) => Category.fromJson(e)).toList();
      getProducts();
      EasyLoading.dismiss();
    });
    super.init();
  }

  selectCategory(int index) {
    _selectedCategory = index;
    if (categories[_selectedCategory].products == null)
      getProducts();
    else
      notifyListeners();
  }

  Future<void> getProducts() {
    _loadingProducts = true;
    notifyListeners();
    return _repo
        .getProducts(
      this._clientId,
      categories[_selectedCategory].uid.toString(),
    )
        .then((response) {
      final Iterable products = response.data['data'];
      categories[selectedCategory].products =
          products.map((e) => Product.fromJson(e)).toList();
      _loadingProducts = false;
      notifyListeners();
    });
  }

  selectProduct(Product product) {
    bool _exist = false;
    _cart.forEach((element) {
      if (element.compare(product)) {
        _exist = true;
        element.count++;
      }
    });
    if (!_exist) {
      _cart.add(CartProduct(product));
    }
    notifyListeners();
  }
}
