// lib/screens/Trilha/Tristeza/Final2_Tristeza.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Final2TristezaScreen extends StatelessWidget {
  const Final2TristezaScreen({super.key});

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

    return Scaffold(
      backgroundColor: const Color(0xFFE7F0FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2F3A8F),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Atividades de Prazer',
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
                  const Icon(Icons.event_available, color: Colors.white, size: 40),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'PEPs - Prazer e Eficiência',
                          style: GoogleFonts.baloo2(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Agendamento de Atividades',
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
              'Ativação Comportamental: Interrompe o ciclo de evitação e isolamento. É altamente eficaz por ser concreto e adequado ao desenvolvimento do adolescente.',
              style: bodyStyle,
            ),
            const SizedBox(height: 28),

            // Tipos de atividades
            Text('Dois tipos de atividades', style: titleStyle),
            const SizedBox(height: 16),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF4F83FF).withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF4F83FF).withOpacity(0.3), width: 2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xFF4F83FF),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.sentiment_very_satisfied, color: Colors.white, size: 28),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Atividades de Prazer',
                          style: GoogleFonts.baloo2(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: const Color(0xFF4F83FF),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Coisas que você gosta de fazer:\n• Ouvir música\n• Assistir séries/filmes\n• Jogar\n• Desenhar/criar\n• Conversar com amigos\n• Praticar hobby',
                    style: bodyStyle,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF6EA8FF).withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF6EA8FF).withOpacity(0.3), width: 2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xFF6EA8FF),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.check_circle, color: Colors.white, size: 28),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Atividades de Eficiência',
                          style: GoogleFonts.baloo2(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: const Color(0xFF6EA8FF),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Tarefas que trazem sensação de realização:\n• Arrumar o quarto\n• Fazer uma tarefa da escola\n• Tomar banho\n• Preparar uma refeição\n• Organizar algo\n• Cuidar de você',
                    style: bodyStyle,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),

            // Como praticar
            Text('Como usar os PEPs', style: titleStyle),
            const SizedBox(height: 16),

            _StepCard(
              number: '1',
              title: 'Escolha 2-3 atividades',
              description: 'Pelo menos uma de prazer e uma de eficiência para a semana.',
              icon: Icons.list_alt,
              color: const Color(0xFF2F3A8F),
            ),
            const SizedBox(height: 12),
            _StepCard(
              number: '2',
              title: 'Agende no calendário',
              description: 'Defina dia e horário. Trate como um compromisso importante.',
              icon: Icons.calendar_month,
              color: const Color(0xFF4F83FF),
            ),
            const SizedBox(height: 12),
            _StepCard(
              number: '3',
              title: 'Comece pequeno',
              description: '10-15 minutos já conta. O importante é começar, não ser perfeito.',
              icon: Icons.rocket_launch,
              color: const Color(0xFF6EA8FF),
            ),
            const SizedBox(height: 12),
            _StepCard(
              number: '4',
              title: 'Celebre ao completar',
              description: 'Reconheça seu esforço. Marque como feito e sinta-se orgulhoso.',
              icon: Icons.celebration,
              color: const Color(0xFF2F3A8F),
            ),
            const SizedBox(height: 28),

            // Dicas
            Text('Dicas importantes', style: titleStyle),
            const SizedBox(height: 16),
            _TipCard(
              icon: Icons.priority_high,
              tip: 'Não espere ter vontade. A ação vem primeiro, a motivação vem depois.',
            ),
            const SizedBox(height: 12),
            _TipCard(
              icon: Icons.groups,
              tip: 'Convide alguém para fazer junto. Fica mais fácil e divertido.',
            ),
            const SizedBox(height: 12),
            _TipCard(
              icon: Icons.battery_charging_full,
              tip: 'Alterne prazer e eficiência para manter o equilíbrio.',
            ),
            const SizedBox(height: 28),

            // Aviso final
            Center(
              child: Text(
                'Pequenas ações quebram o ciclo da tristeza.\nVocê consegue dar o primeiro passo.',
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
