// lib/screens/Trilha/Ansiedade/Final2_Ansiedade.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Final2AnsiedadeScreen extends StatelessWidget {
  const Final2AnsiedadeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle = GoogleFonts.baloo2(
      fontSize: 32,
      fontWeight: FontWeight.w900,
      color: const Color(0xFF0E7C86),
      height: 1.1,
    );

    final subtitleStyle = GoogleFonts.baloo2(
      fontSize: 20,
      fontWeight: FontWeight.w900,
      color: const Color(0xFF0E7C86),
    );

    final bodyStyle = GoogleFonts.baloo2(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.black87,
      height: 1.5,
    );

    return Scaffold(
      backgroundColor: const Color(0xFFE6FAF4),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E7C86),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Visualização do Lago Tranquilo',
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
                  colors: [Color(0xFF0E7C86), Color(0xFF31D0C6)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Icon(Icons.water, color: Colors.white, size: 40),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lago Tranquilo',
                          style: GoogleFonts.baloo2(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Redução do Estresse com Mindfulness',
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
            Text('O que é?', style: titleStyle),
            const SizedBox(height: 12),
            Text(
              'O uso de metáforas visuais auxilia na regulação emocional, permitindo que o cérebro processe a preocupação de forma mais controlada e tranquila.',
              style: bodyStyle,
            ),
            const SizedBox(height: 28),

            // Como praticar
            Text('Como praticar', style: titleStyle),
            const SizedBox(height: 16),

            _VisualizationCard(
              step: '1. Feche os olhos',
              description: 'Respire fundo algumas vezes e relaxe seu corpo completamente.',
              color: const Color(0xFF0E7C86),
            ),
            const SizedBox(height: 12),
            _VisualizationCard(
              step: '2. Imagine um lago',
              description: 'Visualize um lago calmo, com águas cristalinas e tranquilas. A superfície é lisa como um espelho.',
              color: const Color(0xFF31D0C6),
            ),
            const SizedBox(height: 12),
            _VisualizationCard(
              step: '3. Observe as ondas',
              description: 'Cada preocupação é uma pedra jogada no lago, criando ondas. Observe as ondas surgirem e depois se acalmarem naturalmente.',
              color: const Color(0xFF1FBBC1),
            ),
            const SizedBox(height: 12),
            _VisualizationCard(
              step: '4. Retorne à calma',
              description: 'Veja o lago voltando à tranquilidade. As preocupações passam, mas a calma sempre retorna.',
              color: const Color(0xFF00B3C8),
            ),
            const SizedBox(height: 28),

            // Metáfora explicada
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF0E7C86).withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF0E7C86).withOpacity(0.3), width: 2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.psychology, color: Color(0xFF0E7C86), size: 28),
                      const SizedBox(width: 12),
                      Expanded(child: Text('Entenda a metáfora', style: subtitleStyle)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '🌊 Lago = Sua mente\n\n💧 Ondas = Preocupações e pensamentos ansiosos\n\n🪨 Pedras = Situações estressantes\n\nAssim como as ondas sempre se acalmam, suas preocupações também passarão. Você não precisa lutar contra elas, apenas observe-as passar.',
                    style: bodyStyle,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),

            // Dicas
            Text('Dicas para visualização', style: titleStyle),
            const SizedBox(height: 16),
            _TipCard(
              icon: Icons.timer,
              tip: 'Pratique por 5-10 minutos. Quanto mais você praticar, mais fácil fica.',
            ),
            const SizedBox(height: 12),
            _TipCard(
              icon: Icons.location_on,
              tip: 'Tente fazer próximo a uma janela ou em um lugar tranquilo.',
            ),
            const SizedBox(height: 12),
            _TipCard(
              icon: Icons.brush,
              tip: 'Se tiver dificuldade, tente imaginar cores: azul claro para o lago, dourado para o sol.',
            ),
            const SizedBox(height: 28),

            // Aviso final
            Center(
              child: Text(
                'Suas preocupações são ondas que passam.\nA calma sempre pode retornar.',
                textAlign: TextAlign.center,
                style: bodyStyle.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF0E7C86),
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

class _VisualizationCard extends StatelessWidget {
  final String step;
  final String description;
  final Color color;

  const _VisualizationCard({
    required this.step,
    required this.description,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            step,
            style: GoogleFonts.baloo2(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              color: color,
            ),
          ),
          const SizedBox(height: 8),
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
          Icon(icon, color: const Color(0xFF0E7C86), size: 24),
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
