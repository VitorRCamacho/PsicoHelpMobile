// lib/screens/Trilha/Solidao/Final2_Solidao.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mente_ifc/core/routes.dart';
import 'package:mente_ifc/services/trail_loop_detector.dart';

class Final2SolidaoScreen extends StatelessWidget {
  const Final2SolidaoScreen({super.key});

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
          'Desafio 7 Dias',
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
                  const Icon(Icons.event_available, color: Colors.white, size: 40),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Desafio da Não Reclamação',
                          style: GoogleFonts.baloo2(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '7 dias treinando o foco no positivo',
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
              'A reclamação crônica e o diálogo interno negativo podem "viciar" a mente. O desafio força o cérebro a buscar ativamente o positivo.',
              style: bodyStyle,
            ),
            const SizedBox(height: 28),

            // Como funciona o desafio
            Text('Como funciona o desafio', style: titleStyle),
            const SizedBox(height: 16),
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
                      const Icon(Icons.rule, color: Color(0xFF8E3A6E), size: 28),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text('Regras do Desafio', style: subtitleStyle),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _RuleItem(
                    number: '1',
                    text: 'Durante 7 dias consecutivos, evite reclamar em voz alta ou mentalmente.',
                  ),
                  const SizedBox(height: 12),
                  _RuleItem(
                    number: '2',
                    text: 'Se reclamar, recomece do dia 1. Não há punição, apenas recomeço.',
                  ),
                  const SizedBox(height: 12),
                  _RuleItem(
                    number: '3',
                    text: 'Identifique situações que normalmente te fazem reclamar.',
                  ),
                  const SizedBox(height: 12),
                  _RuleItem(
                    number: '4',
                    text: 'Substitua reclamações por gratidão ou ações construtivas.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),

            // Estratégias práticas
            Text('Estratégias para ter sucesso', style: titleStyle),
            const SizedBox(height: 16),
            _StrategyCard(
              icon: Icons.swap_horiz,
              title: 'Substitua reclamações',
              description: 'Em vez de "Está muito quente", diga "Vou tomar água gelada". Transforme queixas em ações.',
              color: const Color(0xFF8E3A6E),
            ),
            const SizedBox(height: 12),
            _StrategyCard(
              icon: Icons.lightbulb,
              title: 'Busque soluções',
              description: 'Se algo te incomoda, pergunte: "O que posso fazer a respeito?" Foque no que está sob seu controle.',
              color: const Color(0xFFA04880),
            ),
            const SizedBox(height: 12),
            _StrategyCard(
              icon: Icons.favorite_border,
              title: 'Pratique gratidão ativa',
              description: 'Ao sentir vontade de reclamar, encontre 3 coisas boas no momento presente.',
              color: const Color(0xFFB85A8E),
            ),
            const SizedBox(height: 12),
            _StrategyCard(
              icon: Icons.pause,
              title: 'Faça uma pausa consciente',
              description: 'Antes de falar, respire e pergunte: "Isso é reclamação ou solução?"',
              color: const Color(0xFFC97BA3),
            ),
            const SizedBox(height: 28),

            // O que fazer quando escorregar
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF8E3A6E).withOpacity(0.15),
                    const Color(0xFFB85A8E).withOpacity(0.15),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF8E3A6E).withOpacity(0.3), width: 2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.auto_awesome, color: Color(0xFF8E3A6E), size: 28),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text('Quando você escorregar', style: subtitleStyle),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Não se culpe! Recomeçar faz parte do processo. Cada tentativa fortalece sua consciência. Anote o que te fez reclamar e prepare-se melhor para a próxima vez.',
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
                color: const Color(0xFF8E3A6E).withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF8E3A6E).withOpacity(0.3), width: 2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.science, color: Color(0xFF8E3A6E), size: 28),
                      const SizedBox(width: 12),
                      Text('Por que funciona?', style: subtitleStyle),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'A neuroplasticidade permite que o cérebro forme novos padrões. Quando você para de alimentar circuitos de negatividade, enfraquece-os. Simultaneamente, fortalece redes neurais de gratidão e solução de problemas.',
                    style: bodyStyle,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),

            // Dicas
            Text('Dicas para o desafio', style: titleStyle),
            const SizedBox(height: 16),
            _TipCard(
              icon: Icons.groups,
              tip: 'Convide amigos ou família. O apoio mútuo aumenta as chances de sucesso.',
            ),
            const SizedBox(height: 12),
            _TipCard(
              icon: Icons.event_note,
              tip: 'Mantenha um diário do desafio. Anote insights e progressos diários.',
            ),
            const SizedBox(height: 12),
            _TipCard(
              icon: Icons.sentiment_satisfied_alt,
              tip: 'Celebre pequenas vitórias. Cada hora sem reclamar é uma conquista.',
            ),
            const SizedBox(height: 12),
            _TipCard(
              icon: Icons.accessibility_new,
              tip: 'Seja gentil consigo mesmo. O objetivo é progresso, não perfeição.',
            ),
            const SizedBox(height: 28),

            // Tabela de acompanhamento visual
            Text('Acompanhe seu progresso', style: titleStyle),
            const SizedBox(height: 16),
            _ProgressTracker(),
            const SizedBox(height: 28),

            // Aviso final
            Center(
              child: Text(
                'Você tem o poder de reprogramar sua mente.\nAceite o desafio!',
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

class _RuleItem extends StatelessWidget {
  final String number;
  final String text;

  const _RuleItem({required this.number, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: const BoxDecoration(
            color: Color(0xFF8E3A6E),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              number,
              style: GoogleFonts.baloo2(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.baloo2(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}

class _StrategyCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  const _StrategyCard({
    required this.icon,
    required this.title,
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
            child: Icon(icon, color: Colors.white, size: 26),
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

class _ProgressTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF8E3A6E).withOpacity(0.3), width: 2),
      ),
      child: Column(
        children: [
          Text(
            'Marque cada dia completo sem reclamar',
            style: GoogleFonts.baloo2(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF8E3A6E),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: List.generate(7, (index) {
              return Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFF8E3A6E).withOpacity(0.1),
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF8E3A6E), width: 2),
                ),
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: GoogleFonts.baloo2(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: const Color(0xFF8E3A6E),
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 12),
          Text(
            'Dica: Tire uma foto desta tela e marque cada dia!',
            style: GoogleFonts.baloo2(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.black54,
            ),
            textAlign: TextAlign.center,
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
