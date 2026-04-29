Mestre Cuca

Aplicativo mobile de receitas culinárias desenvolvido em Flutter.

## Sobre o projeto

O **Mestre Cuca* é um aplicativo mobile desenvolvido com Flutter com o objetivo de oferecer uma experiência simples e intuitiva para consulta de receitas culinárias.

O aplicativo permite que o usuário:

* visualize receitas;
* consulte ingredientes;
* acompanhe o modo de preparo;
* visualize tempo de preparo;
* salve receitas favoritas.

O projeto foi desenvolvido com foco em navegação entre telas, consumo de API, organização de rotas e experiência do usuário.

---

## Funcionalidades

* Tela inicial de apresentação
* Listagem de receitas
* Visualização detalhada de receitas
* Exibição de ingredientes
* Exibição do modo de preparo
* Sistema de favoritos
* Navegação com rotas nomeadas
* Uso de imagens locais
* Fallback local para funcionamento offline

---

## Tecnologias utilizadas

* Flutter
* Dart
* Spoonacular API
* Git
* GitHub

---

## Estrutura do projeto

```text
lib/
 ├── data/
 ├── pages/
 ├── services/
 ├── main.dart
 └── routes.dart
```

---

## Estrutura de navegação

O aplicativo utiliza rotas nomeadas para navegação entre telas:

* `/` → Home
* `/receitas` → Lista de receitas
* `/detalhe` → Detalhes da receita
* `/favoritos` → Favoritos

---

## API utilizada

A API inicialmente integrada ao projeto foi a **Spoonacular API**, utilizada para consumo de receitas em tempo real.

Durante os testes, a API apresentou limitação no plano gratuito (limite diário de requisições), o que motivou a implementação de um fallback local com dados simulados, garantindo o funcionamento do aplicativo para testes e apresentação.

---

## Funcionalidades da API

A integração com a API foi planejada para:

* buscar receitas;
* listar receitas;
* exibir detalhes;
* exibir ingredientes;
* exibir modo de preparo.

---

## Como executar o projeto

1. Clone o repositório:

```bash
git clone https://github.com/samaramerces1/App-Receitas.git
```

2. Acesse a pasta do projeto:

```bash
cd App-Receitas
```Mestre Cuca

3. Instale as dependências:

```bash
flutter pub get
```

4. Execute o projeto:

```bash
flutter run
```

---

## Estrutura funcional

O aplicativo possui quatro telas principais:

* Home
* Lista de Receitas
* Detalhes da Receita
* Favoritos

---

## Status do projeto

Projeto concluído em versão funcional beta, com estrutura preparada para reativação do consumo completo da API.

---

## Autora

Samara Mercês
