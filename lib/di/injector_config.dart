import 'package:kiwi/kiwi.dart';

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
    _configureServices();
  }

  /// Register Services
  @Register.factory(HttpClient)
  void _configureServices();
}
