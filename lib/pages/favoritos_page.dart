import 'package:flutter/material.dart';
import '../data/favoritos_data.dart';

class FavoritosPage extends StatelessWidget {
  const FavoritosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receitas Favoritas'),
      ),
      body: favoritos.isEmpty
          ? const Center(
              child: Text(
                'Nenhuma receita favorita adicionada ainda.',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: favoritos.length,
              itemBuilder: (context, index) {
                final receita = favoritos[index];

                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: Image.asset(
                      receita['image'] ?? '',
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 80,
                          height: 80,
                          color: Colors.grey[300],
                          child: const Icon(Icons.image_not_supported),
                        );
                      },
                    ),
                    title: Text(receita['title'] ?? ''),
                    subtitle: Text(
                      'Tempo de preparo: ${receita['readyInMinutes']} min',
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/detalhe',
                        arguments: Map<String, dynamic>.from(receita),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}