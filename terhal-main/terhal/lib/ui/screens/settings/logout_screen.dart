import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'customer_service.dart';

class Logout extends StatelessWidget {
  Logout({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: -202.0, end: -71.0),
            Pin(start: -142.0, end: 113.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => Customerservice(),
                ),
              ],
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(size: 379.2, end: 68.9),
                    Pin(size: 641.0, end: 44.5),
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
                    Pin(start: 0.0, end: 71.0),
                    Pin(size: 256.8, end: 48.1),
                    child: SvgPicture.string(
                      _svg_jppwaf,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 472.0, end: 71.0),
                    Pin(size: 191.2, end: 61.1),
                    child: SvgPicture.string(
                      _svg_ntzlfa,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 487.0, end: 28.0),
                    Pin(size: 198.5, end: 0.0),
                    child: SvgPicture.string(
                      _svg_mhcju5,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 154.0, middle: 0.6254),
                    Pin(size: 66.0, middle: 0.6691),
                    child: Container(
                      child: ElevatedButton(
                              child: Text(
                                'Log out',
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
                    Pin(size: 261.0, middle: 0.6693),
                    Pin(size: 26.0, middle: 0.5681),
                    child: Text(
                      'Good bye, we will miss you! ',
                      style: TextStyle(
                        fontFamily: 'Kailasa',
                        fontSize: 20,
                        color: const Color(0xff352614),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 178.0, middle: 0.6234),
                    Pin(size: 181.0, middle: 0.3879),
                    child:
                        // Adobe XD layer: 'goodbye (1)' (shape)
                        Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage('image/images/people.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_jppwaf =
    '<svg viewBox="-202.0 377.1 577.0 256.8" ><path transform="matrix(-1.0, 0.0, 0.0, -1.0, 375.0, 633.91)" d="M 0 64.18766784667969 L 0 256.822265625 C 20.40849876403809 236.1058502197266 43.33422470092773 217.2156066894531 68.14311218261719 200.6788330078125 C 93.13785552978516 184.0181274414062 120.1619873046875 169.6690521240234 148.4638671875 158.0307769775391 C 177.2877349853516 146.1776123046875 207.6258239746094 137.0617370605469 238.6363067626953 130.9342803955078 C 270.5049133300781 124.6380081176758 303.3738708496094 121.4458541870117 336.330322265625 121.4458541870117 C 379.7493591308594 121.4458541870117 422.6626281738281 126.9497604370117 463.8786926269531 137.8053588867188 C 503.7937316894531 148.3191375732422 541.85302734375 163.7689666748047 577 183.7278900146484 L 577 157.5465545654297 C 505.0648498535156 62.78878021240234 379.2731018066406 0 236.1149597167969 0 C 147.99658203125 0 66.44979858398438 23.79525184631348 0 64.18766784667969 Z" fill="#56a1af" fill-opacity="0.4" stroke="none" stroke-width="1" stroke-opacity="0.4" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ntzlfa =
    '<svg viewBox="-97.0 429.7 472.0 191.2" ><path transform="matrix(-1.0, 0.0, 0.0, -1.0, 375.0, 620.91)" d="M 0 47.79048538208008 L 0 191.2152099609375 C 16.69464683532715 175.7909545898438 35.44844436645508 161.7263488769531 55.74271774291992 149.4140167236328 C 76.18902587890625 137.0093994140625 98.29541778564453 126.3259201049805 121.4470443725586 117.6607131958008 C 145.0256652832031 108.8355178833008 169.8429565429688 102.0483627319336 195.2102661132812 97.48621368408203 C 221.2795867919922 92.79835510253906 248.1671752929688 90.42166137695312 275.1263427734375 90.42166137695312 C 310.6441650390625 90.42166137695312 345.7482604980469 94.51956176757812 379.4639892578125 102.6020126342773 C 412.115478515625 110.4299697875977 443.2488708496094 121.9330444335938 472.0000305175781 136.7933044433594 L 472.0000305175781 117.3002014160156 C 413.1552734375 46.74895095825195 310.2546081542969 0 193.1477661132812 0 C 121.0647888183594 0 54.3575439453125 17.71658706665039 0 47.79048538208008 Z" fill="#56a1af" fill-opacity="0.5" stroke="none" stroke-width="1" stroke-opacity="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_mhcju5 =
    '<svg viewBox="-69.0 483.5 487.0 198.5" ><path transform="matrix(-1.0, 0.0, 0.0, -1.0, 418.0, 681.98)" d="M 0 49.60616302490234 L 0 198.4799652099609 C 17.22519874572754 182.4697113037109 36.57498550415039 167.8707580566406 57.51420211791992 155.0906524658203 C 78.61028289794922 142.2147369384766 101.4192123413086 131.1253662109375 125.3065795898438 122.1309432983398 C 149.634521484375 112.970458984375 175.2404937744141 105.9254302978516 201.4139862060547 101.1899490356445 C 228.3117523193359 96.32399749755859 256.0538635253906 93.85700988769531 283.8697814941406 93.85700988769531 C 320.5162963867188 93.85700988769531 356.7359924316406 98.110595703125 391.523193359375 106.5001220703125 C 425.2123413085938 114.6254806518555 457.3351440429688 126.5655975341797 487 141.9904327392578 L 487 121.7567367553711 C 426.2851867675781 48.52505874633789 320.1143493652344 0 199.2859191894531 0 C 124.9121856689453 0 56.08500671386719 18.38968658447266 0 49.60616302490234 Z" fill="#336c7e" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
