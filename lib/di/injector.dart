import 'package:kiwi/kiwi.dart';

class Injector {
  static KiwiContainer container = KiwiContainer();
  static var resolver = container.resolve;
}
