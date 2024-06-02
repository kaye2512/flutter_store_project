import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:store/models/product.dart';
import 'package:store/services/products_service.dart';
import 'package:store/widgets/home/product_item_grid.dart';

class ProductsGridWidget extends StatelessWidget {
  ProductsGridWidget({super.key});

  // instancier le service
  final ProductsService _productsService = ProductsService();

  @override
  Widget build(BuildContext context) {
    // inspect(_productsService.getProducts());

    /*
      widget FutureBuilder : à utiliser obligatoirement avec une future
        future : cibler la future
        builder : permet de boucler sur les résultats renvoyés pas la future
          > paramètre snapshot contient les données de la future
    */
    return FutureBuilder(
      future: _productsService.getProducts(),
      builder: (context, snapshot) {
        // si les données sont accessibles
        if (snapshot.hasData) {
          // requireData : récupérer les données
          List<Product> data = snapshot.requireData;

          // inspect(data);
          /*
            définir une hauteur à la grille :
              shrinkWrap : imbriquer les éléments dans la grille
              itemCount :nombre d'éléments présents dans la boucle
            NeverScrollableScrollPhysics : désactiver l'ascenseur sur une grille
          */
          return Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                const Text(
                  'Our products',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                  itemBuilder: (context, index) {
                    // transmettre le produit au widget enfant
                    return ProductItemGrid(
                      product: data[index],
                    );
                  },
                ),
              ],
            ),
          );
        }

        // si les données ne sont pas accessibles
        return const CircularProgressIndicator();
      },
    );
  }
}
