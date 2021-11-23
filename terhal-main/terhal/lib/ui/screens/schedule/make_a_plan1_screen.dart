import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terhal/components/bottom_navigation.dart';
import 'package:terhal/components/component_button.dart';
import 'package:terhal/components/component_sized_box.dart';
import 'package:terhal/components/component_text_widgets.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:terhal/constants/constants_colors.dart';
import 'package:terhal/helpers/utils.dart';

class MakeAPlanOneScreen extends StatefulWidget {
  String placeName;
  MakeAPlanOneScreen({this.placeName});
  @override
  _MakeAPlanOneScreenState createState() => _MakeAPlanOneScreenState();
}

class _MakeAPlanOneScreenState extends State<MakeAPlanOneScreen> {
  final firestoreInstance = FirebaseFirestore.instance;
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime selectedDate = DateTime.now();
  addPlan() {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    Utils.showLoader();
    firestoreInstance
        .collection("plans")
        .doc(firebaseUser.uid)
        .collection( selectedDate.toString().split(' ')[0])
        .doc()
        .set({
      "date": selectedDate.toString().split(' ')[0],
      "city": widget.placeName,
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
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ComponentSizedBox.topMargin(size: 20),
              Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ComponentText.buildTextWidget(
                          title: '< Plan Trip',
                          color: Colors.blue,
                          fontSize: 18,
                          textAlign: TextAlign.left),
                    )),
              ),
              Stack(
                children: [
                  Center(
                    child: Container(
                      height: 130,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Color(0xffD6D6D6),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: Expanded(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.brown.shade800,
                                    radius: 40,
                                    backgroundImage: NetworkImage(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStFdB1yoP342SmgNGsgg9lfPHQN4XdpBogWA&usqp=CAU',
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    widget.placeName,
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'More',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  Icon(
                                    Icons.chevron_right,
                                    color: Colors.blue,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ComponentSizedBox.topMargin(size: 40),
              Row(
                children: [
                  ComponentSizedBox.sideMargin(size: 10),
                  Icon(
                    Icons.calendar_today,
                    color: Colors.grey,
                  ),
                  ComponentSizedBox.sideMargin(size: 5),
                  ComponentText.buildTextWidget(
                      title: 'SELECT DATE', color: Colors.grey),
                  ComponentSizedBox.sideMargin(size: 140),
                  InkWell(
                    onTap: () async {
                      DateTime dateTime = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2025),
                      );
                      setState(() {
                        selectedDate = dateTime;
                      });
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
              ComponentSizedBox.topMargin(size: 40),
              Row(
                children: [
                  ComponentSizedBox.sideMargin(size: 10),
                  Icon(
                    Icons.schedule,
                    color: Colors.grey,
                  ),
                  ComponentSizedBox.sideMargin(size: 5),
                  ComponentText.buildTextWidget(
                      title: 'SELECT TIME', color: Colors.grey),
                  ComponentSizedBox.sideMargin(size: 140),
                  InkWell(
                    onTap: () {
                      selectTime(context);
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
                              title:
                                  "${selectedTime.hour}:${selectedTime.minute}",
                              color: Colors.grey)),
                    ),
                  ),
                ],
              ),
              ComponentSizedBox.topMargin(size: 200),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
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
                              title: "Back", color: Colors.grey)),
                    ),
                  ),
                  ComponentSizedBox.sideMargin(size: 10),
                  InkWell(
                    onTap: (){
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
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  selectTime(BuildContext context) async {
    final TimeOfDay timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.input,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
      });
    }
  }
}
