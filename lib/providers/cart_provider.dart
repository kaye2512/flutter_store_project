import 'package:flutter/material.dart';
import 'package:store/models/product.dart';

class CartProvider extends ChangeNotifier {

  // stocker un produit
  Product? _product;

  // getter / setter
  Product? get product => _product;

  // liste des produits dans le panier
  final List<Product> _cartItems = [];

  // getter : accéder à la liste des produits du panier
  List<Product> get cartItems => _cartItems;


  // ajouter le produit au panier
  void addToCart(Product product) {
    _cartItems.add(product);
    notifyListeners();
  }

  // vérifier si le produit est dans le panier
  bool isProductInCart(Product product) {
    return _cartItems.contains(product);
  }

  // retirer le produit du panier
  void removeFromCart(Product product) {
    _cartItems.remove(product);
    notifyListeners();
  }
}