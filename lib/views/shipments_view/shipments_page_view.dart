import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:stacked/stacked.dart';

import '../../constants/constants_helper.dart';
import '../../widgets/custom_widget_helper.dart';
import 'shipments_page_view_model.dart';

part 'custom_shipments_page_parts.dart';

class ShipmentsPageView extends StatelessWidget {
  const ShipmentsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ShipmentsPageViewModel>.reactive(
        viewModelBuilder: () => ShipmentsPageViewModel(),
        onViewModelReady: (model) => model.initialize(),
        builder: (context, model, child) => SafeArea(
              child: Scaffold(
                  appBar: customShortAppBar(context,
                      parentPage:'shipments_page_view',resources: SizedBox(
                        width: customWidth(context),
                        height: customWidth(context, percentage: 0.23),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            customForButton(context, model, 'For You'),
                            Gap(customWidth(context, percentage: 0.07)),
                            customFromButton(context, model, 'From You')
                          ],
                        ),
                      )),
                  backgroundColor: AppColor.appColorWhite,
                  body: SafeArea(
                      top: const bool.fromEnvironment('name'),
                      child: customShipmentsList(context,model)),
            )));
  }
}
