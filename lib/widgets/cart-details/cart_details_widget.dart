import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/providers/cart_provider.dart';

class CartDetailsWidget extends StatelessWidget {
  const CartDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.cartItems;

    if (cartItems.isEmpty) {
      return const Center(
        child: Text(
          'Panier vide',
          style: TextStyle(fontSize: 24, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        final product = cartItems[index];
        return ListTile(
          title: Text(product.title), // Assurez-vous que le champ 'name' existe dans Product
          subtitle: Text('Prix: ${product.price}'),
          trailing: IconButton(
            icon: const Icon(Icons.remove_shopping_cart),
            color: Colors.red, // Définir la couleur de l'icône sur rouge
            onPressed: () {
              cartProvider.removeFromCart(product);
            },
          ),
          // Vous pouvez ajouter plus de détails ici, comme une image, une description, etc.
        );
      },
    );
  }
}