class ResponseError {
  final String code;
  final String message;
  final String errorSolId;

  ResponseError({
    required this.code,
    required this.message,
    required this.errorSolId,
  });

  factory ResponseError.fromJson(Map<String, dynamic> json) {
    return ResponseError(
      code: json['code'] ?? '',
      message: json['message'] ?? '',
      errorSolId: json['errorSolId'] ?? '',
    );
  }
}
