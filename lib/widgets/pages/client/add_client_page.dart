import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jmorder_app/bloc/clients/clients_bloc.dart';
import 'package:jmorder_app/bloc/clients/clients_event.dart';

class AddClientPage extends StatelessWidget {
  static const String routeName = "/main/clients/add";
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _addressFocus = FocusNode();

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  void submitClientCreate(BuildContext context) {
    BlocProvider.of<ClientsBloc>(context).add(ClientsCreated(
      name: _nameController.text,
      phone: _phoneController.text,
    ));
    _nameController.clear();
    _phoneController.clear();
    _addressController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("새 거래처"),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              submitClientCreate(context);
              Navigator.of(context).pop();
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        child: TextFormField(
                          key: ValueKey("text"),
                          controller: _nameController,
                          focusNode: _nameFocus,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "상호명",
                            suffixIcon: IconButton(
                              onPressed: () => _nameController.clear(),
                              icon: Icon(Icons.clear),
                              iconSize: 20,
                            ),
                          ),
                          onFieldSubmitted: (value) => _fieldFocusChange(
                              context, _nameFocus, _phoneFocus),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        child: TextFormField(
                          key: ValueKey("text"),
                          controller: _phoneController,
                          focusNode: _phoneFocus,
                          textInputAction: TextInputAction.go,
                          decoration: InputDecoration(
                            hintText: "전화번호",
                            suffixIcon: IconButton(
                              onPressed: () => _phoneController.clear(),
                              icon: Icon(Icons.clear),
                              iconSize: 20,
                            ),
                          ),
                          onFieldSubmitted: (value) => _fieldFocusChange(
                              context, _phoneFocus, _addressFocus),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        child: TextFormField(
                          key: ValueKey("text"),
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          controller: _addressController,
                          focusNode: _addressFocus,
                          textInputAction: TextInputAction.go,
                          decoration: InputDecoration(
                            hintText: "주소",
                            suffixIcon: IconButton(
                              onPressed: () => _addressController.clear(),
                              icon: Icon(Icons.clear),
                              iconSize: 20,
                            ),
                          ),
                          // onFieldSubmitted: (value) => _submitLoginForm(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
