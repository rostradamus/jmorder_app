import 'package:flutter/material.dart';
import 'package:jmorder_app/models/client.dart';
import 'package:jmorder_app/widgets/pages/main_page.dart';
import 'package:jmorder_app/widgets/views/clients_view.dart';

class EditClientPage extends StatelessWidget {
  static const String routeName = '/main/clients/edit';
  final Client client;

  const EditClientPage({Key key, this.client}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(client.name),
          actions: [
            IconButton(
              icon: Icon(Icons.check),
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  MainPage.routeName,
                  (r) => false,
                  arguments: ClientsView.viewIndex,
                );
              },
            ),
          ],
        ),
        body: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth,
                maxWidth: constraints.maxWidth,
              ),
              child: Column(
                children: [
                  Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    margin: EdgeInsets.all(10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                            child: Text(
                              "기본정보",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.album),
                          title: Text(client.name),
                          subtitle: Text(client.phone),
                        ),
                        ButtonBar(
                          children: <Widget>[
                            FlatButton(
                              child: const Text('수정'),
                              onPressed: () {/* ... */},
                            ),
                            FlatButton(
                              child: const Text('삭제'),
                              onPressed: () {/* ... */},
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
