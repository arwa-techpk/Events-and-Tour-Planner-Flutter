import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terhal/components/component_button.dart';
import 'package:terhal/components/component_sized_box.dart';
import 'package:terhal/constants/constants_colors.dart';
import 'package:terhal/ui/screens/admin/add_place_event.dart';
import 'package:terhal/ui/screens/admin/plan_list.dart';
import 'package:terhal/ui/screens/admin/slelect_plan_screen.dart';
import 'package:terhal/utils/size_config.dart';

class AdminMenu extends StatefulWidget {
  const AdminMenu({Key key}) : super(key: key);

  @override
  _AdminMenuState createState() => _AdminMenuState();
}

class _AdminMenuState extends State<AdminMenu> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstantColor.medblue,
        title: Text('Admin'),
      ),
      body: Container(
        margin: EdgeInsets.all(24),
        child: ListView(
          children: [
            ComponentButton.buildButton(
                title: 'Add Place',
                height: 60,
                btnColor: ConstantColor.medblue,
                onPressed: () {
                  Get.to(AddPlaceEventScreen());
                }),
            ComponentSizedBox.topMargin(size: 16),
            ComponentButton.buildButton(
                title: 'Add Plan',
                height: 60,
                btnColor: ConstantColor.medblue,
                onPressed: () {
                  Get.to(SelectPlanScreen());
                }),
            ComponentSizedBox.topMargin(size: 16),
            ComponentButton.buildButton(
                title: 'Plans',
                height: 60,
                btnColor: ConstantColor.medblue,
                onPressed: () {
                  Get.to(PlanScreen());
                }),
          ],
        ),
      ),
    );
  }
}
