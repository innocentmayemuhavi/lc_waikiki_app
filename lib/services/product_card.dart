import 'package:flutter/material.dart';
import 'package:lc_waikiki_app/services/card_data.dart';
import 'package:lc_waikiki_app/shared/styles.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({Key? key, required this.data}) : super(key: key);

  final Product data;

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.4,
      child: Container(
        padding: const EdgeInsets.fromLTRB(7, 10, 7, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 150,
              child: Image.asset(
                widget.data.image,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Center(
              child: Text(
                widget.data.name,
                style: productnamestyle,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
                child: Text(widget.data.price.toString(),
                    style: PriceTextStyles, textAlign: TextAlign.center)),
          ],
        ),
      ),
    );
  }
}
