import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiKey = 'e858aecf96e14f8aa3845a6c79d52a3c';

  Future<List<dynamic>> buscarReceitas() async {
    final url = Uri.parse(
      'https://api.spoonacular.com/recipes/complexSearch?apiKey=$apiKey&number=10&addRecipeInformation=true',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final dados = jsonDecode(response.body);
      return dados['results'];
    } else {
      throw Exception('Erro ao carregar receitas');
    }
  }

  Future<Map<String, dynamic>> buscarDetalhesReceita(int id) async {
    final url = Uri.parse(
      'https://api.spoonacular.com/recipes/$id/information?apiKey=$apiKey&includeNutrition=false',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Erro ao carregar detalhes da receita');
    }
  }
}