// lib/screens/Trilha/Ansiedade/Pergunta1_Ansiedade.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mente_ifc/core/routes.dart';

class Pergunta3AnsiedadeScreen extends StatelessWidget {
  const Pergunta3AnsiedadeScreen({super.key});

  static const double _maxWidth = 520;
  static const double _hPad = 20;
  static const double _gapSm = 12;
  static const double _gapMd = 16;
  static const double _gapLg = 20;
  static const double _gapXl = 28;

  @override
  Widget build(BuildContext context) {
    // ===== ALTERAÇÃO 1: Cor do texto principal =====
    final titleStyle = GoogleFonts.baloo2(
      fontSize: 36,
      fontWeight: FontWeight.w900,
      height: 1.05,
      color: Colors.black, // <-- MUDOU DE 0xFF0E7C86 PARA PRETO
      shadows: [Shadow(color: Colors.black.withOpacity(.1), blurRadius: 6)],
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          const _BackgroundGradient(),
          Container(color: Colors.white.withOpacity(0.04)),
          SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: _maxWidth),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: _hPad),
                  child: ListView(
                    padding: const EdgeInsets.only(top: _gapLg, bottom: _gapLg),
                    children: [
                      _ProgressIndicator(current: 3, total: 5),
                      const SizedBox(height: _gapMd),
                      const _SectionLabel(text: 'Trilha Ansiedade - Pergunta 3/5'),
                      const SizedBox(height: _gapMd),
                      Text(
                        'Você tem sentido dificuldade de relaxar ou de se acalmar recentemente?',
                        textAlign: TextAlign.center,
                        style: titleStyle,
                      ),
                      const SizedBox(height: _gapXl),
                      _EmotionGrid(
                        items: const [
                          _EmotionItem('Ansioso(a) 😔', [Color(0xFF31D0C6), Color(0xFF1FBBC1)], Routes.ansiedadeP4),
                          _EmotionItem('Triste 🥺', [Color(0xFF6EA8FF), Color(0xFF4F83FF)], Routes.tristezaP4),
                          _EmotionItem('Com raiva 😤', [Color(0xFFFF8CA1), Color(0xFFFF6D8A)], Routes.raivaP4),
                          _EmotionItem('Com medo 😟', [Color(0xFFA78BFA), Color(0xFF8B6CFF)], Routes.medoP4),
                          _EmotionItem('Estressado(a) 😵‍💫', [Color(0xFFFFB74D), Color(0xFFFFA726)], Routes.estresseP4),
                          _EmotionItem('Sozinho(a) 💛', [Color(0xFFFF8FB3), Color(0xFFFF79A8)], Routes.solidaoP4),
                        ],
                      ),
                      const SizedBox(height: _gapXl),
                      const Divider(color: Colors.black, thickness: 1.2), // <-- MUDOU A COR DA LINHA
                      const SizedBox(height: _gapMd),
                      const _HelpBlock(
                        cvv: '188 (CVV – 24h)',
                        telefone: '(XX) XXXX-XXXX',
                      ),
                      const SizedBox(height: _gapSm),
                      // ===== ALTERAÇÃO 2: Cor do texto do rodapé =====
                      Opacity(
                        opacity: .9,
                        child: Text(
                          'O APP não substitui atendimento psicológico.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.baloo2(
                            color: Colors.black, // <-- MUDOU DE BRANCO PARA PRETO
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                            height: 1.1,
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

// ===== ALTERAÇÃO 3: Cor do indicador de progresso =====
class _ProgressIndicator extends StatelessWidget {
  final int current;
  final int total;
  
  const _ProgressIndicator({ required this.current, required this.total });

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
              // MUDOU DE BRANCO PARA PRETO
              color: isActive ? Colors.black : Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        );
      }),
    );
  }
}

// ===== ALTERAÇÃO 4: Cor do rótulo da seção =====
class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    final style = GoogleFonts.baloo2(
      color: Colors.black, // <-- MUDOU DE BRANCO PARA PRETO
      fontWeight: FontWeight.w700,
      fontSize: 16,
      letterSpacing: .3,
    );
    return Row(
      children: [
        const Expanded(child: Divider(color: Colors.black, thickness: 1.2)), // <-- MUDOU DE BRANCO PARA PRETO
        const SizedBox(width: 10),
        Text(text, style: style),
        const SizedBox(width: 10),
        const Expanded(child: Divider(color: Colors.black, thickness: 1.2)), // <-- MUDOU DE BRANCO PARA PRETO
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
  const _EmotionGrid({super.key, required this.items});

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
            Navigator.pushReplacementNamed(context, e.route);
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
  const _EmotionButton({ super.key, required this.label, required this.colors, required this.onTap });

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
        color: const Color(0xFF0E7C86),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(.18), blurRadius: 14, offset: const Offset(0, 8))],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(22),
          onTap: onTap,
          splashColor: Colors.white.withOpacity(0.2),
          highlightColor: Colors.white.withOpacity(0.1),
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

// ===== ALTERAÇÃO 5: Cores do bloco de ajuda =====
class _HelpBlock extends StatelessWidget {
  final String cvv;
  final String telefone;
  const _HelpBlock({super.key, required this.cvv, required this.telefone});

  @override
  Widget build(BuildContext context) {
    final base = GoogleFonts.baloo2(
      color: Colors.black, // <-- MUDOU DE BRANCO PARA PRETO
      fontSize: 16,
      fontWeight: FontWeight.w700,
      height: 1.1,
    );
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      // MUDOU O FUNDO DO CONTAINER
      decoration: BoxDecoration(color: Colors.black.withOpacity(0.05), borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            // MUDOU O FUNDO DO CÍRCULO
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.08), shape: BoxShape.circle),
            child: const Icon(Icons.support_agent, color: Colors.black, size: 22), // <-- MUDOU A COR DO ÍCONE
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
    return Container(color: const Color(0xFFE6FAF4));
  }
}