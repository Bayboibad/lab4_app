import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab4_app/views/home/tabbottom/account_tab.dart';
import 'package:lab4_app/views/home/tabbottom/bloc/tabbottom_bloc.dart';
import 'package:lab4_app/views/home/tabbottom/favourite_tab.dart';
import 'package:lab4_app/views/home/tabbottom/home_tab.dart';

List<BottomNavigationBarItem> bottomItem = const <BottomNavigationBarItem>[
  BottomNavigationBarItem(icon: Icon(Icons.home), label: "Trang chủ"),
  BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Yêu Thích"),
  BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "Tài Khoản"),
];
List<Widget> bottomNav = <Widget>[
   HomeTab(),
   FavouriteTab(),
   AccountTab(),
];
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabbottomBloc,TabbottomState>(builder: (context, state) {
      if (state is ButtonTab) {
         return Scaffold(
        body: Center(
          child: bottomNav.elementAt(state.tabIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(items: bottomItem,
        currentIndex: state.tabIndex,
        selectedItemColor: Colors.orange.shade700,
        unselectedItemColor: Colors.orange.shade600,
        onTap: (value) {
          BlocProvider.of<TabbottomBloc>(context).add(TabBottom(index: value));
        },
        ),
      );
      }
      return Container();
    },);
  }
}