import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../views/calculator_page_view/calculator_page_view.dart';
import '../views/calculator_page_view/send_shipment_page_view.dart';
import '../views/home_view/home_page_view.dart';
import '../views/login_view/login_page_view.dart';
import '../views/login_view/registration_page_view.dart';
import '../views/setting_view/setting_page_view.dart';
import '../views/shipments_view/shipments_page_view.dart';
import '../views/welcome_view/welcome_page_view.dart';
import '../views/wrapper_view/wrapper_view.dart';


part 'routes.g.dart';



GoRouter router() {
  return GoRouter(
    // navigatorKey: ,

    // refreshListenable: notifier,
    debugLogDiagnostics: true,
    initialLocation: WrapperRoute.path,
    routes: $appRoutes,
    //redirect: notifier.redirect,
  );
}



@TypedGoRoute<WrapperRoute>(path: WrapperRoute.path)
class WrapperRoute extends GoRouteData {
  const WrapperRoute();

  static const path = '/';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const WrapperView();
  }
}


@TypedGoRoute<WelcomePageViewRoute>(path: WelcomePageViewRoute.path)
class WelcomePageViewRoute extends GoRouteData {
  const WelcomePageViewRoute();

  static const path = '/welcome_page_view_path';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return WelcomePageView();
  }
}
@TypedGoRoute<HomePageViewRoute>(path: HomePageViewRoute.path)
class HomePageViewRoute extends GoRouteData {
  const HomePageViewRoute();

  static const path = '/home_page_view_path';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return HomePageView();
  }
}
@TypedGoRoute<LoginPageViewRoute>(path: LoginPageViewRoute.path)
class LoginPageViewRoute extends GoRouteData {
  const LoginPageViewRoute();

  static const path = '/login_page_view_path';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return LoginPageView();
  }
}
@TypedGoRoute<ShipmentsPageViewRoute>(path: ShipmentsPageViewRoute.path)
class ShipmentsPageViewRoute extends GoRouteData {
  const ShipmentsPageViewRoute();

  static const path = '/shipments_page_view_path';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ShipmentsPageView();
  }
}
@TypedGoRoute<CalculatorPageViewRoute>(path: CalculatorPageViewRoute.path)
class CalculatorPageViewRoute extends GoRouteData {
  const CalculatorPageViewRoute();

  static const path = '/calculator_page_view_path';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CalculatorPageView();
  }
}
@TypedGoRoute<SendShipmentPageViewRoute>(path: SendShipmentPageViewRoute.path)
class SendShipmentPageViewRoute extends GoRouteData {
  const SendShipmentPageViewRoute();

  static const path = '/send_shipment_page_view_path';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SendShipmentPageView();
  }
}
@TypedGoRoute<SettingPageViewRoute>(path: SettingPageViewRoute.path)
class SettingPageViewRoute extends GoRouteData {
  const SettingPageViewRoute();

  static const path = '/setting_page_view_path';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SettingPageView();
  }
}
@TypedGoRoute<RegistrationPageViewRoute>(path: RegistrationPageViewRoute.path)
class RegistrationPageViewRoute extends GoRouteData {
  const RegistrationPageViewRoute();

  static const path = '/registration_page_view_path';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return RegistrationPageView();
  }
}