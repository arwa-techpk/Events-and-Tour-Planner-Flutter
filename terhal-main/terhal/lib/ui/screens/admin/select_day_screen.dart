import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terhal/components/component_text_widgets.dart';
import 'package:terhal/constants/constants_colors.dart';
import 'package:terhal/ui/screens/admin/add_place_screen.dart';

class SelectDayScreen extends StatefulWidget {
  String selectPlan, city;
  SelectDayScreen({this.selectPlan, this.city});

  @override
  _SelectDayScreenState createState() => _SelectDayScreenState();
}

class _SelectDayScreenState extends State<SelectDayScreen> {
  int noOfDays = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    noOfDays = int.parse(widget.selectPlan.split('_')[2]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstantColor.medblue,
        title: const Text('Select Day'),
      ),
      body: Container(
        height: 70,
        margin: EdgeInsets.only(top: 50, left: 16),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: noOfDays,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  Get.to(AddPlaceScreen(selectedPlan: widget.selectPlan,day: index+1,city: widget.city,));
                },
                child: Container(
                  margin: EdgeInsets.all(8),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: ConstantColor.medblue,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: ComponentText.buildTextWidget(
                          title: (index + 1).toString(),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              );
            }),
      ),
    );
  }
}
