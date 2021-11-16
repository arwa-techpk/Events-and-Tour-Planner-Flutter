import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terhal/components/component_button.dart';
import 'package:terhal/components/component_form_fields.dart';
import 'package:terhal/components/component_sized_box.dart';
import 'package:terhal/config/validations.dart';
import 'package:terhal/constants/constants_colors.dart';
import 'package:terhal/controllers/auth/login/login_controller.dart';
import 'package:terhal/models/login_request_model.dart';
import 'package:terhal/utils/size_config.dart';

class LoginScreen extends StatelessWidget {
  static const id = 'LoginScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ConstantColor.APP_COLOR,
        body: SafeArea(
          minimum: const EdgeInsets.all(16),
          child: Container(
            decoration: BoxDecoration(),
            child: _SignInForm(),
          ),
        ));
  }
}

class _SignInForm extends StatefulWidget {
  @override
  __SignInFormState createState() => __SignInFormState();
}

class __SignInFormState extends State<_SignInForm> {
  final _controller = Get.put(LoginController());

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _driverController = TextEditingController();
  final _vehicleController = TextEditingController();
  final _companyController = TextEditingController();
  bool _autoValidate = false;

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
                  controller: _companyController,
                  hint: 'Company ID',
                  keyboardType: TextInputType.text,
                  iconField: Icons.lock,
                  validator: (value) {
                    return Validation.validateValue(value, 'Company ID', false);
                  },
                ),
              ),
              ComponentSizedBox.topMargin(size: 20),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.getMargin(30),
                ),
                child: FormFieldComponent.formField(
                  controller: _driverController,
                  hint: 'Driver ID',
                  isObscure: false,
                  keyboardType: TextInputType.text,
                  iconField: Icons.lock,
                  validator: (value) {
                    return Validation.validateValue(value, 'Driver ID', false);
                  },
                ),
              ),
              ComponentSizedBox.topMargin(size: 20),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.getMargin(30),
                ),
                child: FormFieldComponent.formField(
                  controller: _vehicleController,
                  hint: 'Vehicle ID',
                  isObscure: false,
                  keyboardType: TextInputType.text,
                  iconField: Icons.lock,
                  validator: (value) {
                    return Validation.validateValue(value, 'Vehicle ID', false);
                  },
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ComponentButton.buildButton(
                width: SizeConfig.getHeight(200.0),
                height: SizeConfig.getHeight(44.0),
                title: 'Login',
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
    LoginRequestModel loginRequestModel=  LoginRequestModel(companyID: _companyController.text,driverID: _driverController.text,vehicleID: _vehicleController.text);
      // Get.to(StaffProfileScreen());
      // _controller.login(_emailController.text, _passwordController.text);
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }
}
