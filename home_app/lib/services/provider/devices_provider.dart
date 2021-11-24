
import 'package:flutter/material.dart';
import 'package:home_app/models/device_model.dart';

class DeviceProvider with ChangeNotifier {
  
  Device _device =Device() ;
  Future<List<Device>> _devices;
///get one collection 
  Device get device => _device;
///set one collection and notifi listeners
  setDevice(Device collection){
    this._device =collection;
    notifyListeners();
  }
///get collections 
 Future<List<Device>> get devices => _devices;
///set collections and notifi listeners
   setDevices(Future<List<Device>> devices){
    this._devices = devices ;
    notifyListeners();
  }

}
