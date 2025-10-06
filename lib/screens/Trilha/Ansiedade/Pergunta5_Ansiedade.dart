// lib/screens/Trilha/Ansiedade/Pergunta5_Ansiedade.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mente_ifc/core/routes.dart'; // importa as constantes de rota

class Pergunta5AnsiedadeScreen extends StatelessWidget {
  const Pergunta5AnsiedadeScreen({super.key});

  static const double _maxWidth = 520; // limita a largura para ficar simétrico
  static const double _hPad = 20;      // padding horizontal padrão
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
      color: Colors.white,
      shadows: [Shadow(color: Colors.black.withOpacity(.2), blurRadius: 8)],
    );

    return Scaffold(backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          const _BackgroundGradient(),              // fundo ocupa 100%
          Container(color: Colors.white.withOpacity(0.04)), // véu p/ contraste

          SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: _maxWidth),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: _hPad),
                  child: ListView(
                    padding: const EdgeInsets.only(top: _gapLg, bottom: _gapLg),
                    children: [
                      // Indicador de progresso
                      _ProgressIndicator(current: 5, total: 5),
                      const SizedBox(height: _gapMd),
                      
                      const _SectionLabel(text: 'Trilha Ansiedade - Pergunta 5/5'),
                      const SizedBox(height: _gapMd),

                      Text(
                        'Você sente que se preocupa com muitas coisas ao mesmo tempo, a ponto de isso incomodar você?',
                        textAlign: TextAlign.center,
                        style: titleStyle,
                      ),

                      const SizedBox(height: _gapXl),

                      // >>> AQUI DEFINIMOS O GRID DE OPÇÕES <<<
                      // Cada item tem: rótulo, cores e a ROTA de destino ao toque.
                      _EmotionGrid(
                        items: const [
                          _EmotionItem('Ansioso(a) 😔', [Color(0xFF31D0C6), Color(0xFF1FBBC1)], Routes.ansiedadeP5),
                          _EmotionItem('Triste 🥺', [Color(0xFF6EA8FF), Color(0xFF4F83FF)], Routes.tristezaP5),
                          _EmotionItem('Com raiva 😤', [Color(0xFFFF8CA1), Color(0xFFFF6D8A)], Routes.raivaP5),
                          _EmotionItem('Com medo 😟', [Color(0xFFA78BFA), Color(0xFF8B6CFF)], Routes.medoP5),
                          _EmotionItem('Estressado(a) 😵‍💫', [Color(0xFFFFB74D), Color(0xFFFFA726)], Routes.estresseP5),
                          _EmotionItem('Sozinho(a) 💛', [Color(0xFFFF8FB3), Color(0xFFFF79A8)], Routes.solidaoP5),
                        ],
                      ),

                      const SizedBox(height: _gapXl),
                      const Divider(color: Colors.white, thickness: 1.2),
                      const SizedBox(height: _gapMd),

                      const _HelpBlock(
                        cvv: '188 (CVV – 24h)',
                        telefone: '(XX) XXXX-XXXX',
                      ),

                      const SizedBox(height: _gapSm),
                      Opacity(
                        opacity: .9,
                        child: Text(
                          'O APP não substitui atendimento psicológico.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.baloo2(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                            height: 1.1,
                            shadows: [Shadow(color: Colors.black.withOpacity(.2), blurRadius: 6)],
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

// Widget de indicador de progresso
class _ProgressIndicator extends StatelessWidget {
  final int current;
  final int total;
  
  const _ProgressIndicator({
    required this.current,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(total, (index) {
        final isActive = index < current;
        return Expanded(
          child: Container(
            height: 4,
            margin: EdgeInsets.only(right: index < total - 1 ? 4 : 0),
            decoration: BoxDecoration(
              color: isActive 
                ? Colors.white 
                : Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        );
      }),
    );
  }
}

// ---------- Componentes auxiliares de UI (comentados) -------------------------

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    final style = GoogleFonts.baloo2(
      color: Colors.white,
      fontWeight: FontWeight.w700,
      fontSize: 16,
      letterSpacing: .3,
      shadows: [Shadow(color: Colors.black.withOpacity(.2), blurRadius: 6)],
    );
    return Row(
      children: [
        const Expanded(child: Divider(color: Colors.white, thickness: 1.2)),
        const SizedBox(width: 10),
        Text(text, style: style),
        const SizedBox(width: 10),
        const Expanded(child: Divider(color: Colors.white, thickness: 1.2)),
      ],
    );
  }
}

class _EmotionItem {
  final String label;       // texto mostrado no botão
  final List<Color> colors; // gradiente do botão
  final String route;       // ROTA chamada ao tocar
  const _EmotionItem(this.label, this.colors, this.route);
}

class _EmotionGrid extends StatelessWidget {
  final List<_EmotionItem> items;
  const _EmotionGrid({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2, // 2 colunas
      shrinkWrap: true,  // para caber dentro do ListView
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 1.9,
      children: items.map((e) {
        return _EmotionButton(
          label: e.label,
          colors: e.colors,
          onTap: () {
            // >>>>>>> NAVEGAÇÃO ACONTECE AQUI <<<<<<<
            // JEITO ORGANIZADO: pelas rotas nomeadas
            Navigator.pushReplacementNamed(context, e.route);

            // Alternativa (push direto):
            // Navigator.pushNamedAndRemoveUntil(context, Routes.home, (r) => false) => const Pergunta1Ansiedade()));
          },
        );
      }).toList(),
    );
  }
}

class _EmotionButton extends StatelessWidget {
  final String label;
  final List<Color> colors;
  final VoidCallback onTap;
  const _EmotionButton({
    super.key,
    required this.label,
    required this.colors,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final style = GoogleFonts.baloo2(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w900,
      height: 1.05,
      letterSpacing: .3,
      shadows: [Shadow(color: Colors.black.withOpacity(.25), blurRadius: 8)],
    );

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: colors, begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(.18), blurRadius: 14, offset: const Offset(0, 8))],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(22),
          onTap: onTap,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Text(label, textAlign: TextAlign.center, style: style),
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
  const _HelpBlock({super.key, required this.cvv, required this.telefone});

  @override
  Widget build(BuildContext context) {
    final base = GoogleFonts.baloo2(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w700,
      height: 1.1,
      shadows: [Shadow(color: Colors.black.withOpacity(.2), blurRadius: 6)],
    );
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(color: Colors.white.withOpacity(.12), borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.white.withOpacity(.18), shape: BoxShape.circle),
            child: const Icon(Icons.support_agent, color: Colors.white, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Precisa de ajuda?', style: base.copyWith(fontSize: 18)),
              const SizedBox(height: 6),
              Text('CVV: $cvv', style: base),
              Text('Telefone: $telefone', style: base),
            ]),
          ),
        ],
      ),
    );
  }
}

class _BackgroundGradient extends StatelessWidget {
  const _BackgroundGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return const Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFF7A00),
              Color(0xFFFFC300),
              Color(0xFF00D2FF),
              Color(0xFF7B61FF),
              Color(0xFFFF3D81),
            ],
            stops: [0.0, 0.28, 0.55, 0.77, 1.0],
          ),
        ),
      ),
    );
  }
}
