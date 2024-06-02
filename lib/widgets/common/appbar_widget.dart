import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      /*
          title: texte, ou icône, ou image
          centerTitle: centrer le titre
          leading: regroupement de widgets à gauche de la barre de navigation
          actions: regroupement de widgets à droite de la barre de navigation…
      */
      title: const Text(
        'Store',
        style: TextStyle(
          // color: Colors.deepOrange,
          color: Color.fromRGBO(255, 0, 255, 1),
          fontSize: 20,
          fontFamily: 'SpaceGrotesk',
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            /*
              débogage :
                print : affichage de données simples
                inspect : affichage de données complexes
            */
            print('on pressed');
          },
          icon: const Icon(Icons.person),
        ),
        IconButton(
          onPressed: () {
            context.pushNamed('cart');
          },
          icon: const Icon(Icons.shopping_cart),
        ),
      ],
      centerTitle: true,
    );
  }

  // permet de définir la hauteur de la barre de navigation
  @override
  Size get preferredSize => const Size.fromHeight(55);
}
