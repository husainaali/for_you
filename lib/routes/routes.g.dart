// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $wrapperRoute,
      $welcomePageViewRoute,
      $homePageViewRoute,
      $loginPageViewRoute,
      $shipmentsPageViewRoute,
    ];

RouteBase get $wrapperRoute => GoRouteData.$route(
      path: '/',
      factory: $WrapperRouteExtension._fromState,
    );

extension $WrapperRouteExtension on WrapperRoute {
  static WrapperRoute _fromState(GoRouterState state) => const WrapperRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $welcomePageViewRoute => GoRouteData.$route(
      path: '/welcome_page_view_path',
      factory: $WelcomePageViewRouteExtension._fromState,
    );

extension $WelcomePageViewRouteExtension on WelcomePageViewRoute {
  static WelcomePageViewRoute _fromState(GoRouterState state) =>
      const WelcomePageViewRoute();

  String get location => GoRouteData.$location(
        '/welcome_page_view_path',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $homePageViewRoute => GoRouteData.$route(
      path: '/home_page_view_path',
      factory: $HomePageViewRouteExtension._fromState,
    );

extension $HomePageViewRouteExtension on HomePageViewRoute {
  static HomePageViewRoute _fromState(GoRouterState state) =>
      const HomePageViewRoute();

  String get location => GoRouteData.$location(
        '/home_page_view_path',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $loginPageViewRoute => GoRouteData.$route(
      path: '/login_page_view_path',
      factory: $LoginPageViewRouteExtension._fromState,
    );

extension $LoginPageViewRouteExtension on LoginPageViewRoute {
  static LoginPageViewRoute _fromState(GoRouterState state) =>
      const LoginPageViewRoute();

  String get location => GoRouteData.$location(
        '/login_page_view_path',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $shipmentsPageViewRoute => GoRouteData.$route(
      path: '/shipments_page_view_path',
      factory: $ShipmentsPageViewRouteExtension._fromState,
    );

extension $ShipmentsPageViewRouteExtension on ShipmentsPageViewRoute {
  static ShipmentsPageViewRoute _fromState(GoRouterState state) =>
      const ShipmentsPageViewRoute();

  String get location => GoRouteData.$location(
        '/shipments_page_view_path',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
