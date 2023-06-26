enum NavigationRoutes {
  home,
  event,
}

extension NavigationRoutesExtension on NavigationRoutes {
  String get route {
    switch (this) {
      case NavigationRoutes.home:
        return '/home';
      case NavigationRoutes.event:
        return '/event';
      default:
        return '/home';
    }
  }
}