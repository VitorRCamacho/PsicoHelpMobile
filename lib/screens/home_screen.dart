// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mente_ifc/core/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle = GoogleFonts.baloo2(
      fontSize: 44,
      fontWeight: FontWeight.w900,
      height: 1.0,
      letterSpacing: 0.5,
      color: Colors.white,
      shadows: [
        Shadow(
          color: Colors.black.withOpacity(.2),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ],
    );

    final subtitleStyle = GoogleFonts.baloo2(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: Colors.white.withOpacity(.95),
      shadows: [
        Shadow(
          color: Colors.black.withOpacity(.15),
          blurRadius: 6,
          offset: const Offset(0, 2),
        ),
      ],
    );

    return Scaffold(
      body: Stack(
        children: [
          // Fundo em degradê
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFFF7A00), // laranja
                  Color(0xFFFFC300), // amarelo
                  Color(0xFF00D2FF), // ciano
                  Color(0xFF7B61FF), // roxo-azulado
                  Color(0xFFFF3D81), // magenta
                ],
                stops: [0.0, 0.28, 0.55, 0.77, 1.0],
              ),
            ),
          ),

          // Véu pra legibilidade
          Container(color: Colors.white12),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  Text(
                    'Como você\nestá hoje? 👋',
                    textAlign: TextAlign.center,
                    style: titleStyle,
                  ),
                  const SizedBox(height: 6),
                  Text('Leva 5 a 7 mins', style: subtitleStyle),
                  const Spacer(),

                  // CTA principal
                  _BigButton(
                    label: 'Começar Guia\nEmocional',
                    icon: Icons.play_arrow_rounded,
                    background: const LinearGradient(
                      colors: [Color(0xFF29D3E8), Color(0xFF00B3C8)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    onPressed: () => Navigator.pushNamed(context, Routes.guia),
                  ),
                  const SizedBox(height: 14),

                  // Botão de respiração
                  _BigButton(
                    label: 'respiração 2 min',
                    compact: true,
                    background: const LinearGradient(
                      colors: [Color(0xFF7C4DFF), Color(0xFF9B5BFF)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    onPressed: () => Navigator.pushNamed(context, Routes.respiracao),
                  ),

                  const SizedBox(height: 18),

                  // Linha divisória
                  Opacity(
                    opacity: .6,
                    child: Container(
                      height: 1.2,
                      width: double.infinity,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Bloco de ajuda
                  _HelpBlock(
                    cvv: '188 (24h, todos os dias)',
                    telefone: '(XX) XXXX-XXXX',
                    onAjuda: () => Navigator.pushNamed(context, Routes.ajuda),
                  ),

                  const SizedBox(height: 8),

                  // Rodapé
                  Opacity(
                    opacity: .9,
                    child: Text(
                      'O APP não substitui atendimento psicológico.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.baloo2(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                        height: 1.1,
                        shadows: [
                          Shadow(
                            color: Colors.black54,
                            blurRadius: 6,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Opacity(
                    opacity: .9,
                    child: Text(
                      'Seus dados não saem deste dispositivo.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.baloo2(
                        color: Colors.white70,
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        height: 1.1,
                        shadows: [
                          Shadow(
                            color: Colors.black54,
                            blurRadius: 6,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Botão Sobre os Criadores
                  TextButton.icon(
                    onPressed: () => Navigator.pushNamed(context, Routes.sobreCriadores),
                    icon: const Icon(Icons.info_outline, size: 14, color: Colors.white70),
                    label: Text(
                      'Sobre os Criadores',
                      style: GoogleFonts.baloo2(
                        color: Colors.white70,
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        shadows: [
                          Shadow(
                            color: Colors.black54,
                            blurRadius: 6,
                          ),
                        ],
                      ),
                    ),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ------------------ Widgets auxiliares da Home ------------------

class _BigButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final bool compact;
  final LinearGradient background;
  final VoidCallback onPressed;

  const _BigButton({
    required this.label,
    required this.background,
    required this.onPressed,
    this.icon,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = GoogleFonts.baloo2(
      color: Colors.white,
      fontSize: compact ? 18 : 22,
      fontWeight: FontWeight.w900,
      height: 1.05,
      letterSpacing: .3,
      shadows: [
        Shadow(color: Colors.black26, blurRadius: 8),
      ],
    );

    return SizedBox(
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: background,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.18),
              blurRadius: 14,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(22),
            onTap: onPressed,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 18,
                vertical: compact ? 12 : 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    Icon(icon, color: Colors.white, size: compact ? 22 : 26),
                    const SizedBox(width: 10),
                  ],
                  Flexible(
                    child: Text(label, textAlign: TextAlign.center, style: textStyle),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HelpBlock extends StatelessWidget {
  final String cvv;
  final String telefone;
  final VoidCallback onAjuda;
  const _HelpBlock({
    required this.cvv,
    required this.telefone,
    required this.onAjuda,
  });

  @override
  Widget build(BuildContext context) {
    final base = GoogleFonts.baloo2(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w700,
      height: 1.1,
      shadows: [Shadow(color: Colors.black26, blurRadius: 6)],
    );
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.12),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.18),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.support_agent, color: Colors.white, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Precisa de ajuda?', style: base.copyWith(fontSize: 18)),
                const SizedBox(height: 6),
                Text('📞 CVV: $cvv', style: base),
                Text('💬 Chat: www.cvv.org.br', style: base),
                Text('✉️ E-mail: atendimento@cvv.org.br', style: base),
              ],
            ),
          ),
          const SizedBox(width: 8),
          TextButton(
            onPressed: onAjuda,
            child: const Text('Ajuda'),
          ),
        ],
      ),
    );
  }
}
