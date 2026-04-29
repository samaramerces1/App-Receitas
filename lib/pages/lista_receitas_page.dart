import 'package:flutter/material.dart';
import '../services/api_service.dart';

class ListaReceitasPage extends StatefulWidget {
  const ListaReceitasPage({super.key});

  @override
  State<ListaReceitasPage> createState() => _ListaReceitasPageState();
}

class _ListaReceitasPageState extends State<ListaReceitasPage> {
  late Future<List<dynamic>> receitas;

  @override
  void initState() {
    super.initState();
    receitas = ApiService().buscarReceitas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mestre Cuca'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.pushNamed(context, '/favoritos');
            },
          ),
        ],
      ),
      body: FutureBuilder<List<dynamic>>(
        future: receitas,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Erro: ${snapshot.error}',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          final lista = snapshot.data!;

          return ListView.builder(
            itemCount: lista.length,
            itemBuilder: (context, index) {
              final receita = lista[index];

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
                  title: Text(_traduzirTitulo(receita['title'] ?? '')),
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
          );
        },
      ),
    );
  }
}

String _traduzirTitulo(String titulo) {
  final traducoes = {
    'Red Lentil Soup with Chicken and Turnips':
        'Sopa de Lentilha Vermelha com Frango e Nabo',
    'Asparagus and Pea Soup: Real Convenience Food':
        'Sopa de Aspargos e Ervilha',
    'Garlicky Kale': 'Couve com Alho',
    'Slow Cooker Beef Stew': 'Ensopado de Carne na Panela Lenta',
    'Red Kidney Bean Jambalaya': 'Jambalaya com Feijão Vermelho',
    'Cauliflower, Brown Rice, and Vegetable Fried Rice':
        'Arroz Integral com Couve-Flor e Legumes',
    'Quinoa and Chickpea Salad with Sun-Dried Tomatoes and Dried Cherries':
        'Salada de Quinoa com Grão-de-Bico',
    'Easy Homemade Rice and Beans': 'Arroz com Feijão Caseiro',
    'Tuscan White Bean Soup with Olive Oil and Rosemary':
        'Sopa Toscana de Feijão Branco',
    'Crunchy Brussels Sprouts Side Dish': 'Couve de Bruxelas Crocante',
  };

  return traducoes[titulo] ?? titulo;
}