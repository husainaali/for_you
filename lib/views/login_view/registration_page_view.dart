import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:for_you/constants/constants_helper.dart';
import 'package:for_you/routes/routes.dart';
import 'package:for_you/views/shipments_view/shipments_page_view.dart';
import 'package:for_you/views/wrapper_view/wrapper_view.dart';
import 'package:for_you/widgets/custom_widget_helper.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';

import 'login_page_view_model.dart';

part 'custom_registration_page_parts.dart';

class RegistrationPageView extends StatelessWidget {
  RegistrationPageView({
    Key? key,
    required this.userName,
    required this.password,
  }) : super(key: key);
  final String userName;
  final String password;

  ButtonStyle buttonStyle = ButtonStyle(
      overlayColor: MaterialStateProperty.all(
        AppColor.appColorWhite,
      ),
      foregroundColor: MaterialStateProperty.all(
        AppColor.appColorWhite,
      ),
      splashFactory: NoSplash.splashFactory,
      elevation: MaterialStateProperty.all(0.0),
      backgroundColor: MaterialStateProperty.all<Color>(
          AppColor.appColorWhite.withOpacity(0.0)));
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginPageViewModel>.reactive(
        viewModelBuilder: () => LoginPageViewModel(),
        onViewModelReady: (model) =>
            model.registrationInitialize(userName, password),
        builder: (context, model, child) => Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
                child: ListView(
                    padding: EdgeInsets.only(
                        left: customWidth(context, percentage: 0.11),
                        right: customWidth(context, percentage: 0.11)),
                    children: [
                  Gap(customHeight(context, percentage: 0.12)),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColor.appColorGreylight2,
                        borderRadius: BorderRadius.circular(
                            customHeight(context, percentage: 0.1))),
                    height: customHeight(context, percentage: 0.07),
                    width: customWidth(context, percentage: 0.08),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: customWidth(context, percentage: 0.03),
                            right: customWidth(context, percentage: 0.03),
                          ),
                          child: SizedBox(
                            width: customWidth(context, percentage: 0.33),
                            child: ElevatedButton(
                                style: model.isUser ? null : buttonStyle,
                                onPressed: () {
                                  model.isUser = true;
                                  model.userInformation.role = 'User';
                                  model.notifyListeners();
                                },
                                child: Text(
                                  'User',
                                  style: TextStyle(
                                      color: model.isUser
                                          ? AppColor.appColorMainRed
                                          : AppColor.appColorGreyNormal),
                                )),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: customWidth(context, percentage: 0.03),
                            right: customWidth(context, percentage: 0.03),
                          ),
                          child: SizedBox(
                            width: customWidth(context, percentage: 0.33),
                            child: ElevatedButton(
                                style: model.isUser ? buttonStyle : null,
                                onPressed: () {
                                  model.isUser = false;
                                  model.userInformation.role = 'Manager';
                                  model.notifyListeners();
                                },
                                child: Container(
                                  child: Text(
                                    'Manager',
                                    style: TextStyle(
                                        color: model.isUser
                                            ? AppColor.appColorGreyNormal
                                            : AppColor.appColorMainRed),
                                  ),
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                  model.isUser
                      ? customUserForm(context, model)
                      : customManagerForm(context, model),
                  Gap(customHeight(context, percentage: 0.02)),
                  customRequestButton(context, 'Register', () {
                    model.userService
                        .registerUser(model.userInformation)
                        .then((value) => {
                              if (value)
                                {
                                  context.go(WrapperRoute.path),
                                }
                            });
                  }),
                  Gap(customHeight(context, percentage: 0.04)),
                ]))));
  }
}
