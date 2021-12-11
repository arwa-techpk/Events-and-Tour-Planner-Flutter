import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:terhal/common_widgets/validators.dart';
import 'package:terhal/components/component_button.dart';
import 'package:terhal/components/component_form_fields.dart';
import 'package:terhal/components/component_sized_box.dart';
import 'package:terhal/constants/constants_colors.dart';
import 'package:terhal/controllers/auth/login/login_controller.dart';
import 'package:terhal/helpers/utils.dart';
import 'package:terhal/utils/size_config.dart';

class AddPlaceScreen extends StatefulWidget {
  int day;
  String selectedPlan;
  String city;
  AddPlaceScreen({this.day, this.selectedPlan, this.city});

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstantColor.medblue,
        title: Text('Day ${widget.day}'),
      ),
      body: Container(
        margin: EdgeInsets.all(24),
        child: _SignInForm(
          day: widget.day,
          selectedPlan: widget.selectedPlan,
          city: widget.city,
        ),
      ),
    );
  }
}

class _SignInForm extends StatefulWidget {
  int day;
  String selectedPlan;
  String city;
  _SignInForm({this.day, this.selectedPlan, this.city});
  @override
  __SignInFormState createState() => __SignInFormState();
}

class __SignInFormState extends State<_SignInForm> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  final firestoreInstance = FirebaseFirestore.instance;

  bool _autoValidate = false;
  addPlan() {
    Utils.showLoader();
    firestoreInstance
        .collection('get_a_plan')
        .doc(widget.selectedPlan)
        .collection(widget.selectedPlan)
        .doc('plan')
        .collection('days')
        .doc('Day ${widget.day}')
        .collection('places')
        .doc()
        .set({
      "name": _nameController.text,
      "location": _locationController.text,
    }).then((_) {
      Utils.hideLoader();
      Navigator.of(context).pop();
      print("success!");
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Center(
      child: Form(
        key: _key,
        autovalidateMode:
            _autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.getMargin(30),
                ),
                child: FormFieldComponent.formField(
                  controller: _nameController,
                  hint: 'Eneter Name',
                  keyboardType: TextInputType.text,
                  iconField: Icons.lock,
                  validator: (value) {
                    return Validation.validateValue(value, 'Name', false);
                  },
                ),
              ),
              ComponentSizedBox.topMargin(size: 20),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.getMargin(30),
                ),
                child: FormFieldComponent.formField(
                  controller: _locationController,
                  hint: 'Eneter Location',
                  isObscure: false,
                  keyboardType: TextInputType.text,
                  iconField: Icons.lock,
                  validator: (value) {
                    return Validation.validateValue(value, 'Location', false);
                  },
                ),
              ),
              ComponentSizedBox.topMargin(size: 20),
              const SizedBox(
                height: 50,
              ),
              ComponentButton.buildButton(
                btnColor: ConstantColor.medblue,
                width: SizeConfig.getHeight(200.0),
                height: SizeConfig.getHeight(44.0),
                title: 'Add',
                onPressed: _onLoginButtonPressed,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onLoginButtonPressed() {
    if (_key.currentState.validate()) {
      addPlan();
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }
}
