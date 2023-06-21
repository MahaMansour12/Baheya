class ApiResponse {
  String message;
  String token;

  ApiResponse({required this.message, required this.token});

  factory ApiResponse.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw Exception('Failed to parse LoginResponse from null');
    }

    return ApiResponse(
      message: json['message'] ?? '',
      token: json['token'] ?? '',
    );
  }
}