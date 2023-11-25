import '../../../../data/model/weather_report.dart';

abstract class HomeState {}

class InitialHomeState extends HomeState {}

class WeatherReportFetchLoadingState extends HomeState {}

class WeatherReportFetchFailedState extends HomeState {}

class WeatherReportFetchSuccessState extends HomeState {
  WeatherReport? res;
  WeatherReportFetchSuccessState(this.res);
}
