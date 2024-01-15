import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ItemFav extends StatefulWidget {
  int id;
  String title;
  int price;
  String images;
  BuildContext context;
  Function() onTap;
  ItemFav(
      {super.key,
      required this.id,
      required this.title,
      required this.price,
      required this.images,
      required this.context,
      required this.onTap});

  @override
  State<ItemFav> createState() => _ItemProductState();
}

class _ItemProductState extends State<ItemFav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8, left: 4, right: 4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 1, color: Colors.grey)),
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(widget.images), fit: BoxFit.cover)),
                ),
                // ignore: avoid_unnecessary_containers
                Container(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(children: [
                    // ignore: sized_box_for_whitespace
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Text(
                        "${widget.id}",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    // ignore: sized_box_for_whitespace
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Text(
                        widget.title,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    // ignore: unnecessary_brace_in_string_interps
                    Container(
                      alignment: Alignment.topLeft,
                      width: MediaQuery.of(context).size.width * 0.7,
                      // ignore: unnecessary_brace_in_string_interps
                      child: Text(
                        "${widget.price}",
                        style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    )
                  ]),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
              child: IconButton(onPressed: widget.onTap, icon: Icon(Icons.close)))
        ],
      ),
    );
  }
}
