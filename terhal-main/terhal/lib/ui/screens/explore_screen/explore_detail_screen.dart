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

class ExploreDetailScreen extends StatefulWidget {
  ExploreModel exploreModel;
  ExploreDetailScreen({Key key, this.exploreModel}) : super(key: key);

  @override
  _ExploreDetailScreenState createState() => _ExploreDetailScreenState();
}

class _ExploreDetailScreenState extends State<ExploreDetailScreen> {
  final firestoreInstance = FirebaseFirestore.instance;
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime selectedDate = DateTime.now();
  addPlan() {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    Utils.showLoader();
    firestoreInstance
        .collection("plans")
        .doc(firebaseUser.uid)
        .collection(selectedDate.toString().split(' ')[0])
        .doc()
        .set({
      "date": selectedDate.toString().split(' ')[0],
      "city": widget.exploreModel.name,
      'location': '',
      "plan_type": '',
    }).then((_) {
      Utils.hideLoader();
      Get.offAll(BottomNavigation(
        isPlan: true,
      ));

      print("success!");
    });
  }

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
              ComponentText.buildTextWidget(
                  title: widget.exploreModel.name,
                  color: ConstantColor.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
              ComponentSizedBox.topMargin(size: 20),
              Image.network(
                widget.exploreModel.image,
                width: MediaQuery.of(context).size.width,
                height: 280,
                fit: BoxFit.cover,
              ),
              Container(
                height: 110,
                child: ListView(
                  children: [
                    ComponentText.buildTextWidget(
                        maxLines: 10,
                        title: widget.exploreModel.descrription,
                        color: ConstantColor.black.withOpacity(0.6),
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        height: 1.6),
                  ],
                ),
              ),
              ComponentSizedBox.topMargin(size: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ComponentSizedBox.sideMargin(size: 10),
                  Icon(
                    Icons.calendar_today,
                    color: Colors.grey,
                  ),
                  ComponentSizedBox.sideMargin(size: 5),
                  ComponentText.buildTextWidget(
                      title: 'SELECT DATE', color: Colors.grey),
                  ComponentSizedBox.sideMargin(size: 10),
                  InkWell(
                    onTap: () async {
                      DateTime dateTime = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2025),
                      );
                      if (dateTime != null) {
                        setState(() {
                          selectedDate = dateTime;
                        });
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Center(
                          child: ComponentText.buildTextWidget(
                              title: "${selectedDate.toLocal()}".split(' ')[0],
                              color: Colors.grey)),
                    ),
                  ),
                ],
              ),
              ComponentSizedBox.topMargin(size: 30),
              Center(
                child: InkWell(
                  onTap: () {
                    addPlan();
                  },
                  child: Container(
                    height: 50,
                    width: 180,
                    decoration: BoxDecoration(
                      color: Color(0xff56A1AF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: ComponentText.buildTextWidget(
                            title: "Add to Schedule", color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
