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
                'Chat: www.cvv.org.br',
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
                'Endereço: XXX',
                'Telefone: (XX) XXXX-XXXX',
                'E-mail: XXX@ifc.edu.br',
              ],
              color: const Color(0xFF00B3C8),
            ),
            const SizedBox(height: 24),

            // Psicólogo do IFC
            Text('👨‍⚕️ Atendimento Psicológico', style: titleStyle),
            const SizedBox(height: 16),
            _ContactCard(
              icon: Icons.psychology,
              title: 'Psicólogo(a) do IFC',
              subtitle: 'Atendimento especializado para estudantes',
              contacts: [
                'Nome: XXX',
                'Horário: XXX',
                'Telefone/Ramal: XXX',
                'E-mail: XXX@ifc.edu.br',
              ],
              color: const Color(0xFF7B61FF),
            ),
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
