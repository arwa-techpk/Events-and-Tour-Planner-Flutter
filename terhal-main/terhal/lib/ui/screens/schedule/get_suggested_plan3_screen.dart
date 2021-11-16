import 'package:calendar_strip/calendar_strip.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terhal/components/component_button.dart';
import 'package:terhal/components/component_sized_box.dart';
import 'package:terhal/components/component_text_widgets.dart';
import 'package:terhal/constants/constants_colors.dart';

class GetSuggestedPlanThreeScreen extends StatefulWidget {
  @override
  _GetSuggestedPlanThreeScreenState createState() =>
      _GetSuggestedPlanThreeScreenState();
}

class _GetSuggestedPlanThreeScreenState
    extends State<GetSuggestedPlanThreeScreen> {
  DateTime startDate = DateTime.now().subtract(Duration(days: 2));
  DateTime endDate = DateTime.now().add(Duration(days: 2));
  DateTime selectedDate = DateTime.now().subtract(Duration(days: 0));
  List<DateTime> markedDates = [
    DateTime.now().subtract(Duration(days: 1)),
    DateTime.now().subtract(Duration(days: 2)),
    DateTime.now().add(Duration(days: 4))
  ];

  onSelect(data) {
    selectedDate = data;
    print("Selected Date -> $data");
  }

  onWeekSelect(data) {
    print("Selected week starting at -> $data");
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
  Widget build(BuildContext context) {
    return Scaffold(
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
                  ComponentSizedBox.topMargin(size: 40),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.chevron_left,
                          color: Colors.blue,
                        ),
                      ),
                      ComponentText.buildTextWidget(
                          title: 'Plan Trip', color: Colors.blue)
                    ],
                  ),
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

                  CalendarStrip(
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
                  ComponentSizedBox.topMargin(size: 20),

                  ComponentButton.buildTransparentButton(
                      height: 50,
                      width: 130,
                      title: 'Add',
                      fontsize: 20,
                      radius: 30,
                      btnColor: ConstantColor.medblue,
                      borderColor: ConstantColor.medblue,
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
                    return buildItemList();
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.black,
                    );
                  },
                  itemCount: 5)),
        ],
      ),
    );
  }

  Widget buildItemList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: RotatedBox(
            quarterTurns: -1,
            child: Text('11:0AM - 11:30AM'),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 6),
            height: 140,
            width: 300,
            decoration: BoxDecoration(
                color: ConstantColor.medblue,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    topLeft: Radius.circular(40))),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ComponentSizedBox.topMargin(size: 20),
                  ComponentText.buildTextWidget(
                      title: 'Ward Restaurant',
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  ComponentSizedBox.topMargin(size: 15),
                  ComponentText.buildTextWidget(
                    title: 'Place type: Restaurant',
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  ComponentSizedBox.topMargin(size: 15),
                  Row(
                    children: [
                      ComponentText.buildTextWidget(
                          title: 'Location',
                          textDecoration: TextDecoration.underline,
                          color: Color(0xff255EBA)),
                      ComponentSizedBox.sideMargin(size: 140),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Color(0xff336C7E),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.chevron_right_rounded,
                            color: Colors.white),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
