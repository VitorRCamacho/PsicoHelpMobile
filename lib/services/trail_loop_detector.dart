// lib/services/trail_loop_detector.dart
import 'package:flutter/material.dart';
import 'package:mente_ifc/core/routes.dart';
import 'package:mente_ifc/services/final_manager.dart';

/// Serviço que detecta loops nas trilhas emocionais e redireciona para finais
class TrailLoopDetector {
  // Singleton
  static final TrailLoopDetector _instance = TrailLoopDetector._internal();
  factory TrailLoopDetector() => _instance;
  TrailLoopDetector._internal();

  // Histórico de telas visitadas na sessão atual
  final Map<String, List<String>> _visitHistory = {};

  /// Registra uma visita a uma tela específica
  /// Retorna true se deve prosseguir normalmente, false se deve redirecionar
  void registerVisit(String screenId) {
    final emotion = _getEmotionFromScreenId(screenId);
    if (emotion == null) return;

    if (!_visitHistory.containsKey(emotion)) {
      _visitHistory[emotion] = [];
    }
    _visitHistory[emotion]!.add(screenId);
  }

  /// Verifica se houve loop (segunda visita à pergunta 5 da mesma emoção)
  /// Retorna a rota do final se houver loop, null caso contrário
  Future<String?> checkForLoop(String screenId, BuildContext context) async {
    final emotion = _getEmotionFromScreenId(screenId);
    if (emotion == null || !screenId.contains('P5')) return null;

    final history = _visitHistory[emotion] ?? [];

    // Conta quantas vezes visitou a pergunta 5 desta emoção
    final visitCount = history.where((screen) => screen == screenId).length;

    // Se já visitou uma vez antes (agora seria a segunda), redireciona para final
    if (visitCount >= 1) {
      final nextFinal = await FinalManager.getNextFinal(emotion);
      final route = _getFinalRoute(emotion, nextFinal);
      await FinalManager.markFinalShown(emotion, nextFinal);
      return route;
    }

    return null;
  }

  /// Limpa o histórico de visitas (útil ao iniciar nova trilha)
  void clearHistory() {
    _visitHistory.clear();
  }

  /// Limpa o histórico de uma emoção específica
  void clearEmotionHistory(String emotion) {
    _visitHistory.remove(emotion);
  }

  /// Extrai o nome da emoção do ID da tela
  String? _getEmotionFromScreenId(String screenId) {
    if (screenId.contains('Ansiedade')) return 'ansiedade';
    if (screenId.contains('Tristeza')) return 'tristeza';
    if (screenId.contains('Raiva')) return 'raiva';
    if (screenId.contains('Medo')) return 'medo';
    if (screenId.contains('Estresse')) return 'estresse';
    if (screenId.contains('Solidao')) return 'solidao';
    return null;
  }

  /// Retorna a rota do final baseado na emoção e número
  String _getFinalRoute(String emotion, int finalNumber) {
    switch (emotion) {
      case 'ansiedade':
        return finalNumber == 1 ? Routes.ansiedadeFinal1 : Routes.ansiedadeFinal2;
      case 'tristeza':
        return finalNumber == 1 ? Routes.tristezaFinal1 : Routes.tristezaFinal2;
      case 'raiva':
        return finalNumber == 1 ? Routes.raivaFinal1 : Routes.raivaFinal2;
      case 'medo':
        return finalNumber == 1 ? Routes.medoFinal1 : Routes.medoFinal2;
      case 'estresse':
        return finalNumber == 1 ? Routes.estresseFinal1 : Routes.estresseFinal2;
      case 'solidao':
        return finalNumber == 1 ? Routes.solidaoFinal1 : Routes.solidaoFinal2;
      default:
        return Routes.ansiedadeFinal1; // Fallback
    }
  }

  /// Debug: retorna histórico de visitas
  Map<String, List<String>> getVisitHistory() => Map.from(_visitHistory);
}
