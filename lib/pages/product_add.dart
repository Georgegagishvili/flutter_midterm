import 'package:flutter/material.dart';
import 'package:shop_app_midterm/logic/product_helper.dart';
import 'package:shop_app_midterm/models/clothes_model.dart';
import 'package:shop_app_midterm/widgets/default_app_bar.dart';
import 'package:shop_app_midterm/widgets/default_textfield.dart';
import 'package:shop_app_midterm/widgets/main_button.dart';

class _ProductAddPageState extends State<ProductAddPage> {
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
    String _pleaseEnter = "Please Enter";
    Map<dynamic, String> _textControllers = {
      _nameController: "Name",
      _imageController: "Image",
      _sizeController: "Size",
      _priceController: "Price",
      _descController: "Description",
    };
    return Scaffold(
      appBar: const DefaultAppBar('Add', null),
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
                      label:
                          "$_pleaseEnter ${_textControllers.values.toList()[idx]}",
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
                    title: 'ADD',
                    action: () {
                      if (_validateControllers(
                          _textControllers.keys.toList())) {
                        ProductHelper().addProduct(Clothes(
                            id: ProductHelper().getClothes.last.id + 1,
                            name: _nameController.text,
                            imageUrl: _imageController.text,
                            size: _sizeController.text,
                            price: double.parse(_priceController.text),
                            description: _descController.text));
                        Navigator.of(context).pop();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Please Fill Textfields")));
                      }
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }

  _validateControllers(List controllers) {
    List<bool> _controllerStates = [];
    for (var item in controllers) {
      if (item.text == '') {
        _controllerStates.add(false);
      }
    }
    if (_controllerStates.isNotEmpty) {
      return false;
    } else {
      return true;
    }
  }
}

class ProductAddPage extends StatefulWidget {
  const ProductAddPage({Key? key}) : super(key: key);

  @override
  _ProductAddPageState createState() => _ProductAddPageState();
}
