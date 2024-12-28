import 'package:flutter/material.dart';
import 'package:shop_app_flutter/cart_page.dart';

import 'package:shop_app_flutter/product_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;
  List<Widget> pages = const [ProductList(), CartPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          iconSize: 35,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          onTap: (value) {
            setState(() {
              currentPage = value;
            });
          },
          currentIndex: currentPage,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: '')
          ]),
    );
  }
}
