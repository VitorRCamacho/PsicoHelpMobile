// lib/core/app_router.dart
import 'package:flutter/material.dart';
import 'package:mente_ifc/core/routes.dart';

// Telas principais
import 'package:mente_ifc/screens/home_screen.dart';
import 'package:mente_ifc/screens/pergunta_geral_screen.dart';
import 'package:mente_ifc/screens/ajuda_screen.dart';
import 'package:mente_ifc/screens/respiracao_screen.dart';

// Trilha de Ansiedade
import 'package:mente_ifc/screens/Trilha/Ansiedade/Pergunta1_Ansiedade.dart';
import 'package:mente_ifc/screens/Trilha/Ansiedade/Pergunta2_Ansiedade.dart';
import 'package:mente_ifc/screens/Trilha/Ansiedade/Pergunta3_Ansiedade.dart';
import 'package:mente_ifc/screens/Trilha/Ansiedade/Pergunta4_Ansiedade.dart';
import 'package:mente_ifc/screens/Trilha/Ansiedade/Pergunta5_Ansiedade.dart';

// Trilha de Tristeza
import 'package:mente_ifc/screens/Trilha/Tristeza/Pergunta1_Tristeza.dart';
import 'package:mente_ifc/screens/Trilha/Tristeza/Pergunta2_Tristeza.dart';
import 'package:mente_ifc/screens/Trilha/Tristeza/Pergunta3_Tristeza.dart';
import 'package:mente_ifc/screens/Trilha/Tristeza/Pergunta4_Tristeza.dart';
import 'package:mente_ifc/screens/Trilha/Tristeza/Pergunta5_Tristeza.dart';

// Trilha de Raiva
import 'package:mente_ifc/screens/Trilha/Raiva/Pergunta1_Raiva.dart';
import 'package:mente_ifc/screens/Trilha/Raiva/Pergunta2_Raiva.dart';
import 'package:mente_ifc/screens/Trilha/Raiva/Pergunta3_Raiva.dart';
import 'package:mente_ifc/screens/Trilha/Raiva/Pergunta4_Raiva.dart';
import 'package:mente_ifc/screens/Trilha/Raiva/Pergunta5_Raiva.dart';

// Trilha de Medo
import 'package:mente_ifc/screens/Trilha/Medo/Pergunta1_Medo.dart';
import 'package:mente_ifc/screens/Trilha/Medo/Pergunta2_Medo.dart';
import 'package:mente_ifc/screens/Trilha/Medo/Pergunta3_Medo.dart';
import 'package:mente_ifc/screens/Trilha/Medo/Pergunta4_Medo.dart';
import 'package:mente_ifc/screens/Trilha/Medo/Pergunta5_Medo.dart';

// Trilha de Estresse
import 'package:mente_ifc/screens/Trilha/Estresse/Pergunta1_Estresse.dart';
import 'package:mente_ifc/screens/Trilha/Estresse/Pergunta2_Estresse.dart';
import 'package:mente_ifc/screens/Trilha/Estresse/Pergunta3_Estresse.dart';
import 'package:mente_ifc/screens/Trilha/Estresse/Pergunta4_Estresse.dart';
import 'package:mente_ifc/screens/Trilha/Estresse/Pergunta5_Estresse.dart';

// Trilha de Solidão
import 'package:mente_ifc/screens/Trilha/Solidao/Pergunta1_Solidao.dart';
import 'package:mente_ifc/screens/Trilha/Solidao/Pergunta2_Solidao.dart';
import 'package:mente_ifc/screens/Trilha/Solidao/Pergunta3_Solidao.dart';
import 'package:mente_ifc/screens/Trilha/Solidao/Pergunta4_Solidao.dart';
import 'package:mente_ifc/screens/Trilha/Solidao/Pergunta5_Solidao.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // TELAS PRINCIPAIS
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case Routes.guia:
        return MaterialPageRoute(builder: (_) => const PerguntaGeralScreen());

      case Routes.ajuda:
        return MaterialPageRoute(builder: (_) => const AjudaScreen());

      case Routes.respiracao:
        return MaterialPageRoute(builder: (_) => const RespiracaoScreen());
      
      // TRILHA DE ANSIEDADE
      case Routes.ansiedadeP1:
        return MaterialPageRoute(builder: (_) => const Pergunta1AnsiedadeScreen());
      case Routes.ansiedadeP2:
        return MaterialPageRoute(builder: (_) => const Pergunta2AnsiedadeScreen());
      case Routes.ansiedadeP3:
        return MaterialPageRoute(builder: (_) => const Pergunta3AnsiedadeScreen());
      case Routes.ansiedadeP4:
        return MaterialPageRoute(builder: (_) => const Pergunta4AnsiedadeScreen());
      case Routes.ansiedadeP5:
        return MaterialPageRoute(builder: (_) => const Pergunta5AnsiedadeScreen());

      // TRILHA DE TRISTEZA
      case Routes.tristezaP1:
        return MaterialPageRoute(builder: (_) => const Pergunta1TristezaScreen());
      case Routes.tristezaP2:
        return MaterialPageRoute(builder: (_) => const Pergunta2TristezaScreen());
      case Routes.tristezaP3:
        return MaterialPageRoute(builder: (_) => const Pergunta3TristezaScreen());
      case Routes.tristezaP4:
        return MaterialPageRoute(builder: (_) => const Pergunta4TristezaScreen());
      case Routes.tristezaP5:
        return MaterialPageRoute(builder: (_) => const Pergunta5TristezaScreen());  

      // TRILHA DE RAIVA
      case Routes.raivaP1:
        return MaterialPageRoute(builder: (_) => const Pergunta1RaivaScreen());
      case Routes.raivaP2:
        return MaterialPageRoute(builder: (_) => const Pergunta2RaivaScreen());
      case Routes.raivaP3:
        return MaterialPageRoute(builder: (_) => const Pergunta3RaivaScreen());
      case Routes.raivaP4:
        return MaterialPageRoute(builder: (_) => const Pergunta4RaivaScreen());
      case Routes.raivaP5:
        return MaterialPageRoute(builder: (_) => const Pergunta5RaivaScreen());

      // TRILHA DE MEDO
      case Routes.medoP1:
        return MaterialPageRoute(builder: (_) => const Pergunta1MedoScreen());
      case Routes.medoP2:
        return MaterialPageRoute(builder: (_) => const Pergunta2MedoScreen());
      case Routes.medoP3:
        return MaterialPageRoute(builder: (_) => const Pergunta3MedoScreen());
      case Routes.medoP4:
        return MaterialPageRoute(builder: (_) => const Pergunta4MedoScreen());
      case Routes.medoP5:
        return MaterialPageRoute(builder: (_) => const Pergunta5MedoScreen());

      // TRILHA DE ESTRESSE
      case Routes.estresseP1:
        return MaterialPageRoute(builder: (_) => const Pergunta1EstresseScreen());
      case Routes.estresseP2:
        return MaterialPageRoute(builder: (_) => const Pergunta2EstresseScreen());
      case Routes.estresseP3:
        return MaterialPageRoute(builder: (_) => const Pergunta3EstresseScreen());
      case Routes.estresseP4:
        return MaterialPageRoute(builder: (_) => const Pergunta4EstresseScreen());
      case Routes.estresseP5:
        return MaterialPageRoute(builder: (_) => const Pergunta5EstresseScreen());

      // TRILHA DE SOLIDÃO
      case Routes.solidaoP1:
        return MaterialPageRoute(builder: (_) => const Pergunta1SolidaoScreen());
      case Routes.solidaoP2:
        return MaterialPageRoute(builder: (_) => const Pergunta2SolidaoScreen());
      case Routes.solidaoP3:
        return MaterialPageRoute(builder: (_) => const Pergunta3SolidaoScreen());
      case Routes.solidaoP4:
        return MaterialPageRoute(builder: (_) => const Pergunta4SolidaoScreen());
      case Routes.solidaoP5:
        return MaterialPageRoute(builder: (_) => const Pergunta5SolidaoScreen());


      default:
        return MaterialPageRoute(builder: (_) => const _UnknownRoutePage());
    }
  }
}

class _UnknownRoutePage extends StatelessWidget {
  const _UnknownRoutePage();
  
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: const Color(0xFF7B61FF),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            size: 80,
            color: Colors.white,
          ),
          const SizedBox(height: 20),
          const Text(
            'Ops! Rota não encontrada',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'A página solicitada não existe',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.home,
              (route) => false,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xFF7B61FF),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            ),
            child: const Text('Voltar ao Início'),
          ),
        ],
      ),
    ),
  );
}