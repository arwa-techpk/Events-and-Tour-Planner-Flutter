import 'package:calendar_strip/calendar_strip.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terhal/components/bottom_navigation.dart';
import 'package:terhal/components/component_button.dart';
import 'package:terhal/components/component_sized_box.dart';
import 'package:terhal/components/component_text_widgets.dart';
import 'package:terhal/constants/constants_colors.dart';
import 'package:terhal/constants/constants_strings.dart';
import 'package:terhal/helpers/utils.dart';
import 'package:terhal/models/plan.dart';
import 'package:url_launcher/url_launcher.dart';

import 'edit_place_screen.dart';

class PlanDetailScreen extends StatefulWidget {
  String selectedPlan;
  String city;
  PlanDetailScreen({this.selectedPlan});
  @override
  _PlanDetailScreenState createState() => _PlanDetailScreenState();
}

class _PlanDetailScreenState extends State<PlanDetailScreen> {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(Duration(days: 60));
  DateTime selectedDate = DateTime.now();
  List<DateTime> markedDates = [
    DateTime.now().subtract(Duration(days: 1)),
    DateTime.now().subtract(Duration(days: 2)),
    DateTime.now().add(Duration(days: 4))
  ];
  String selectedTime = '';

  bool _isDeleting = false;
  List<PlanDay> plans = [];
  final firestoreInstance = FirebaseFirestore.instance;
  onSelect(data) {
    selectedDate = data;
    selectedTime = data.toString().split(' ')[0];
    print(selectedTime);
    print("Selected Date -> $data");
  }

  onWeekSelect(data) {
    print("Selected week starting at -> $data");
  }

  getData() {
    firestoreInstance
        .collection('get_a_plan')
        .doc(widget.selectedPlan)
        .collection(widget.selectedPlan)
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        firestoreInstance
            .collection('get_a_plan')
            .doc(widget.selectedPlan)
            .collection(widget.selectedPlan)
            .doc('Plan')
            .collection('days')
            .get()
            .then((querySnapshot) {
          querySnapshot.docs.forEach((result1) {
            print(result1.id);
            PlanDay planDay = PlanDay(plans: [], title:result1.id);

            /*   print(result['name']);
            plans.add(PlanLocation(
                name: result[ConstantString.name],
                location: result[ConstantString.location])); */
            //setState(() {});
            firestoreInstance
                .collection('get_a_plan')
                .doc(widget.selectedPlan)
                .collection(widget.selectedPlan)
                .doc('Plan')
                .collection('days')
                .doc(result1.id)
                .collection('places')
                .get()
                .then((querySnapshot) {
              querySnapshot.docs.forEach((result3) {
                print(result3['name']);

                planDay.plans.add(PlanLocation(
                  name: result3[ConstantString.name],
                  location: result3[ConstantString.location],
                  id: result3.id.toString()
                ));

                setState(() {});
              });
              plans.add(planDay);
            });
          });
        });
      });
    });
  }

  _monthNameWidget(monthName) {
    return Container(
      child: Text(
        monthName,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
          fontStyle: FontStyle.italic,
        ),
      ),
      padding: EdgeInsets.only(top: 8, bottom: 4),
    );
  }

  getMarkedIndicatorWidget() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        margin: EdgeInsets.only(left: 1, right: 1),
        width: 7,
        height: 7,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
      ),
      Container(
        width: 7,
        height: 7,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
      )
    ]);
  }

  dateTileBuilder(
      date, selectedDate, rowIndex, dayName, isDateMarked, isDateOutOfRange) {
    bool isSelectedDate = date.compareTo(selectedDate) == 0;
    Color fontColor = isDateOutOfRange ? Colors.black26 : Colors.black87;
    TextStyle normalStyle =
        TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: fontColor);
    TextStyle selectedStyle = TextStyle(
        fontSize: 17, fontWeight: FontWeight.w800, color: Colors.black87);
    TextStyle dayNameStyle = TextStyle(fontSize: 14.5, color: fontColor);
    List<Widget> _children = [
      Text(dayName, style: dayNameStyle),
      Text(date.day.toString(),
          style: !isSelectedDate ? normalStyle : selectedStyle),
    ];

    if (isDateMarked == true) {
      _children.add(getMarkedIndicatorWidget());
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 8, left: 5, right: 5, bottom: 5),
      decoration: BoxDecoration(
        color: !isSelectedDate ? Colors.transparent : Colors.white70,
        borderRadius: BorderRadius.all(Radius.circular(60)),
      ),
      child: Column(
        children: _children,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedTime = selectedDate.toString().split(' ')[0];
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstantColor.medblue,
        title: Text('Plan Detail 1'),
        actions: [
          _isDeleting
              ? Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
              right: 16.0,
            ),
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.redAccent,
              ),
              strokeWidth: 3,
            ),
          )
              : IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.redAccent,
              size: 32,
            ),
            onPressed: () async {
              setState(() {
                _isDeleting = true;
              });

              DocumentReference documentReferencer = firestoreInstance
                  .collection('get_a_plan')
                  .doc(widget.selectedPlan);

              await documentReferencer
                  .delete()
                  .whenComplete(() => print('Note item deleted from the database'))
                  .catchError((e) => print(e));

              setState(() {
                _isDeleting = false;
              });

              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          ComponentSizedBox.topMargin(size: 10),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return planItem(plans[index]);
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.black,
                    );
                  },
                  itemCount: plans.length)),
        ],
      ),
    );
  }

  Widget planItem(PlanDay planDay) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: ComponentText.buildTextWidget(
              title: planDay.title, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return buildItemList(planDay.plans[index],planDay.title);
            },
            itemCount: planDay.plans.length),
      ],
    );
  }

  Widget buildItemList(PlanLocation planLocation,String day) {
    return  Align(
        alignment: Alignment.topRight,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 6),
          height: 140,
          width: 300,
          decoration: BoxDecoration(
              color: ConstantColor.medblue,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40), topLeft: Radius.circular(40))),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ComponentSizedBox.topMargin(size: 20),
                ComponentText.buildTextWidget(
                    title: planLocation.name,
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                ComponentSizedBox.topMargin(size: 15),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        _launchURL(planLocation.location);
                      },
                      child: ComponentText.buildTextWidget(
                          title: 'Location',
                          textDecoration: TextDecoration.underline,
                          color: Color(0xff255EBA)),
                    ),

                    ComponentSizedBox.sideMargin(size: 140),
                  ],
                ),
                IconButton(onPressed: (){
                   Get.to(EditPlaceScreen(selectedPlan: widget.selectedPlan,day: day,planLocation: planLocation,));
                }, icon: Icon(Icons.edit,color: Colors.white,))
             ],
          ),
        ),
        )
    );
  }

  void _launchURL(String url) async {
    print(url);
    if (!await launch(url)) throw 'Could not launch $url';
  }
}