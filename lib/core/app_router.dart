// lib/core/app_router.dart
import 'package:flutter/material.dart';
import 'package:mente_ifc/core/routes.dart';

// Telas principais
import 'package:mente_ifc/screens/home_screen.dart';
import 'package:mente_ifc/screens/pergunta_geral_screen.dart'; // ADICIONAR ESTE IMPORT!

// Trilha de Ansiedade
import 'package:mente_ifc/screens/Trilha/Ansiedade/Pergunta1_Ansiedade.dart';
import 'package:mente_ifc/screens/Trilha/Ansiedade/Pergunta2_Ansiedade.dart';
import 'package:mente_ifc/screens/Trilha/Ansiedade/Pergunta3_Ansiedade.dart';
import 'package:mente_ifc/screens/Trilha/Ansiedade/Pergunta4_Ansiedade.dart';
import 'package:mente_ifc/screens/Trilha/Ansiedade/Pergunta5_Ansiedade.dart';

// TODO: Adicionar imports das outras trilhas quando criar
// import 'package:mente_ifc/screens/Trilha/Tristeza/Pergunta1_Tristeza.dart';
// import 'package:mente_ifc/screens/Trilha/Raiva/Pergunta1_Raiva.dart';
// etc...

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // TELAS PRINCIPAIS
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      
      case Routes.guia:
        // CORRIGIDO: Agora vai para PerguntaGeralScreen!
        return MaterialPageRoute(builder: (_) => const PerguntaGeralScreen());
      
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
      
      // TODO: Adicionar casos para outras trilhas
      // case Routes.tristezaP1:
      //   return MaterialPageRoute(builder: (_) => const Pergunta1TristezaScreen());
      // case Routes.raivaP1:
      //   return MaterialPageRoute(builder: (_) => const Pergunta1RaivaScreen());
      // etc...
      
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