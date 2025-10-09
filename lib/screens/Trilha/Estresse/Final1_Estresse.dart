// lib/screens/Trilha/Estresse/Final1_Estresse.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Final1EstresseScreen extends StatelessWidget {
  const Final1EstresseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle = GoogleFonts.baloo2(
      fontSize: 32,
      fontWeight: FontWeight.w900,
      color: const Color(0xFF8A6D1F),
      height: 1.1,
    );

    final subtitleStyle = GoogleFonts.baloo2(
      fontSize: 20,
      fontWeight: FontWeight.w900,
      color: const Color(0xFF8A6D1F),
    );

    final bodyStyle = GoogleFonts.baloo2(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.black87,
      height: 1.5,
    );

    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF8A6D1F),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Planejador de Blocos de Tempo',
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
                  colors: [Color(0xFF8A6D1F), Color(0xFFB8953D)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Icon(Icons.grid_on, color: Colors.white, size: 40),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Blocos de Tempo 3x3',
                          style: GoogleFonts.baloo2(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Organize seu dia e recupere o controle',
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
              'A organização restaura o senso de controle, combatendo a sensação de sobrecarga e caos mental. O método 3x3 divide o dia em 9 blocos gerenciáveis.',
              style: bodyStyle,
            ),
            const SizedBox(height: 28),

            // Como praticar
            Text('Como praticar', style: titleStyle),
            const SizedBox(height: 16),
            _StepCard(
              number: '1',
              title: 'Divida seu dia',
              description: 'Separe o dia em 3 períodos: Manhã, Tarde e Noite. Cada período terá 3 blocos de atividades.',
              icon: Icons.schedule,
              color: const Color(0xFF8A6D1F),
            ),
            const SizedBox(height: 12),
            _StepCard(
              number: '2',
              title: 'Liste as prioridades',
              description: 'Para cada período, escolha as 3 tarefas mais importantes. Não mais que isso! Foco é essencial.',
              icon: Icons.list_alt,
              color: const Color(0xFF9D7E2D),
            ),
            const SizedBox(height: 12),
            _StepCard(
              number: '3',
              title: 'Atribua tempo realista',
              description: 'Defina quanto tempo cada tarefa vai levar. Seja honesto e inclua pequenas pausas entre blocos.',
              icon: Icons.timer,
              color: const Color(0xFFB8953D),
            ),
            const SizedBox(height: 12),
            _StepCard(
              number: '4',
              title: 'Execute com foco',
              description: 'Durante cada bloco, trabalhe apenas naquela tarefa. Desligue notificações e distrações.',
              icon: Icons.center_focus_strong,
              color: const Color(0xFFCDAA4B),
            ),
            const SizedBox(height: 28),

            // Exemplo visual 3x3
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF8A6D1F).withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF8A6D1F).withOpacity(0.3), width: 2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.grid_view, color: Color(0xFF8A6D1F), size: 28),
                      const SizedBox(width: 12),
                      Text('Exemplo de dia 3x3', style: subtitleStyle),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '🌅 MANHÃ (6h-12h)',
                    style: bodyStyle.copyWith(fontWeight: FontWeight.w900, color: const Color(0xFF8A6D1F)),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '1️⃣ Exercício físico (30 min)\n2️⃣ Tarefa prioritária do trabalho (2h)\n3️⃣ Reunião importante (1h)',
                    style: bodyStyle,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '☀️ TARDE (12h-18h)',
                    style: bodyStyle.copyWith(fontWeight: FontWeight.w900, color: const Color(0xFF8A6D1F)),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '1️⃣ Almoço tranquilo (1h)\n2️⃣ E-mails e tarefas rápidas (1h30)\n3️⃣ Projeto criativo (2h)',
                    style: bodyStyle,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '🌙 NOITE (18h-22h)',
                    style: bodyStyle.copyWith(fontWeight: FontWeight.w900, color: const Color(0xFF8A6D1F)),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '1️⃣ Tempo com família (1h30)\n2️⃣ Hobby ou lazer (1h)\n3️⃣ Ritual de descanso (30 min)',
                    style: bodyStyle,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),

            // Benefícios
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF8A6D1F).withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF8A6D1F).withOpacity(0.3), width: 2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.check_circle, color: Color(0xFF8A6D1F), size: 28),
                      const SizedBox(width: 12),
                      Text('Por que funciona?', style: subtitleStyle),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'A estrutura clara reduz a sensação de caos e sobrecarga. Ao limitar a 3 tarefas por período, você evita a paralisia da escolha e aumenta a sensação de realização ao completar cada bloco.',
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
              icon: Icons.edit_note,
              tip: 'Planeje seu 3x3 na noite anterior ou logo ao acordar. Isso reduz decisões impulsivas.',
            ),
            const SizedBox(height: 12),
            _TipCard(
              icon: Icons.priority_high,
              tip: 'Se algo não cabe nos 9 blocos, provavelmente não é tão urgente. Deixe para outro dia.',
            ),
            const SizedBox(height: 12),
            _TipCard(
              icon: Icons.accessibility_new,
              tip: 'Inclua sempre um bloco de autocuidado (exercício, meditação, descanso).',
            ),
            const SizedBox(height: 12),
            _TipCard(
              icon: Icons.celebration,
              tip: 'Ao completar cada bloco, faça uma pequena pausa e celebre sua produtividade.',
            ),
            const SizedBox(height: 28),

            // Aviso final
            Center(
              child: Text(
                'O controle começa com organização.\nVocê consegue gerenciar 3 tarefas de cada vez.',
                textAlign: TextAlign.center,
                style: bodyStyle.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF8A6D1F),
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
          Icon(icon, color: const Color(0xFF8A6D1F), size: 24),
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
