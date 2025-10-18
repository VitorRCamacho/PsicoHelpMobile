// lib/screens/Trilha/Medo/Final2_Medo.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mente_ifc/core/routes.dart';
import 'package:mente_ifc/services/trail_loop_detector.dart';

class Final2MedoScreen extends StatelessWidget {
  const Final2MedoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle = GoogleFonts.baloo2(
      fontSize: 32,
      fontWeight: FontWeight.w900,
      color: const Color(0xFF5B4FC4),
      height: 1.1,
    );

    final subtitleStyle = GoogleFonts.baloo2(
      fontSize: 20,
      fontWeight: FontWeight.w900,
      color: const Color(0xFF5B4FC4),
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
        backgroundColor: const Color(0xFFF2EEFF),
        appBar: AppBar(
          backgroundColor: const Color(0xFF5B4FC4),
          elevation: 0,
          automaticallyImplyLeading: false,
        title: Text(
          'Afirmações de Força',
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
                  colors: [Color(0xFF5B4FC4), Color(0xFF8B7FDB)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Icon(Icons.credit_card, color: Colors.white, size: 40),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Flashcards Interativos',
                          style: GoogleFonts.baloo2(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Fortaleça seu diálogo interno positivo',
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
              'A substituição consciente do diálogo interno negativo por declarações de valor e capacidade fortalece as vias neurais de autocontrole e autoconfiança.',
              style: bodyStyle,
            ),
            const SizedBox(height: 28),

            // Como praticar
            Text('Como praticar', style: titleStyle),
            const SizedBox(height: 16),

            _VisualizationCard(
              step: '1. Crie seus flashcards',
              description: 'Escreva 5-10 afirmações positivas sobre você em pequenos cartões (papel ou digital). Exemplo: "Eu sou corajoso", "Eu mereço sucesso".',
              color: const Color(0xFF5B4FC4),
            ),
            const SizedBox(height: 12),
            _VisualizationCard(
              step: '2. Leia em voz alta',
              description: 'Todos os dias, ao acordar ou antes de dormir, leia cada flashcard em voz alta, com convicção e emoção.',
              color: const Color(0xFF7566D4),
            ),
            const SizedBox(height: 12),
            _VisualizationCard(
              step: '3. Visualize a afirmação',
              description: 'Ao ler cada frase, feche os olhos por alguns segundos e visualize-se vivendo aquela qualidade.',
              color: const Color(0xFF8B7FDB),
            ),
            const SizedBox(height: 12),
            _VisualizationCard(
              step: '4. Repita antes de desafios',
              description: 'Antes de situações que geram insegurança, releia seus flashcards para fortalecer sua confiança.',
              color: const Color(0xFFA297E5),
            ),
            const SizedBox(height: 28),

            // Exemplos de afirmações
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF5B4FC4).withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF5B4FC4).withOpacity(0.3), width: 2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.format_quote, color: Color(0xFF5B4FC4), size: 28),
                      const SizedBox(width: 12),
                      Expanded(child: Text('Exemplos de afirmações', style: subtitleStyle)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '💪 "Eu sou capaz de enfrentar desafios"\n\n🌟 "Eu mereço coisas boas na minha vida"\n\n🛡️ "Eu confio na minha capacidade de aprender"\n\n❤️ "Eu sou valioso(a) exatamente como sou"\n\n🚀 "Cada dia eu fico mais forte e confiante"',
                    style: bodyStyle,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),

            // Base científica
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF5B4FC4).withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF5B4FC4).withOpacity(0.3), width: 2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.psychology, color: Color(0xFF5B4FC4), size: 28),
                      const SizedBox(width: 12),
                      Text('Por que funciona?', style: subtitleStyle),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'A repetição de afirmações positivas cria novas conexões neurais, enfraquecendo gradualmente os padrões de pensamento negativo. O cérebro começa a aceitar essas afirmações como verdades, aumentando a autoconfiança.',
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
              icon: Icons.alarm,
              tip: 'Defina alarmes no celular para lembrar de ler seus flashcards diariamente.',
            ),
            const SizedBox(height: 12),
            _TipCard(
              icon: Icons.edit,
              tip: 'Personalize as afirmações. Use palavras que ressoem com você e sua realidade.',
            ),
            const SizedBox(height: 12),
            _TipCard(
              icon: Icons.volume_up,
              tip: 'Dizer em voz alta é mais poderoso que apenas pensar. Use tom de voz firme e confiante.',
            ),
            const SizedBox(height: 12),
            _TipCard(
              icon: Icons.update,
              tip: 'Atualize seus flashcards mensalmente à medida que evolui e conquista novos objetivos.',
            ),
            const SizedBox(height: 28),

            // Aviso final
            Center(
              child: Text(
                'Suas palavras têm poder.\nRepita-as até que se tornem sua realidade.',
                textAlign: TextAlign.center,
                style: bodyStyle.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF5B4FC4),
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
                  backgroundColor: const Color(0xFF5B4FC4),
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
          Icon(icon, color: const Color(0xFF5B4FC4), size: 24),
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
        color: const Color(0xFF5B4FC4).withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF5B4FC4).withOpacity(0.3), width: 2),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF5B4FC4).withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.support_agent, color: Color(0xFF5B4FC4), size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Precisa de ajuda?', style: base.copyWith(fontSize: 18, color: const Color(0xFF5B4FC4))),
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
