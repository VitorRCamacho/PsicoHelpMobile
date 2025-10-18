// lib/screens/Trilha/Raiva/Final1_Raiva.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mente_ifc/core/routes.dart';
import 'package:mente_ifc/services/trail_loop_detector.dart';

class Final1RaivaScreen extends StatelessWidget {
  const Final1RaivaScreen({super.key});

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
          'Time-Out Cognitivo',
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
                  const Icon(Icons.pause_circle, color: Colors.white, size: 40),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Time-Out Cognitivo',
                          style: GoogleFonts.baloo2(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Contagem de 10 Segundos',
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
              'A pausa consciente (atraso na resposta) permite que o Córtex Pré-Frontal (responsável pelo controle) se reative, inibindo a reação impulsiva e explosiva do sistema límbico.',
              style: bodyStyle,
            ),
            const SizedBox(height: 28),

            // Como funciona
            Text('Como o cérebro reage', style: titleStyle),
            const SizedBox(height: 16),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFF8CA1).withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFFF8CA1), width: 2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.warning, color: Color(0xFFFF6D8A), size: 28),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Sem a pausa',
                          style: GoogleFonts.baloo2(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: const Color(0xFFFF6D8A),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Gatilho → Raiva instantânea → Explosão → Arrependimento',
                    style: bodyStyle.copyWith(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
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
                  Row(
                    children: [
                      const Icon(Icons.check_circle, color: Color(0xFF006D77), size: 28),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Com a pausa',
                          style: GoogleFonts.baloo2(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: const Color(0xFF006D77),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Gatilho → PAUSA 10s → Cérebro racional ativa → Escolha melhor',
                    style: bodyStyle.copyWith(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),

            // Como praticar
            Text('Como praticar', style: titleStyle),
            const SizedBox(height: 16),

            _StepCard(
              number: '1',
              title: 'Identifique o gatilho',
              description: 'Quando sentir raiva subindo (calor, tensão, vontade de reagir), PARE.',
              icon: Icons.stop,
              color: const Color(0xFFFF6D8A),
            ),
            const SizedBox(height: 12),
            _StepCard(
              number: '2',
              title: 'Conte até 10',
              description: 'Respire fundo e conte mentalmente: 1... 2... 3... até 10. Devagar.',
              icon: Icons.timer,
              color: const Color(0xFFFF8CA1),
            ),
            const SizedBox(height: 12),
            _StepCard(
              number: '3',
              title: 'Se afaste fisicamente',
              description: 'Se possível, saia do ambiente por alguns minutos. Vá ao banheiro, beba água.',
              icon: Icons.directions_walk,
              color: const Color(0xFF006D77),
            ),
            const SizedBox(height: 12),
            _StepCard(
              number: '4',
              title: 'Escolha sua resposta',
              description: 'Agora, com o cérebro racional no comando, decida como reagir.',
              icon: Icons.psychology,
              color: const Color(0xFF83C5BE),
            ),
            const SizedBox(height: 28),

            // Frases de apoio
            Text('Frases para usar na pausa', style: titleStyle),
            const SizedBox(height: 16),

            _QuoteCard(quote: '"Eu posso escolher como reagir."'),
            const SizedBox(height: 8),
            _QuoteCard(quote: '"Isso vai passar. Respire."'),
            const SizedBox(height: 8),
            _QuoteCard(quote: '"Não preciso reagir agora."'),
            const SizedBox(height: 8),
            _QuoteCard(quote: '"Eu tenho o controle."'),
            const SizedBox(height: 28),

            // Dicas
            Text('Dicas importantes', style: titleStyle),
            const SizedBox(height: 16),
            _TipCard(
              icon: Icons.fitness_center,
              tip: 'Pratique em momentos calmos. Conte até 10 respirando fundo antes de dormir.',
            ),
            const SizedBox(height: 12),
            _TipCard(
              icon: Icons.groups,
              tip: 'Avise pessoas próximas: "Quando eu me afastar, não é desrespeito, é autocuidado".',
            ),
            const SizedBox(height: 12),
            _TipCard(
              icon: Icons.celebration,
              tip: 'Cada vez que usar a técnica, celebre! Você está treinando seu cérebro.',
            ),
            const SizedBox(height: 28),

            // Aviso final
            Center(
              child: Text(
                '10 segundos podem evitar\nhoras de arrependimento.',
                textAlign: TextAlign.center,
                style: bodyStyle.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF006D77),
                ),
              ),
            ),
            const SizedBox(height: 28),

            // Help banner
            const _HelpBlock(),
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
                  TrailLoopDetector().clearHistory();
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

class _QuoteCard extends StatelessWidget {
  final String quote;

  const _QuoteCard({required this.quote});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF006D77).withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF006D77).withOpacity(0.2), width: 1),
      ),
      child: Row(
        children: [
          const Icon(Icons.format_quote, color: Color(0xFF006D77), size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              quote,
              style: GoogleFonts.baloo2(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF006D77),
                fontStyle: FontStyle.italic,
              ),
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

class _HelpBlock extends StatelessWidget {
  const _HelpBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final base = GoogleFonts.baloo2(
      color: Colors.black87,
      fontSize: 16,
      fontWeight: FontWeight.w700,
      height: 1.1,
    );
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF006D77).withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF006D77).withOpacity(0.3), width: 2),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF006D77).withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.support_agent, color: Color(0xFF006D77), size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Precisa de ajuda?', style: base.copyWith(fontSize: 18, color: const Color(0xFF006D77))),
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
