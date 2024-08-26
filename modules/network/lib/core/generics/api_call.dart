import 'package:network/core/enums/http_types.dart';
import 'package:network/core/enums/return_types.dart';
import 'package:network/core/models/network_entity.dart';

abstract interface class ApiCall {
  Future<dynamic> send<T extends NetworkEntity<T>>(
    String path, {
    required HttpTypes type,
    required ReturnTypes returnType,
    required T parserModel,
    Map<String, String>? queryParameters,
    Map<String, dynamic>? body,
  });
}
