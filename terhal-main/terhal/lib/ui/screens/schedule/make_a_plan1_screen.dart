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
import 'package:url_launcher/url_launcher.dart';

class MakeAPlanOneScreen extends StatefulWidget {
  String placeName;
  String placeLocation;
  MakeAPlanOneScreen({this.placeName, this.placeLocation});
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
        .collection(selectedDate.toString().split(' ')[0])
        .doc()
        .set({
      "date": selectedDate.toString().split(' ')[0],
      "city": widget.placeName,
      'location': widget.placeLocation,
      "plan_type": '',
    }).then((_) {
      Utils.hideLoader();
      Get.offAll(BottomNavigation(
        isPlan: true,
      ));

      print("success!");
    });
  }

  void _launchURL(String url) async {
    print(url);
    if (!await launch(url)) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
     print(widget.placeLocation);
    return Scaffold(
      
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ComponentSizedBox.topMargin(size: 50),
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
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                     /*  CircleAvatar(
                                        backgroundColor: Colors.brown.shade800,
                                        radius: 35,
                                        backgroundImage: NetworkImage(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStFdB1yoP342SmgNGsgg9lfPHQN4XdpBogWA&usqp=CAU',
                                        ),
                                      ), */
                                     
                                      Text(
                                        widget.placeName,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                   SizedBox(
                                    height: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      _launchURL(widget.placeLocation);
                                    },
                                    child: ComponentText.buildTextWidget(
                                        title: 'Location',
                                        textDecoration: TextDecoration.underline,
                                        color: Color(0xff255EBA)),
                                  ),
                                ],
                              ),
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
                  ],
                )
              ],
            ),
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
