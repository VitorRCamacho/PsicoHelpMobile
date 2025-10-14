// lib/screens/Trilha/Solidao/Final1_Solidao.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mente_ifc/core/routes.dart';

class Final1SolidaoScreen extends StatelessWidget {
  const Final1SolidaoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle = GoogleFonts.baloo2(
      fontSize: 32,
      fontWeight: FontWeight.w900,
      color: const Color(0xFF8E3A6E),
      height: 1.1,
    );

    final subtitleStyle = GoogleFonts.baloo2(
      fontSize: 20,
      fontWeight: FontWeight.w900,
      color: const Color(0xFF8E3A6E),
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
        backgroundColor: const Color(0xFFFDECF3),
        appBar: AppBar(
          backgroundColor: const Color(0xFF8E3A6E),
          elevation: 0,
          automaticallyImplyLeading: false,
        title: Text(
          'Rito da Autocompaixão',
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
                  colors: [Color(0xFF8E3A6E), Color(0xFFB85A8E)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Icon(Icons.favorite, color: Colors.white, size: 40),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Autocompaixão',
                          style: GoogleFonts.baloo2(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Erros como Pit Stops na corrida da vida',
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
              'Reduz a autocrítica e ativa o sistema de cuidado (ligado à oxitocina) no cérebro, aumentando a resiliência.',
              style: bodyStyle,
            ),
            const SizedBox(height: 28),

            // Metáfora dos Pit Stops
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF8E3A6E).withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF8E3A6E).withOpacity(0.3), width: 2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.directions_car, color: Color(0xFF8E3A6E), size: 28),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text('Erros como Pit Stops', style: subtitleStyle),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Em corridas de Fórmula 1, os pit stops não são falhas - são paradas estratégicas necessárias para ajustes, reabastecimento e continuidade. Seus erros funcionam da mesma forma: são oportunidades de ajuste, aprendizado e recalibração para seguir em frente mais forte.',
                    style: bodyStyle,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),

            // Como praticar
            Text('Como praticar autocompaixão', style: titleStyle),
            const SizedBox(height: 16),
            _StepCard(
              number: '1',
              title: 'Reconheça o momento difícil',
              description: 'Quando errar ou se sentir mal, pare e reconheça: "Este é um momento de sofrimento" ou "Estou passando por algo difícil".',
              icon: Icons.pause_circle,
              color: const Color(0xFF8E3A6E),
            ),
            const SizedBox(height: 12),
            _StepCard(
              number: '2',
              title: 'Lembre-se: você não está sozinho',
              description: 'Todos erram. Todos sofrem. Isso faz parte da experiência humana compartilhada. Não se isole na culpa.',
              icon: Icons.groups,
              color: const Color(0xFFA04880),
            ),
            const SizedBox(height: 12),
            _StepCard(
              number: '3',
              title: 'Seja gentil consigo mesmo',
              description: 'Fale com você como falaria com um amigo querido. "Está tudo bem, você está fazendo o melhor que pode. Erros são parte do crescimento."',
              icon: Icons.self_improvement,
              color: const Color(0xFFB85A8E),
            ),
            const SizedBox(height: 12),
            _StepCard(
              number: '4',
              title: 'Toque de conforto',
              description: 'Coloque a mão no coração ou dê um abraço em si mesmo. O toque físico ativa o sistema calmante do corpo.',
              icon: Icons.volunteer_activism,
              color: const Color(0xFFC97BA3),
            ),
            const SizedBox(height: 28),

            // Frases de autocompaixão
            Text('Frases para praticar', style: titleStyle),
            const SizedBox(height: 16),
            _PhraseCard(
              phrase: '"Eu mereço bondade, mesmo quando erro."',
            ),
            const SizedBox(height: 12),
            _PhraseCard(
              phrase: '"Este pit stop é necessário para eu seguir mais forte."',
            ),
            const SizedBox(height: 12),
            _PhraseCard(
              phrase: '"Posso aprender com isso sem me punir."',
            ),
            const SizedBox(height: 12),
            _PhraseCard(
              phrase: '"Estou fazendo o melhor que posso com o que tenho agora."',
            ),
            const SizedBox(height: 28),

            // Benefícios
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF8E3A6E).withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF8E3A6E).withOpacity(0.3), width: 2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.check_circle, color: Color(0xFF8E3A6E), size: 28),
                      const SizedBox(width: 12),
                      Text('Por que funciona?', style: subtitleStyle),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'A autocompaixão ativa o sistema parassimpático, reduz cortisol e libera oxitocina. Isso diminui a ruminação mental, aumenta a motivação para mudanças positivas e fortalece a resiliência emocional.',
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
              icon: Icons.psychology,
              tip: 'Autocompaixão não é autoindulgência. É reconhecer a dor sem se afundar nela.',
            ),
            const SizedBox(height: 12),
            _TipCard(
              icon: Icons.repeat,
              tip: 'Pratique diariamente, mesmo em pequenos momentos. A repetição treina o cérebro.',
            ),
            const SizedBox(height: 12),
            _TipCard(
              icon: Icons.edit_note,
              tip: 'Escreva uma carta de compaixão para si mesmo quando passar por dificuldades.',
            ),
            const SizedBox(height: 12),
            _TipCard(
              icon: Icons.timer,
              tip: 'Reserve 5 minutos por dia para meditar sobre autocompaixão.',
            ),
            const SizedBox(height: 28),

            // Aviso final
            Center(
              child: Text(
                'Você merece a mesma gentileza que oferece aos outros.\nPratique o amor-próprio.',
                textAlign: TextAlign.center,
                style: bodyStyle.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF8E3A6E),
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
                  backgroundColor: const Color(0xFF8E3A6E),
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

class _PhraseCard extends StatelessWidget {
  final String phrase;

  const _PhraseCard({required this.phrase});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF8E3A6E).withOpacity(0.1),
            const Color(0xFFB85A8E).withOpacity(0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF8E3A6E).withOpacity(0.2), width: 1.5),
      ),
      child: Row(
        children: [
          const Icon(Icons.format_quote, color: Color(0xFF8E3A6E), size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              phrase,
              style: GoogleFonts.baloo2(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF8E3A6E),
                height: 1.4,
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
          Icon(icon, color: const Color(0xFF8E3A6E), size: 24),
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
        color: const Color(0xFF8E3A6E).withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF8E3A6E).withOpacity(0.3), width: 2),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF8E3A6E).withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.support_agent, color: Color(0xFF8E3A6E), size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Precisa de ajuda?', style: base.copyWith(fontSize: 18, color: const Color(0xFF8E3A6E))),
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
