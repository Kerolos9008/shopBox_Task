import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pmvvm/view_model.dart';
import 'package:shopbox_task/models/clients.dart';
import 'package:shopbox_task/pages/clientsPage/clients.repo.dart';

class ClientsViewModel extends ViewModel {
  ClientsRepo _repo = ClientsRepo();

  List<Client> _clientList = [];

  List<Client> get clientList => _clientList;
  @override
  void init() {
    // TODO: implement init
    EasyLoading.show();
    _repo.getClients().then((response) {
      final Iterable clients = response.data['data'];
      _clientList = clients.map((e) => Client.fromJson(e)).toList();
      notifyListeners();
      EasyLoading.dismiss();
    });
    super.init();
  }
}
