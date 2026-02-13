import 'package:flutter_mpc/features/orders/data/models/base/response_error.dart';

class SolCustomerResponseBase {
  final bool success;
  final List<ResponseError> errors;

  SolCustomerResponseBase({required this.success, required this.errors});

  factory SolCustomerResponseBase.fromJson(Map<String, dynamic> json) {
    return SolCustomerResponseBase(
      success: json['success'] as bool,
      errors: (json['errors'] as List)
          .map((errorJson) => ResponseError.fromJson(errorJson))
          .toList(),
    );
  }
}
