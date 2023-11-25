// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector_config.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$InjectorConfig extends InjectorConfig {
  @override
  void _configureCubits() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory((c) => HomeCubit(c<HomeRepository>()));
  }

  @override
  void _configureRepositories() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory((c) => HomeRepository(c<HttpClient>()));
  }

  @override
  void _configureServices() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory((c) => HttpClient());
  }
}
