import 'package:flutter/material.dart';
import 'package:for_you/views/employees_view/employee_register_form.dart';
import 'package:go_router/go_router.dart';

import '../views/calculator_page_view/addresses_control_page.dart';
import '../views/calculator_page_view/calculator_page_view.dart';
import '../views/calculator_page_view/send_shipment_page_view.dart';
import '../views/employees_view/employees_page_view.dart';
import '../views/home_employee/home_employee_page_view.dart';
import '../views/home_manager/home_manager_page_view.dart';
import '../views/home_manager/manager_send_shipment_page_view.dart';
import '../views/home_view/home_page_view.dart';
import '../views/login_view/login_page_view.dart';
import '../views/login_view/registration_page_view.dart';
import '../views/manager_view/manager_page_view.dart';
import '../views/map_view/map_page_view.dart';
import '../views/setting_view/setting_page_view.dart';
import '../views/shipments_view/shipment_details_view.dart';
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

@TypedGoRoute<HomeManagerPageViewRoute>(path: HomeManagerPageViewRoute.path)
class HomeManagerPageViewRoute extends GoRouteData {
  const HomeManagerPageViewRoute();

  static const path = '/home_manager_page_view_path';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return HomeManagerPageView();
  }
}

@TypedGoRoute<HomeEmployeePageViewRoute>(path: HomeEmployeePageViewRoute.path)
class HomeEmployeePageViewRoute extends GoRouteData {
  const HomeEmployeePageViewRoute();

  static const path = '/home_employee_page_view_path';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return HomeEmployeePageView();
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
@TypedGoRoute<ShpmentDetailsViewRoute>(path: ShpmentDetailsViewRoute.path)
class ShpmentDetailsViewRoute extends GoRouteData {
  const ShpmentDetailsViewRoute();

  static const path = '/shipments_details_view_path';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ShpmentDetailsView();
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
    Map data = state.extra as Map;

    return SendShipmentPageView(
      sendShipmentDetails: data['sendShipmentDetails'],
    );
  }
}
@TypedGoRoute<ManagerSendShipmentPageViewRoute>(path: ManagerSendShipmentPageViewRoute.path)
class ManagerSendShipmentPageViewRoute extends GoRouteData {
  const ManagerSendShipmentPageViewRoute();

  static const path = '/manager_send_shipment_page_view_path';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ManagerSendShipmentPageView(
    );
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
    Map data = state.extra as Map;

    return RegistrationPageView(
      userName: data['userName'],
      password: data['password'],
    );
  }
}

@TypedGoRoute<AddressesControlPageViewRoute>(
    path: AddressesControlPageViewRoute.path)
class AddressesControlPageViewRoute extends GoRouteData {
  const AddressesControlPageViewRoute();

  static const path = '/addresses_control_view_path';

  @override
  Widget build(BuildContext context, GoRouterState state) {
        Map data = state.extra as Map;

    return  AddressesControlPageView(
      addressId: data['addressId']??-1,

    );
  }
}
@TypedGoRoute<MapPageViewRoute>(
    path: MapPageViewRoute.path)
class MapPageViewRoute extends GoRouteData {
  const MapPageViewRoute();

  static const path = '/map_page_view_path';

  @override
  Widget build(BuildContext context, GoRouterState state) {

    return  MapPageView(
    );
  }
}
@TypedGoRoute<ManagerPageViewRoute>(
    path: ManagerPageViewRoute.path)
class ManagerPageViewRoute extends GoRouteData {
  const ManagerPageViewRoute();

  static const path = '/manager_page_view_path';

  @override
  Widget build(BuildContext context, GoRouterState state) {

    return  ManagerPageView(
    );
  }
}
@TypedGoRoute<EmployeesPageViewRoute>(
    path: EmployeesPageViewRoute.path)
class EmployeesPageViewRoute extends GoRouteData {
  const EmployeesPageViewRoute();

  static const path = '/employees_page_view_path';

  @override
  Widget build(BuildContext context, GoRouterState state) {

    return  EmployeesPageView(
    );
  }
}

@TypedGoRoute<EmployeeRegisterFormRoute>(
    path: EmployeeRegisterFormRoute.path)
class EmployeeRegisterFormRoute extends GoRouteData {
  const EmployeeRegisterFormRoute();

  static const path = '/employee_register_form_path';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return  const EmployeeRegisterForm();
  }
}
