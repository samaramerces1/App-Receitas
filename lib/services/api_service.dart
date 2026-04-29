class ApiService {
  Future<List<dynamic>> buscarReceitas() async {
    return [
      {
        'id': 1,
        'title': 'Bolo de Laranja',
        'image': 'assets/images/Bolo_de_Laranja.png',
        'readyInMinutes': 50,
        'servings': 8,
      },
      {
        'id': 2,
        'title': 'Bolo de Chocolate',
        'image': 'assets/images/Bolo_de_Chocolate.jpg',
        'readyInMinutes': 60,
        'servings': 10,
      },
      {
        'id': 3,
        'title': 'Arroz Doce',
        'image': 'assets/images/Arroz_Doce.jpg',
        'readyInMinutes': 40,
        'servings': 6,
      },
      {
        'id': 4,
        'title': 'Canjica',
        'image': 'assets/images/Canjica.jpg',
        'readyInMinutes': 50,
        'servings': 8,
      },
      {
        'id': 5,
        'title': 'Torta de Frango',
        'image': 'assets/images/Torta_de_Frango.jpg',
        'readyInMinutes': 70,
        'servings': 8,
      },
    ];
  }

  Future<Map<String, dynamic>> buscarDetalhesReceita(int id) async {
    final receitas = {
      1: {
        'id': 1,
        'title': 'Bolo de Laranja',
        'image': 'assets/images/Bolo_de_Laranja.png',
        'readyInMinutes': 50,
        'servings': 8,
        'extendedIngredients': [
          {'original': '3 ovos'},
          {'original': '1 xícara de suco de laranja'},
          {'original': '2 xícaras de açúcar'},
          {'original': '2 xícaras de farinha de trigo'},
          {'original': '1 colher de sopa de fermento'},
        ],
        'analyzedInstructions': [
          {
            'steps': [
              {'number': 1, 'step': 'Misture os ovos, o açúcar e o suco de laranja.'},
              {'number': 2, 'step': 'Adicione a farinha aos poucos e mexa bem.'},
              {'number': 3, 'step': 'Coloque o fermento e misture delicadamente.'},
              {'number': 4, 'step': 'Leve ao forno médio por aproximadamente 40 minutos.'},
            ],
          }
        ],
      },
      2: {
        'id': 2,
        'title': 'Bolo de Chocolate',
        'image': 'assets/images/Bolo_de_Chocolate.jpg',
        'readyInMinutes': 60,
        'servings': 10,
        'extendedIngredients': [
          {'original': '3 ovos'},
          {'original': '2 xícaras de farinha de trigo'},
          {'original': '1 xícara de chocolate em pó'},
          {'original': '1 xícara de açúcar'},
          {'original': '1 colher de sopa de fermento'},
        ],
        'analyzedInstructions': [
          {
            'steps': [
              {'number': 1, 'step': 'Misture os ovos, o açúcar e o chocolate em pó.'},
              {'number': 2, 'step': 'Adicione a farinha e misture até formar uma massa homogênea.'},
              {'number': 3, 'step': 'Acrescente o fermento e mexa delicadamente.'},
              {'number': 4, 'step': 'Asse em forno médio por cerca de 45 minutos.'},
            ],
          }
        ],
      },
      3: {
        'id': 3,
        'title': 'Arroz Doce',
        'image': 'assets/images/Arroz_Doce.jpg',
        'readyInMinutes': 40,
        'servings': 6,
        'extendedIngredients': [
          {'original': '1 xícara de arroz'},
          {'original': '2 xícaras de água'},
          {'original': '1 litro de leite'},
          {'original': '1 lata de leite condensado'},
          {'original': 'Canela a gosto'},
        ],
        'analyzedInstructions': [
          {
            'steps': [
              {'number': 1, 'step': 'Cozinhe o arroz com a água até ficar macio.'},
              {'number': 2, 'step': 'Adicione o leite e o leite condensado.'},
              {'number': 3, 'step': 'Mexa até ficar cremoso.'},
              {'number': 4, 'step': 'Finalize com canela a gosto.'},
            ],
          }
        ],
      },
      4: {
        'id': 4,
        'title': 'Canjica',
        'image': 'assets/images/Canjica.jpg',
        'readyInMinutes': 50,
        'servings': 8,
        'extendedIngredients': [
          {'original': '500g de milho para canjica'},
          {'original': '1 litro de leite'},
          {'original': '1 lata de leite condensado'},
          {'original': 'Coco ralado a gosto'},
          {'original': 'Canela a gosto'},
        ],
        'analyzedInstructions': [
          {
            'steps': [
              {'number': 1, 'step': 'Cozinhe o milho da canjica até ficar macio.'},
              {'number': 2, 'step': 'Adicione o leite e o leite condensado.'},
              {'number': 3, 'step': 'Misture bem e deixe engrossar.'},
              {'number': 4, 'step': 'Finalize com coco ralado e canela.'},
            ],
          }
        ],
      },
      5: {
        'id': 5,
        'title': 'Torta de Frango',
        'image': 'assets/images/Torta_de_Frango.jpg',
        'readyInMinutes': 70,
        'servings': 8,
        'extendedIngredients': [
          {'original': '2 xícaras de frango desfiado'},
          {'original': '2 xícaras de farinha de trigo'},
          {'original': '1 xícara de leite'},
          {'original': '2 ovos'},
          {'original': '1 colher de sopa de fermento'},
        ],
        'analyzedInstructions': [
          {
            'steps': [
              {'number': 1, 'step': 'Misture os ingredientes da massa no liquidificador.'},
              {'number': 2, 'step': 'Coloque metade da massa em uma forma.'},
              {'number': 3, 'step': 'Adicione o frango desfiado como recheio.'},
              {'number': 4, 'step': 'Cubra com o restante da massa e asse até dourar.'},
            ],
          }
        ],
      },
    };

    return receitas[id]!;
  }
}