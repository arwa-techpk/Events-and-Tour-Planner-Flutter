import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:terhal/components/component_checkBox.dart';
import 'package:terhal/components/component_sized_box.dart';
import 'package:terhal/components/component_text_widgets.dart';
import 'package:terhal/constants/constants_colors.dart';
import 'package:terhal/ui/screens/schedule/get_suggested_plan2.dart';

class GetPlanScreen extends StatefulWidget {
  @override
  _GetPlanScreenState createState() => _GetPlanScreenState();
}

class _GetPlanScreenState extends State<GetPlanScreen> {
  bool value = false;
  String _chosenValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Align(
                 alignment: Alignment.topLeft,
                 child: InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ComponentText.buildTextWidget(title: '< Plan Trip',color: Colors.blue,fontSize: 18,textAlign: TextAlign.left),
                  )),
               ),
              ComponentSizedBox.topMargin(size: 5),
          
          
              Padding(
                padding: const EdgeInsets.only(
                  left: 30.0,
                  right: 30,
                ),
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(80.0),
                        child: Image.asset(
                          'image/images/profileBackground.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        ComponentSizedBox.topMargin(size: 40),
                        Center(
                          child: Container(
                            height: 100,
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Color(0xffDCF1F5),
                            ),
                            child: Column(
                              children: [
                                ComponentSizedBox.topMargin(size: 25),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 10),
                                    child: ComponentText.buildTextWidget(
                                        title:
                                            'Choose from the information\nshown bleow',
                                        fontSize: 18,
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              ComponentSizedBox.topMargin(size: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ComponentText.buildTextWidget(
                      title: 'Budget',
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                  ComponentSizedBox.sideMargin(size: 5),
                  ComponentText.buildTextWidget(
                      title: '(per day)', fontWeight: FontWeight.bold)
                ],
              ),
              ComponentSizedBox.topMargin(size: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xffE5EEF0),
                ),
                child: Row(
                  children: [
                    Row(
                      children: [
                        CustomCheckBox(
                          onChanged: (value) {},
                        ),
                        ComponentText.buildTextWidget(
                            title: '250-500',
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ],
                    ),
                    Row(
                      children: [
                        CustomCheckBox(
                          onChanged: (value) {},
                        ),
                        ComponentText.buildTextWidget(
                            title: '600-1000',
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ],
                    ),
                    Row(
                      children: [
                        CustomCheckBox(
                          onChanged: (value) {},
                        ),
                        ComponentText.buildTextWidget(
                            title: '1000+',
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ],
                    ),
                  ],
                ),
              ),
              ComponentSizedBox.topMargin(size: 10),
              Divider(
                height: 20,
                thickness: 2,
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
                        CustomCheckBox(
                          onChanged: (value) {},
                        ),
                        ComponentText.buildTextWidget(
                            title: '3 Days',
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ],
                    ),
                    Row(
                      children: [
                        CustomCheckBox(
                          onChanged: (value) {},
                        ),
                        ComponentText.buildTextWidget(
                            title: '5 Days',
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ],
                    ),
                    Row(
                      children: [
                        CustomCheckBox(
                          onChanged: (value) {},
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
                height: 20,
                thickness: 2,
              ),
              ComponentSizedBox.topMargin(size: 10),
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
                      border: Border.all(width: 2,color: Colors.black.withOpacity(0.4)),
                      borderRadius: BorderRadius.circular(20)
                    ),
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
                                'Riyad',
                                'Jeddah',
                                'Madina',
                                'Makka',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(color: Colors.black, fontSize: 22),
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
                            IconButton(onPressed: (){
                              Get.to( Get.to(GetSuggestedPlanTwoScreen()));

                            }, icon: Icon(Icons.arrow_forward_ios_sharp))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
