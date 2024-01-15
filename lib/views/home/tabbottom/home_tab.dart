import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab4_app/api/firebase_store.dart';
import 'package:lab4_app/composents/icon_button.dart';
import 'package:lab4_app/composents/item_product.dart';
import 'package:lab4_app/composents/layout_item.dart';
import 'package:lab4_app/configs/string.dart';
import 'package:lab4_app/models/product.dart';
import 'package:lab4_app/views/home/account/bloc/update_bloc.dart';
import 'package:lab4_app/views/home/bloc/product_bloc.dart';
import 'package:loadmore/loadmore.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int count = 10;
  late List<Product> list;
  String userId = "";
  @override
  void initState() {
    super.initState();
    loadData();
    loadUserId();
    FirebaseAccount().getUser(userId);
  }

  Future<void> loadData() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        final data = context.read<ProductBloc>();
        data.add(CountEvent(count: count));
        count += 10;
      });
    });
  }

  Future<void> loadUserId() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        userId = user.uid;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StyleTitiles.homeApp),
        automaticallyImplyLeading: false,
        actions: [iconBtn(icon: Icon(Icons.search), onTap: () {}, size: 30.0)],
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is LoadingProduct || state is ProductInitial) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorProduct) {
            return Center(
              child: Text(state.error),
            );
          } else if (state is SubmitProduct) {
            return RefreshIndicator(
              onRefresh: _refresh,
              child: LoadMore(
                onLoadMore: _loadMore,
                isFinish: state.list.length >= 10,
                whenEmptyLoad: true,
                delegate: const DefaultLoadMoreDelegate(),
                textBuilder: DefaultLoadMoreTextBuilder.chinese,
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.all(4),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                        mainAxisExtent: 270,
                      ),
                      itemCount: state.list.length,
                      itemBuilder: (context, index) {
                        var data = state.list[index];
                        return Padding(
                          padding: const EdgeInsets.all(0),
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
                              child: Stack(
                                children: [
                                  ItemProduct(
                                      id: data.id,
                                      title: data.title,
                                      price: data.price,
                                      images: data.thumbnail,
                                      context: context),
                                  Padding(
                                    padding: EdgeInsets.all(4),
                                    child:
                                        stackImage(id: data.id, userId: userId),
                                  ),
                                ],
                              )),
                        );
                      },
                    ),
                  ),
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  Future<bool> _loadMore() async {
    await Future.delayed(const Duration(seconds: 0, milliseconds: 100));
    loadData();
    return true;
  }

  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 0, milliseconds: 100));
    loadData();
  }
}

class stackImage extends StatefulWidget {
  final int id;
  final String userId;
  stackImage({super.key, required this.id, required this.userId});

  @override
  State<stackImage> createState() => _stackImageState();
}

class _stackImageState extends State<stackImage> {
  @override
  Widget build(BuildContext context) {
          return Container(
            alignment: Alignment.topRight,
            padding: EdgeInsets.all(0),
            child: IconButton(
              onPressed: () {
                context.read<UpdateBloc>().add(
                    ButtonLove(productId: widget.id, userId: widget.userId));
              },
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              color: Colors.amber,
            ),
          );
    // return Container(
    //   child: Text("${widget.id} ---  ${widget.userId}"),
    // );
  }
}
