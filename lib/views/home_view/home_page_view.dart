import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:for_you/constants/constants_helper.dart';
// import 'package:for_you/widgets/custom_widget_helper.dart';
import 'package:flutter/material.dart';
import 'package:for_you/routes/routes.dart';
import 'package:for_you/views/shipments_view/shipments_page_view.dart';
import 'package:rive/rive.dart';

import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
// import 'package:rive/rive.dart';

import 'package:stacked/stacked.dart';

import '../../widgets/custom_widget_helper.dart';
import 'home_page_view_model.dart';

part 'custom_home_parts.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
        viewModelBuilder: () => HomePageViewModel(),
        onViewModelReady: (model) => model.initialize(),
        builder: (context, model, child) => Scaffold(
            appBar: customLongAppBar(context),
            backgroundColor: AppColor.appColorWhite,
            body: SafeArea(
                child: ListView(
                  children: [
                    customTextFieldTracking(context),
                    customHomeButton(context),
                    customAdsBanner(context,model),
                  ],
                ))));
  }
}
