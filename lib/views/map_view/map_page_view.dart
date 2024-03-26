import 'dart:convert';

import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:for_you/constants/constants_helper.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import '../../routes/routes.dart';
import '../../widgets/custom_widget_helper.dart';
import 'map_page_view_model.dart';

class MapPageView extends StatelessWidget {
  MapPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MapPageViewModel>.reactive(
        viewModelBuilder: () => MapPageViewModel(),
        onViewModelReady: (model) => model.initialize(),
        builder: (context, model, child) => model.busy?customLoading(): Scaffold(
            appBar: customShortAppBar(context),
            backgroundColor: Colors.white,
            body: SafeArea(
              child: FlutterMap(
                options: MapOptions(
                  center: LatLng(26.0667, 50.5577), // Initial center of the map
                  zoom: 12.0, // Initial zoom level
                  onTap: (tapPosition, point) {
                    model.handleTap(point, context);
                    print(point);
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
                          model.shipmentsPointsList[index]['latitude']!,
                          model.shipmentsPointsList[index]['longitude']!,
                        ),
                        width: 64,
                        height: 64,
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                            onPressed: () {
                              if(model.userData!.role=='Manager')
                              customEmployeeDialog(
                                  context: context, model: model);
                              if(model.userData!.role=='User')
                context.push(ShpmentDetailsViewRoute.path);
                            },
                            icon: SvgPicture.asset(
                              'assets/packagepin.svg',
                              fit: BoxFit.fitHeight,
                              height: customHeight(context, percentage: 0.037),
                            ))),
                  )),
                                         if(model.userData!.role=='User')

                   MarkerLayer(
                      markers: List.generate(
                    5,
                    (index) => Marker(
                        point: LatLng(
                          model.shipmentsOfficesList[index]['latitude']!,
                          model.shipmentsOfficesList[index]['longitude']!,
                        ),
                        width: 64,
                        height: 64,
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                            onPressed: () {
                              customEmployeeDialog(
                                  context: context, model: model);
                              print('greate $index');
                            },
                            icon: SvgPicture.asset(
                              'assets/foryouoffice.svg',
                              height: customHeight(context, percentage: 0.08),
                            ))),
                  ))
                
                ],
              ),
            )));
  }
}
