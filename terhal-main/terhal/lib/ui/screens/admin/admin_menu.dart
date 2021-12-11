import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terhal/components/component_button.dart';
import 'package:terhal/components/component_sized_box.dart';
import 'package:terhal/constants/constants_colors.dart';
import 'package:terhal/ui/screens/admin/add_place_event.dart';
import 'package:terhal/ui/screens/admin/plan_list.dart';
import 'package:terhal/ui/screens/admin/slelect_plan_screen.dart';
import 'package:terhal/utils/size_config.dart';
import '../pref_manager.dart';
import 'package:terhal/controllers/auth/auth_service.dart';
import 'package:terhal/ui/screens/auth/welcome_screen.dart';

class AdminMenu extends StatefulWidget {
  const AdminMenu({Key key}) : super(key: key);

  @override
  _AdminMenuState createState() => _AdminMenuState();
}

class _AdminMenuState extends State<AdminMenu> {
  Auth auth = Auth();
  Future<void> _signOut() async {
    try {
      await auth.signOut();
      await Get.find<PrefManager>().save('email', null);
      await Get.find<PrefManager>().save('user', null);
      Get.offAll(WelcomeScreen());
    } catch (e) {
      print(e.toString());
    }
  }
  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Logout'),
            content: Text('Are you sure that you want to logout?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Logout'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('Cancel'),
              ),
            ],
          );
        });
    if (didRequestSignOut == true) {
      _signOut();
    }
  }

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
            ComponentSizedBox.topMargin(size: 16),
            ComponentButton.buildButton(
                title: 'Sign Out',
                height: 60,
                btnColor: ConstantColor.lightblue,
                onPressed: () {
                  _confirmSignOut(context);
                }),
          ],
        ),
      ),
    );
  }
}
