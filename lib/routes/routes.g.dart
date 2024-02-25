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
      $calculatorPageViewRoute,
      $sendShipmentPageViewRoute,
      $settingPageViewRoute,
      $registrationPageViewRoute,
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

RouteBase get $calculatorPageViewRoute => GoRouteData.$route(
      path: '/calculator_page_view_path',
      factory: $CalculatorPageViewRouteExtension._fromState,
    );

extension $CalculatorPageViewRouteExtension on CalculatorPageViewRoute {
  static CalculatorPageViewRoute _fromState(GoRouterState state) =>
      const CalculatorPageViewRoute();

  String get location => GoRouteData.$location(
        '/calculator_page_view_path',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $sendShipmentPageViewRoute => GoRouteData.$route(
      path: '/send_shipment_page_view_path',
      factory: $SendShipmentPageViewRouteExtension._fromState,
    );

extension $SendShipmentPageViewRouteExtension on SendShipmentPageViewRoute {
  static SendShipmentPageViewRoute _fromState(GoRouterState state) =>
      const SendShipmentPageViewRoute();

  String get location => GoRouteData.$location(
        '/send_shipment_page_view_path',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $settingPageViewRoute => GoRouteData.$route(
      path: '/setting_page_view_path',
      factory: $SettingPageViewRouteExtension._fromState,
    );

extension $SettingPageViewRouteExtension on SettingPageViewRoute {
  static SettingPageViewRoute _fromState(GoRouterState state) =>
      const SettingPageViewRoute();

  String get location => GoRouteData.$location(
        '/setting_page_view_path',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $registrationPageViewRoute => GoRouteData.$route(
      path: '/registration_page_view_path',
      factory: $RegistrationPageViewRouteExtension._fromState,
    );

extension $RegistrationPageViewRouteExtension on RegistrationPageViewRoute {
  static RegistrationPageViewRoute _fromState(GoRouterState state) =>
      const RegistrationPageViewRoute();

  String get location => GoRouteData.$location(
        '/registration_page_view_path',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
