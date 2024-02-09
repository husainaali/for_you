import 'package:drd_app/constants/constants_helper.dart';
import 'package:drd_app/widgets/custom_widget_helper.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:stacked/stacked.dart';


class WelcomePageView extends StatelessWidget {
  WelcomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WelcomePageViewModel>.reactive(
        viewModelBuilder: () => WelcomePageViewModel(),
        onViewModelReady: (model) => model.initialize(),
        builder: (context, model, child) => SafeArea(
              child: Scaffold(
                backgroundColor: Colors.white,
                body: Stack(
                  children: [                  ],
                ),
              ),
            ));
  }
}
