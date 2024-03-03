
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../view_models/base_model.dart';

class MapPageViewModel extends BaseModel {



    List<Marker> markers = [];

  initialize() {}



Future<void> handleTap(LatLng latLng,context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Data'),
          content: Text('Do you want to add data at this location?'),
          actions: <Widget>[
            FilledButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FilledButton(
              child: Text('Add'),
              onPressed: () {
                addMarker(latLng);
                Navigator.of(context).pop();
                // Here you can handle data recording or any other action you want to take
              },
            ),
          ],
        );
      },
    );
  }

  void addMarker(LatLng latLng) {
  
      markers.add(
        Marker(
          width: 80.0,
          height: 80.0,
          point: latLng,
          child:Icon(
            Icons.pin_drop,
            color: Colors.red,
          ), 
        ),
      );
    
  }

}
