import 'package:dio/dio.dart';
import 'package:shopbox_task/services/webService.dart';

class ProductsRepo{
  WebService _webService = WebService();

  Future<Response> getCategories(String clientId){
    return _webService.tokenDio.get("api/v3/tags",queryParameters: {
      "client" : clientId,
    });
  }

  Future<Response> getProducts(String clientId,String category){
    return _webService.tokenDio.get("api/v3/products",queryParameters: {
      "client" : clientId,
      "tag" : category,
    });
  }
}