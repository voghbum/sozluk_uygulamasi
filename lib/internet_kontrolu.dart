import 'dart:async';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:json_deneme_2/splash_screen.dart';

class InternetKontrol extends StatefulWidget {
  @override
  _InternetKontrolState createState() => _InternetKontrolState();
}

class _InternetKontrolState extends State<InternetKontrol> {
  Map _source = {ConnectivityResult.none: false};
  MyConnectivity _connectivity = MyConnectivity.instance;

  @override
  void initState() {
    super.initState();
    _connectivity.initialise();
    _connectivity.myStream.listen((source) {
      setState(() => _source = source);
      if (_source.keys.toList()[0] == ConnectivityResult.none) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                    "Lütfen uygulamayı açmadan önce internetinizi açınız!"),
                actions: [
                  FlatButton(
                      onPressed: () {
                        exit(0);
                      },
                      child: Text("çık"))
                ],
              );
            });
      } else { Navigator
          .of(context)
          .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) => Splash()));}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }

  @override
  void dispose() {
    _connectivity.disposeStream();
    super.dispose();
  }
}

class MyConnectivity {
  MyConnectivity._internal();

  static final MyConnectivity _instance = MyConnectivity._internal();

  static MyConnectivity get instance => _instance;

  Connectivity connectivity = Connectivity();

  StreamController controller = StreamController.broadcast();

  Stream get myStream => controller.stream;

  void initialise() async {
    ConnectivityResult result = await connectivity.checkConnectivity();
    _checkStatus(result);
    connectivity.onConnectivityChanged.listen((result) {
      _checkStatus(result);
    });
  }

  void _checkStatus(ConnectivityResult result) async {
    bool isOnline = false;
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isOnline = true;
      } else
        isOnline = false;
    } on SocketException catch (_) {
      isOnline = false;
    }
    controller.sink.add({result: isOnline});
  }

  void disposeStream() => controller.close();
}
