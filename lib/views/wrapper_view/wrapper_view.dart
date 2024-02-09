import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';



class WrapperView extends StatelessWidget {
  const WrapperView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WrapperViewModel>.reactive(
        viewModelBuilder: () => WrapperViewModel(),
        onViewModelReady: (model) => model.initialize(),
        //builder: (context, model, child) {return const LogInView();});
        builder: (context, model, child) => !model.loggedIn ? WelcomePageView() : WelcomePageView());
  }
}
