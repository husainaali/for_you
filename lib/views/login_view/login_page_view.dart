import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:for_you/constants/constants_helper.dart';
// import 'package:for_you/widgets/custom_widget_helper.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
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
                Gap(customHeight(context, percentage: 0.04)),



                TextField(
                  keyboardType: TextInputType.emailAddress,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@._]'))
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    labelStyle:
                        TextStyle(color: AppColor.appColorCornflowerBlue),
                    hintText: 'Enter your email',
                    hintStyle: TextStyle(color: AppColor.appColorGreyNormal),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColor.appColorGreyNormal),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColor.appColorCornflowerBlue),
                    ),
                  ),
                ),

                const TextField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle:
                        TextStyle(color: AppColor.appColorCornflowerBlue),
                    hintText: 'Enter your password',
                    hintStyle: TextStyle(color: AppColor.appColorGreyNormal),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColor.appColorGreyNormal),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColor.appColorCornflowerBlue),
                    ),
                  ),
                ),
                model.isLoginPage
                    ? SizedBox()
                    : const TextField(
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
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

                customRequestButtom(
                    context, model.isLoginPage ? 'Sign in' : 'Sign up'),
              ],
            ))),
      ),
    );
  }
}
