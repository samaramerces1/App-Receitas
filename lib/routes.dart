import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/lista_receitas_page.dart';
import 'pages/detalhe_receita_page.dart';
import 'pages/favoritos_page.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );

      case '/receitas':
        return MaterialPageRoute(
          builder: (_) => const ListaReceitasPage(),
        );

      case '/detalhe':
        final receita = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => DetalheReceitaPage(receita: receita),
        );

      case '/favoritos':
        return MaterialPageRoute(
          builder: (_) => FavoritosPage(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
    }
  }
}