import 'dart:async';
import 'package:basic_channel_communication/main_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future main() async {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter-Native Demo',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider<MainController>(
          child: MyHomePage(title: "blabla"),
          bloc: MainController(),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title});

  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final MainController bloc = BlocProvider.of<MainController>(context);

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Teste Channel com Bloc"),
      ),
      body: new Center(
        child: StreamBuilder(
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Text("Android: ${snapshot.data}");
          },
          stream: bloc.outData,
          initialData: "Teste",
        ),
      ),
    );
  }
}
