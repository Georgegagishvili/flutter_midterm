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
      "Name:": _product.name,
      "Price:": _product.price,
      "Size:": _product.size,
    };
    return Scaffold(
      appBar: DefaultAppBar(
          _product.name, () => _deleteProduct(context, _product.id)),
      body: Stack(
        children: [
          Positioned(
              top: 200,
              bottom: 0,
              left: -180,
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.3,
                backgroundColor: const Color(0xff283048),
              )),
          Positioned(
              left: -20,
              top: -20,
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.15,
                backgroundColor: const Color(0xff859398),
              )),
          Positioned(
              right: -80,
              bottom: -80,
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.25,
                backgroundColor: const Color(0xff859398),
              )),
          Positioned(
              top: 0,
              bottom: 120,
              right: 0,
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.2,
                backgroundColor: const Color(0xff283048),
              )),
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            children: [
              Align(
                child: Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05,
                      bottom: 30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xff2C5364),
                      )),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(_product.imageUrl.contains('http')
                          ? _product.imageUrl
                          : 'https://via.placeholder.com/300/414345/ffffff.png'),
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),
                  ),
                ),
              ),
              for (var index = 0; index < _data.keys.toList().length; index++)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      _data.keys.toList()[index],
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'Monospace',
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          color: Color(0xff1D4350),
                          fontWeight: FontWeight.w800),
                    ),
                    Text(
                      "${_data.values.toList()[index]}",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontFamily: 'Monospace',
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          color: Color(0xff1D4350),
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  _product.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontFamily: '',
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  void _deleteProduct(context, id) {
    showDialog(
        context: context,
        barrierColor: const Color(0xff1D4350).withOpacity(0.5),
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: const Color(0xff1f3041),
            title: const Text(
              "Are you sure?",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, letterSpacing: 1),
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
                    child: const Text(
                      "Yes",
                      style: TextStyle(color: Colors.white),
                    )),
                InkWell(
                    onTap: () => {Navigator.of(context).pop()},
                    child: const Text(
                      "No",
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
          );
        });
  }
}
