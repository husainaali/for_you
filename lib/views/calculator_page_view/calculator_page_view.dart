import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_svg/svg.dart';
import 'package:for_you/constants/constants_helper.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../widgets/custom_widget_helper.dart';
import 'calculator_page_view_model.dart';

part 'custom_calculator_parts.dart';

class CalculatorPageView extends StatelessWidget {
  const CalculatorPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CalculatorPageViewModel>.reactive(
        viewModelBuilder: () => CalculatorPageViewModel(),
        onViewModelReady: (model) => model.initialize(),
        builder: (context, model, child) => SafeArea(
              child: Scaffold(
                  appBar: customLongAppBar(context),
                  backgroundColor: AppColor.appColorWhite,
                  body: SafeArea(
                      top: bool.fromEnvironment('name'),
                      child: ListView(
                        padding: EdgeInsets.only(
                          top: customHeight(context,percentage: 0.02),
                          left: customWidth(context,percentage: 0.05),
                          right: customWidth(context,percentage: 0.05)
                          ),
                        children: [
                          AutoSizeText(
                            'Shipment from*',
                            maxFontSize: 24,
minFontSize: 18,
                            style: TextStyle(),
                          ),
// customDropDownMenu(context,items,action),
// customDropDownMenu(context,items,action),
                        ],
                      ))),
            ));
  }
}
