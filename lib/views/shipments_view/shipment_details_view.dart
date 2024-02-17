import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stacked/stacked.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../constants/constants_helper.dart';
import '../../widgets/custom_widget_helper.dart';
import 'shipments_page_view.dart';
import 'shipments_page_view_model.dart';

part 'custom_shipment_details_parts.dart';

class ShpmentDetailsView extends StatelessWidget {
  const ShpmentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ShipmentsPageViewModel>.reactive(
        viewModelBuilder: () => ShipmentsPageViewModel(),
        onViewModelReady: (model) => model.initialize(),
        builder: (context, model, child) => SafeArea(
            child: Scaffold(
                appBar: customShipmentDatailsAppBar(context),
                backgroundColor: AppColor.appColorWhite,
                body: SafeArea(
                  top: bool.fromEnvironment('name'),
                  child: ListView(children: [
                    customShipmentDetailsContainer(context),
                    customShipmentHistoryTimeLine(context)
                  ]),
                ))));
  }
}
