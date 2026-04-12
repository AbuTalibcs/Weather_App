import 'package:location/location.dart';

Location location = new Location();
bool _serviceEnable = false;
PermissionStatus? _permissionGranted;
LocationData? _locationData;

void _requestLocationPermission() async {
  _serviceEnable = await location.serviceEnabled();
  if(!_serviceEnable){
    _serviceEnable = await location.requestService();
    if(!_serviceEnable){
      return;
    }
  }
  _permissionGranted = await location.hasPermission();
  if(_permissionGranted == PermissionStatus.denied){
    _permissionGranted = await location.requestPermission();
    if(_permissionGranted != PermissionStatus.granted){
      return;
    }
  }
   _locationData = await location.getLocation();

}