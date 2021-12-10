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

class GetSuggestedPlanThreeScreen extends StatefulWidget {
  String selectedBudget;
  String city;
  GetSuggestedPlanThreeScreen({this.selectedBudget, this.city});
  @override
  _GetSuggestedPlanThreeScreenState createState() =>
      _GetSuggestedPlanThreeScreenState();
}

class _GetSuggestedPlanThreeScreenState
    extends State<GetSuggestedPlanThreeScreen> {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(Duration(days: 60));
  DateTime selectedDate = DateTime.now();
  List<DateTime> markedDates = [
    DateTime.now().subtract(Duration(days: 1)),
    DateTime.now().subtract(Duration(days: 2)),
    DateTime.now().add(Duration(days: 4))
  ];
  String selectedTime = '';
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

  addPlan() {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    Utils.showLoader();
    firestoreInstance
        .collection("plans")
        .doc(firebaseUser.uid)
        .collection(selectedTime)
        .doc()
        .set({
      "date": selectedDate,
      "city": widget.city,
      "location": '',
      "plan_type": widget.selectedBudget,
    }).then((_) {
      Utils.hideLoader();
      Get.offAll(BottomNavigation(
        isPlan: true,
      ));

      print("success!");
    });
  }

  getData() {
    firestoreInstance
        .collection(widget.selectedBudget)
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        firestoreInstance
            .collection(widget.selectedBudget)
            .doc(result.id)
            .collection('days')
            .get()
            .then((querySnapshot) {
          querySnapshot.docs.forEach((result1) {
            print(result1['title']);
            PlanDay planDay = PlanDay(plans: [], title: result1['title']);

            /*   print(result['name']);
            plans.add(PlanLocation(
                name: result[ConstantString.name],
                location: result[ConstantString.location])); */
            //setState(() {});
            firestoreInstance
                .collection(widget.selectedBudget)
                .doc(result.id)
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
    print(widget.selectedBudget);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstantColor.medblue,
        title: Text('Plan Trip'),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              color: ConstantColor.medgrey,
            ),
            child: Card(
              color: ConstantColor.lightgrey,
              child: Column(
                children: [
                  ComponentSizedBox.topMargin(size: 20),
                  Container(
                    child: Column(
                      children: [],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ComponentText.buildTextWidget(
                            title: 'My Plan',
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                        ComponentText.buildTextWidget(
                            title: '2021',
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    child: CalendarStrip(
                      startDate: startDate,
                      endDate: endDate,
                      selectedDate: selectedDate,
                      onDateSelected: onSelect,
                      onWeekSelected: onWeekSelect,
                      dateTileBuilder: dateTileBuilder,
                      iconColor: Colors.black87,
                      monthNameWidget: _monthNameWidget,
                      containerDecoration: BoxDecoration(
                        color: ConstantColor.lightgrey,
                      ),
                    ),
                  ),
                  ComponentSizedBox.topMargin(size: 20),
                  ComponentButton.buildTransparentButton(
                      height: 50,
                      width: 130,
                      title: 'Add',
                      fontsize: 20,
                      radius: 30,
                      btnColor: ConstantColor.medblue,
                      borderColor: ConstantColor.medblue,
                      onPressed: () {
                        addPlan();
                      },
                      texColor: Colors.white)
                ],
              ),
            ),
          ),
          Divider(
            height: 1.0,
            thickness: 1,
          ),
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
              return buildItemList(planDay.plans[index]);
            },
            itemCount: planDay.plans.length),
      ],
    );
  }

  Widget buildItemList(PlanLocation planLocation) {
    return Align(
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
              )
            ],
          ),
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    print(url);
    if (!await launch(url)) throw 'Could not launch $url';
  }
}
