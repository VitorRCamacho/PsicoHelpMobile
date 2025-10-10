// lib/screens/Trilha/Tristeza/Final1_Tristeza.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mente_ifc/core/routes.dart';

class Final1TristezaScreen extends StatelessWidget {
  const Final1TristezaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle = GoogleFonts.baloo2(
      fontSize: 32,
      fontWeight: FontWeight.w900,
      color: const Color(0xFF2F3A8F),
      height: 1.1,
    );

    final subtitleStyle = GoogleFonts.baloo2(
      fontSize: 20,
      fontWeight: FontWeight.w900,
      color: const Color(0xFF2F3A8F),
    );

    final bodyStyle = GoogleFonts.baloo2(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.black87,
      height: 1.5,
    );

    return PopScope(
      canPop: false, // Bloqueia o botão voltar do sistema
      child: Scaffold(
        backgroundColor: const Color(0xFFE7F0FF),
        appBar: AppBar(
          backgroundColor: const Color(0xFF2F3A8F),
          elevation: 0,
          automaticallyImplyLeading: false,
        title: Text(
          'Diário de Gratidão',
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
                  colors: [Color(0xFF2F3A8F), Color(0xFF4F83FF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Icon(Icons.auto_stories, color: Colors.white, size: 40),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Diário de Gratidão',
                          style: GoogleFonts.baloo2(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Estruturado - 5 minutos diários',
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
              'A prática da gratidão aumenta a produção de neurotransmissores como a dopamina e a serotonina (atuando como um "antidepressivo natural") e fortalece as vias neurais positivas no cérebro.',
              style: bodyStyle,
            ),
            const SizedBox(height: 28),

            // Como praticar
            Text('Como praticar', style: titleStyle),
            const SizedBox(height: 16),

            _GratitudeCard(
              number: '1',
              question: 'Três coisas boas de hoje',
              description: 'Liste três coisas boas que aconteceram hoje, mesmo que pequenas (ex: um sorriso, uma refeição gostosa, um momento de paz).',
              color: const Color(0xFF2F3A8F),
            ),
            const SizedBox(height: 12),
            _GratitudeCard(
              number: '2',
              question: 'Uma pessoa que me ajudou',
              description: 'Pense em alguém que fez diferença hoje, mesmo de forma simples. Agradeça mentalmente ou envie uma mensagem.',
              color: const Color(0xFF4F83FF),
            ),
            const SizedBox(height: 12),
            _GratitudeCard(
              number: '3',
              question: 'Algo sobre mim mesmo(a)',
              description: 'Reconheça algo positivo em você: uma qualidade, uma conquista, um esforço que você fez.',
              color: const Color(0xFF6EA8FF),
            ),
            const SizedBox(height: 28),

            // Por que funciona
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF2F3A8F).withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF2F3A8F).withOpacity(0.3), width: 2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.science, color: Color(0xFF2F3A8F), size: 28),
                      const SizedBox(width: 12),
                      Expanded(child: Text('Como isso te ajuda?', style: subtitleStyle)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '🧠 Ativa áreas cerebrais ligadas ao bem-estar\n\n💊 Aumenta serotonina e dopamina naturalmente\n\n🌟 Treina o cérebro a notar o positivo\n\n❤️ Reduz sintomas depressivos com prática regular',
                    style: bodyStyle,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),

            // Dicas
            Text('Dicas importantes', style: titleStyle),
            const SizedBox(height: 16),
            _TipCard(
              icon: Icons.calendar_today,
              tip: 'Escolha um horário fixo: manhã ao acordar ou noite antes de dormir.',
            ),
            const SizedBox(height: 12),
            _TipCard(
              icon: Icons.edit_note,
              tip: 'Pode ser em um caderno, bloco de notas do celular ou até em áudio.',
            ),
            const SizedBox(height: 12),
            _TipCard(
              icon: Icons.favorite,
              tip: 'Não precisa ser perfeito. O importante é praticar consistentemente.',
            ),
            const SizedBox(height: 12),
            _TipCard(
              icon: Icons.trending_up,
              tip: 'Nos dias difíceis, mesmo coisas pequenas contam: "respirei", "levantei da cama".',
            ),
            const SizedBox(height: 28),

            // Aviso final
            Center(
              child: Text(
                'Pequenos momentos de gratidão podem\ntransformar sua perspectiva.',
                textAlign: TextAlign.center,
                style: bodyStyle.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF2F3A8F),
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
            const SizedBox(height: 28),

            // Botão para voltar à tela principal
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Volta para a tela principal, removendo todas as rotas anteriores
                  Navigator.pushNamedAndRemoveUntil(context, Routes.home, (route) => false);
                },
                icon: const Icon(Icons.home, color: Colors.white),
                label: Text(
                  'Voltar para Tela Principal',
                  style: GoogleFonts.baloo2(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2F3A8F),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      ),
    );
  }
}

class _GratitudeCard extends StatelessWidget {
  final String number;
  final String question;
  final String description;
  final Color color;

  const _GratitudeCard({
    required this.number,
    required this.question,
    required this.description,
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
                  question,
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
          Icon(icon, color: const Color(0xFF2F3A8F), size: 24),
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
