
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ItemProduct extends StatefulWidget {
  int id;
  String title;
  int price;
  String images;
  BuildContext context;
  ItemProduct(
      {super.key,
      required this.id,
      required this.title,
      required this.price,
      required this.images,
      required this.context});

  @override
  State<ItemProduct> createState() => _ItemProductState();
}

class _ItemProductState extends State<ItemProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      margin: const EdgeInsets.only(top: 8, left: 4, right: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              width: 1, color: const Color.fromRGBO(158, 158, 158, 1))),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                image: DecorationImage(
                    image: NetworkImage(widget.images), fit: BoxFit.cover)),
          ),
          Container(
            padding: const EdgeInsets.only(left: 8),
            child: Column(children: [
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  widget.title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
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
    );
  }
}

