class GhostscriptDartException implements Exception {
  final int code;
  final String function;
  const GhostscriptDartException(this.function, this.code);
}
