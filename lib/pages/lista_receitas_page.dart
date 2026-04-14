import 'package:flutter/material.dart';
import '../routes.dart';

class ListaReceitasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Receitas')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Bolo de Chocolate'),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.detalhe);
            },
          ),
        ],
      ),
    );
  }
}