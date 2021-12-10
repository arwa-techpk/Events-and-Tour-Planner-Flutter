import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terhal/components/bottom_navigation.dart';
import 'package:terhal/components/component_sized_box.dart';
import 'package:terhal/components/component_text_widgets.dart';
import 'package:terhal/constants/constants_colors.dart';
import 'package:terhal/helpers/utils.dart';
import 'package:terhal/models/explore_model.dart';

class MostVisitedScreen extends StatefulWidget {
  ExploreModel exploreModel;
  MostVisitedScreen({Key key, this.exploreModel}) : super(key: key);

  @override
  _MostVisitedScreenState createState() => _MostVisitedScreenState();
}

class _MostVisitedScreenState extends State<MostVisitedScreen> {
  final firestoreInstance = FirebaseFirestore.instance;
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: ConstantColor.medblue,
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ComponentSizedBox.topMargin(size: 20),
              Image.network(
                widget.exploreModel.image,
                width: MediaQuery.of(context).size.width,
                height: 280,
                fit: BoxFit.cover,
              ),
               ComponentSizedBox.topMargin(size: 10),
              Container(
                height: 180,
                child: ListView(
                  children: [
                    ComponentText.buildTextWidget(
                        maxLines: 10,
                        title: widget.exploreModel.descrription ?? '',
                        color: ConstantColor.black.withOpacity(0.6),
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        height: 1.6),
                  ],
                ),
              ),
             
              
            ],
          ),
        ),
      ),
    );
  }
}
