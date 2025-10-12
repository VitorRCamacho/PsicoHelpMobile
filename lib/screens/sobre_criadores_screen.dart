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
                  _InfoRow(label: 'Email', value: 'Vitor.rodcam@gmail.com'),
                ],
              ),

              const SizedBox(height: 24),

              // Informações do Projeto
              _InfoCard(
                title: 'Sobre o Projeto',
                icon: Icons.info_outline,
                iconColor: const Color(0xFF7B61FF),
                children: [
                  _InfoRow(label: 'Ano', value: '2025'),
                  _InfoRow(label: 'Tipo', value: 'Trabalho de Conclusão de Curso'),
                  _InfoRow(label: 'Objetivo', value: 'Promover saúde mental através de recursos digitais acessíveis'),
                ],
              ),

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
