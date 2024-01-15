
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

class FavouriteTab extends StatelessWidget {
  const FavouriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    FirebaseAccount tym = FirebaseAccount();
    return Scaffold(
      appBar: AppBar(
        title: Text(StyleTitiles.favourApp),
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder<List<Fav>>(
        future:
            tym.getTym(userId), // Replace 'yourUserId' with the actual user ID
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData) {
            return Center(
              child: Text('No favorites found.'),
            );
          } else {
            List<Fav> favList = snapshot.data!;
            return ListView.builder(
              itemCount: favList.length,
              itemBuilder: (context, index) {
                Fav fav = favList[index];
                int proId = fav.proId;
                return Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.13,
                  child: _itemFav(proId),
                );
              },
            );
            // return _itemFav();
          }
        },
      ),
    );
  }
}

Widget _itemFav(int id) {
  return BlocBuilder<ProductBloc, ProductState>(
    builder: (context, state) {
      if (state is LoadingProduct) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is SubmitProduct) {
        return Container(
          child: ListView.builder(
            itemCount: state.list.length,
            itemBuilder: (context, index) {
              final data = state.list[index];
              if (id == data.id) {
                return Container(
                    child: GestureDetector(
                      onTap: (){
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
                          onTap: (){
                            context.read<UpdateBloc>().add(ButtonFav(id: data.id.toString()));
                          }),
                    ),
                    );
              } else {
                return Container();
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
