import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';
import 'package:shopbox_task/pages/clientsPage/clients.viewModel.dart';
import 'package:shopbox_task/widgets/client_card.dart';

class ClientsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MVVM(
      view: (context, viewModel) => ClientsView(),
      viewModel: ClientsViewModel(),
    );
  }
}

class ClientsView extends HookView<ClientsViewModel> {
  @override
  Widget render(BuildContext context, ClientsViewModel viewModel) {
    // TODO: implement render
    return Scaffold(
      appBar: AppBar(
        title: Text("ShopBox"),
      ),
      body: viewModel.clientList.isNotEmpty
          ? ListView.builder(
            padding: EdgeInsets.symmetric(vertical:10,horizontal: 25,),
            itemCount: viewModel.clientList.length,
            itemBuilder: (context, index) {
              return ClientCard(viewModel.clientList[index]);
            },)
          : Container(),
    );
  }
}
