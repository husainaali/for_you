import 'package:flutter/material.dart';
import 'package:for_you/routes/routes.dart';
import 'package:for_you/views/employees_view/employee_register_form.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';
import '../../constants/constants_helper.dart';
import '../../widgets/custom_widget_helper.dart';
import 'employees_page_view_model.dart';

class EmployeesPageView extends StatelessWidget {
  EmployeesPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EmployeesPageViewModel>.reactive(
        viewModelBuilder: () => EmployeesPageViewModel(),
        onViewModelReady: (model) => model.initialize(),
        builder: (context, model, child) => Scaffold(
              appBar: customShortAppBar(context),
              backgroundColor: Colors.white,
              body: SafeArea(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          width: customWidth(context),
                          height: customHeight(context, percentage: 0.2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  customHeight(context, percentage: 0.03)),
                              color: AppColor.appColorCornflowerBlueLight,
                              border: Border.all(
                                  width: customHeight(context, percentage: 0.0016),
                                  color:
                                       AppColor.appColorCornflowerBlue)),
                          child: SizedBox(
                            height: customHeight(context, percentage: 0.02),
                            width: customWidth(context, percentage: 0.4),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: customHeight(context, percentage: 0.04),
                                      right: customWidth(context, percentage: 0.02),
                                      left: customWidth(context, percentage: 0.02)),
                                  child: RichText(
                                    textScaleFactor: 1.0,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Name  ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: customHeight(context,
                                                percentage: 0.02),
                                            color: AppColor.appColorGreyNormal,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Hazem Ahmed Nader\n',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: customHeight(context,
                                                percentage: 0.02),
                                            color: AppColor.appColorGreyNormal,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '\n',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: customHeight(context,
                                                percentage: 0.01),
                                            color: AppColor.appColorGreyNormal,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Contact  ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: customHeight(context,
                                                percentage: 0.02),
                                            color: AppColor.appColorGreyNormal,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '+97334334444\n',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: customHeight(context,
                                                percentage: 0.02),
                                            color: AppColor.appColorGreyNormal,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '\n',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: customHeight(context,
                                                percentage: 0.01),
                                            color: AppColor.appColorGreyNormal,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Status: Active ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: customHeight(context,
                                                percentage: 0.02),
                                            color: AppColor.appColorGreyNormal,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '\n',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: customHeight(context,
                                                percentage: 0.01),
                                            color: AppColor.appColorGreyNormal,
                                          ),
                                        ),
                                         TextSpan(
                                          text: '\n',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: customHeight(context,
                                                percentage: 0.01),
                                            color: AppColor.appColorGreyNormal,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Number of package rest: 55 ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: customHeight(context,
                                                percentage: 0.02),
                                            color: AppColor.appColorGreyNormal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              floatingActionButton: model.addEditEmployees
                  ? null
                  : FloatingActionButton(
                      elevation: 30,
                      backgroundColor: AppColor.appColorCornflowerBlue,
                      child: Icon(Icons.add, color: AppColor.appColorWhite),
                      onPressed: () {
                        context.push(EmployeeRegisterFormRoute.path);
                      },
                    ),
            ));
  }
}
