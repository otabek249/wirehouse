
class BaseResponse<T> {
  final bool success;
  final String message;
  final T data;
  final String timestamp;
  final int statusCode;

  BaseResponse({
    required this.success,
    required this.message,
    required this.data,
    required this.timestamp,
    required this.statusCode,
  });

  factory BaseResponse.fromJson(
      Map<String, dynamic> json, T Function(dynamic) fromJsonT) {
    return BaseResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: fromJsonT(json['data']),
      timestamp: json['timestamp'] ?? '',
      statusCode: json['statusCode'] ?? 0,
    );
  }
}
