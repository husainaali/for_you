import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_svg/svg.dart';
import 'package:for_you/constants/constants_helper.dart';
// import 'package:for_you/widgets/custom_widget_helper.dart';
import 'package:flutter/material.dart';
import 'package:for_you/routes/routes.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/custom_widget_helper.dart';
import 'setting_page_view_model.dart';

class SettingPageView extends StatelessWidget {
  SettingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingPageViewModel>.reactive(
        viewModelBuilder: () => SettingPageViewModel(),
        onViewModelReady: (model) => model.initialize(),
        builder: (context, model, child) =>model.busy? customLoading(): Scaffold(
            appBar: customShortAppBar(context),
            backgroundColor: Colors.white,
            body: SafeArea(
                child: ListView(
              padding: EdgeInsets.only(
                  left: customWidth(context, percentage: 0.03),
                  right: customWidth(context, percentage: 0.03)),
              children: [
                customPicker(
                    context,
                    '',
                    'Ahmed mustafa\nahmed@foryou.app',
                    AppColor.appColorCornflowerBlueLight,
                    0.1,
                    2,
                    SvgPicture.asset('assets/profile_icon.svg',color: AppColor.appColorMainRed,),
                    
                    model,'UserInfo',actionButton: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset('assets/edit_icon.svg',color: AppColor.appColorMainRed,)),),
                customPicker(
                    context,
                    '',
                    'My Addresses',
                    AppColor.appColorWhite,
                    0.08,
                    2,
                    Icon(Icons.pin_drop,
                        color: AppColor.appColorMainRed,
                        size: customHeight(context, percentage: 0.045)),
                    
                    model,'addresses',actionButton:  IconButton(
                        onPressed: () {

                                      context.push(AddressesControlPageViewRoute.path,extra: {'addressId':null});

                        },
                        icon: SvgPicture.asset('assets/edit_icon.svg',color: AppColor.appColorMainRed)),),
                customPicker(
                    context,
                    '',
                    'Notification',
                    AppColor.appColorWhite,
                    0.08,
                    2,
                    Icon(Icons.notifications_none_outlined,
                        color: AppColor.appColorMainRed,
                        size: customHeight(context, percentage: 0.045)),
                    
                    model,'notifications',actionButton: Switch(
                      activeColor: AppColor.appColorMainRed,
                      value: true,
                      onChanged: (value) {},
                    ),),
                customPicker(
                    context,
                    '',
                    'Help and support',
                    AppColor.appColorWhite,
                    0.08,
                    2,
                    SvgPicture.asset('assets/support_icon.svg',
                        color: AppColor.appColorMainRed,
                        height: customHeight(context, percentage: 0.04)),
                    
                    model,'help',actionButton:  IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: AppColor.appColorMainRed,
                        )),),

                      if(model.userData!.role=='Manager') imagePickerWidget(context, model),
                Gap(customHeight(context, percentage: 0.03)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.swap_horizontal_circle_rounded,
                          color: AppColor.appColorMainRed,
                        )),
                    const Text(
                      'عربي',
                      style: TextStyle(
                          color: AppColor.appColorMainRed, fontSize: 15),
                    ),
                    SizedBox(
                      width: customWidth(context, percentage: 0.06),
                    )
                  ],
                ),


                Padding(
                  padding: EdgeInsets.only(
                    left: customWidth(context, percentage: 0.2),
                    right: customWidth(context, percentage: 0.2),
                  ),
                  child: SizedBox(
                    height: customHeight(context, percentage: 0.05),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                customHeight(context, percentage: 0.05)),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                            AppColor.appColorMainRed),
                      ),
                      onPressed: () {
                        model.logout(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/logout_icon.svg',
                            height: customHeight(context, percentage: 0.03),
                            color: AppColor.appColorMainBlack,
                          ),
                          Gap(customWidth(context, percentage: 0.02)),
                          AutoSizeText(
                            'Logout',
                            style: TextStyle(
                                fontSize:
                                    customHeight(context, percentage: 0.2),
                                fontWeight: FontWeight.w300,
                                color: AppColor.appColorWhite),
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ))));
  }
}
