import 'dart:convert';
import 'dart:math';
import 'package:jogo_bandeira/models/paises_model.dart';

class Gerenciarpaises {
  final List<Paises> paises = [];
  final Random random = Random();
  final List<dynamic> resultado;
  String nomePaisSorteado = '';
  String caminhoImagem = '';

  Gerenciarpaises(String jsonList) : resultado = jsonDecode(jsonList);

void adicionarPais() {
  Set<int> indicesEscolhidos = {}; // Usamos um Set para evitar índices duplicados
  while (indicesEscolhidos.length < 4) { // Queremos exatamente 4 países
    int randomInt = random.nextInt(resultado.length); // Sorteamos um índice
    if (!indicesEscolhidos.contains(randomInt)) { // Garantimos que o índice ainda não foi escolhido
      indicesEscolhidos.add(randomInt); // Adicionamos o índice ao Set
      var pais = Paises(
        resultado[randomInt]["id"],
        resultado[randomInt]["nome"],
        resultado[randomInt]["sigla"],
        resultado[randomInt]["caminho"],
      );
      paises.add(pais); // Adicionamos o país à lista final
    }
  }
}


  int sortearPais() {
    int paisSorteadoVerdadeiro = random.nextInt(4);
    sortearPaisNome(paisSorteadoVerdadeiro);
    nomePaisSorteado = paises[paisSorteadoVerdadeiro].nome;
    return paisSorteadoVerdadeiro;
  }

  void sortearPaisNome(int n) {
    nomePaisSorteado = paises[n].nome;
    caminhoImagem = paises[n].caminho;
  }

  List<Paises> getPaises() {
    return paises;
  }

  void limparListaPaises() {
    nomePaisSorteado = "";
    caminhoImagem = "";
    paises.clear();

  }
}
