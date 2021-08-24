import 'package:dio/dio.dart';
import 'package:shopbox_task/services/webService.dart';

class ClientsRepo {
  WebService _webService = WebService();

  Future<Response> getClients(){
    return _webService.tokenDio.get("api/v3/clients");
  }
}