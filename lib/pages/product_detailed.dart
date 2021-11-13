import 'package:flutter/material.dart';
import 'package:shop_app_midterm/logic/product_helper.dart';
import 'package:shop_app_midterm/models/clothes_model.dart';
import 'package:shop_app_midterm/widgets/default_app_bar.dart';

class ProductDetailedPage extends StatelessWidget {
  const ProductDetailedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map _routeArgs = ModalRoute.of(context)!.settings.arguments as Map;
    Clothes _product = ProductHelper().getProductById(_routeArgs['prodId']);
    Map _data = {
      "Name: ": _product.name,
      "Price": _product.price,
      "Size: ": _product.size,
    };
    return Scaffold(
      appBar:
          DefaultAppBar(_product.name, () => _deleteProduct(context, _product.id)),
      body: ListView(
        children: [
          Align(
            child: Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05, bottom: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.indigo)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(_product.imageUrl.contains('http')
                      ? _product.imageUrl
                      : 'https://via.placeholder.com/300/09f/fff.png%20C/'),
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
              ),
            ),
          ),
          for (var index = 0; index < _data.keys.toList().length; index++)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(_data.keys.toList()[index]),
                Text("${_data.values.toList()[index]}"),
              ],
            ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              _product.description,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }

  void _deleteProduct(context, id) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              "Are you sure?",
              textAlign: TextAlign.center,
            ),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      ProductHelper().deleteProductById(id);
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                    child: const Text("Yes")),
                InkWell(
                    onTap: () => {Navigator.of(context).pop()},
                    child: const Text("no")),
              ],
            ),
          );
        });
  }
}
