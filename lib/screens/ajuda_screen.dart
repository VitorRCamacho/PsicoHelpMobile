// lib/screens/ajuda_screen.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AjudaScreen extends StatelessWidget {
  const AjudaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle = GoogleFonts.baloo2(
      fontSize: 32,
      fontWeight: FontWeight.w900,
      color: const Color(0xFF7B61FF),
      height: 1.1,
    );

    final subtitleStyle = GoogleFonts.baloo2(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: const Color(0xFF7B61FF),
    );

    final bodyStyle = GoogleFonts.baloo2(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.black87,
      height: 1.4,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF7B61FF),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Precisa de Ajuda?',
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
            // Mensagem inicial
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF7B61FF).withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.favorite,
                    color: Color(0xFF7B61FF),
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Você não está sozinho(a). Estamos aqui para você.',
                      style: bodyStyle.copyWith(
                        color: const Color(0xFF7B61FF),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),

            // CVV - Centro de Valorização da Vida
            Text('🆘 Atendimento 24h', style: titleStyle),
            const SizedBox(height: 16),
            _ContactCard(
              icon: Icons.phone_in_talk,
              title: 'CVV - Centro de Valorização da Vida',
              subtitle: 'Apoio emocional e prevenção do suicídio',
              contacts: [
                'Ligue: 188 (24 horas, todos os dias)',
                'Chat: cvv.org.br',
                'E-mail: atendimento@cvv.org.br',
              ],
              color: const Color(0xFFFF3D81),
            ),
            const SizedBox(height: 24),

            // IFC Fraiburgo
            Text('🏫 Instituto Federal', style: titleStyle),
            const SizedBox(height: 16),
            _ContactCard(
              icon: Icons.school,
              title: 'IFC - Campus Fraiburgo',
              subtitle: 'Atendimento presencial e suporte',
              contacts: [
                'Endereço: R. Cruz e Souza, 100 - CENTRO, Fraiburgo - SC, 89580-676',
                'Telefone: (49) 3202-8800',
                'site: fraiburgo.ifc.edu.br',
                'E-mail: sisae.fraiburgo@ifc.edu.br',
              ],
              color: const Color(0xFF00B3C8),
            ),
            const SizedBox(height: 24),

            // Psicólogo do IFC
            Text('👨‍⚕️ Atendimento Psicológico', style: titleStyle),
            const SizedBox(height: 16),
            _PsicologoCard(),
            const SizedBox(height: 28),

            // Aviso importante
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.orange, width: 2),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.warning_amber_rounded,
                    color: Colors.orange,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Importante',
                          style: subtitleStyle.copyWith(color: Colors.orange),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Se você está em crise ou pensando em se machucar, ligue para o CVV (188) agora. O atendimento é gratuito, sigiloso e 24 horas.',
                          style: bodyStyle.copyWith(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Rodapé
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

class _ContactCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final List<String> contacts;
  final Color color;

  const _ContactCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.contacts,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = GoogleFonts.baloo2(
      fontSize: 18,
      fontWeight: FontWeight.w900,
      color: color,
    );

    final subtitleStyle = GoogleFonts.baloo2(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.black54,
    );

    final contactStyle = GoogleFonts.baloo2(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: Colors.black87,
      height: 1.5,
    );

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3), width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: titleStyle),
                    Text(subtitle, style: subtitleStyle),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Divider(),
          const SizedBox(height: 10),
          ...contacts.map((contact) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.check_circle, color: color, size: 18),
                    const SizedBox(width: 8),
                    Expanded(child: Text(contact, style: contactStyle)),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

class _PsicologoCard extends StatelessWidget {
  const _PsicologoCard();

  @override
  Widget build(BuildContext context) {
    const color = Color(0xFF7B61FF);

    final titleStyle = GoogleFonts.baloo2(
      fontSize: 18,
      fontWeight: FontWeight.w900,
      color: color,
    );

    final subtitleStyle = GoogleFonts.baloo2(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.black54,
    );

    final nameStyle = GoogleFonts.baloo2(
      fontSize: 15,
      fontWeight: FontWeight.w700,
      color: Colors.black87,
    );

    final dayStyle = GoogleFonts.baloo2(
      fontSize: 14,
      fontWeight: FontWeight.w800,
      color: color,
    );

    final scheduleStyle = GoogleFonts.baloo2(
      fontSize: 13,
      fontWeight: FontWeight.w600,
      color: Colors.black87,
      height: 1.4,
    );

    final infoStyle = GoogleFonts.baloo2(
      fontSize: 13,
      fontWeight: FontWeight.w600,
      color: Colors.black54,
      fontStyle: FontStyle.italic,
    );

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3), width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.psychology, color: color, size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Psicólogo do Campus', style: titleStyle),
                    Text('IFC Fraiburgo', style: subtitleStyle),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Divider(),
          const SizedBox(height: 12),

          // Nome
          Row(
            children: [
              const Icon(Icons.person, color: color, size: 18),
              const SizedBox(width: 8),
              Text('Davi Penno', style: nameStyle),
            ],
          ),
          const SizedBox(height: 16),

          // Telefone/WhatsApp
          Row(
            children: [
              const Icon(Icons.phone, color: color, size: 18),
              const SizedBox(width: 8),
              Text('3202-8812', style: nameStyle),
            ],
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 26),
            child: Text(
              'Ramal e WhatsApp',
              style: infoStyle,
            ),
          ),
          const SizedBox(height: 12),

          // E-mail
          Row(
            children: [
              const Icon(Icons.email, color: color, size: 18),
              const SizedBox(width: 8),
              Expanded(
                child: Text('davi.penno@ifc.edu.br', style: nameStyle),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Horários
          Row(
            children: [
              const Icon(Icons.schedule, color: color, size: 18),
              const SizedBox(width: 8),
              Text('Horários de Atendimento', style: dayStyle),
            ],
          ),
          const SizedBox(height: 6),

          // Aviso sobre alteração de horários
          Padding(
            padding: const EdgeInsets.only(left: 26, bottom: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.orange.withOpacity(0.3)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.info_outline, color: Colors.orange, size: 14),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      'Os horários podem alterar conforme necessidade da escola ou demanda pessoal',
                      style: infoStyle.copyWith(fontSize: 11, color: Colors.orange.shade800),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Segunda
          _HorarioRow(
            day: 'Segunda-feira',
            schedule: 'Presencial: 12:30–17:30 e 18:00–21:00',
            dayStyle: dayStyle,
            scheduleStyle: scheduleStyle,
          ),

          // Terça
          _HorarioRow(
            day: 'Terça-feira',
            schedule: 'Presencial: 07:45–11:45 • Teletrabalho: 12:15–16:15',
            dayStyle: dayStyle,
            scheduleStyle: scheduleStyle,
          ),

          // Quarta
          _HorarioRow(
            day: 'Quarta-feira',
            schedule: 'Presencial: 07:45–11:45 • Teletrabalho: 12:15–16:15',
            dayStyle: dayStyle,
            scheduleStyle: scheduleStyle,
          ),

          // Quinta
          _HorarioRow(
            day: 'Quinta-feira',
            schedule: 'Presencial: 07:45–11:45 • Teletrabalho: 12:15–16:15',
            dayStyle: dayStyle,
            scheduleStyle: scheduleStyle,
          ),

          // Sexta
          _HorarioRow(
            day: 'Sexta-feira',
            schedule: 'Presencial: 07:45–11:45 • Teletrabalho: 14:30–18:30',
            dayStyle: dayStyle,
            scheduleStyle: scheduleStyle,
            isLast: true,
          ),
        ],
      ),
    );
  }
}

class _HorarioRow extends StatelessWidget {
  final String day;
  final String schedule;
  final TextStyle dayStyle;
  final TextStyle scheduleStyle;
  final bool isLast;

  const _HorarioRow({
    required this.day,
    required this.schedule,
    required this.dayStyle,
    required this.scheduleStyle,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 26, bottom: isLast ? 0 : 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(day, style: dayStyle),
          const SizedBox(height: 2),
          Text(schedule, style: scheduleStyle),
        ],
      ),
    );
  }
}
