import 'package:flutter/material.dart';
import 'package:shop_app_midterm/logic/product_helper.dart';
import 'package:shop_app_midterm/models/clothes_model.dart';
import 'package:shop_app_midterm/widgets/default_app_bar.dart';
import 'package:shop_app_midterm/widgets/default_textfield.dart';
import 'package:shop_app_midterm/widgets/main_button.dart';

class _ProductEditPageState extends State<ProductEditPage> {
  late TextEditingController _nameController;
  late TextEditingController _imageController;
  late TextEditingController _sizeController;
  late TextEditingController _priceController;
  late TextEditingController _descController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _imageController = TextEditingController();
    _sizeController = TextEditingController();
    _priceController = TextEditingController();
    _descController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _imageController.dispose();
    _sizeController.dispose();
    _priceController.dispose();
    _descController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Map _prodId = ModalRoute.of(context)!.settings.arguments as Map;
    Clothes _singleItem = ProductHelper().getProductById(_prodId['prodId']);
    Map<TextEditingController, String> _textControllers = {
      _nameController: _singleItem.name,
      _imageController: _singleItem.imageUrl,
      _sizeController: _singleItem.size,
      _priceController: _singleItem.price.toString(),
      _descController: _singleItem.description,
    };
    return Scaffold(
      appBar: const DefaultAppBar('Edit Product', null),
      body: ListView(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.07,
            horizontal: 15),
        children: [
          Column(
            children: [
              for (var idx = 0;
                  idx < _textControllers.keys.toList().length;
                  idx++)
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: DefaultTextField(
                      isNumeric:
                          _textControllers.values.toList()[idx] == "Price"
                              ? true
                              : false,
                      controller: _textControllers.keys.toList()[idx],
                      label: _textControllers.values.toList()[idx],
                    )),
            ],
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MainButton(
                    title: 'BACK', action: () => Navigator.of(context).pop()),
                MainButton(
                    title: 'EDIT',
                    action: () =>
                        _validateProduct(_singleItem, _textControllers)),
              ],
            ),
          )
        ],
      ),
    );
  }

  _validateProduct(Clothes _singleItem, Map controllers) {
    for (int i = 0; i < controllers.keys.toList().length; i++) {
      if (controllers.keys.toList()[i].text == '') {
        controllers.keys.toList()[i].text = controllers.values.toList()[i];
      }
    }
    ProductHelper().editProduct(Clothes(
        id: _singleItem.id,
        name: _nameController.text,
        imageUrl: _imageController.text,
        size: _sizeController.text,
        price: double.parse(_priceController.text),
        description: _descController.text));
    Navigator.of(context).pop();
  }
}

class ProductEditPage extends StatefulWidget {
  const ProductEditPage({Key? key}) : super(key: key);

  @override
  _ProductEditPageState createState() => _ProductEditPageState();
}
