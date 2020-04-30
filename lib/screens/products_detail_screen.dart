import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class ProductsDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              loadedProduct.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Text(
              loadedProduct.description,
              style:
                  TextStyle(fontSize: 20, color: Theme.of(context).accentColor),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
              child: Text('\$${loadedProduct.price}',
                  style: TextStyle(
                      fontSize: 40, color: Theme.of(context).primaryColor))),
        ],
      ),
    );
  }
}
