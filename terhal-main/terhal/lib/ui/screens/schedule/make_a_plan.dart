import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:get/get.dart';
import 'package:terhal/components/component_sized_box.dart';
import 'package:terhal/ui/screens/schedule/get_plan_screen.dart';
import 'package:terhal/ui/screens/schedule/get_suggested_plan2.dart';
import 'package:terhal/ui/screens/schedule/search_plan.dart';

class Planatrip extends StatelessWidget {
  Planatrip({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Column(
            children: [
              ComponentSizedBox.topMargin(size: 60),
              Center(
                child: Container(
                  height: 200,
                  width: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: const AssetImage(
                          'image/images/plan.png',
                        ),
                        fit: BoxFit.contain),
                  ),
                ),
              ),
            ],
          ),
          Pinned.fromPins(
            Pin(start: 61.0, end: 60.0),
            Pin(size: 84.0, middle: 0.5907),
            child: Container(
              child: ElevatedButton(
                child: Text(
                  'Get a Plan',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff56a1af),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0)),
                ),
                onPressed: () {
                  Get.to(GetPlanScreen());
                },
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 61.0, end: 60.0),
            Pin(size: 84.0, middle: 0.7912),
            child: Container(
              child: ElevatedButton(
                child: Text(
                  'Make a Plan',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffd6d6d6),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0)),
                ),
                onPressed: () {
                  Get.to(Searchaplan());
                },
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomMenu(),
    );
  }
}
