
import 'package:adobe_xd/adobe_xd.dart';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:terhal/components/bottom_navigation.dart';
import 'package:terhal/components/component_sized_box.dart';
import 'package:terhal/components/component_text_widgets.dart';
import 'package:terhal/constants/constants_colors.dart';
import 'package:terhal/constants/constants_strings.dart';
import 'package:terhal/ui/screens/admin/slelect_plan_screen.dart';
import 'package:terhal/ui/screens/auth/welcome_screen.dart';
import 'package:terhal/ui/screens/login_screen.dart';
import 'package:terhal/ui/screens/pref_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'admin/admin_menu.dart';
import 'auth/sigin_in.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () async {
      String user = await Get.find<PrefManager>().read('user');
      print(user);
      if (user != null) {
        Get.offAll(AdminMenu());
      } else {
       // Navigator.popAndPushNamed(context, SignIn.id);
       Get.offAll(const WelcomeScreen());
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        // For Android.
        // Use [light] for white status bar and [dark] for black status bar.
        statusBarIconBrightness: Brightness.light,
        // For iOS.
        // Use [dark] for white status bar and [light] for black status bar.
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: Container(
        child: Stack(
          children: <Widget>[
            Pinned.fromPins(
              Pin(start: -30.7, end: -8.0),
              Pin(size: 229.4, start: -100.4),
              child: SvgPicture.string(
                _svg_yb95v,
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
              ),
            ),
            Pinned.fromPins(
              Pin(start: -11.7, end: -24.0),
              Pin(size: 250.4, start: -133.4),
              child: SvgPicture.string(
                _svg_bzlg6q,
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
              ),
            ),
            Pinned.fromPins(
              Pin(start: -201.0, end: -93.0),
              Pin(start: 55.0, end: 25.0),
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(size: 379.2, end: 90.9),
                    Pin(size: 641.0, middle: 0.5097),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(56.0),
                        ),
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ),
                  Container(),
                  Pinned.fromPins(
                    Pin(size: 434.0, end: 60.0),
                    Pin(size: 209.5, end: 40.7),
                    child: SvgPicture.string(
                      _svg_ale2tv,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 482.0, end: 60.0),
                    Pin(size: 179.7, end: 84.5),
                    child: SvgPicture.string(
                      _svg_uo5td8,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 82.0),
                    Pin(size: 256.8, middle: 0.637),
                    child: SvgPicture.string(
                      _svg_awlpd7,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 454.0, end: 92.8),
                    Pin(size: 220.2, middle: 0.68),
                    child: SvgPicture.string(
                      _svg_xjtenw,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 448.0, end: 74.0),
                    Pin(size: 250.5, middle: 0.73981),
                    child: SvgPicture.string(
                      _svg_aut51k,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 468.0, end: 17.0),
                    Pin(size: 159.2, end: 126.0),
                    child: SvgPicture.string(
                      _svg_ktpzeh,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  
                  Pinned.fromPins(
                    Pin(size: 154.0, middle: 0.4311),
                    Pin(size: 66.0, middle: 0.4864),
                    child: Container(
                        
                    ),
                  ),
      
      
      
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50,left: 16),
                  child: Image.asset('image/images/logo.png',width: 240,),
                      
                      ),

                      
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                        'Welcome back to your World! ',
                        style: TextStyle(
                          fontFamily: 'Kailasa',
                          fontSize: 20,
                          color: const Color(0xff352614),
                        ),
                        textAlign: TextAlign.left,
                    ),
                      ),

              ],
            )
          ],
        )),
      ));
    
    
  }
}
const String _svg_yb95v =
    '<svg viewBox="-30.7 -101.4 413.7 229.4" ><path transform="matrix(-1.0, 0.0, 0.0, -1.0, 383.0, 128.0)" d="M 0 172.0567321777344 L 0 0 C 14.63369274139404 18.50341796875 31.07233238220215 35.37575531005859 48.86127471923828 50.14600372314453 C 66.78348541259766 65.0269775390625 86.16084289550781 77.84320831298828 106.4543838500977 88.23825836181641 C 127.1222305297852 98.82523345947266 148.8758239746094 106.9673233032227 171.1115417480469 112.4402160644531 C 193.9625854492188 118.0639114379883 217.5309295654297 120.9150619506836 241.1619720458984 120.9150619506836 C 272.2951049804688 120.9150619506836 303.0656433105469 115.9990921020508 332.6191101074219 106.3031387329102 C 361.2398071289062 96.9124755859375 388.5297546386719 83.11302947998047 413.7315368652344 65.28620910644531 L 413.7315368652344 88.67073822021484 C 362.1512145996094 173.3061981201172 271.9536437988281 229.3876800537109 169.3036651611328 229.3876800537109 C 106.1193237304688 229.3876800537109 47.64710235595703 208.1342926025391 0 172.0567321777344 Z" fill="#56a1af" fill-opacity="0.5" stroke="none" stroke-width="1" stroke-opacity="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ale2tv =
    '<svg viewBox="-16.0 536.9 434.0 209.5" ><path transform="translate(-16.0, 536.85)" d="M 0 157.1090698242188 L 0 0 C 15.3505859375 16.89591407775879 32.59451293945312 32.30242156982422 51.25494384765625 45.78952026367188 C 70.05514526367188 59.37766647338867 90.38179016113281 71.08049774169922 111.6695098876953 80.57242584228516 C 133.349853515625 90.23967742919922 156.1691589355469 97.67440032958984 179.4941711425781 102.6718215942383 C 203.4646911621094 107.8069305419922 228.1875915527344 110.4104156494141 252.976318359375 110.4104156494141 C 285.6346435546875 110.4104156494141 317.9125671386719 105.921516418457 348.9139099121094 97.06790924072266 C 378.9366455078125 88.49309539794922 407.5635070800781 75.89248657226562 434.0000305175781 59.61439514160156 L 434.0000305175781 80.96732330322266 C 379.8927001953125 158.2500152587891 285.2764892578125 209.4592590332031 177.5977172851562 209.4592590332031 C 111.3180389404297 209.4592590332031 49.98129272460938 190.0523529052734 0 157.1090698242188 Z" fill="#557b09" fill-opacity="0.4" stroke="none" stroke-width="1" stroke-opacity="0.4" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_uo5td8 =
    '<svg viewBox="-7.0 522.8 462.0 179.7" ><path transform="translate(-7.0, 522.8)" d="M 0 134.7685089111328 L 0 0 C 16.34095001220703 14.4933443069458 34.69741439819336 27.7091007232666 54.56173706054688 39.27834320068359 C 74.57484436035156 50.93427658081055 96.21286773681641 60.97299575805664 118.8739852905273 69.115234375 C 141.9530792236328 77.40777587890625 166.2445831298828 83.78531646728516 191.0744323730469 88.07211303710938 C 216.5913848876953 92.47705078125 242.9093475341797 94.71028900146484 269.2973327636719 94.71028900146484 C 304.0626525878906 94.71028900146484 338.4230346679688 90.85973358154297 371.4244384765625 83.26506805419922 C 403.3841247558594 75.9095458984375 433.8578796386719 65.10073852539062 461.9999694824219 51.13736724853516 L 461.9999694824219 69.45396423339844 C 404.4019165039062 135.7471923828125 303.6813354492188 179.6746826171875 189.0555877685547 179.6746826171875 C 118.4998321533203 179.6746826171875 53.20589447021484 163.0273895263672 0 134.7685089111328 Z" fill="#557b09" fill-opacity="0.5" stroke="none" stroke-width="1" stroke-opacity="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_awlpd7 =
    '<svg viewBox="-201.0 337.0 577.0 256.8" ><path transform="matrix(-1.0, 0.0, 0.0, -1.0, 376.0, 593.82)" d="M 0 64.18766784667969 L 0 256.822265625 C 20.40849876403809 236.1058502197266 43.33422470092773 217.2156066894531 68.14311218261719 200.6788330078125 C 93.13785552978516 184.0181274414062 120.1619873046875 169.6690521240234 148.4638671875 158.0307769775391 C 177.2877349853516 146.1776123046875 207.6258239746094 137.0617370605469 238.6363067626953 130.9342803955078 C 270.5049133300781 124.6380081176758 303.3738708496094 121.4458541870117 336.330322265625 121.4458541870117 C 379.7493591308594 121.4458541870117 422.6626281738281 126.9497604370117 463.8786926269531 137.8053588867188 C 503.7937316894531 148.3191375732422 541.85302734375 163.7689666748047 577 183.7278900146484 L 577 157.5465545654297 C 505.0648498535156 62.78878021240234 379.2731018066406 0 236.1149597167969 0 C 147.99658203125 0 66.44979858398438 23.79525184631348 0 64.18766784667969 Z" fill="#56a1af" fill-opacity="0.4" stroke="none" stroke-width="1" stroke-opacity="0.4" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_xjtenw =
    '<svg viewBox="-69.0 389.0 454.0 191.2" ><path transform="matrix(-1.0, 0.0, 0.0, -1.0, 385.0, 580.22)" d="M 0 47.79048538208008 L 0 191.2152099609375 C 16.05798721313477 175.7909545898438 34.09659957885742 161.7263488769531 53.61693572998047 149.4140167236328 C 73.28351593017578 137.0093994140625 94.54686737060547 126.3259201049805 116.8155899047852 117.6607131958008 C 139.4950256347656 108.8355178833008 163.3658905029297 102.0483627319336 187.7658081054688 97.48621368408203 C 212.8409576416016 92.79835510253906 238.7031860351562 90.42166137695312 264.6342468261719 90.42166137695312 C 298.7975769042969 90.42166137695312 332.5629577636719 94.51956176757812 364.992919921875 102.6020126342773 C 396.3992309570312 110.4299697875977 426.3453369140625 121.9330444335938 454.0000305175781 136.7933044433594 L 454.0000305175781 117.3002014160156 C 397.3993835449219 46.74895095825195 298.4228515625 0 185.7819671630859 0 C 116.4479141235352 0 52.28458786010742 17.71658706665039 0 47.79048538208008 Z" fill="#56a1af" fill-opacity="0.5" stroke="none" stroke-width="1" stroke-opacity="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_aut51k =
    '<svg viewBox="-7.0 437.6 392.0 198.5" ><path transform="matrix(-1.0, 0.0, 0.0, -1.0, 385.0, 636.09)" d="M 0 49.60616302490234 L 0 198.4799652099609 C 13.86504554748535 182.4697113037109 29.44023323059082 167.8707580566406 46.2947998046875 155.0906524658203 C 63.27562713623047 142.2147369384766 81.63516998291016 131.1253662109375 100.86279296875 122.1309432983398 C 120.4450302124023 112.970458984375 141.0559997558594 105.9254302978516 162.123779296875 101.1899490356445 C 183.7745513916016 96.32399749755859 206.1049346923828 93.85700988769531 228.4947509765625 93.85700988769531 C 257.9925842285156 93.85700988769531 287.1468505859375 98.110595703125 315.1480407714844 106.5001220703125 C 342.265380859375 114.6254806518555 368.1219177246094 126.5655975341797 391.9999694824219 141.9904327392578 L 391.9999694824219 121.7567367553711 C 343.1289367675781 48.52505874633789 257.6690368652344 0 160.4108428955078 0 C 100.5453262329102 0 45.1443977355957 18.38968658447266 0 49.60616302490234 Z" fill="#336c7e" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ktpzeh =
    '<svg viewBox="0.0 501.8 468.0 159.2" ><path transform="translate(0.0, 501.8)" d="M 0 119.3921127319336 L 0 0 C 16.55316162109375 12.83973979949951 35.14802551269531 24.54763031005859 55.27032470703125 34.79687881469727 C 75.54335021972656 45.12294769287109 97.46240234375 54.01626968383789 120.4178161621094 61.22951889038086 C 143.7966156005859 68.57594299316406 168.4036254882812 74.225830078125 193.5559387207031 78.02352905273438 C 219.4043273925781 81.92587280273438 246.0640563964844 83.90433502197266 272.7947387695312 83.90433502197266 C 308.0115356445312 83.90433502197266 342.8182067871094 80.49308776855469 376.2481689453125 73.76493835449219 C 408.6229553222656 67.24866485595703 439.4925231933594 57.67308044433594 468.0000305175781 45.30284881591797 L 468.0000305175781 61.52962875366211 C 409.6539611816406 120.2591247558594 307.6253051757812 159.1746826171875 191.5109252929688 159.1746826171875 C 120.0387878417969 159.1746826171875 53.89686584472656 144.4267578125 0 119.3921127319336 Z" fill="#294519" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_bzlg6q =
    '<svg viewBox="-8.7 -133.4 407.7 229.4" ><path transform="matrix(-1.0, 0.0, 0.0, -1.0, 399.0, 96.0)" d="M 0 172.0564117431641 L 0 -0.0009000000427477062 C 14.42177581787109 18.50310134887695 30.62188148498535 35.37540054321289 48.15329742431641 50.14620208740234 C 65.81509399414062 65.02680206298828 84.91108703613281 77.84280395507812 104.9108810424805 88.23780059814453 C 125.2787628173828 98.82540130615234 146.7171783447266 106.9677047729492 168.6301116943359 112.4397048950195 C 191.1497344970703 118.0638046264648 214.3762359619141 120.9150009155273 237.6648254394531 120.9150009155273 C 268.3461303710938 120.9150009155273 298.6708984375 115.9992065429688 327.7955932617188 106.302604675293 C 356.0005493164062 96.91290283203125 382.8946228027344 83.1123046875 407.7317810058594 65.28600311279297 L 407.7317810058594 88.66989135742188 C 356.8995056152344 173.3053741455078 268.0096435546875 229.3875122070312 166.8482208251953 229.3875122070312 C 104.5805816650391 229.3875122070312 46.95613098144531 208.1339111328125 0 172.0564117431641 Z" fill="#56a1af" fill-opacity="0.5" stroke="none" stroke-width="1" stroke-opacity="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
