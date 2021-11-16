import 'package:flutter/material.dart';
import 'package:terhal/components/component_text_widgets.dart';
import 'package:terhal/models/login_request_model.dart';
class HomeScreen extends StatefulWidget {
   LoginRequestModel loginRequestModel;
   HomeScreen({ this.loginRequestModel }); 

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: ComponentText.buildTextWidget(title: 'Home'),),
      
    );
  }
}