import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:for_you/constants/constants_helper.dart';
// import 'package:for_you/widgets/custom_widget_helper.dart';
import 'package:flutter/material.dart';
import 'package:for_you/routes/routes.dart';
import 'package:for_you/views/shipments_view/shipments_page_view.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
// import 'package:rive/rive.dart';

import 'package:stacked/stacked.dart';

import '../../widgets/custom_widget_helper.dart';
import 'home_manager_page_view_model.dart';

part 'custom_home_manager_parts.dart';

class HomeManagerPageView extends StatelessWidget {
  const HomeManagerPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeManagerPageViewModel>.reactive(
        viewModelBuilder: () => HomeManagerPageViewModel(),
        onViewModelReady: (model) => model.initialize(),
        builder: (context, model, child) => Scaffold(
            appBar: customShortAppBarForManager(context,
                parentPage: 'home_manager',
                resources: SizedBox(
                  width: customWidth(context),
                  height: customWidth(context, percentage: 0.23),
                  child: ListView.builder(
                      itemCount: model.managerHomeLists.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: EdgeInsets.all(10),
                            child: customForButton(context, model,
                                model.managerHomeLists[index], index));
                      }),
                )),
            backgroundColor: AppColor.appColorWhite,
            body: SafeArea(
                top: const bool.fromEnvironment('name'),
                child: customShipmentsList(context, model)),
            floatingActionButton: FloatingActionButton(
              elevation: 30,
              backgroundColor: AppColor.appColorMainRed,
              child: Icon(Icons.add, color: AppColor.appColorWhite),
              onPressed: () {
                context.push(ManagerSendShipmentPageViewRoute.path);
              },
            )));
  }
}
