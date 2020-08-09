import 'package:jmorder_app/bloc/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:jmorder_app/bloc/bottom_navigation/bottom_navigation_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: true,
      showUnselectedLabels: false,
      onTap: (index) => BlocProvider.of<BottomNavigationBloc>(context)
          .add(PageTapped(index: index)),
      currentIndex: BlocProvider.of<BottomNavigationBloc>(context).currentIndex,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text("홈"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text("친구"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          title: Text("발주"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          title: Text("기록"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          title: Text("설정"),
        ),
      ],
    );
  }
}
