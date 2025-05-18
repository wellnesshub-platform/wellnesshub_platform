import '../../services/api_service.dart';
import '../../models/daily_plan.dart';

class HomeViewModel {
  Future<DailyPlanResponse> fetchDailyPlan() async {
    return await ApiService().getDailyPlan();
  }
}