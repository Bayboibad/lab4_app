import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab4_app/api/firebase_store.dart';
import 'package:lab4_app/composents/item_fav.dart';
import 'package:lab4_app/configs/string.dart';
import 'package:lab4_app/views/home/account/bloc/update_bloc.dart';
import 'package:lab4_app/views/home/bloc/product_bloc.dart';

import '../../../composents/layout_item.dart';
import '../../../models/fav.dart';

class FavouriteTab extends StatefulWidget {
  const FavouriteTab({super.key});

  @override
  State<FavouriteTab> createState() => _FavouriteTabState();
}

class _FavouriteTabState extends State<FavouriteTab> {
  List<Fav> listFav = [];
  final userId = FirebaseAuth.instance.currentUser!.uid;
  FirebaseAccount tym = FirebaseAccount();
  @override
  initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    try {
      final data = await tym.getTym(userId);
      setState(() {
        listFav = data;
      });
    } catch (e) {
      throw (e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StyleTitiles.favourApp),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: listFav.length,
        itemBuilder: (context, index) {
          Fav fav = listFav[index];
          int proId = fav.proId;
          return Container(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 0.13,
            child: _itemFav(
              proId: proId,
              index: index,
              list: listFav,
            ),
          );
        },
      ),
    );
  }
}

class _itemFav extends StatefulWidget {
  final int proId;
  final List<Fav> list;
  final int index;
  const _itemFav({super.key, required this.proId, required this.list, required this.index});

  @override
  State<_itemFav> createState() => __itemFavState();
}

class __itemFavState extends State<_itemFav> {
  late int id;
  @override
  void initState() {
    super.initState();
    getId();
  }

  void getId() {
    setState(() {
      id = widget.proId;
      print("xóa : ${id}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is SubmitProduct) {
          return Container(
            child: ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                final data = state.list[index];
                if (id != data.id) {
                  return Container();
                } else {
                  return Container(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LayoutItem(
                                  title: data.title,
                                  price: data.price,
                                  brand: data.brand,
                                  description: data.description,
                                  thumbnail: data.thumbnail,
                                  images: data.images),
                            ));
                      },
                      child: ItemFav(
                          id: data.id,
                          title: data.title,
                          price: data.price,
                          images: data.thumbnail,
                          context: context,
                          onTap: () {
                            context
                                .read<UpdateBloc>()
                                .add(ButtonFav(id: data.id.toString()));
                            setState(() {
                              state.list.removeAt(index);
                              print("xóa thành công");
                            });

                          }),
                    ),
                  );
                }
              },
            ),
          );
        }
        return Container(
          child: Text("hhaha"),
        );
      },
    );
  }
}
