import 'dart:async';
import 'package:flutter/material.dart';

// classe du widget
class AdsWidget extends StatefulWidget {
  AdsWidget({super.key});

  /*
    dart :
      List : équivalent à un array indicé
      Map : équivalent à un objet JS

      visiblité des membres :
        pas de protected
        préfixe _ : équivalent à private
  */

  // Liste des Map
  final List<Map> _items = [
    {'img': 'ad1.jpg', 'text': 'Text1'},
    {'img': 'ad2.jpg', 'text': 'Text2'},
    {'img': 'ad3.jpg', 'text': 'Text3'},
  ];

  // indice de la liste
  int _index = 0;

  // minuteur
  // ? : valeur nulle
  Timer? _timer;

  @override
  State<AdsWidget> createState() => _AdsWidgetState();
}

// classe de l'état du widget
class _AdsWidgetState extends State<AdsWidget> {
  /*
    cycle de vie d'un widget
      initState : affichage du widget
      dispose : désaffichage du widget
  */
  @override
  void initState() {
    super.initState();
    // déclencher le timer
    widget._timer = Timer.periodic(const Duration(seconds: 2), _setTimer);
  }

  void _setTimer(Timer timer) {
    // setState : permet de modifier un état et de déclencher la mise à jour visuelle du widget
    setState(() {
      if (widget._index < widget._items.length - 1) {
        widget._index++;
      } else {
        widget._index = 0;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    // stopper le minuteur
    // null coaslescing : utilisation ?
    // ! : permet de définir que la valeur n'est pas nulle
    widget._timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // le mot-clé widget permet d'accéder à la classe du widget à partir de la classe de l'état du widget
        Image.asset('assets/img/${widget._items[widget._index]['img']}'),
        Text(widget._items[widget._index]['text'])
      ],
    );
  }
}
