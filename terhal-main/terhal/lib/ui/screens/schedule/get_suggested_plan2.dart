import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terhal/components/component_button.dart';
import 'package:terhal/components/component_checkBox.dart';
import 'package:terhal/components/component_sized_box.dart';
import 'package:terhal/components/component_text_widgets.dart';
import 'package:terhal/constants/constants_colors.dart';
import 'package:terhal/constants/constants_strings.dart';
import 'package:terhal/ui/screens/schedule/get_suggested_plan3_screen.dart';

enum BestTutorSite { low, med, high }

class GetSuggestedPlanTwoScreen extends StatefulWidget {
  @override
  _GetSuggestedPlanTwoScreenState createState() =>
      _GetSuggestedPlanTwoScreenState();
}

class _GetSuggestedPlanTwoScreenState extends State<GetSuggestedPlanTwoScreen> {
  String _chosenValue;
  String budget = '';

  BestTutorSite _site = BestTutorSite.low;
  BestTutorSite duration = BestTutorSite.low;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: ConstantColor.medblue,
        title: Text('Plan Trip'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
          children: [
            
              ComponentSizedBox.topMargin(size: 10),
              ComponentText.buildTextWidget(
                  title: 'Budget', fontSize: 26, fontWeight: FontWeight.bold),
              ComponentSizedBox.topMargin(size: 20),
              Container(
                height: 70,
                width: 330,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xffE5EEF0),
                ),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: BestTutorSite.low,
                          groupValue: _site,
                          onChanged: (BestTutorSite value) {
                            print(value);
                            setState(() {
                              _site = value;
                            });
                          },
                        ),
                        ComponentText.buildTextWidget(
                            title: 'Low',
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: BestTutorSite.med,
                          groupValue: _site,
                          onChanged: (BestTutorSite value) {
                            setState(() {
                              _site = value;
                            });
                          },
                        ),
                        ComponentText.buildTextWidget(
                            title: 'Medium',
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: BestTutorSite.high,
                          groupValue: _site,
                          onChanged: (BestTutorSite value) {
                            setState(() {
                              _site = value;
                            });
                          },
                        ),
                        ComponentText.buildTextWidget(
                            title: 'High',
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ],
                    ),
                  ],
                ),
              ),
              ComponentSizedBox.topMargin(size: 10),
              Divider(
                color: Colors.black,
              ),
              ComponentSizedBox.topMargin(size: 10),
              ComponentText.buildTextWidget(
                  title: 'Duration', fontSize: 26, fontWeight: FontWeight.bold),
              ComponentSizedBox.topMargin(size: 20),
              Container(
                height: 70,
                width: 330,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xffE5EEF0),
                ),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: BestTutorSite.low,
                          groupValue: duration,
                          onChanged: (BestTutorSite value) {
                            print(value);
                            setState(() {
                              duration = value;
                            });
                          },
                        ),
                        ComponentText.buildTextWidget(
                            title: '3 Days',
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: BestTutorSite.med,
                          groupValue: duration,
                          onChanged: (BestTutorSite value) {
                            setState(() {
                              duration = value;
                            });
                          },
                        ),
                        ComponentText.buildTextWidget(
                            title: '5 Days',
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: BestTutorSite.high,
                          groupValue: duration,
                          onChanged: (BestTutorSite value) {
                            setState(() {
                              duration = value;
                            });
                          },
                        ),
                        ComponentText.buildTextWidget(
                            title: '1 Week',
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ],
                    ),
                  ],
                ),
              ),
              ComponentSizedBox.topMargin(size: 10),
              Divider(
                color: Colors.black,
              ),
              ComponentSizedBox.topMargin(size: 30),
              ComponentText.buildTextWidget(
                  title: 'Destination',
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
              ComponentSizedBox.topMargin(size: 10),
              Container(
                height: 90,
                margin: EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xffE5EEF0),
                ),
                child: Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            width: 2, color: Colors.black.withOpacity(0.4)),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 60),
                          child: DropdownButton<String>(
                            focusColor: Colors.white,

                            value: _chosenValue,
                            //elevation: 5,
                            style: TextStyle(color: Colors.white),
                            iconEnabledColor: Colors.black,
                            items: <String>[
                              'Riyadh',
                              'Al Khobar',
                              'Jeddah',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 22),
                                ),
                              );
                            }).toList(),
                            hint: Text(
                              "Riyadh",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500),
                            ),
                            onChanged: (String value) {
                              setState(() {
                                _chosenValue = value;
                              });
                            },
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 30),
                              height: 50,
                              width: 2,
                              color: Colors.black.withOpacity(0.4),
                            ),
                            IconButton(
                                onPressed: () {
                                  Get.to(Get.to(GetSuggestedPlanTwoScreen()));
                                },
                                icon: Icon(Icons.arrow_forward_ios_sharp))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              ComponentSizedBox.topMargin(size: 30),
              ComponentButton.buildTransparentButton(
                  height: 60,
                  width: 200,
                  title: 'Send',
                  fontsize: 30,
                  radius: 30,
                  btnColor: ConstantColor.medblue,
                  borderColor: ConstantColor.medblue,
                  onPressed: () {
                    String selectedBudget = ConstantString.plan_low_riyadh_3;
                    if (_site == BestTutorSite.low &&
                        duration == BestTutorSite.low) {
                      selectedBudget = ConstantString.plan_low_riyadh_3;
                    } else if (_site == BestTutorSite.low &&
                        duration == BestTutorSite.med) {
                      selectedBudget = ConstantString.plan_low_riyadh_5;
                    } else if (_site == BestTutorSite.low &&
                        duration == BestTutorSite.high) {
                      selectedBudget = ConstantString.plan_low_riyadh_7;
                    } else if (_site == BestTutorSite.med &&
                        duration == BestTutorSite.low) {
                      selectedBudget = ConstantString.plan_medium_riyadh_3;
                    } else if (_site == BestTutorSite.med &&
                        duration == BestTutorSite.med) {
                      selectedBudget = ConstantString.plan_medium_riyadh_5;
                    } else if (_site == BestTutorSite.med &&
                        duration == BestTutorSite.high) {
                      selectedBudget = ConstantString.plan_medium_riyadh_7;
                    } else if (_site == BestTutorSite.high &&
                        duration == BestTutorSite.low) {
                      selectedBudget = ConstantString.plan_high_riyadh_3;
                    } else if (_site == BestTutorSite.high &&
                        duration == BestTutorSite.med) {
                      selectedBudget = ConstantString.plan_high_riyadh_5;
                    } else if (_site == BestTutorSite.high &&
                        duration == BestTutorSite.high) {
                      selectedBudget = ConstantString.plan_high_riyadh_7;
                    }
                    Get.to(GetSuggestedPlanThreeScreen(
                      selectedBudget: selectedBudget,
                    ));
                  },
                  texColor: Colors.white)
            ],
          ),
        ),
      ),
    );
  }
}
