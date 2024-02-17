import 'package:flutter/material.dart';
import 'package:for_you/views/shipments_view/shipments_page_view.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/custom_widget_helper.dart';
import '../home_view/home_page_view.dart';
import '../shipments_view/shipment_details_view.dart';
import 'wrapper_view_model.dart';



class WrapperView extends StatelessWidget {
  const WrapperView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WrapperViewModel>.reactive(
        viewModelBuilder: () => WrapperViewModel(),
        onViewModelReady: (model) => model.initialize(),
        builder: (context, model, child) => Scaffold(
          bottomNavigationBar: bottomNavigationBar(context,model),
          body: !model.loggedIn ? HomePageView() : ShpmentDetailsView()));
  }
}
