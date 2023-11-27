import 'package:bloc/bloc.dart';

import '../../../../data/model/weather_report_req.dart';
import '../../../../data/repositories/home_repository.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _repo;
  HomeCubit(this._repo) : super(InitialHomeState());

  void getWeatherReport() async {
    try {
      emit(WeatherReportFetchLoadingState());
      WeatherReportRequest req =
          const WeatherReportRequest(lat: 23.83, long: 91.28, pastDays: 3);
      final res = await _repo.getWeatherReport(req);
      print("From cubit: $res");
      emit(WeatherReportFetchSuccessState(res));
    } catch (e) {
      emit(WeatherReportFetchFailedState());
    }
  }
}
