import 'package:flutter/material.dart';
import 'package:shopbox_task/models/branch.dart';
import 'package:shopbox_task/models/cash_register.dart';

class BranchCard extends StatelessWidget {
  final Branch _branch;
  final int? _selectedcr;
  void Function (int?)? selectCr;

  BranchCard(this._branch,this._selectedcr,this.selectCr);
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    // TODO: implement build
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _branch.name,
                  style: theme.textTheme.headline1,
                ),
                Container(
                  width: MediaQuery.of(context).size.width/4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Phone: " + _branch.phone,
                        style: theme.textTheme.headline2,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Address: ${_branch.address.street} ,${_branch.address.city}",
                        style: theme.textTheme.headline2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            ListView.builder(
              itemCount: _branch.crs.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: RadioListTile(groupValue: _selectedcr, onChanged: selectCr, value: _branch.crs[index].crId,title: 
                  Text(
                    "- Cash Register: ${_branch.crs[index].name}",
                    style: theme.textTheme.bodyText1,
                  ),),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
