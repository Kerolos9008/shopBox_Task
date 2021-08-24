import 'package:flutter/material.dart';
import 'package:shopbox_task/models/clients.dart';

class ClientCard extends StatelessWidget {
  final Client _client;

  const ClientCard(this._client);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/branches/${_client.uid}');
      },
      child: Card(
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
                    _client.name,
                    style: theme.textTheme.headline1,
                  ),
                  Text(
                    "Phone: " + _client.phone,
                    style: theme.textTheme.headline2,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                _client.description,
                style: theme.textTheme.bodyText1,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
