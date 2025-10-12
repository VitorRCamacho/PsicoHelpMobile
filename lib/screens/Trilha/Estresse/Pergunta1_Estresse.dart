// lib/screens/Trilha/Estresse/Pergunta1_Estresse.dart
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mente_ifc/core/routes.dart';

class Pergunta1EstresseScreen extends StatelessWidget {
  const Pergunta1EstresseScreen({super.key});

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
      color: Colors.black,
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
                      _ProgressIndicator(current: 1, total: 5),
                      const SizedBox(height: _gapMd),
                      const _SectionLabel(text: 'Trilha Estresse'),
                      const SizedBox(height: _gapMd),
                      Text(
                        'Você tem se sentido sobrecarregado(a) com as demandas do seu dia a dia?',
                        textAlign: TextAlign.center,
                        style: titleStyle,
                      ),
                      const SizedBox(height: _gapXl),
                      _EmotionGrid(
                        items: () {
                          final items = [
                            const _EmotionItem('Sim, é muita pressão e responsabilidades 😫', [Color(0xFFFFB74D), Color(0xFFFFA726)], Routes.estresseP2),
                            const _EmotionItem('Não sobrecarregado, mas ando constantemente nervoso 😟', [Color(0xFF31D0C6), Color(0xFF1FBBC1)], Routes.ansiedadeP2),
                            const _EmotionItem('Não, só me sinto desanimado e sem energia 😞', [Color(0xFF6EA8FF), Color(0xFF4F83FF)], Routes.tristezaP2),
                            const _EmotionItem('Não, só irritado com algumas coisas 😠', [Color(0xFFFF8CA1), Color(0xFFFF6D8A)], Routes.raivaP2),
                            const _EmotionItem('Não, só preocupado com certos medos 😨', [Color(0xFFA78BFA), Color(0xFF8B6CFF)], Routes.medoP2),
                            const _EmotionItem('Não, me sinto é muito sozinho 😔', [Color(0xFFFF8FB3), Color(0xFFFF79A8)], Routes.solidaoP2),
                          ];
                          items.shuffle(Random());
                          return items;
                        }(),
                      ),
                      const SizedBox(height: _gapXl),
                      const Divider(color: Colors.black, thickness: 1.2),
                      const SizedBox(height: _gapMd),
                      const _HelpBlock(),
                      const SizedBox(height: _gapSm),
                      Opacity(
                        opacity: .9,
                        child: Text(
                          'O APP não substitui atendimento psicológico.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.baloo2(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 13, height: 1.1),
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
              color: isActive ? Colors.black : Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        );
      }),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    final style = GoogleFonts.baloo2(
      color: Colors.black,
      fontWeight: FontWeight.w700,
      fontSize: 16,
      letterSpacing: .3,
    );
    return Row(
      children: [
        const Expanded(child: Divider(color: Colors.black, thickness: 1.2)),
        const SizedBox(width: 10),
        Text(text, style: style),
        const SizedBox(width: 10),
        const Expanded(child: Divider(color: Colors.black, thickness: 1.2)),
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
            Navigator.pushNamed(context, e.route);
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
        gradient: const LinearGradient(
          colors: [Color(0xFF8A6D1F), Color(0xFF6E5618)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
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

class _HelpBlock extends StatelessWidget {
  const _HelpBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final base = GoogleFonts.baloo2(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w700,
      height: 1.1,
    );
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(color: Colors.black.withOpacity(0.05), borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.08), shape: BoxShape.circle),
            child: const Icon(Icons.support_agent, color: Colors.black, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Precisa de ajuda?', style: base.copyWith(fontSize: 18)),
              const SizedBox(height: 6),
              Text('📞 CVV: 188 (24h, todos os dias)', style: base),
              Text('💬 Chat: www.cvv.org.br', style: base),
              Text('✉️ E-mail: atendimento@cvv.org.br', style: base),
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
    return Container(color: const Color(0xFFFFF8E5));
  }
}
