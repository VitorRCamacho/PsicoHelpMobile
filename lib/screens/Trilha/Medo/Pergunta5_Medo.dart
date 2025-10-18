// lib/screens/Trilha/Medo/Pergunta5_Medo.dart
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mente_ifc/core/routes.dart';
import 'package:mente_ifc/services/final_manager.dart';
import 'package:mente_ifc/services/trail_loop_detector.dart';

class Pergunta5MedoScreen extends StatefulWidget {
  const Pergunta5MedoScreen({super.key});

  @override
  State<Pergunta5MedoScreen> createState() => _Pergunta5MedoScreenState();
}

class _Pergunta5MedoScreenState extends State<Pergunta5MedoScreen> {
  final _loopDetector = TrailLoopDetector();
  bool _isChecking = true;

  @override
  void initState() {
    super.initState();
    _checkForLoop();
  }

  Future<void> _checkForLoop() async {
    final redirectRoute = await _loopDetector.checkForLoop('MedoP5', context);
    if (redirectRoute != null && mounted) {
      Navigator.pushReplacementNamed(context, redirectRoute);
    } else {
      _loopDetector.registerVisit('MedoP5');
      if (mounted) {
        setState(() => _isChecking = false);
      }
    }
  }

  static const double _maxWidth = 520;
  static const double _hPad = 20;
  static const double _gapSm = 12;
  static const double _gapMd = 16;
  static const double _gapLg = 20;
  static const double _gapXl = 28;

  @override
  Widget build(BuildContext context) {
    if (_isChecking) {
      return const Scaffold(
        backgroundColor: Color(0xFFF3EEFF),
        body: Center(
          child: CircularProgressIndicator(color: Colors.black),
        ),
      );
    }

    final titleStyle = GoogleFonts.baloo2(
      fontSize: 36,
      fontWeight: FontWeight.w900,
      height: 1.2,
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
                      _ProgressIndicator(current: 5, total: 5),
                      const SizedBox(height: _gapMd),
                      const _SectionLabel(text: 'Trilha Medo'),
                      const SizedBox(height: _gapMd),
                      Text(
                        'Esse medo tem interferido na sua qualidade de vida e bem-estar emocional?',
                        textAlign: TextAlign.center,
                        style: titleStyle,
                      ),
                      const SizedBox(height: _gapXl),
                      _EmotionGrid(
                        items: () {
                          final items = [
                            _EmotionItem('Morro de medo de falar em público 😨', [Color(0xFFA78BFA), Color(0xFF8B6CFF)], () async {
                              final nextFinal = await FinalManager.getNextFinal('medo');
                              final route = nextFinal == 1 ? Routes.medoFinal1 : Routes.medoFinal2;
                              await FinalManager.markFinalShown('medo', nextFinal);
                              if (context.mounted) {
                                Navigator.pushNamed(context, route);
                              }
                            }),
                            _EmotionItem('Fico ansioso em público, ainda encaro 😟', [Color(0xFF31D0C6), Color(0xFF1FBBC1)], () => Navigator.pushNamed(context, Routes.ansiedadeP5)),
                            _EmotionItem('Não é medo, só falta ânimo pra socializar 😞', [Color(0xFF6EA8FF), Color(0xFF4F83FF)], () => Navigator.pushNamed(context, Routes.tristezaP5)),
                            _EmotionItem('Não tenho medo não, falo até demais 😠', [Color(0xFFFF8CA1), Color(0xFFFF6D8A)], () => Navigator.pushNamed(context, Routes.raivaP5)),
                            _EmotionItem('Não, até gosto de conhecer gente nova 😫', [Color(0xFFFFB74D), Color(0xFFFFA726)], () => Navigator.pushNamed(context, Routes.estresseP5)),
                            _EmotionItem('Não fujo de gente, só me sinto invisível 😔', [Color(0xFFFF8FB3), Color(0xFFFF79A8)], () => Navigator.pushNamed(context, Routes.solidaoP5)),
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
  final VoidCallback onTap;
  _EmotionItem(this.label, this.colors, this.onTap);
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
      childAspectRatio: 1.5,
      children: items.map((e) {
        return _EmotionButton(
          label: e.label,
          colors: e.colors,
          onTap: e.onTap,
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
      fontSize: 15,
      fontWeight: FontWeight.w900,
      height: 1.2,
      letterSpacing: .3,
      shadows: [Shadow(color: Colors.black.withOpacity(.25), blurRadius: 8)],
    );

    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF5B4FC4), Color(0xFF4A40A6)],
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
    return Container(color: const Color(0xFFF2EEFF));
  }
}
