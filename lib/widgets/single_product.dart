import 'package:flutter/material.dart';
import 'package:shop_app_midterm/logic/product_helper.dart';
import 'package:shop_app_midterm/models/clothes_model.dart';

class SingleProduct extends StatelessWidget {
  const SingleProduct({
    Key? key,
    required this.id,
  }) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context) {
    Clothes _singleItem = ProductHelper().getProductById(id);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.indigo)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: FadeInImage(
                width: MediaQuery.of(context).size.width,
                height:
                    (MediaQuery.of(context).size.height - kToolbarHeight) * 0.2,
                fit: BoxFit.cover,
                fadeInDuration: const Duration(milliseconds: 300),
                placeholder:
                    const AssetImage('assets/clothes/clothes_placeholder.png'),
                image: _singleItem.imageUrl.contains('https://')
                    ? NetworkImage(
                        _singleItem.imageUrl,
                      )
                    : const NetworkImage(
                        'https://via.placeholder.com/300/09f/fff.png%20C/'),
                imageErrorBuilder: (context, obj, trace) {
                  return Image(
                    image: const AssetImage(
                        'assets/clothes/clothes_placeholder.png'),
                    width: MediaQuery.of(context).size.width,
                  );
                },
              ),
            ),
          ),
        ),
        Text(_singleItem.name),
        Text("${_singleItem.price}\$"),
      ],
    );
  }
}
