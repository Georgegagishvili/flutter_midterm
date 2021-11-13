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
    return Card(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: FadeInImage(
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                fadeInDuration: const Duration(milliseconds: 300),
                placeholder:
                    const AssetImage('assets/clothes/clothes_placeholder.png'),
                image: _singleItem.imageUrl.contains('https://')
                    ? NetworkImage(
                        _singleItem.imageUrl,
                      )
                    : const NetworkImage(
                        'https://via.placeholder.com/300/414345/ffffff.png'),
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
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _singleItem.name,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: 'Monospace',
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                ),
                Flexible(
                  child: Text(
                    "${_singleItem.price}\$",
                    style: const TextStyle(
                        fontFamily: 'Monospace',
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () => Navigator.of(context).pushNamed(
                '/product_detailed',
                arguments: {"prodId": _singleItem.id}).then((_) {
            }),
            child: Ink(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.35,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.black, width: 2)),
                child: const Text(
                  "See More",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Roboto",
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
