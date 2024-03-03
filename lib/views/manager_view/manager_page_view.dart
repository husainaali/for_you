import 'dart:convert';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import '../../widgets/custom_widget_helper.dart';
import 'manager_page_view_model.dart';

class ManagerPageView extends StatelessWidget {
  ManagerPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ManagerPageViewModel>.reactive(
        viewModelBuilder: () => ManagerPageViewModel(),
        onViewModelReady: (model) => model.initialize(),
        builder: (context, model, child) => Scaffold(
            appBar: customShortAppBar(context),
            backgroundColor: Colors.white,
            body: SafeArea(
              child: SizedBox())));}}