class HttpException implements Exception {
  final _statusCode;
  final _message;

  HttpException(this._statusCode, this._message);

  @override
  String toString() {
    return _message;
  }
}