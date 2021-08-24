import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';
import 'package:shopbox_task/pages/branchesPage/branches.viewModel.dart';
import 'package:shopbox_task/widgets/branch_card.dart';
import 'package:shopbox_task/widgets/styled_button.dart';

class BranchesPage extends StatelessWidget {
  final String clientId;

  const BranchesPage(this.clientId);

  @override
  Widget build(BuildContext context) {
    return MVVM(
      view: (context, viewModel) => BranchesView(),
      viewModel: BranchesViewModel(this.clientId),
    );
  }
}

class BranchesView extends HookView<BranchesViewModel> {
  @override
  Widget render(BuildContext context, BranchesViewModel viewModel) {
    ThemeData theme = Theme.of(context);
    // TODO: implement render
    return Scaffold(
      appBar: AppBar(
        title: Text("Branches"),
      ),
      body: viewModel.branchesList.isNotEmpty
          ? ListView.builder(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 25,
              ),
              itemCount: viewModel.branchesList.length,
              itemBuilder: (context, index) {
                return BranchCard(viewModel.branchesList[index],
                    viewModel.selectedCrId, viewModel.selectCR);
              },
            )
          : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: StyledButton(
          width: MediaQuery.of(context).size.width / 4,
          child: Text(
            "Select",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          onPressed: viewModel.selectedCrId == null
              ? null
              : viewModel.next),
    );
  }
}
