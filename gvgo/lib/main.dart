import 'package:flutter/material.dart'; // Importa os widgets visuais do Flutter.

const Color backgroundColor = Color(
  0xFF0B0F14,
); // Cor escura principal do fundo.
const Color primaryGreen = Color(0xFF00C853); // Verde vibrante usado nas ações.
const Color textWhite = Color(
  0xFFFFFFFF,
); // Branco usado nos textos principais.
const Color textGray = Color(
  0xFFB0B0B0,
); // Cinza claro usado nos textos secundários.
const Color rewardGold = Color(
  0xFFFFC107,
); // Dourado usado para destacar recompensas.
const Color cardColor = Color(
  0xFF121821,
); // Cor do card para criar profundidade.
const Color inputColor = Color(0xFF18212B); // Cor dos campos de texto.

void main() {
  // Função principal: é aqui que o aplicativo começa.
  runApp(const MyApp()); // Inicia o app exibindo o widget MyApp.
}

class MyApp extends StatelessWidget {
  // Widget principal do aplicativo.
  const MyApp({
    super.key,
  }); // Construtor usado pelo Flutter para identificar o widget.

  @override // Indica que vamos sobrescrever o método build da classe StatelessWidget.
  Widget build(BuildContext context) {
    // Monta a base visual do app.
    return MaterialApp(
      // Cria um app no padrão Material Design.
      debugShowCheckedModeBanner: false, // Remove a faixa de debug da tela.
      title: 'GvGo', // Define o nome do aplicativo.
      theme: ThemeData(
        // Define o tema global do app.
        brightness:
            Brightness.dark, // Informa ao Flutter que a interface é escura.
        scaffoldBackgroundColor:
            backgroundColor, // Define a cor padrão das páginas.
        fontFamily: 'Roboto', // Mantém uma fonte limpa e comum em apps Android.
        colorScheme: ColorScheme.fromSeed(
          // Gera uma paleta de cores baseada no verde principal.
          seedColor: primaryGreen, // Usa o verde vibrante como cor base.
          brightness:
              Brightness.dark, // Garante contraste adequado no tema escuro.
        ),
        useMaterial3:
            true, // Usa componentes com aparência moderna do Material 3.
      ),
      home: const LoginPage(), // Define a tela de login como tela inicial.
    );
  }
}

class LoginPage extends StatelessWidget {
  // Tela responsável pelo login do usuário.
  const LoginPage({super.key}); // Construtor da tela.

  @override // Indica que vamos criar a interface dessa tela.
  Widget build(BuildContext context) {
    // Monta todos os elementos visuais do login.
    return Scaffold(
      // Estrutura principal da página.
      body: Container(
        // Container usado para aplicar o fundo em toda a tela.
        width: double.infinity, // Faz o fundo ocupar toda a largura.
        height: double.infinity, // Faz o fundo ocupar toda a altura.
        decoration: const BoxDecoration(
          // Decoração visual do fundo.
          gradient: RadialGradient(
            // Cria um brilho sutil para deixar o fundo menos chapado.
            center: Alignment
                .topRight, // Posiciona o brilho no canto superior direito.
            radius: 1.15, // Define o tamanho do brilho.
            colors: [
              Color(0xFF123323), // Verde escuro sutil no topo.
              backgroundColor, // Preto azulado principal do app.
            ],
          ),
        ),
        child: SafeArea(
          // Evita que o conteúdo fique atrás da barra de status do celular.
          child: Center(
            // Centraliza o conteúdo na tela.
            child: SingleChildScrollView(
              // Permite rolagem se o teclado abrir ou a tela for pequena.
              padding: const EdgeInsets.symmetric(
                // Define respiro lateral e vertical.
                horizontal: 24, // Espaço nas laterais.
                vertical: 28, // Espaço em cima e embaixo.
              ),
              child: ConstrainedBox(
                // Limita a largura para manter aparência de app mobile.
                constraints: const BoxConstraints(
                  maxWidth: 390,
                ), // Largura próxima de um celular.
                child: Column(
                  // Organiza os elementos em uma coluna vertical.
                  crossAxisAlignment: CrossAxisAlignment
                      .stretch, // Faz os elementos ocuparem a largura disponível.
                  children: [
                    // Lista de widgets exibidos na tela.
                    const _MissionBadge(), // Mostra o destaque gamificado de missão/recompensa.
                    const SizedBox(
                      height: 34,
                    ), // Espaço entre o badge e o título.
                    const Text(
                      // Título grande do aplicativo.
                      'GvGo', // Nome do app.
                      textAlign: TextAlign.center, // Centraliza o título.
                      style: TextStyle(
                        // Estilo visual do título.
                        color: textWhite, // Usa branco para alto contraste.
                        fontSize: 44, // Deixa o nome grande e marcante.
                        fontWeight: FontWeight
                            .w800, // Usa peso forte para dar presença.
                        letterSpacing:
                            -1, // Aproxima levemente as letras para visual moderno.
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ), // Espaço entre título e subtítulo.
                    const Text(
                      // Subtítulo explicando a proposta do app.
                      'Explore, complete missões e ganhe recompensas', // Mensagem principal da experiência.
                      textAlign: TextAlign.center, // Centraliza o subtítulo.
                      style: TextStyle(
                        // Estilo do subtítulo.
                        color:
                            textGray, // Usa cinza claro para hierarquia visual.
                        fontSize: 16, // Tamanho confortável para leitura.
                        height:
                            1.45, // Aumenta a altura da linha para respirar melhor.
                      ),
                    ),
                    const SizedBox(height: 34), // Espaço antes do formulário.
                    Container(
                      // Card que agrupa os campos e botões.
                      padding: const EdgeInsets.all(
                        22,
                      ), // Espaço interno do card.
                      decoration: BoxDecoration(
                        // Aparência do card.
                        color: cardColor.withOpacity(
                          0.94,
                        ), // Fundo escuro levemente destacado.
                        borderRadius: BorderRadius.circular(
                          28,
                        ), // Bordas grandes e arredondadas.
                        border: Border.all(
                          // Borda discreta para separar do fundo.
                          color: Colors.white.withOpacity(
                            0.08,
                          ), // Linha branca quase transparente.
                        ),
                        boxShadow: [
                          // Sombra para criar profundidade.
                          BoxShadow(
                            color: Colors.black.withOpacity(
                              0.35,
                            ), // Sombra escura suave.
                            blurRadius: 30, // Deixa a sombra bem espalhada.
                            offset: const Offset(
                              0,
                              18,
                            ), // Move a sombra para baixo.
                          ),
                        ],
                      ),
                      child: Column(
                        // Coluna do formulário.
                        crossAxisAlignment: CrossAxisAlignment
                            .stretch, // Campos e botões ocupam toda a largura.
                        children: [
                          // Elementos do formulário.
                          const _LoginInput(
                            // Campo de e-mail reutilizável.
                            label: 'Email', // Nome do campo.
                            hint: 'voce@email.com', // Exemplo de e-mail.
                            icon:
                                Icons.email_outlined, // Ícone sutil de e-mail.
                            keyboardType: TextInputType
                                .emailAddress, // Teclado otimizado para e-mail.
                          ),
                          const SizedBox(height: 16), // Espaço entre os inputs.
                          const _LoginInput(
                            // Campo de senha reutilizável.
                            label: 'Senha', // Nome do campo.
                            hint: 'Digite sua senha', // Texto de ajuda.
                            icon: Icons
                                .lock_outline_rounded, // Ícone sutil de senha.
                            obscureText:
                                true, // Esconde os caracteres digitados.
                          ),
                          const SizedBox(
                            height: 22,
                          ), // Espaço antes do botão principal.
                          SizedBox(
                            // Controla a altura do botão principal.
                            height:
                                56, // Altura confortável para toque no celular.
                            child: ElevatedButton(
                              // Botão de entrada.
                              onPressed: () {
                                // Ação executada ao tocar no botão.
                                debugPrint(
                                  'Entrar clicado',
                                ); // Mensagem temporária para teste.
                              },
                              style: ElevatedButton.styleFrom(
                                // Personaliza o botão.
                                backgroundColor:
                                    primaryGreen, // Usa o verde vibrante solicitado.
                                foregroundColor:
                                    backgroundColor, // Texto escuro para contrastar com o verde.
                                elevation:
                                    0, // Remove sombra padrão para visual mais limpo.
                                shadowColor: primaryGreen.withOpacity(
                                  0.4,
                                ), // Cor de sombra caso o botão ganhe elevação.
                                shape: RoundedRectangleBorder(
                                  // Formato moderno do botão.
                                  borderRadius: BorderRadius.circular(
                                    18,
                                  ), // Bordas arredondadas.
                                ),
                              ),
                              child: const Text(
                                // Texto do botão.
                                'Entrar', // Chamada principal da tela.
                                style: TextStyle(
                                  // Estilo do texto do botão.
                                  fontSize: 17, // Tamanho fácil de ler.
                                  fontWeight: FontWeight
                                      .w800, // Peso forte para destaque.
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 18,
                          ), // Espaço entre botão principal e link.
                          TextButton(
                            // Botão secundário para cadastro.
                            onPressed: () {
                              // Ação executada ao tocar em criar conta.
                              debugPrint(
                                'Criar conta clicado',
                              ); // Mensagem temporária para teste.
                            },
                            style: TextButton.styleFrom(
                              // Estilo do botão secundário.
                              foregroundColor:
                                  textWhite, // Texto branco para contraste.
                            ),
                            child: const Text.rich(
                              // Texto com duas cores para dar hierarquia.
                              TextSpan(
                                // Agrupa partes do texto.
                                text:
                                    'Novo explorador? ', // Parte inicial em cinza.
                                style: TextStyle(
                                  color: textGray,
                                ), // Cor discreta para o texto inicial.
                                children: [
                                  // Partes extras do texto.
                                  TextSpan(
                                    text: 'Criar conta', // Chamada do link.
                                    style: TextStyle(
                                      color:
                                          primaryGreen, // Usa verde para indicar ação.
                                      fontWeight:
                                          FontWeight.w700, // Destaca o link.
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ), // Espaço antes do texto de recompensa.
                    const _RewardHint(), // Mostra uma dica de recompensa para reforçar o tema gamificado.
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MissionBadge extends StatelessWidget {
  // Widget visual que comunica missões e recompensas logo no topo.
  const _MissionBadge(); // Construtor simples porque o widget não recebe dados externos.

  @override // Indica que vamos montar a interface do badge.
  Widget build(BuildContext context) {
    // Cria o badge gamificado.
    return Center(
      // Centraliza o badge horizontalmente.
      child: Container(
        // Cria a cápsula visual no topo.
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ), // Espaçamento interno da cápsula.
        decoration: BoxDecoration(
          // Aparência do badge.
          color: rewardGold.withOpacity(
            0.12,
          ), // Fundo dourado bem transparente.
          borderRadius: BorderRadius.circular(
            999,
          ), // Bordas totalmente arredondadas.
          border: Border.all(
            color: rewardGold.withOpacity(0.32),
          ), // Borda dourada sutil.
        ),
        child: const Row(
          // Organiza ícone e texto lado a lado.
          mainAxisSize:
              MainAxisSize.min, // Faz o badge ter apenas o tamanho necessário.
          children: [
            // Conteúdo do badge.
            Icon(
              // Ícone de recompensa.
              Icons
                  .emoji_events_rounded, // Troféu para passar sensação de conquista.
              color: rewardGold, // Usa a cor dourada de recompensa.
              size: 18, // Mantém o ícone sutil.
            ),
            SizedBox(width: 8), // Espaço entre ícone e texto.
            Text(
              // Texto curto do badge.
              'Missões urbanas esperam por você', // Frase com tom gamificado.
              style: TextStyle(
                // Estilo do texto do badge.
                color: rewardGold, // Dourado para conectar com recompensas.
                fontSize: 13, // Tamanho pequeno e elegante.
                fontWeight:
                    FontWeight.w700, // Peso médio/forte para legibilidade.
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoginInput extends StatelessWidget {
  // Widget reutilizável para os campos do formulário.
  const _LoginInput({
    // Construtor com os dados necessários do input.
    required this.label, // Texto exibido como nome do campo.
    required this.hint, // Texto de exemplo dentro do campo.
    required this.icon, // Ícone exibido no início do campo.
    this.keyboardType, // Tipo de teclado opcional.
    this.obscureText = false, // Define se o texto deve ficar escondido.
  });

  final String label; // Guarda o texto do rótulo.
  final String hint; // Guarda o texto de ajuda.
  final IconData icon; // Guarda o ícone do campo.
  final TextInputType? keyboardType; // Guarda o tipo de teclado quando existir.
  final bool obscureText; // Guarda se o campo deve ocultar o texto.

  @override // Indica que vamos construir o campo visual.
  Widget build(BuildContext context) {
    // Monta o TextField estilizado.
    return TextField(
      // Campo onde o usuário digita informações.
      keyboardType: keyboardType, // Aplica o teclado correto quando informado.
      obscureText: obscureText, // Oculta o texto quando for campo de senha.
      style: const TextStyle(color: textWhite), // Cor do texto digitado.
      cursorColor: primaryGreen, // Cor do cursor dentro do campo.
      decoration: InputDecoration(
        // Define toda a aparência do campo.
        labelText: label, // Mostra o nome do campo.
        hintText: hint, // Mostra uma dica de preenchimento.
        labelStyle: const TextStyle(color: textGray), // Cor do rótulo.
        hintStyle: TextStyle(
          color: textGray.withOpacity(0.55),
        ), // Cor mais suave para o exemplo.
        prefixIcon: Icon(
          icon,
          color: textGray,
          size: 22,
        ), // Ícone sutil à esquerda.
        filled: true, // Ativa a cor de fundo do campo.
        fillColor: inputColor, // Aplica a cor escura dos inputs.
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 18,
        ), // Espaço interno confortável.
        enabledBorder: OutlineInputBorder(
          // Borda quando o campo não está selecionado.
          borderRadius: BorderRadius.circular(18), // Bordas arredondadas.
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.08),
          ), // Borda discreta.
        ),
        focusedBorder: OutlineInputBorder(
          // Borda quando o usuário seleciona o campo.
          borderRadius: BorderRadius.circular(
            18,
          ), // Mantém o mesmo arredondamento.
          borderSide: const BorderSide(
            color: primaryGreen,
            width: 1.4,
          ), // Destaca com verde.
        ),
      ),
    );
  }
}

class _RewardHint extends StatelessWidget {
  // Widget que mostra um pequeno incentivo de recompensa.
  const _RewardHint(); // Construtor simples do widget.

  @override // Indica que vamos montar esse componente.
  Widget build(BuildContext context) {
    // Cria o texto final de apoio.
    return Row(
      // Organiza os itens em linha.
      mainAxisAlignment: MainAxisAlignment.center, // Centraliza a dica.
      children: [
        // Elementos da dica.
        Container(
          // Ponto verde decorativo.
          width: 8, // Largura do ponto.
          height: 8, // Altura do ponto.
          decoration: const BoxDecoration(
            // Aparência do ponto.
            color: primaryGreen, // Usa o verde principal.
            shape: BoxShape.circle, // Deixa o ponto circular.
          ),
        ),
        const SizedBox(width: 10), // Espaço entre o ponto e o texto.
        const Text(
          // Texto de reforço da proposta.
          'Ganhe XP, moedas e conquistas pela cidade', // Frase com sensação de jogo.
          style: TextStyle(
            // Estilo da dica.
            color: textGray, // Cinza claro para não competir com o botão.
            fontSize: 13, // Tamanho discreto.
          ),
        ),
      ],
    );
  }
}
