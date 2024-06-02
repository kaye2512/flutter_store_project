import 'package:flutter/material.dart';
import 'package:store/widgets/common/appbar_widget.dart';
// import 'package:store/widgets/common/drawer_widget.dart';
import 'package:store/widgets/product-details/product_details_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppbarWidget(),
      // si l'écran est superposé, si le drawer n'est pas présent, une flèche de retour va apparaître
      // drawer: DrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductDetailsWidget(),
          ],
        ),
      ),
    );
  }
}
