import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/cart_provider.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, Object> product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int? selectedSize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Column(
        children: [
          Text(
            widget.product['title'].toString(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(widget.product['imageUrl'].toString()),
          ),
          Spacer(
            flex: 2,
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Color.fromRGBO(245, 247, 249, 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\$${widget.product['price']}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['sizes'] as List<int>).length,
                    itemBuilder: (context, index) {
                      final size =
                          (widget.product['sizes'] as List<int>)[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {});
                            selectedSize = size;
                          },
                          child: Chip(
                            label: Text(
                              size.toString(),
                            ),
                            backgroundColor: selectedSize == size
                                ? Theme.of(context).colorScheme.primary
                                : Color.fromRGBO(225, 225, 225, 0.521),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Provider.of<CartProvider>(context, listen: false)
                          .addProduct(widget.product);
                    },
                    icon: Icon(Icons.shopping_cart_outlined),
                    label: Text('Add To Cart'),
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Colors.black),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
