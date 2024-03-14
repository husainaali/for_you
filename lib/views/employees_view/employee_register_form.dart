import 'package:flutter/material.dart';
import 'package:for_you/views/home_employee/home_employee_page_view.dart';
import 'package:for_you/views/home_employee/home_employee_page_view_model.dart';
import 'package:for_you/views/home_manager/home_manager_page_view_model.dart';
import 'package:for_you/widgets/custom_widget_helper.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';

import '../../constants/constants_helper.dart';
import '../../routes/routes.dart';
import 'employees_page_view_model.dart';

class EmployeeRegisterForm extends StatelessWidget {
  const EmployeeRegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EmployeesPageViewModel>.reactive(
        viewModelBuilder: () => EmployeesPageViewModel(),
        onViewModelReady: (model) => model.empRegisterFormInit(),
        builder: (context, model, child) => Scaffold(
              appBar: customShortAppBar(context),
              body: SafeArea(
                  top: const bool.fromEnvironment('name'),
                  child: ListView(
                    padding: EdgeInsets.only(
                        top: customWidth(context, percentage: 0.11),
                        left: customWidth(context, percentage: 0.11),
                        right: customWidth(context, percentage: 0.11)),
                    children: [
                      Text(
                        'Register new employee!',
                        style: TextStyle(
                            color: AppColor.appColorAccentRed,
                            fontSize: customWidth(context, percentage: 0.05)),
                      ),
                      Gap(customHeight(context, percentage: 0.03)),
                      customRegistrationTextFeild(context, 'Full Name',
                          model.textControllerEmployeeUserName, model),
                      customRegistrationTextFeild(context, 'User Name',
                          model.textControllerEmployeeFullName, model),
                      customRegistrationTextFeild(context, 'Contact No. 1',
                          model.textControllerEmployeeContectNo, model),
                      Row(
                        children: [
                          Checkbox(
                              fillColor: MaterialStateProperty.all(
                                  model.isEmployeeActive
                                      ? AppColor.appColorCornflowerBlue
                                      : null),
                              value: model.isEmployeeActive,
                              onChanged: (value) => {
                                    model.fillRegistrationForm(
                                        value, 'isActive'),
                                    model.isEmployeeActive =
                                        !model.isEmployeeActive,
                                    model.notifyListeners(),
                                  }),
                          const Text(
                            'Is the employee active?',
                            style: TextStyle(
                                color: AppColor.appColorCornflowerBlue),
                          ),
                        ],
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
                          labelStyle:
                              TextStyle(color: AppColor.appColorCornflowerBlue),
                          hintText: 'Enter your password',
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
                      Gap(customHeight(context, percentage: 0.1)),
                      customRequestButton(context, 'Submit', () {
                        if (model.userInformation.fullName != null &&
                            model.userInformation.fullName!.length > 3) {
                          if (model.userInformation.userName != null &&
                              model.userInformation.userName!.length > 3) {
                            if (model.userInformation.contactNo1 != null &&
                                model.userInformation.contactNo1!.length > 3) {
                              if (model.userInformation.password != null &&
                                  model.userInformation.password!.length >
                                      3) {
                                model.userService
                                    .registerUser(model.userInformation)
                                    .then((value) => {
                                          if (value)
                                            {
                                              context.pop(),
                                            }
                                        });
                              }else{
                                model.textControllerUserPassword.addListener(() { });
                              }
                            }
                          }
                        }
                      }),
                    ],
                  )),
            ));
  }
}

customRegistrationTextFeild(
    context, label, controller, EmployeesPageViewModel model) {
  return TextField(
    controller: controller,
    keyboardType: TextInputType.name,
    onChanged: (value) {
      model.fillRegistrationForm(value, label);
    },
    // obscureText: true,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: AppColor.appColorCornflowerBlue),
      hintText: 'Enter your $label',
      hintStyle: const TextStyle(color: AppColor.appColorGreyNormal),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColor.appColorGreyNormal),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColor.appColorCornflowerBlue),
      ),
    ),
  );
}
