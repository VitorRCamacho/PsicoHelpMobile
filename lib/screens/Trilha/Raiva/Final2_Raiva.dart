// lib/screens/Trilha/Raiva/Final2_Raiva.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mente_ifc/core/routes.dart';

class Final2RaivaScreen extends StatelessWidget {
  const Final2RaivaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle = GoogleFonts.baloo2(
      fontSize: 32,
      fontWeight: FontWeight.w900,
      color: const Color(0xFF006D77),
      height: 1.1,
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
        backgroundColor: const Color(0xFFFFE7DD),
        appBar: AppBar(
          backgroundColor: const Color(0xFF006D77),
          elevation: 0,
          automaticallyImplyLeading: false,
        title: Text(
          'Role-Playing Mental',
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
                  colors: [Color(0xFF006D77), Color(0xFFFF8CA1)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Icon(Icons.record_voice_over, color: Colors.white, size: 40),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Role-Playing Assertivo',
                          style: GoogleFonts.baloo2(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Treino de Habilidades Sociais',
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
              'Ensina a expressar necessidades e frustrações de forma funcional, diminuindo a raiva reprimida que leva à explosão.',
              style: bodyStyle,
            ),
            const SizedBox(height: 28),

            // Tipos de comunicação
            Text('Três estilos de comunicação', style: titleStyle),
            const SizedBox(height: 16),

            _CommunicationCard(
              style: 'Passivo 😔',
              description: 'Engole a raiva, não fala o que sente. Explode depois.',
              example: '"Tudo bem..." (mas não está bem)',
              color: const Color(0xFF6EA8FF),
            ),
            const SizedBox(height: 12),
            _CommunicationCard(
              style: 'Agressivo 😤',
              description: 'Ataca, grita, ofende. Machuca as pessoas.',
              example: '"Você é um idiota! Sempre faz isso!"',
              color: const Color(0xFFFF6D8A),
            ),
            const SizedBox(height: 12),
            _CommunicationCard(
              style: 'Assertivo ✅',
              description: 'Fala o que sente de forma clara e respeitosa.',
              example: '"Eu me sinto chateado quando isso acontece. Podemos conversar?"',
              color: const Color(0xFF006D77),
            ),
            const SizedBox(height: 28),

            // Fórmula assertiva
            Text('Fórmula da comunicação assertiva', style: titleStyle),
            const SizedBox(height: 16),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF006D77).withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF006D77), width: 2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Use esta estrutura:',
                    style: GoogleFonts.baloo2(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: const Color(0xFF006D77),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _FormulaStep('1', 'Quando você...', 'Descreva o comportamento sem julgar'),
                  const SizedBox(height: 8),
                  _FormulaStep('2', 'Eu me sinto...', 'Expresse sua emoção'),
                  const SizedBox(height: 8),
                  _FormulaStep('3', 'Porque...', 'Explique o impacto'),
                  const SizedBox(height: 8),
                  _FormulaStep('4', 'Eu gostaria que...', 'Faça um pedido claro'),
                ],
              ),
            ),
            const SizedBox(height: 28),

            // Exemplos práticos
            Text('Exemplos práticos', style: titleStyle),
            const SizedBox(height: 16),

            _ExampleCard(
              situation: 'Amigo não te ouve',
              wrong: '❌ "Você nunca me escuta! É sempre você falando!"',
              right: '✅ "Quando eu tento falar e você me interrompe, eu me sinto desvalorizado. Eu gostaria que você me deixasse terminar."',
            ),
            const SizedBox(height: 12),
            _ExampleCard(
              situation: 'Pai/mãe impõe regras',
              wrong: '❌ "Você é muito chato! Não aguento mais!"',
              right: '✅ "Quando você muda as regras sem explicar, eu me sinto confuso e frustrado. Podemos conversar sobre isso?"',
            ),
            const SizedBox(height: 28),

            // Como praticar
            Text('Como treinar', style: titleStyle),
            const SizedBox(height: 16),
            _TipCard(
              icon: Icons.psychology,
              tip: 'Pratique mentalmente antes de situações difíceis. Imagine a conversa.',
            ),
            const SizedBox(height: 12),
            _TipCard(
              icon: Icons.mic,
              tip: 'Fale em voz alta sozinho, treinando o tom de voz calmo.',
            ),
            const SizedBox(height: 12),
            _TipCard(
              icon: Icons.people,
              tip: 'Peça a alguém de confiança para treinar com você.',
            ),
            const SizedBox(height: 12),
            _TipCard(
              icon: Icons.star,
              tip: 'Comece com situações pequenas antes das grandes.',
            ),
            const SizedBox(height: 28),

            // Aviso final
            Center(
              child: Text(
                'Sua voz merece ser ouvida.\nVocê pode falar sem atacar.',
                textAlign: TextAlign.center,
                style: bodyStyle.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF006D77),
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
                  backgroundColor: const Color(0xFF006D77),
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

class _CommunicationCard extends StatelessWidget {
  final String style;
  final String description;
  final String example;
  final Color color;

  const _CommunicationCard({
    required this.style,
    required this.description,
    required this.example,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3), width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            style,
            style: GoogleFonts.baloo2(
              fontSize: 20,
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
            ),
          ),
          const SizedBox(height: 8),
          Text(
            example,
            style: GoogleFonts.baloo2(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black54,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}

class _FormulaStep extends StatelessWidget {
  final String number;
  final String label;
  final String description;

  const _FormulaStep(this.number, this.label, this.description);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: const BoxDecoration(
            color: Color(0xFF006D77),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              number,
              style: GoogleFonts.baloo2(
                fontSize: 16,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.baloo2(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  color: const Color(0xFF006D77),
                ),
              ),
              Text(
                description,
                style: GoogleFonts.baloo2(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ExampleCard extends StatelessWidget {
  final String situation;
  final String wrong;
  final String right;

  const _ExampleCard({
    required this.situation,
    required this.wrong,
    required this.right,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '📍 $situation',
            style: GoogleFonts.baloo2(
              fontSize: 16,
              fontWeight: FontWeight.w900,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            wrong,
            style: GoogleFonts.baloo2(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color(0xFFFF6D8A),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            right,
            style: GoogleFonts.baloo2(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF006D77),
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
          Icon(icon, color: const Color(0xFF006D77), size: 24),
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
