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
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Erro: ${snapshot.error}'),
            );
          }

          final lista = snapshot.data!;

          return ListView.builder(
            itemCount: lista.length,
            itemBuilder: (context, index) {
              final receita = lista[index];

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/detalhe',
                      arguments: Map<String, dynamic>.from(receita),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            receita['image'] ?? '',
                            width: 90,
                            height: 90,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 90,
                                height: 90,
                                color: Colors.grey[300],
                                child: const Icon(Icons.image_not_supported),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _traduzirTitulo(receita['title'] ?? ''),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'Tempo de preparo: ${receita['readyInMinutes']} min',
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  ),
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