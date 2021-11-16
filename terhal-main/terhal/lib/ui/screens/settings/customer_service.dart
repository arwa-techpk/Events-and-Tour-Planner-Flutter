import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Customerservice extends StatelessWidget {
  Customerservice({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 317.0, end: 20.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                ),
                color: const Color(0x8056a1af),
              ),
            ),
          ),
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
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 317.0, end: -2.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                ),
                color: const Color(0x8056a1af),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 278.0, start: 35.0),
            Pin(size: 56.0, start: 71.0),
            child: Text(
              'Contact Us ',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 50,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 46.0, end: 20.0),
            Pin(size: 37.0, middle: 0.1776),
            child: Text(
              'Feel free to contact us any time.\nWe will get back to you as soon as we can !',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 16,
                color: const Color(0xff868484),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 46.0, end: 46.0),
            Pin(size: 1.0, middle: 0.2805),
            child: SvgPicture.string(
              _svg_fi4f3p,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 46.0, end: 46.0),
            Pin(size: 1.0, middle: 0.3434),
            child: SvgPicture.string(
              _svg_u4csc5,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 46.0, end: 46.0),
            Pin(size: 1.0, middle: 0.4063),
            child: SvgPicture.string(
              _svg_uxj3rf,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 154.0, middle: 0.5023),
            Pin(size: 66.0, middle: 0.4932),
            child: Container(
                      child: ElevatedButton(
                              child: Text(
                                'Send',
                                style: TextStyle(
                                fontSize: 30,
                                
                                ),
                              ),
                            
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xff56a1af),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)), 
                                       ),
                              onPressed: () {},   
                              
                                ),
                  ),
          ),
         
          Pinned.fromPins(
            Pin(size: 70.0, middle: 0.1),
            Pin(size: 100.0, middle: 0.2544),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Name',
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 70.0, start: 40.0),
            Pin(size: 100.0, middle: 0.3177),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                decoration: InputDecoration(
              border: InputBorder.none,
                  hintText: 'e-mail',
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 87.0, start: 40.0),
            Pin(size: 100.0, middle: 0.3823),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Message',
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 46.0, end: 24.0),
            Pin(size: 54.0, middle: 0.7004),
            child: Text(
              'Information ',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 50,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 53.0, end: 33.0),
            Pin(size: 107.0, end: 109.0),
            child: Text(
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
          ),
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
