import 'package:flutter/material.dart';
import '../routes.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FUNCIONOU')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.receitas);
              },
              child: Text('Ver Receitas'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.favoritos);
              },
              child: Text('Favoritos'),
            ),
          ],
        ),
      ),
    );
  }
}