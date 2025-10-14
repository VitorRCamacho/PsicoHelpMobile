// lib/screens/Trilha/Estresse/Final2_Estresse.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mente_ifc/core/routes.dart';

class Final2EstresseScreen extends StatelessWidget {
  const Final2EstresseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle = GoogleFonts.baloo2(
      fontSize: 32,
      fontWeight: FontWeight.w900,
      color: const Color(0xFF8A6D1F),
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
        backgroundColor: const Color(0xFFFFF8E5),
        appBar: AppBar(
          backgroundColor: const Color(0xFF8A6D1F),
          elevation: 0,
          automaticallyImplyLeading: false,
        title: Text(
          'Ritual de Desconexão',
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
                  const Icon(Icons.nightlight_round, color: Colors.white, size: 40),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ritual Noturno',
                          style: GoogleFonts.baloo2(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Desconexão para um sono reparador',
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

            Text('O que é?', style: titleStyle),
            const SizedBox(height: 12),
            Text(
              'A privação de sono agrava a irritabilidade e a vulnerabilidade ao estresse. O ritual regula o ritmo circadiano e prepara corpo e mente para o descanso.',
              style: bodyStyle,
            ),
            const SizedBox(height: 28),

            Text('Seu ritual de 60 minutos', style: titleStyle),
            const SizedBox(height: 16),

            _RitualCard(
              time: '21h - 21h15',
              title: 'Desligue as telas',
              description: 'Celular, TV, computador. A luz azul inibe a melatonina (hormônio do sono).',
              icon: Icons.phone_android,
              color: const Color(0xFF8A6D1F),
            ),
            const SizedBox(height: 12),
            _RitualCard(
              time: '21h15 - 21h30',
              title: 'Prepare o ambiente',
              description: 'Diminua as luzes, ajuste a temperatura, deixe o quarto confortável.',
              icon: Icons.wb_twilight,
              color: const Color(0xFF9D7E2D),
            ),
            const SizedBox(height: 12),
            _RitualCard(
              time: '21h30 - 21h45',
              title: 'Atividade calma',
              description: 'Leitura leve, música suave, alongamento, meditação ou diário.',
              icon: Icons.menu_book,
              color: const Color(0xFFB8953D),
            ),
            const SizedBox(height: 12),
            _RitualCard(
              time: '21h45 - 22h',
              title: 'Gratidão e planejamento',
              description: 'Anote 3 coisas boas do dia. Escreva 3 prioridades para amanhã.',
              icon: Icons.check_circle_outline,
              color: const Color(0xFFCDAA4B),
            ),
            const SizedBox(height: 28),

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
                      const Icon(Icons.science, color: Color(0xFF8A6D1F), size: 28),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Por que funciona?',
                          style: GoogleFonts.baloo2(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: const Color(0xFF8A6D1F),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'O ritual consistente sinaliza ao cérebro que é hora de desacelerar. Isso fortalece o ritmo circadiano, melhora a qualidade do sono e reduz o cortisol (hormônio do estresse).',
                    style: bodyStyle,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),

            Text('Dicas importantes', style: titleStyle),
            const SizedBox(height: 16),
            _TipCard(
              icon: Icons.schedule,
              tip: 'Mantenha o mesmo horário todos os dias, inclusive nos fins de semana.',
            ),
            const SizedBox(height: 12),
            _TipCard(
              icon: Icons.coffee,
              tip: 'Evite cafeína após as 16h e refeições pesadas 3h antes de dormir.',
            ),
            const SizedBox(height: 12),
            _TipCard(
              icon: Icons.ac_unit,
              tip: 'Quarto fresco (18-21°C), escuro e silencioso favorece o sono profundo.',
            ),
            const SizedBox(height: 12),
            _TipCard(
              icon: Icons.emoji_objects,
              tip: 'Se não dormir em 20 min, levante e faça algo relaxante. Volte quando sentir sono.',
            ),
            const SizedBox(height: 28),

            Center(
              child: Text(
                'O sono é a base da saúde mental.\nInvista no seu descanso.',
                textAlign: TextAlign.center,
                style: bodyStyle.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF8A6D1F),
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
                  backgroundColor: const Color(0xFF8A6D1F),
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

class _RitualCard extends StatelessWidget {
  final String time;
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  const _RitualCard({
    required this.time,
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
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  time,
                  style: GoogleFonts.baloo2(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: color,
                  ),
                ),
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
        color: const Color(0xFF8A6D1F).withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF8A6D1F).withOpacity(0.3), width: 2),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF8A6D1F).withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.support_agent, color: Color(0xFF8A6D1F), size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Precisa de ajuda?', style: base.copyWith(fontSize: 18, color: const Color(0xFF8A6D1F))),
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
