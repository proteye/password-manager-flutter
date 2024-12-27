import 'dart:developer' as developer;

T? tryCast<T>(dynamic x, {T? fallback}) {
  try {
    return x as T;
  } catch (_) {
    developer.log('TypeError when trying to cast $x to $T!');
    return fallback;
  }
}
