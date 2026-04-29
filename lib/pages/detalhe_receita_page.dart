import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../data/favoritos_data.dart';

class DetalheReceitaPage extends StatefulWidget {
  final Map<String, dynamic> receita;

  const DetalheReceitaPage({super.key, required this.receita});

  @override
  State<DetalheReceitaPage> createState() => _DetalheReceitaPageState();
}

class _DetalheReceitaPageState extends State<DetalheReceitaPage> {
  late Future<Map<String, dynamic>> detalhes;

  @override
  void initState() {
    super.initState();
    detalhes = ApiService().buscarDetalhesReceita(widget.receita['id']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da Receita'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: detalhes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text('Erro ao carregar detalhes da receita'),
            );
          }

          final receita = snapshot.data!;
          final ingredientes = receita['extendedIngredients'] ?? [];
          final instrucoes = receita['analyzedInstructions'];

          return SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  receita['image'] ?? '',
                  width: double.infinity,
                  height: 240,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: double.infinity,
                      height: 240,
                      color: Colors.grey[300],
                      child: const Icon(Icons.image_not_supported, size: 70),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _traduzirTitulo(receita['title'] ?? 'Receita sem nome'),
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 12),

                      ElevatedButton.icon(
                        onPressed: () {
                          favoritos.add(Map<String, dynamic>.from(receita));

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Receita adicionada aos favoritos!'),
                            ),
                          );
                        },
                        icon: const Icon(Icons.favorite),
                        label: const Text('Adicionar aos Favoritos'),
                      ),

                      const SizedBox(height: 16),

                      Row(
                        children: [
                          Expanded(
                            child: _cardInfo(
                              Icons.timer,
                              'Tempo',
                              '${receita['readyInMinutes'] ?? '-'} min',
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: _cardInfo(
                              Icons.restaurant,
                              'Porções',
                              '${receita['servings'] ?? '-'}',
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      const Text(
                        'Ingredientes',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      ...ingredientes.map<Widget>((ingrediente) {
                        return Card(
                          child: ListTile(
                            leading: const Icon(Icons.check_circle_outline),
                            title: Text(
                              _traduzirTexto(
                                ingrediente['original'] ?? 'Ingrediente',
                              ),
                            ),
                          ),
                        );
                      }).toList(),

                      const SizedBox(height: 24),

                      const Text(
                        'Modo de Preparo',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      _mostrarModoPreparo(instrucoes),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _cardInfo(IconData icon, String titulo, String valor) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            Icon(icon, size: 30),
            const SizedBox(height: 8),
            Text(
              titulo,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(valor),
          ],
        ),
      ),
    );
  }

  Widget _mostrarModoPreparo(dynamic instrucoes) {
    if (instrucoes == null || instrucoes.isEmpty) {
      return const Text(
        'Modo de preparo não disponível para esta receita.',
        style: TextStyle(fontSize: 16),
      );
    }

    final passos = instrucoes[0]['steps'];

    return Column(
      children: passos.map<Widget>((passo) {
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              child: Text('${passo['number']}'),
            ),
            title: Text(
              _traduzirTexto(passo['step'] ?? ''),
            ),
          ),
        );
      }).toList(),
    );
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

  String _traduzirTexto(String texto) {
    return texto
        .replaceAll('olive oil', 'azeite de oliva')
        .replaceAll('chicken', 'frango')
        .replaceAll('Chicken', 'Frango')
        .replaceAll('beef', 'carne')
        .replaceAll('rice', 'arroz')
        .replaceAll('beans', 'feijão')
        .replaceAll('salt', 'sal')
        .replaceAll('pepper', 'pimenta')
        .replaceAll('garlic', 'alho')
        .replaceAll('onion', 'cebola')
        .replaceAll('water', 'água')
        .replaceAll('milk', 'leite')
        .replaceAll('sugar', 'açúcar')
        .replaceAll('flour', 'farinha')
        .replaceAll('egg', 'ovo')
        .replaceAll('eggs', 'ovos')
        .replaceAll('oil', 'óleo')
        .replaceAll('butter', 'manteiga')
        .replaceAll('cheese', 'queijo')
        .replaceAll('tomatoes', 'tomates')
        .replaceAll('tomato', 'tomate')
        .replaceAll('minutes', 'minutos')
        .replaceAll('minute', 'minuto');
  }
}