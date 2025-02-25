# Jogo das Bandeiras

O **Jogo das Bandeiras** é um quiz interativo desenvolvido com Flutter, onde os jogadores devem identificar as bandeiras de diferentes países. O jogo é cronometrado e avalia o desempenho com base na precisão das respostas.
Link par o video: https://youtu.be/vdDDHEXhtC0
---

## Funcionalidades

- **Seleção de Tempo:** O jogador pode escolher entre 1 minuto, 3 minutos ou 5 minutos de jogo.
- **Sistema de Pontuação:**
  - +50 pontos para respostas corretas.
  - -25 pontos para respostas incorretas.
- **Interface Intuitiva:** Inclui componentes visuais claros, como cartões de opção e indicador de tempo.
- **Tela de Resultados:** Exibe a pontuação final e mensagens de desempenho personalizadas.

---

## Tecnologias Utilizadas

- **Linguagem:** Dart
- **Framework:** Flutter
- **Estrutura Modular:**
  - Widgets personalizados (NextButton, OptionCard, QuestionWidget).
  - Gerenciamento de países usando a classe `Gerenciarpaises`.

---

## Estrutura do Jogo

### 1. **Tela Inicial**
- O jogador escolhe o tempo do jogo (1, 3 ou 5 minutos).
- É direcionado para a tela principal com as perguntas.

### 2. **Tela do Jogo**
- Exibe uma bandeira e quatro opções de países.
- Um cronômetro regressivo controla o tempo restante.
- Ao selecionar uma opção:
  - Respostas corretas destacadas em verde.
  - Respostas incorretas destacadas em vermelho.

### 3. **Tela de Resultados**
- Mostra a pontuação final.
- Mensagem personalizada:
  - “Normal!” para pontuação zero.
  - “Estude mais!” para pontuação negativa.
  - “Muito bem!” para pontuação até 200.
  - “Você é fera!” para pontuação acima de 200.

---

## Como Executar o Jogo

### Passo 1: Clone o Repositório
```bash
https://github.com/seu-usuario/jogo-das-bandeiras.git
```

### Passo 2: Instale as Dependências
```bash
flutter pub get
```

### Passo 3: Execute o Projeto
```bash
flutter run
```

> **Nota:** Certifique-se de que um dispositivo físico ou emulador esteja configurado.

---

## Personalização

### Adicionar Novas Bandeiras
1. Adicione a imagem da bandeira no diretório `assets/images`.
2. Atualize o arquivo JSON com as informações do país:
```json
{
  "id": 5,
  "nome": "Brasil",
  "sigla": "BR",
  "caminho": "assets/images/brasil.jpg"
}
```
3. Certifique-se de registrar as novas imagens no `pubspec.yaml`.

### Mensagens Personalizadas
- Altere as mensagens exibidas na tela de resultados na classe `ResultScreen`:
```dart
if (score == 0) {
  message = "Normal!";
} else if (score < 0) {
  message = "Estude mais!";
} else if (score <= 200) {
  message = "Muito bem!";
} else {
  message = "Você é fera!";
}
```

---

## Estrutura do Projeto

```plaintext
jogo_bandeira/
├── lib/
│   ├── assets/
│   │   └── images/
│   ├── models/
│   │   └── paises_model.dart
│   ├── screens/
│   │   ├── home_screen.dart
│   │   ├── result_screen.dart
│   │   └── time_option_screen.dart
│   ├── widgets/
│   │   ├── next_button.dart
│   │   ├── option_card.dart
│   │   └── question_widget.dart
│   ├── constants.dart
│   ├── gerenciarPaises.dart
│   └── listaDeBandeiras.dart
├── pubspec.yaml
├── README.md
```

---

## Melhorias Futuras

- **Adicionação de Múltiplos Modos de Jogo:**
  - Time Attack, Modo Livre.
- **Banco de Dados para High Scores:** Armazenar as pontuações mais altas.
- **Níveis de Dificuldade:** Categorizar bandeiras por dificuldade.

---

Divirta-se aprendendo sobre as bandeiras do mundo!


