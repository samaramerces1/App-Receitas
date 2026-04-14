import 'package:flutter/material.dart';

class DetalheReceitaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalhe')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Text('Detalhes da receita aqui'),
      ),
    );
  }
}