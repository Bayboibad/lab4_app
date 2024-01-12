// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class LayoutItem extends StatefulWidget {
  String title;
  int price;
  String brand;
  String thumbnail;
  String description;
  List<dynamic> images;

  LayoutItem(
      {super.key,
      required this.title,
      required this.price,
      required this.brand,
      required this.description,
      required this.thumbnail,
      required this.images});

  @override
  State<LayoutItem> createState() => _ItemProductState();
}

class _ItemProductState extends State<LayoutItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        // ignore: avoid_unnecessary_containers
        child: Container(
          child: Column(
            children: [
              HederImages(widget.thumbnail, widget.price),
              const SizedBox(height: 8,),
              Container(
                height: 70,
                child: ListView.builder(
                  itemCount: widget.images.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    dynamic imagesUrl = widget.images[index];
                      return Container(
                        width: 60,
                        height: 60,
                        margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(width: 1,color: Colors.grey),
                        image: DecorationImage(image: NetworkImage(imagesUrl),fit: BoxFit.cover)
                      ),
                    );
                  },),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin:const EdgeInsets.only(left:8,top: 4,bottom: 4,right: 8),
                child: Row(
                  children: [
                    const Icon(Icons.all_out_sharp,size: 30,),
                    const SizedBox(width: 8,),
                    Text(widget.brand, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin:const EdgeInsets.only(left:8,top: 4,bottom: 4,right: 8),
                child: Text(widget.description,style:  const TextStyle(color: Colors.black54,fontSize: 15),),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget HederImages(String thumbnail, int price) {
  return Stack(
    alignment: Alignment.bottomLeft,
    children: [
      Container(
        height: 200,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(thumbnail), fit: BoxFit.cover)),
      ),
      Container(
        padding: const EdgeInsets.all(4),
        color: const Color.fromARGB(255, 242, 142, 142),
        child: Text(
          // ignore: unnecessary_brace_in_string_interps
          "${price}",
          // ignore: prefer_const_constructors
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      )
    ],
  );
}
