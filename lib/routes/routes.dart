import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../views/home_view/home_page_view.dart';
import '../views/login_view/login_page_view.dart';
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