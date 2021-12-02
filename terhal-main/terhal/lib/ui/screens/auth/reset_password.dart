import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:terhal/components/component_form_fields.dart';
import 'package:terhal/config/validations.dart';
import 'package:terhal/constants/constants_colors.dart';
import 'package:terhal/controllers/auth/auth_service.dart';
import 'package:terhal/utils/size_config.dart';
import 'package:terhal/utils/utils.dart';

class Restpassword extends StatefulWidget {
  Restpassword({
    Key key,
  }) : super(key: key);

  @override
  State<Restpassword> createState() => _RestpasswordState();
}

class _RestpasswordState extends State<Restpassword> {
  final TextEditingController _emailcontroller = new TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  Auth auth = Auth();
  void resetPassword() async {
    Utils.showLoader();
    try {
      await auth.resetPassword(_emailcontroller.text, context);
      Utils.hideLoader();
    } catch (e) {
      Utils.hideLoader();
    } finally {
      Utils.hideLoader();
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
        appBar: AppBar(
        backgroundColor: ConstantColor.medblue,
        title: Text('Reset Password'),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          //blue design at the top
          Expanded(
            child: Pinned.fromPins(
              Pin(start: -38.7, end: 0.0),
              Pin(size: 229.4, start: -38.2),
              child: SvgPicture.string(
                _svg_v7cx4a,
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Pinned.fromPins(
              Pin(start: -14.7, end: -37.7),
              Pin(size: 259.1, start: -53.1),
              child: SvgPicture.string(
                _svg_lswb3p,
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Pinned.fromPins(
              Pin(start: -69.7, end: -69.7),
              Pin(size: 208.3, start: -68.4),
              child: SvgPicture.string(
                _svg_vd0i5c,
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
              ),
            ),
          ),

          Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               
               
                Text(
                  'Enter your e-mail address and we will send you\nfuther instructions on how to rest the password  ',
                  style: TextStyle(
                    fontFamily: 'PT Mono',
                    fontSize: 12,
                    color: const Color(0x96000000),
                    letterSpacing: -0.2879999542236328,
                    fontWeight: FontWeight.w700,
                    height: 1.8333333333333333,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  textAlign: TextAlign.center,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: FormFieldComponent.formField(
                        hint: 'Enter your e-mail',
                        controller: _emailcontroller,
                        onSaved: (val) {},
                        validator: (value) {
                          return Validation.validateValue(value, 'Email',true);
                        })),
                Container(
                  child: ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
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
                        resetPassword();
                      }
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

const String _svg_v7cx4a =
    '<svg viewBox="-38.7 -38.2 413.7 229.4" ><path transform="matrix(-1.0, 0.0, 0.0, -1.0, 375.0, 191.14)" d="M 0 172.0567321777344 L 0 0 C 14.63369274139404 18.50341796875 31.07233238220215 35.37575531005859 48.86127471923828 50.14600372314453 C 66.78348541259766 65.0269775390625 86.16084289550781 77.84320831298828 106.4543838500977 88.23825836181641 C 127.1222305297852 98.82523345947266 148.8758239746094 106.9673233032227 171.1115417480469 112.4402160644531 C 193.9625854492188 118.0639114379883 217.5309295654297 120.9150619506836 241.1619720458984 120.9150619506836 C 272.2951049804688 120.9150619506836 303.0656433105469 115.9990921020508 332.6191101074219 106.3031387329102 C 361.2398071289062 96.9124755859375 388.5297546386719 83.11302947998047 413.7315368652344 65.28620910644531 L 413.7315368652344 88.67073822021484 C 362.1512145996094 173.3061981201172 271.9536437988281 229.3876800537109 169.3036651611328 229.3876800537109 C 106.1193237304688 229.3876800537109 47.64710235595703 208.1342926025391 0 172.0567321777344 Z" fill="#56a1af" fill-opacity="0.5" stroke="none" stroke-width="1" stroke-opacity="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_lswb3p =
    '<svg viewBox="-14.7 -53.1 427.5 259.1" ><path transform="translate(-14.73, -53.1)" d="M 0 64.75787353515625 L 0 259.1036376953125 C 15.11937427520752 238.2031860351562 32.10360336303711 219.1451263427734 50.48295211791992 202.4614562988281 C 68.99998474121094 185.6527404785156 89.02046203613281 171.1762390136719 109.987548828125 159.4345703125 C 131.3413391113281 147.4761047363281 153.8169250488281 138.2792663574219 176.7906494140625 132.0973968505859 C 200.4001007080078 125.7451934814453 224.7506408691406 122.5246734619141 249.1660003662109 122.5246734619141 C 281.3324584960938 122.5246734619141 313.1241760253906 128.0774688720703 343.6585693359375 139.0294952392578 C 373.2291259765625 149.6366424560547 401.4248352050781 165.2237548828125 427.4630737304688 185.3599700927734 L 427.4630737304688 158.946044921875 C 374.1708068847656 63.34655380249023 280.9796142578125 1.757990867190529e-05 174.9227294921875 1.757990867190529e-05 C 109.6413650512695 1.757990867190529e-05 49.22847747802734 24.00663757324219 0 64.75787353515625 Z" fill="#56a1af" fill-opacity="0.5" stroke="none" stroke-width="1" stroke-opacity="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_vd0i5c =
    '<svg viewBox="-69.7 -68.4 514.5 208.3" ><path transform="matrix(-1.0, 0.0, 0.0, -1.0, 444.75, 139.87)" d="M 0 156.2105255126953 L 0 0 C 18.19787406921387 16.79926681518555 38.64031600952148 32.11768341064453 60.76192855834961 45.52761459350586 C 83.04926300048828 59.0380744934082 107.1461715698242 70.67393493652344 132.3824157714844 80.11161041259766 C 158.0841064453125 89.72354125976562 185.1360168457031 97.11576080322266 212.7874603271484 102.084602355957 C 241.2041168212891 107.1903610229492 270.5127258300781 109.7789306640625 299.8993835449219 109.7789306640625 C 338.6152648925781 109.7789306640625 376.8802795410156 105.3157119750977 413.6318359375 96.51274108886719 C 449.2233276367188 87.98696136474609 483.1600646972656 75.45841979980469 514.5 59.2734260559082 L 514.5 80.50426483154297 C 450.3567504882812 157.3448944091797 338.1906433105469 208.2613372802734 210.5392303466797 208.2613372802734 C 131.9657592773438 208.2613372802734 59.25202560424805 188.9653930664062 0 156.2105255126953 Z" fill="#336c7e" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
