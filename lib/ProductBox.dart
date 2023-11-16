import 'package:flutter/material.dart';
import 'package:lorem_ipsum_stores/Product.dart';

class ProductBox extends StatelessWidget {
  ProductBox({key,required this.item}) : super(key: key);
  final Product item;

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        child: Card(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image(
                  width: 100,
                  image: NetworkImage(this.item.image),
                ),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(this.item.name,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(this.item.description),
                            Text("Price: " + this.item.price.toString()),
                          ],
                        )
                    )
                )
              ]
          ),
        )
    );
  }
}