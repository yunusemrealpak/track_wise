// ignore_for_file: constant_identifier_names

enum HttpTypes {
  GET('GET'),
  POST('POST'),
  PUT('PUT'),
  DELETE('DELETE');

  final String value;
  const HttpTypes(this.value);
}
