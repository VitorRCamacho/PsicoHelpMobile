// lib/screens/pergunta_geral_screen.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mente_ifc/core/routes.dart';

class PerguntaGeralScreen extends StatelessWidget {
  const PerguntaGeralScreen({super.key});

  static const double _maxWidth = 520;
  static const double _hPad = 20;
  static const double _gapSm = 12;
  static const double _gapMd = 16;
  static const double _gapLg = 20;
  static const double _gapXl = 28;

  @override
  Widget build(BuildContext context) {
    final titleStyle = GoogleFonts.baloo2(
      fontSize: 36,
      fontWeight: FontWeight.w900,
      height: 1.05,
      color: const Color(0xFF2C3E50),
      shadows: [Shadow(color: Colors.white.withOpacity(.4), blurRadius: 8)],
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          const _BackgroundGradient(),
          Container(color: Colors.transparent),

          SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: _maxWidth),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: _hPad),
                  child: ListView(
                    padding: const EdgeInsets.only(top: _gapLg, bottom: _gapLg),
                    children: [
                      const SizedBox(height: 8),

                      // Título mais amigável para jovens
                      Text(
                        'E aí, como você\nestá se sentindo\nhoje? 💭',
                        textAlign: TextAlign.center,
                        style: titleStyle.copyWith(fontSize: 40, height: 1.15),
                      ),

                      const SizedBox(height: 12),

                      Text(
                        'Escolha a emoção que mais combina com você agora',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.baloo2(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF34495E),
                          height: 1.3,
                          shadows: [Shadow(color: Colors.white.withOpacity(.3), blurRadius: 6)],
                        ),
                      ),

                      const SizedBox(height: _gapXl),

                      // GRID DE EMOÇÕES - CADA UMA VAI PARA SUA TRILHA
                      _EmotionGrid(
                        items: const [
                          _EmotionItem(
                            'Ansioso(a) 😔',
                            [Color(0xFF7AB8C5), Color(0xFF6AA8B8)],
                            Routes.ansiedadeP1,   // Vai para primeira pergunta de ansiedade
                          ),
                          _EmotionItem(
                            'Triste 🥺',
                            [Color(0xFF88B3D9), Color(0xFF769FC8)],
                            Routes.tristezaP1,    // Vai para primeira pergunta de tristeza
                          ),
                          _EmotionItem(
                            'Com raiva 😤',
                            [Color(0xFFD8A8B8), Color(0xFFC598A8)],
                            Routes.raivaP1,       // Vai para primeira pergunta de raiva
                          ),
                          _EmotionItem(
                            'Com medo 😟',
                            [Color(0xFFB8A8D8), Color(0xFFA898C8)],
                            Routes.medoP1,        // Vai para primeira pergunta de medo
                          ),
                          _EmotionItem(
                            'Estressado(a) 😵‍💫',
                            [Color(0xFFD8C8A8), Color(0xFFC8B898)],
                            Routes.estresseP1,    // Vai para primeira pergunta de estresse
                          ),
                          _EmotionItem(
                            'Sozinho(a) 💛',
                            [Color(0xFFD8B8C8), Color(0xFFC8A8B8)],
                            Routes.solidaoP1,     // Vai para primeira pergunta de solidão
                          ),
                        ],
                      ),

                      const SizedBox(height: _gapXl),
                      Opacity(
                        opacity: .4,
                        child: Container(
                          height: 1.2,
                          color: const Color(0xFF2C3E50),
                        ),
                      ),
                      const SizedBox(height: _gapMd),

                      const _HelpBlock(
                        cvv: '188 (24h, todos os dias)',
                        telefone: '(XX) XXXX-XXXX',
                      ),

                      const SizedBox(height: _gapSm),
                      Opacity(
                        opacity: .9,
                        child: Text(
                          'O APP não substitui atendimento psicológico.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.baloo2(
                            color: const Color(0xFF2C3E50),
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                            height: 1.1,
                            shadows: [Shadow(color: Colors.white.withOpacity(.5), blurRadius: 6)],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------- Componentes auxiliares -------------------------

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    final style = GoogleFonts.baloo2(
      color: const Color(0xFF2C3E50),
      fontWeight: FontWeight.w700,
      fontSize: 16,
      letterSpacing: .3,
      shadows: [Shadow(color: Colors.white.withOpacity(.3), blurRadius: 6)],
    );
    return Row(
      children: [
        Expanded(child: Container(height: 1.2, color: const Color(0xFF2C3E50).withOpacity(.4))),
        const SizedBox(width: 10),
        Text(text, style: style),
        const SizedBox(width: 10),
        Expanded(child: Container(height: 1.2, color: const Color(0xFF2C3E50).withOpacity(.4))),
      ],
    );
  }
}

class _EmotionItem {
  final String label;
  final List<Color> colors;
  final String route;
  const _EmotionItem(this.label, this.colors, this.route);
}

class _EmotionGrid extends StatelessWidget {
  final List<_EmotionItem> items;
  const _EmotionGrid({required this.items});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 1.9,
      children: items.map((e) {
        return _EmotionButton(
          label: e.label,
          colors: e.colors,
          onTap: () {
            // NAVEGAÇÃO CORRETA: usa pushNamed para empilhar telas
            Navigator.pushNamed(context, e.route);
          },
        );
      }).toList(),
    );
  }
}

class _EmotionButton extends StatefulWidget {
  final String label;
  final List<Color> colors;
  final VoidCallback onTap;

  const _EmotionButton({
    required this.label,
    required this.colors,
    required this.onTap,
  });

  @override
  State<_EmotionButton> createState() => _EmotionButtonState();
}

class _EmotionButtonState extends State<_EmotionButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = GoogleFonts.baloo2(
      color: Colors.white,
      fontSize: 19,
      fontWeight: FontWeight.w900,
      height: 1.1,
      letterSpacing: .3,
      shadows: [Shadow(color: Colors.black.withOpacity(.3), blurRadius: 10)],
    );

    return ScaleTransition(
      scale: _scaleAnimation,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: widget.colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(_isPressed ? .12 : .18),
              blurRadius: _isPressed ? 10 : 14,
              offset: Offset(0, _isPressed ? 4 : 8),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(22),
            onTap: widget.onTap,
            onTapDown: (_) {
              setState(() => _isPressed = true);
              _controller.forward();
            },
            onTapUp: (_) {
              setState(() => _isPressed = false);
              _controller.reverse();
            },
            onTapCancel: () {
              setState(() => _isPressed = false);
              _controller.reverse();
            },
            splashColor: Colors.white.withOpacity(0.2),
            highlightColor: Colors.white.withOpacity(0.1),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Text(widget.label, textAlign: TextAlign.center, style: style),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HelpBlock extends StatelessWidget {
  final String cvv;
  final String telefone;
  const _HelpBlock({required this.cvv, required this.telefone});

  @override
  Widget build(BuildContext context) {
    final base = GoogleFonts.baloo2(
      color: const Color(0xFF2C3E50),
      fontSize: 16,
      fontWeight: FontWeight.w700,
      height: 1.1,
      shadows: [Shadow(color: Colors.white.withOpacity(.3), blurRadius: 6)],
    );
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.25),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF7AB8C5).withOpacity(.3),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.support_agent, color: Color(0xFF2C3E50), size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Precisa de ajuda?', style: base.copyWith(fontSize: 18)),
                const SizedBox(height: 6),
                Text('📞 CVV: $cvv', style: base),
                Text('💬 Chat: www.cvv.org.br', style: base),
                Text('✉️ E-mail: atendimento@cvv.org.br', style: base),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BackgroundGradient extends StatelessWidget {
  const _BackgroundGradient();

  @override
  Widget build(BuildContext context) {
    return const Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF8EC5FC), // azul claro suave
              Color(0xFFB8D9F5), // azul pastel
              Color(0xFFD4E8F0), // azul muito claro
            ],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
      ),
    );
  }
}