// lib/screens/sobre_criadores_screen.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SobreCriadoresScreen extends StatelessWidget {
  const SobreCriadoresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6FAF4),
      appBar: AppBar(
        title: Text(
          'Sobre os Criadores',
          style: GoogleFonts.baloo2(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 22,
          ),
        ),
        backgroundColor: const Color(0xFF0E7C86),
        elevation: 4,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),

              // Card do Desenvolvedor
              _InfoCard(
                title: 'Desenvolvedor',
                icon: Icons.code,
                iconColor: const Color(0xFF0E7C86),
                children: [
                  _InfoRow(label: 'Nome', value: 'Vitor Rodrigueiro Camacho'),
                  _InfoRow(label: 'Curso', value: 'ADS - Analise e Desenvolvimento de Sistemas'),
                  _InfoRow(label: 'Instituição', value: 'Instituto Federal Catarinense Fraiburgo'),
                  _InfoRow(label: 'Email', value: 'Vitor.rodcam@gmail.com'),
                ],
              ),

              const SizedBox(height: 24),

              // Card do Orientador
              _InfoCard(
                title: 'Orientador',
                icon: Icons.school,
                iconColor: const Color(0xFF2F3A8F),
                children: [
                  _InfoRow(label: 'Nome', value: 'Rafael Leonardo Vivian'),
                  _InfoRow(label: 'Titulação', value: 'Doutor'),
                  _InfoRow(label: 'Área', value: 'Informática na Educação'),
                  _InfoRow(label: 'Função', value: 'Professor EBTT'),
                  _InfoRow(label: 'Email', value: 'rafael.vivian@ifc.edu.br'),
                ],
              ),

              const SizedBox(height: 24),

              // Card do Coorientador
              _InfoCard(
                title: 'Coorientador',
                icon: Icons.psychology,
                iconColor: const Color(0xFF7B61FF),
                children: [
                  _InfoRow(label: 'Nome', value: 'Davi Penno'),
                  _InfoRow(label: 'Área', value: 'Psicologia'),
                  _InfoRow(label: 'Função', value: 'Psicólogo do IFC - Campus Fraiburgo'),
                  _InfoRow(label: 'Email', value: 'davi.penno@ifc.edu.br'),
                  _InfoRow(label: 'Contato', value: '3202-8812 (Ramal e WhatsApp)'),
                ],
              ),

              const SizedBox(height: 24),

              // Informações do Projeto
              _ProjetoCard(),

              const SizedBox(height: 32),

              // Rodapé
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Colors.red.withOpacity(0.8),
                      size: 28,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Desenvolvido com dedicação para ajudar você',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.baloo2(
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final List<Widget> children;

  const _InfoCard({
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header do card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: iconColor.withOpacity(0.15),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    color: iconColor,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: GoogleFonts.baloo2(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),

          // Conteúdo do card
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: GoogleFonts.baloo2(
                color: Colors.black54,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: GoogleFonts.baloo2(
                color: Colors.black87,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjetoCard extends StatelessWidget {
  const _ProjetoCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header do card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF7B61FF).withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF7B61FF).withOpacity(0.15),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.info_outline,
                    color: Color(0xFF7B61FF),
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Sobre o Projeto',
                  style: GoogleFonts.baloo2(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),

          // Conteúdo do card
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Introdução
                Text(
                  'Este aplicativo é um protótipo desenvolvido no Instituto Federal Catarinense (IFC – Campus Fraiburgo) para apoiar a saúde mental de estudantes do ensino médio. A ideia nasceu da necessidade de oferecer um cuidado simples, acessível e contínuo dentro do contexto escolar.',
                  style: GoogleFonts.baloo2(
                    color: Colors.black87,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.justify,
                ),

                const SizedBox(height: 20),

                // O que o app faz
                _SectionTitle(title: 'O que o app faz', icon: Icons.lightbulb_outline, color: const Color(0xFF0E7C86)),
                const SizedBox(height: 8),

                _BulletPoint(text: 'Ajuda você a identificar como está se sentindo no momento por meio de um questionário curto e trilhas emocionais.'),
                _BulletPoint(text: 'Sugere práticas rápidas de autocuidado (por exemplo, respiração guiada de 2 minutos), diário de bem-estar e ações de empatia/gentileza.'),
                _BulletPoint(text: 'Entrega orientações imediatas e caminhos de apoio quando necessário (contato do psicólogo escolar e CVV 188).'),

                const SizedBox(height: 20),

                // Como foi construído
                _SectionTitle(title: 'Como foi construído', icon: Icons.build_outlined, color: const Color(0xFF2F3A8F)),
                const SizedBox(height: 8),

                _BulletPoint(text: 'Projeto de TCC com pesquisa-ação e co-design com alunos, professores e psicólogo escolar.'),
                _BulletPoint(text: 'Protótipo implementado em Flutter, com foco em usabilidade e linguagem acolhedora.'),
                _BulletPoint(text: 'Alinhado à BNCC (competências socioemocionais) e à LGPD (proteção de dados).'),

                const SizedBox(height: 20),

                // Privacidade e ética
                _SectionTitle(title: 'Privacidade e ética', icon: Icons.lock_outline, color: const Color(0xFF7B61FF)),
                const SizedBox(height: 8),

                Text(
                  'Coletamos o mínimo necessário de dados e garantimos sua proteção, respeitando a LGPD e os princípios éticos de cuidado.',
                  style: GoogleFonts.baloo2(
                    color: Colors.black87,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const _SectionTitle({
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
          size: 20,
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: GoogleFonts.baloo2(
            color: color,
            fontSize: 16,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}

class _BulletPoint extends StatelessWidget {
  final String text;

  const _BulletPoint({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8, right: 12),
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: Color(0xFF0E7C86),
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.baloo2(
                color: Colors.black87,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 1.5,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
