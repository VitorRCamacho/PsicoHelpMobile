// lib/screens/respiracao_screen.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RespiracaoScreen extends StatelessWidget {
  const RespiracaoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle = GoogleFonts.baloo2(
      fontSize: 32,
      fontWeight: FontWeight.w900,
      color: const Color(0xFF7C4DFF),
      height: 1.1,
    );

    final stepTitleStyle = GoogleFonts.baloo2(
      fontSize: 20,
      fontWeight: FontWeight.w900,
      color: const Color(0xFF7C4DFF),
    );

    final bodyStyle = GoogleFonts.baloo2(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.black87,
      height: 1.5,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF7C4DFF),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Guia de Respiração',
          style: GoogleFonts.baloo2(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF7C4DFF), Color(0xFF9B5BFF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Icon(Icons.self_improvement, color: Colors.white, size: 40),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Respire fundo',
                          style: GoogleFonts.baloo2(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Um exercício de 2 minutos para acalmar',
                          style: GoogleFonts.baloo2(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),

            // Introdução
            Text('Como funciona?', style: titleStyle),
            const SizedBox(height: 12),
            Text(
              'A respiração consciente é uma técnica simples e poderosa para reduzir a ansiedade e o estresse. Quando estamos nervosos, nossa respiração fica rápida e superficial. Ao desacelerar e respirar profundamente, enviamos um sinal ao nosso corpo de que está tudo bem.',
              style: bodyStyle,
            ),
            const SizedBox(height: 28),

            // Preparação
            Text('Preparação', style: titleStyle),
            const SizedBox(height: 16),
            _StepCard(
              number: '1',
              title: 'Encontre um lugar confortável',
              description: 'Sente-se em uma cadeira com os pés no chão, ou deite-se confortavelmente. Você também pode fazer em pé se preferir.',
              icon: Icons.chair,
              color: const Color(0xFF7C4DFF),
            ),
            const SizedBox(height: 12),
            _StepCard(
              number: '2',
              title: 'Relaxe seu corpo',
              description: 'Feche os olhos ou mantenha um olhar suave. Relaxe seus ombros, solte a tensão do rosto e das mãos.',
              icon: Icons.spa,
              color: const Color(0xFF9B5BFF),
            ),
            const SizedBox(height: 28),

            // Técnica 4-7-8
            Text('Técnica de Respiração 4-7-8', style: titleStyle),
            const SizedBox(height: 12),
            Text(
              'Esta técnica, desenvolvida pelo Dr. Andrew Weil, é conhecida como "tranquilizante natural" para o sistema nervoso.',
              style: bodyStyle,
            ),
            const SizedBox(height: 16),

            _BreathingStepCard(
              step: 'Inspire',
              duration: '4 segundos',
              description: 'Inspire silenciosamente pelo nariz enquanto conta até 4.',
              icon: Icons.arrow_downward,
              color: const Color(0xFF00B3C8),
            ),
            const SizedBox(height: 12),
            _BreathingStepCard(
              step: 'Segure',
              duration: '7 segundos',
              description: 'Segure a respiração enquanto conta até 7.',
              icon: Icons.pause_circle_outline,
              color: const Color(0xFFFFB74D),
            ),
            const SizedBox(height: 12),
            _BreathingStepCard(
              step: 'Expire',
              duration: '8 segundos',
              description: 'Expire completamente pela boca, fazendo um som suave, enquanto conta até 8.',
              icon: Icons.arrow_upward,
              color: const Color(0xFFFF3D81),
            ),
            const SizedBox(height: 16),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF7C4DFF).withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Icon(Icons.repeat, color: Color(0xFF7C4DFF), size: 28),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Repita este ciclo 4 vezes (cerca de 2 minutos)',
                      style: bodyStyle.copyWith(
                        color: const Color(0xFF7C4DFF),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),

            // Dicas
            Text('Dicas Importantes', style: titleStyle),
            const SizedBox(height: 16),
            _TipCard(
              icon: Icons.schedule,
              tip: 'Pratique regularmente, mesmo quando não estiver ansioso. Isso treina seu corpo.',
            ),
            const SizedBox(height: 12),
            _TipCard(
              icon: Icons.volume_off,
              tip: 'Não se preocupe se se distrair. Gentilmente, traga sua atenção de volta à respiração.',
            ),
            const SizedBox(height: 12),
            _TipCard(
              icon: Icons.bed,
              tip: 'Esta técnica é ótima antes de dormir para acalmar a mente.',
            ),
            const SizedBox(height: 12),
            _TipCard(
              icon: Icons.warning_amber,
              tip: 'Se sentir tonturas, diminua a intensidade ou respire normalmente por alguns segundos.',
            ),
            const SizedBox(height: 28),

            // Aviso final
            Center(
              child: Text(
                'Lembre-se: você tem o poder de acalmar sua mente.\nRespire e confie no processo.',
                textAlign: TextAlign.center,
                style: bodyStyle.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF7C4DFF),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                'O APP não substitui atendimento psicológico profissional.',
                textAlign: TextAlign.center,
                style: bodyStyle.copyWith(
                  fontSize: 13,
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StepCard extends StatelessWidget {
  final String number;
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  const _StepCard({
    required this.number,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3), width: 2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                number,
                style: GoogleFonts.baloo2(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.baloo2(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: color,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: GoogleFonts.baloo2(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BreathingStepCard extends StatelessWidget {
  final String step;
  final String duration;
  final String description;
  final IconData icon;
  final Color color;

  const _BreathingStepCard({
    required this.step,
    required this.duration,
    required this.description,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.4), width: 2),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 40),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      step,
                      style: GoogleFonts.baloo2(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: color,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        duration,
                        style: GoogleFonts.baloo2(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: GoogleFonts.baloo2(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TipCard extends StatelessWidget {
  final IconData icon;
  final String tip;

  const _TipCard({required this.icon, required this.tip});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF7C4DFF), size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              tip,
              style: GoogleFonts.baloo2(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
