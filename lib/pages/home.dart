import 'package:flutter/material.dart';
import 'package:shop_app_midterm/logic/product_helper.dart';
import 'package:shop_app_midterm/models/clothes_model.dart';
import 'package:shop_app_midterm/widgets/default_app_bar.dart';
import 'package:shop_app_midterm/widgets/single_product.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var _gadgetWidth = MediaQuery.of(context).size.width;
    List<Clothes> _clothesList = ProductHelper().getClothes;
    return WillPopScope(
      onWillPop: () {
        return Future.delayed(const Duration(seconds: 1));
      },
      child: Scaffold(
        appBar: const DefaultAppBar('Home Page', null),
        body: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            itemCount: _clothesList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: _gadgetWidth * 0.05,
                mainAxisSpacing: _gadgetWidth * 0.05),
            itemBuilder: (BuildContext context, idx) {
              return GestureDetector(
                onLongPress: () => Navigator.of(context).pushNamed(
                    '/product_edit',
                    arguments: {"prodId": _clothesList[idx].id}).then((_) {
                  setState(() {});
                }),
                onTap: () => Navigator.of(context).pushNamed(
                    '/product_detailed',
                    arguments: {"prodId": _clothesList[idx].id}).then((_) {
                  setState(() {});
                }),
                child: SingleProduct(
                  id: _clothesList[idx].id,
                ),
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () =>
              Navigator.of(context).pushNamed('/product_add').then((_) {
            setState(() {});
          }),
          child: const Icon(
            Icons.add,
            size: 30,
          ),
        ),
      ),
    );
  }
}
