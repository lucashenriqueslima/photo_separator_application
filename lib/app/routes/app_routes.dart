part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const CREATE_EVENT = _Paths.EVENT + _Paths.CREATE_EVENT;
  static const EVENT = _Paths.EVENT;
  static const EVENT_DETAIL = _Paths.EVENT + _Paths.EVENT_DETAIL;
  static const SPLASH = _Paths.SPLASH;
  static const UNKNOWN = _Paths.UNKNOWN;
  static const LOGIN = _Paths.LOGIN;
}

abstract class _Paths {
  _Paths._();
  static const SPLASH = '/init';
  static const LOGIN = '/login';
  static const HOME = '/inicio';

  static const EVENT = '/eventos';
  static const EVENT_DETAIL = '/:eventId';
  static const CREATE_EVENT = '/criar';

  static const UNKNOWN = '/404';
}
