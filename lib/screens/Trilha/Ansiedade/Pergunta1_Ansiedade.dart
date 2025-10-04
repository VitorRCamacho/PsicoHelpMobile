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
                      const _SectionLabel(text: 'Pergunta 1 - Ansiedade'),
                      const SizedBox(height: _gapMd),

                      Text(
                        'Nos últimos dias, você se sentiu muito ansioso ou nervoso sem um motivo claro?',
                        textAlign: TextAlign.center,
                        style: titleStyle,
                      ),

                      const SizedBox(height: _gapXl),

                      // OPÇÕES DE RESPOSTA PARA SIM/NÃO ou ESCALA
                      _AnswerOptions(
                        onAnswer: (answer) {
                          // Aqui você pode salvar a resposta se quiser
                          // Por exemplo: saveAnswer('ansiedade_p1', answer);
                          
                          // Navega para próxima pergunta
                          Navigator.pushNamed(context, Routes.ansiedadeP2);
                        },
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

// Widget para as opções de resposta
class _AnswerOptions extends StatelessWidget {
  final Function(String) onAnswer;
  
  const _AnswerOptions({required this.onAnswer});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _AnswerButton(
                label: 'Não',
                emoji: '😌',
                colors: const [Color(0xFF4CAF50), Color(0xFF45A049)],
                onTap: () => onAnswer('nao'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _AnswerButton(
                label: 'Um pouco',
                emoji: '😕',
                colors: const [Color(0xFFFFA726), Color(0xFFFF9800)],
                onTap: () => onAnswer('um_pouco'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _AnswerButton(
                label: 'Bastante',
                emoji: '😟',
                colors: const [Color(0xFFFF7043), Color(0xFFFF5722)],
                onTap: () => onAnswer('bastante'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _AnswerButton(
                label: 'Muito',
                emoji: '😰',
                colors: const [Color(0xFFEF5350), Color(0xFFF44336)],
                onTap: () => onAnswer('muito'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// Botão de resposta individual
class _AnswerButton extends StatelessWidget {
  final String label;
  final String emoji;
  final List<Color> colors;
  final VoidCallback onTap;
  
  const _AnswerButton({
    required this.label,
    required this.emoji,
    required this.colors,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final style = GoogleFonts.baloo2(
      color: Colors.white,
      fontSize: 18,
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
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
            child: Column(
              children: [
                Text(emoji, style: const TextStyle(fontSize: 24)),
                const SizedBox(height: 4),
                Text(label, textAlign: TextAlign.center, style: style),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Componentes auxiliares mantidos iguais...
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