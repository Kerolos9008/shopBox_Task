import 'package:dio/dio.dart';
import 'package:shopbox_task/services/webService.dart';

class BranchesRepo {
  WebService _webService = WebService();

  Future<Response> getBranches(String client) {
    return _webService.tokenDio.get(
      'api/v3/branches',
      queryParameters: {
        "client": client,
      },
    );
  }
}
