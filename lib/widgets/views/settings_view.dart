import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jmorder_app/bloc/auth/auth_bloc.dart';
import 'package:jmorder_app/bloc/auth/auth_event.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Card(
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: const EdgeInsets.all(8.0),
            color: Colors.deepOrange,
            child: ListTile(
              onTap: () => {},
              title: Text(
                "Ro Lee",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              leading: CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                  'https://kansai-resilience-forum.jp/wp-content/uploads/2019/02/IAFOR-Blank-Avatar-Image-1.jpg',
                ),
              ),
              trailing: Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.lock_outline,
                    color: Colors.deepOrange,
                  ),
                  title: Text("비밀번호 변경"),
                  onTap: () => {},
                ),
                ListTile(
                  leading: Icon(
                    Icons.language,
                    color: Colors.deepOrange,
                  ),
                  title: Text("언어 변경"),
                  onTap: () => {},
                ),
                ListTile(
                  leading: Icon(
                    Icons.report,
                    color: Colors.deepOrange,
                  ),
                  title: Text("문의하기"),
                  onTap: () => {},
                ),
                ListTile(
                  leading: Icon(
                    Icons.power_settings_new,
                    color: Colors.deepOrange,
                  ),
                  title: Text("로그아웃"),
                  onTap: () {
                    BlocProvider.of<AuthBloc>(context).add(LogoutSubmitted());
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/', (r) => false);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
