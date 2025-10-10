// lib/services/final_manager.dart
import 'package:shared_preferences/shared_preferences.dart';

/// Gerencia qual final deve ser mostrado para cada trilha emocional.
/// Garante que o usuário sempre veja finais alternados (Final1 -> Final2 -> Final1...).
class FinalManager {
  static const String _keyPrefix = 'last_final_';

  /// Retorna qual final deve ser mostrado para a trilha especificada.
  /// Retorna 1 ou 2 dependendo do último final que foi mostrado.
  static Future<int> getNextFinal(String trilha) async {
    final prefs = await SharedPreferences.getInstance();
    final lastFinal = prefs.getInt('$_keyPrefix$trilha') ?? 0;

    // Se nunca mostrou nenhum final, ou se o último foi 2, mostra 1
    // Se o último foi 1, mostra 2
    return lastFinal == 1 ? 2 : 1;
  }

  /// Marca que um determinado final foi mostrado para uma trilha.
  static Future<void> markFinalShown(String trilha, int finalNumber) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('$_keyPrefix$trilha', finalNumber);
  }

  /// Limpa o histórico de finais (útil para testes ou reset).
  static Future<void> clearHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys().where((key) => key.startsWith(_keyPrefix));
    for (final key in keys) {
      await prefs.remove(key);
    }
  }
}
