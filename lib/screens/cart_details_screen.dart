import 'package:flutter/material.dart';
import 'package:store/widgets/cart-details/cart_details_widget.dart';
import 'package:store/widgets/common/appbar_widget.dart';
import 'package:store/widgets/common/drawer_widget.dart';

class CartDetailsScreen extends StatelessWidget {
  const CartDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppbarWidget(),
      drawer: DrawerWidget(),
      body: Column(
        children: [
          Expanded(
            child: CartDetailsWidget(),
          ),
        ],
      ),
    );
  }
}