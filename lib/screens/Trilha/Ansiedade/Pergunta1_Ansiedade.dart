// lib/screens/Trilha/Ansiedade/Pergunta1_Ansiedade.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mente_ifc/core/routes.dart';

class Pergunta1AnsiedadeScreen extends StatelessWidget {
  const Pergunta1AnsiedadeScreen({super.key});

  static const double _maxWidth = 520;
  static const double _hPad = 20;
  static const double _gapSm = 12;
  static const double _gapMd = 16;
  static const double _gapLg = 20;
  static const double _gapXl = 28;

  @override
  Widget build(BuildContext context) {
    final titleStyle = GoogleFonts.baloo2(
      fontSize: 32,
      fontWeight: FontWeight.w900,
      height: 1.15,
      color: Colors.white,
      shadows: [Shadow(color: Colors.black.withOpacity(.2), blurRadius: 8)],
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
                      // Indicador de progresso
                      _ProgressIndicator(current: 1, total: 5),
                      const SizedBox(height: _gapMd),
                      
                      const _SectionLabel(text: 'Trilha Ansiedade - Pergunta 1/5'),
                      const SizedBox(height: _gapMd),

                      Text(
                        'Nos últimos dias, você se sentiu muito ansioso ou nervoso sem um motivo claro?',
                        textAlign: TextAlign.center,
                        style: titleStyle,
                      ),

                      const SizedBox(height: _gapXl),

                      // GRID DE RESPOSTAS COM INTENSIDADE
                      _IntensityGrid(
                        items: const [
                          _IntensityItem(
                            'Ansiedade',
                            '😊',
                            [Color(0xFF4CAF50), Color(0xFF45A049)],
                            0,
                          ),
                          _IntensityItem(
                            'Tristeza',
                            '🙂',
                            [Color(0xFF8BC34A), Color(0xFF7CB342)],
                            1,
                          ),
                          _IntensityItem(
                            'Raiva',
                            '😐',
                            [Color(0xFFFFC107), Color(0xFFFFB300)],
                            2,
                          ),
                          _IntensityItem(
                            'Medo',
                            '😟',
                            [Color(0xFFFF9800), Color(0xFFFF8F00)],
                            3,
                          ),
                          _IntensityItem(
                            'Extresse',
                            '😰',
                            [Color(0xFFFF5722), Color(0xFFFF4411)],
                            4,
                          ),
                          _IntensityItem(
                            'Solidão',
                            '😱',
                            [Color(0xFFF44336), Color(0xFFE53935)],
                            5,
                          ),
                        ],
                        onAnswer: (intensity) {
                          // Aqui você pode salvar a resposta
                          // Por exemplo: saveAnswer('ansiedade_p1', intensity);
                          
                          // Navega para próxima pergunta
                          Navigator.pushNamed(context, Routes.ansiedadeP2);
                        },
                      ),

                      const SizedBox(height: _gapXl),
                      
                      // Botão para voltar
                      Center(
                        child: TextButton.icon(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back, color: Colors.white),
                          label: Text(
                            'Voltar',
                            style: GoogleFonts.baloo2(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: _gapMd),
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

// Modelo de item de intensidade
class _IntensityItem {
  final String label;
  final String emoji;
  final List<Color> colors;
  final int value;
  
  const _IntensityItem(this.label, this.emoji, this.colors, this.value);
}

// Grid de intensidade
class _IntensityGrid extends StatelessWidget {
  final List<_IntensityItem> items;
  final Function(int) onAnswer;
  
  const _IntensityGrid({
    required this.items,
    required this.onAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 1.8,
      children: items.map((item) {
        return _IntensityButton(
          label: item.label,
          emoji: item.emoji,
          colors: item.colors,
          onTap: () => onAnswer(item.value),
        );
      }).toList(),
    );
  }
}

// Botão de intensidade
class _IntensityButton extends StatelessWidget {
  final String label;
  final String emoji;
  final List<Color> colors;
  final VoidCallback onTap;
  
  const _IntensityButton({
    required this.label,
    required this.emoji,
    required this.colors,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final style = GoogleFonts.baloo2(
      color: Colors.white,
      fontSize: 17,
      fontWeight: FontWeight.w800,
      height: 1.05,
      letterSpacing: .3,
      shadows: [Shadow(color: Colors.black.withOpacity(.25), blurRadius: 8)],
    );

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.18),
            blurRadius: 14,
            offset: const Offset(0, 8),
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(22),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(emoji, style: const TextStyle(fontSize: 22)),
                const SizedBox(height: 2),
                Text(label, textAlign: TextAlign.center, style: style),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Componentes auxiliares
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

class _HelpBlock extends StatelessWidget {
  final String cvv;
  final String telefone;
  const _HelpBlock({required this.cvv, required this.telefone});

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
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.12),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.18),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.support_agent, color: Colors.white, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Precisa de ajuda?', style: base.copyWith(fontSize: 18)),
                const SizedBox(height: 6),
                Text('CVV: $cvv', style: base),
                Text('Telefone: $telefone', style: base),
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