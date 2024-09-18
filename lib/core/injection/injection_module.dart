import 'package:injectable/injectable.dart';
import 'package:network/network.dart';

@module
abstract class InjectionModule {
  @singleton
  NetworkManager get manager => FirebaseStoreManager.instance;
}
