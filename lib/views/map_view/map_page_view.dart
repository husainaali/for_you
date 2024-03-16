import 'dart:convert';

import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:for_you/constants/constants_helper.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import '../../widgets/custom_widget_helper.dart';
import 'map_page_view_model.dart';

class MapPageView extends StatelessWidget {
  MapPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MapPageViewModel>.reactive(
        viewModelBuilder: () => MapPageViewModel(),
        onViewModelReady: (model) => model.initialize(),
        builder: (context, model, child) => Scaffold(
            appBar: customShortAppBar(context),
            backgroundColor: Colors.white,
            body: SafeArea(
              child: FlutterMap(
                options: MapOptions(
                  center: LatLng(26.0667, 50.5577), // Initial center of the map
                  zoom: 12.0, // Initial zoom level
                  onTap: (tapPosition, point) {
                    model.handleTap(point, context);
                  },
                ),
                children: [
                  TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.foryou.app'),
                  MarkerLayer(
                      markers: List.generate(
                    5,
                    (index) => Marker(
                        point: LatLng(
                          26.0667 + index * 0.01,
                          50.5577 + index * 0.01,
                        ),
                        width: 64,
                        height: 64,
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                            onPressed: () {
                              print('greate $index');
                            },
                            icon: SvgPicture.asset('assets/map_pin.svg',
                              height: customHeight(context,percentage: 0.08),) )),
                  ))
                ],
              ),
            )));
  }
}
