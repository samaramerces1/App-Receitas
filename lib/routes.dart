import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/lista_receitas_page.dart';
import 'pages/detalhe_receita_page.dart';
import 'pages/favoritos_page.dart';

class AppRoutes {
  static const home = '/';
  static const receitas = '/receitas';
  static const detalhe = '/detalhe';
  static const favoritos = '/favoritos';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => HomePage(),
    receitas: (context) => ListaReceitasPage(),
    detalhe: (context) => DetalheReceitaPage(),
    favoritos: (context) => FavoritosPage(),
  };
}