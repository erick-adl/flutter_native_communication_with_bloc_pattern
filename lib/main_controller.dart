import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class MainController implements BlocBase {
  static const platform =
      const MethodChannel('flutter.rortega.com.basicchannelcommunication');

  MainController() {
    platform.setMethodCallHandler(_handleMethod);
  }

  var _dataController = StreamController<String>();

  Stream<String> get outData => _dataController.stream;
  Sink<String> get inData => _dataController.sink;

  Future<Null> _showNativeView() async {
    await platform.invokeMethod('showNativeView');
  }

    Future<Null> _getData() async {
    await platform.invokeMethod('getData');
  }

  String dataToSend = "";
  void sendData() {
    inData.add(dataToSend);
  }

  Future<dynamic> _handleMethod(MethodCall call) async {
    switch (call.method) {
      case "message":
        print(call.arguments);
        dataToSend = call.arguments;
        sendData();
        return new Future.value(call.arguments);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
