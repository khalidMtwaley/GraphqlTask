import 'package:hive/hive.dart';

class HiveHelper {
  static const String _cacheBox = 'cacheBox';
  static const String _bearerTokenKey = 'token';
  static const String _languageCodeKey = 'language_code';

  static Future<Box> _getCacheBox() async {
    return await Hive.openBox(_cacheBox);
  }

  static Future<void> saveBearerToken(String token) async {
    final box = await _getCacheBox();
    await box.put(_bearerTokenKey, token);
  }

  static Future<String?> getBearerToken() async {
    final box = await _getCacheBox();
    return box.get(_bearerTokenKey);
  }

  static Future<void> deleteBearerToken() async {
    final box = await _getCacheBox();
    await box.delete(_bearerTokenKey);
  }

  static Future<void> saveLanguageCode(String languageCode) async {
    final box = await _getCacheBox();
    await box.put(_languageCodeKey, languageCode);
  }

  static Future<String?> getLanguageCode() async {
    final box = await _getCacheBox();
    return box.get(_languageCodeKey) ?? 'en';
  }

  static Future<void> clearCache() async {
    final box = await _getCacheBox();
    await box.clear();
  }
}
