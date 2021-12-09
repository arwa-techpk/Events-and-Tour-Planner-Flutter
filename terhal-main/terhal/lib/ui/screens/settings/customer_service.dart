import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:terhal/components/component_form_fields.dart';
import 'package:terhal/components/component_sized_box.dart';
import 'package:terhal/config/validations.dart';
import 'package:terhal/constants/constants_colors.dart';
import 'package:terhal/utils/size_config.dart';

class Customerservice extends StatefulWidget {
  Customerservice({
    Key key,
  }) : super(key: key);

  @override
  State<Customerservice> createState() => _CustomerserviceState();
}

class _CustomerserviceState extends State<Customerservice> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _namecontroller = new TextEditingController();
  final TextEditingController _emailPassController =
      new TextEditingController();
  final TextEditingController _messagecontroller = new TextEditingController();
   Future<void> send() async {
    final Email email = Email(
      body: _messagecontroller.text,
      subject: _namecontroller.text,
      recipients: ['terhal013@gmail.com'],

    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      platformResponse = error.toString();
    }

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(platformResponse),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstantColor.medblue,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 317.0, end: -27.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                ),
                color: const Color(0xff56a1af),
              ),
            ),
          ),
          Form(
            key: _key,
            child: Column(
              children: [
                ComponentSizedBox.topMargin(size: 50),
                Text(
                  'Contact Us ',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 50,
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
                ComponentSizedBox.topMargin(size: 10),
                Text(
                  'Feel free to contact us any time.\nWe will get back to you as soon as we can !',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 16,
                    color: const Color(0xff868484),
                  ),
                  textAlign: TextAlign.left,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: FormFieldComponent.simpleFormField(
                      hint: 'Name',
                      validator: (value) {
                        return Validation.validateValue(value, 'Name');
                      },
                      controller: _namecontroller),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: FormFieldComponent.simpleFormField(
                    hint: 'Email',
                    controller: _emailPassController,
                    validator: (value) {
                      return Validation.validateValue(value, 'Email', true);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: FormFieldComponent.simpleFormField(
                    hint: 'Message',
                    controller: _messagecontroller,
                    validator: (value) {
                      return Validation.validateValue(value, 'Message');
                    },
                  ),
                ),
                ComponentSizedBox.topMargin(size: 10),
                Container(
                  child: ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Send',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff56a1af),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0)),
                    ),
                    onPressed: () {
                      if (_key.currentState.validate()) {
                        _key.currentState.save();
                        send();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 50,
              left: 50,
              child: Container(
                child: Column(
                  children: [
                    Text(
                      'Information ',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 50,
                        color: const Color(0xffffffff),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      'By e-mail: Terhal013@gmail.com\nBy phone number: 0554441888\nBy Instagram direct message: Terhal013\nBy twitter direct message: Terhal013',
                      style: TextStyle(
                        fontFamily: 'SFProText-Regular',
                        fontSize: 17,
                        color: const Color(0xffffffff),
                        letterSpacing: -0.40800000000000003,
                        height: 1.7647058823529411,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

/*
const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your e-mail',
                ),
              ),
            ),
 */
const String _svg_fi4f3p =
    '<svg viewBox="46.0 227.5 283.0 1.0" ><path transform="translate(46.0, 227.5)" d="M 0 1 L 283 0" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_u4csc5 =
    '<svg viewBox="46.0 278.5 283.0 1.0" ><path transform="translate(46.0, 278.5)" d="M 0 1 L 283 0" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_uxj3rf =
    '<svg viewBox="46.0 329.5 283.0 1.0" ><path transform="translate(46.0, 329.5)" d="M 0 1 L 283 0" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
