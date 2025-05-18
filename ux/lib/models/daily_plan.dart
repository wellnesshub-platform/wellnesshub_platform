class DailyPlanResponse {
  final String status;

  DailyPlanResponse({required this.status});

  factory DailyPlanResponse.fromJson(Map<String, dynamic> json) {
    return DailyPlanResponse(status: json['status']);
  }
}