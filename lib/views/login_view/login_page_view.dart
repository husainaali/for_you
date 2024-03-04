import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:for_you/constants/constants_helper.dart';
// import 'package:for_you/widgets/custom_widget_helper.dart';
import 'package:flutter/material.dart';
import 'package:for_you/routes/routes.dart';
import 'package:for_you/views/login_view/registration_page_view.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
// import 'package:rive/rive.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/custom_widget_helper.dart';
import 'login_page_view_model.dart';

class LoginPageView extends StatelessWidget {
  LoginPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginPageViewModel>.reactive(
      viewModelBuilder: () => LoginPageViewModel(),
      onViewModelReady: (model) => model.initialize(),
      builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
              child: ListView(
            padding: EdgeInsets.only(
                left: customWidth(context, percentage: 0.11),
                right: customWidth(context, percentage: 0.11)),
            children: [
              Gap(customHeight(context, percentage: 0.04)),
              SvgPicture.asset('assets/logo_login.svg',
                  height: customHeight(context, percentage: 0.22),
                  fit: BoxFit.fitHeight),
              Gap(customHeight(context, percentage: 0.04)),
              const Text(
                'Welcome Back!',
                style: TextStyle(fontSize: 24),
              ),
              Row(
                children: [
                  Text(
                    model.isLoginPage
                        ? 'Don’t have an account?'
                        : 'Already have an account?',
                    style: TextStyle(fontSize: 16),
                  ),
                  TextButton(
                      onPressed: () {
                        model.isLoginPage = !model.isLoginPage;
                        model.notifyListeners();
                      },
                      child: Text(
                        model.isLoginPage ? 'Sign up here' : 'Sign in',
                        style: const TextStyle(
                            color: AppColor.appColorAccentRed,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColor.appColorAccentRed),
                      ))
                ],
              ),
              model.isLoginPage?Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Radio(
                      focusColor: AppColor.appColorGreyNormal,
                      activeColor: AppColor.appColorGreyNormal,
                      overlayColor:
                          MaterialStateProperty.all(AppColor.appColorGreyNormal),
                      fillColor:
                          MaterialStateProperty.resolveWith<Color>((states) {
                        if (states.contains(MaterialState.selected)) {
                          return AppColor.appColorAccentRed;
                        }
                        return AppColor.appColorGreyNormal;
                      }),
                      value: true,
                      toggleable: true,
                      groupValue: model.isServiceProvider,
                      onChanged: (bool? value) {
                        model.isServiceProvider = !model.isServiceProvider;
                        model.notifyListeners();
                      },
                    ),
                    Text(
                      'Are you Service Manager?',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ):SizedBox(),
              TextField(
                controller: model.textControllerUserEmail,
                keyboardType: TextInputType.emailAddress,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@._]'))
                ],
                onChanged: (value) {
                  model.fillRegistrationForm(value, 'Email');
                },
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: AppColor.appColorCornflowerBlue),
                  hintText: 'Enter your email',
                  hintStyle: TextStyle(color: AppColor.appColorGreyNormal),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColor.appColorGreyNormal),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColor.appColorCornflowerBlue),
                  ),
                ),
              ),
              TextField(
                controller: model.textControllerUserPassword,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                onChanged: (value) {
                  model.fillRegistrationForm(value, 'Password');
                },
                decoration: const InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: AppColor.appColorCornflowerBlue),
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(color: AppColor.appColorGreyNormal),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColor.appColorGreyNormal),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColor.appColorCornflowerBlue),
                  ),
                ),
              ),
              model.isLoginPage
                  ? const SizedBox()
                  : TextField(
                      controller: model.textControllerUserConfirmPassword,
                      onChanged: (value) {
                        model.isPasswordConfirmed =
                            model.userInformation.password == value;
                      },
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Confirm Password',
                        labelStyle:
                            TextStyle(color: AppColor.appColorCornflowerBlue),
                        hintText: 'Enter your password confirmation',
                        hintStyle:
                            TextStyle(color: AppColor.appColorGreyNormal),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColor.appColorGreyNormal),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColor.appColorCornflowerBlue),
                        ),
                      ),
                    ),
              Gap(customHeight(context, percentage: 0.04)),
              customRequestButton(
                  context,
                  model.isLoginPage ? 'Sign in' : 'Sign up',
                  model.isLoginPage
                      ? () {
                          if (model.textControllerUserEmail.text.length > 3 &&
                              model.textControllerUserPassword.text.length >
                                  3) {
                            model.userService
                                .loginUser(context,model.userInformation.email!,
                                    model.userInformation.password!)
                                .then((value) => {
                                      if (value) {context.go(WrapperRoute.path)}
                                    });
                          }
                        }
                      : () {
                          if (model.textControllerUserEmail.text.isNotEmpty &&
                              model
                                  .textControllerUserPassword.text.isNotEmpty &&
                              model.textControllerUserConfirmPassword.text
                                  .isNotEmpty &&
                              model.textControllerUserPassword.text ==
                                  model
                                      .textControllerUserConfirmPassword.text) {
                            context
                                .push(RegistrationPageViewRoute.path, extra: {
                              'userName': model.userInformation.email,
                              'password': model.userInformation.password
                            });
                          } else if (model.textControllerUserConfirmPassword
                              .text.isEmpty) {}
                        }),
            ],
          ))),
    );
  }
}
