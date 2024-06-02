import 'package:go_router/go_router.dart';
import 'package:store/screens/home_screen.dart';
import 'package:store/screens/product_details_screen.dart';

import '../screens/cart_details_screen.dart';
import '../screens/product_screen.dart';

class RouterService {
  // lister les routes
  static GoRouter getRouter() {
    return GoRouter(
      routes: [
        GoRoute(
          /*
            path : schéma Web d'une route
              > la route / doit exister et est considérée comme la route d'accueil
            name : nom de la route
            builder permet de cibler un widget associé à la route
          */
          path: '/',
          name: 'home',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/product-details',
          name: 'product-details',
          builder: (context, state) => const ProductDetailsScreen(),
        ),
        GoRoute(
          path: '/cart',
          name: 'cart',
          builder: (context, state) => const CartDetailsScreen(),
        ),
        GoRoute(
          path: '/products',
          name: 'products',
          builder: (context, state) => const ProductsScreen(),
        ),
      ],
    );
  }
}
