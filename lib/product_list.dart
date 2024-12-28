import 'package:flutter/material.dart';
import 'package:shop_app_flutter/global_variable.dart';
import 'package:shop_app_flutter/product_card.dart';
import 'package:shop_app_flutter/product_details_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const ['All', 'Puma', 'Bata', 'Nike', 'Adidas'];
  String? selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(225, 225, 225, 1),
      ),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(50),
      ),
    );
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Shoes\nCollection',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search',
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border),
                ),
              )
            ],
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {});
                        selectedFilter = filter;
                      },
                      child: Chip(
                        label: Text(filter),
                        labelStyle: const TextStyle(fontSize: 16),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            style: BorderStyle.none,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: selectedFilter == filter
                            ? Theme.of(context).colorScheme.primary
                            : const Color.fromRGBO(225, 225, 225, 0.521),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return ProductDetailsPage(
                            product: product,
                          );
                        },
                      ),
                    );
                  },
                  child: ProductCard(
                      title: product['title'].toString(),
                      price: product['price'] as double,
                      image: product['imageUrl'].toString(),
                      color: index.isOdd
                          ? const Color.fromRGBO(216, 240, 253, 1)
                          : const Color.fromRGBO(225, 225, 225, 0.521)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
