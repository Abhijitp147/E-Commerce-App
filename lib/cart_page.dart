import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/cart_provider.dart';
import 'package:shop_app_flutter/global_variable.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    print(Provider.of<CartProvider>(context).cart);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            final cartItem = cart[index];
            return ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Image.asset(cartItem['imageUrl'] as String),
              ),
              title: Text(
                cartItem['title'] as String,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              subtitle: Text('Size: ${cartItem['sizes']}'),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete_outline, color: Colors.red),
              ),
            );
          }),
    );
  }
}
