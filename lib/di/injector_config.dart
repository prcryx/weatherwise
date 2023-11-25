import 'package:kiwi/kiwi.dart';
import 'package:weatherwise/app/data/repositories/home_repository.dart';
import 'package:weatherwise/app/presentation/screens/home/bloc/home_cubit.dart';

import '../app/services/http/http_client.dart';

part 'injector_config.g.dart';

abstract class InjectorConfig {
  static late KiwiContainer container;

  static void setUp() {
    container = KiwiContainer();
    final injector = _$InjectorConfig();
    injector._configure();
  }

  static final resolve = container.resolve;

  void _configure() {
    _configureCubits();
    _configureRepositories();
    _configureServices();
  }

  /// Register Cubits
  @Register.factory(HomeCubit)
  void _configureCubits();

  /// Register Repositories
  @Register.factory(HomeRepository)
  void _configureRepositories();

  /// Register Services
  @Register.factory(HttpClient)
  void _configureServices();
}
