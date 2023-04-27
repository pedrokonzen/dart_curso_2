void main() {
  String nome = 'Laranja';
  double peso = 100.2;
  String cor = 'Verde e Amarela';
  String sabor = 'Doce e cítrica';
  int diasDesdeColheita = 40;
  bool isMadura = funcEstaMadura(diasDesdeColheita);

  if (diasDesdeColheita >= 30) {
    isMadura = true;
  } else {
    isMadura = false;
  }

  Fruta melancia = Fruta('Melancia', 1550.0, 'Verde', 'Doce', 40);
  melancia.estaMadura(43);

  Legumes mandioca1 = Legumes('Macaxeira', 1200, 'Marrom', true);

  Fruta banana1 = Fruta('Banana', 75, 'Amarela', 'Doce', 12);

  Nozes macadamia1 = Nozes('Macadamia', 2, 'Branco Amarelado', 'Doce', 20, 30);

  Citricas limao1 = Citricas('Limao', 50, 'Verde', 'Azedo', 5, 9);

  macadamia1.printAlimento();
  banana1.printAlimento();
  mandioca1.printAlimento();
  limao1.printAlimento();

  mandioca1.cozinhar();
  limao1.fazerSuco();
  macadamia1.fazerMassa();

// comentarios de teste
  // Fruta fruta00 = Fruta(nome, peso, cor, sabor, diasDesdeColheita);
  // Fruta fruta01 = Fruta("Uva", 10.2, "Roxa", "Doce", 100);
  // mostrarMadura('Uva', 40, cor: 'Roxa');
  // int quantosDias = funcQuantosDiasMadura(diasDesdeColheita);
  // print(fruta00.nome);
  // print(fruta01.peso);
  // fruta01.estaMadura(45);
  // fruta00.estaMadura(45);
  // print(fruta01.estaMadura(50));
  // print('A laranja está madura? $isMadura');
  // print(funcEstaMadura(50));
}

int funcQuantosDiasMadura(int dias) {
  int diasParaMadura = 30;
  int quantosDiasFaltam = dias - diasParaMadura;
  return quantosDiasFaltam;
}

// 1 - Posicionais Obrigatórios
// 2 - Nomeados Opcionais
// 3 - Parâmetros com "Padrão"
// 4 - Modificaodor "required"

mostrarMadura(String nome, int dias, {required String cor}) {
  if (dias >= 30) {
    print('A $nome está madura');
  } else {
    print('A $nome não está madura');
  }

  if (cor != null) {
    print("A $nome é $cor");
  } else {
    print("A cor é nula");
  }
}

bool funcEstaMadura(int dias) {
  if (dias >= 30) {
    return true;
  } else {
    return false;
  }
}

class Fruta extends Alimento implements Bolo {
  String sabor;
  int diasDesdeColheita;
  bool? isMadura;

  Fruta(
      String nome, double peso, String cor, this.sabor, this.diasDesdeColheita,
      {this.isMadura})
      : super(nome, peso, cor);

  estaMadura(int diasParaMadura) {
    isMadura = diasDesdeColheita >= diasParaMadura;
    print(
        "A sua $nome foi colhida $diasDesdeColheita e precisa de $diasParaMadura para poder comer. Ela está madura? $isMadura");
  }

  void fazerSuco() {
    print('Você fez um ótimo suco de $nome');
  }

  @override
  void assar() {
    print('Colocar no forno');
  }

  @override
  void fazerMassa() {
    print('Misturar a fruta com farinha');
  }

  @override
  void separarIngredientes() {
    print('Catar Fruta');
  }
}

class Alimento {
  String nome;
  double peso;
  String cor;

  Alimento(
    this.nome,
    this.peso,
    this.cor,
  );

  void printAlimento() {
    print('Este(a) $nome pesa $peso gramas e é $cor.');
  }
}

class Legumes extends Alimento implements Bolo {
  bool isPrecisaCozinhar;

  Legumes(String nome, double peso, String cor, this.isPrecisaCozinhar)
      : super(nome, peso, cor);

  void cozinhar() {
    if (isPrecisaCozinhar) {
      print('Pronto, o $nome está cozinhando');
    } else {
      print('$nome não precisa cozinhar');
    }
  }

  @override
  void assar() {
    // colocar mais tempo
  }

  @override
  void fazerMassa() {
    // fazer a papa
  }

  @override
  void separarIngredientes() {
    // ver se o alimento esta cozido ou cru
  }
}

class Citricas extends Fruta {
  double nivelAzedo;

  Citricas(String nome, double peso, String cor, String sabor,
      int diasDesdeColheita, this.nivelAzedo)
      : super(nome, peso, cor, sabor, diasDesdeColheita);

  void existeRefri(bool existe) {
    if (existe) {
      print('Existe Refrigerante de $nome');
    } else {
      print('Não existe Refrigerante de $nome');
    }
  }
}

class Nozes extends Fruta {
  double porcentagemOleoNatural;

  Nozes(String nome, double peso, String cor, String sabor,
      int diasDesdeColheita, this.porcentagemOleoNatural)
      : super(nome, peso, cor, sabor, diasDesdeColheita);

  @override
  void fazerMassa() {
    print('Tirar a casca');
    super.fazerMassa();
  }
}

abstract class Bolo {
  void separarIngredientes();
  void fazerMassa();
  void assar();
}
