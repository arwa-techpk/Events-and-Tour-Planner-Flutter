import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terhal/components/component_sized_box.dart';
import 'package:terhal/components/component_text_widgets.dart';
import 'package:terhal/constants/const_images_paths.dart';
import 'package:terhal/controllers/auth/auth_service.dart';
import 'package:terhal/ui/screens/auth/reset_password.dart';
import 'package:terhal/ui/screens/auth/welcome_screen.dart';
import 'package:terhal/ui/screens/favorite/favorite_screen.dart';
import 'package:terhal/ui/screens/settings/customer_service.dart';
import 'package:terhal/ui/screens/settings/favorite.dart';

import '../pref_manager.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Auth auth = Auth();
  get child => null;
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

  String email = '';

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
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  getUser() async {
    email = await Get.find<PrefManager>().read('email');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(80),
                        bottomRight: Radius.circular(80)),
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
                        height: 150,
                        width: 200,
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color(0xffE6EFF1),
                        ),
                        child: Column(
                          children: [
                            ComponentSizedBox.topMargin(size: 25),
                            Image.asset(
                              ImagePath.PROFILEICON,
                              height: 60,
                              width: 60,
                            ),
                            ComponentSizedBox.topMargin(size: 10),
                            ComponentText.buildTextWidget(
                                title: email, fontSize: 18),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            ComponentSizedBox.topMargin(size: 50),
            Container(
              height: 60,
              width: 300,
              decoration: BoxDecoration(
                color: Color(0xffE6EFF1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                  child: ComponentText.buildTextWidget(
                      title: 'Change email', fontSize: 20)),
            ),
            ComponentSizedBox.topMargin(size: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FavoriteScreen()),
                    );
                  },
                  child: Container(
                    height: 60,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Color(0xffE6EFF1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: ComponentText.buildTextWidget(
                      title: 'Favourite',
                    )),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Restpassword()),
                    );
                  },
                  child: Container(
                    height: 60,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Color(0xffE6EFF1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: ComponentText.buildTextWidget(
                      title: 'Resest Password',
                    )),
                  ),
                ),
              ],
            ),
            ComponentSizedBox.topMargin(size: 50),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Customerservice()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 60,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Color(0xffE6EFF1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: ComponentText.buildTextWidget(
                      title: 'Customer\n  Service',
                    )),
                  ),
                  InkWell(
                    onTap: () => _confirmSignOut(context),
                    child: Container(
                      height: 60,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Color(0xffE6EFF1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: ComponentText.buildTextWidget(
                        title: 'Log out',
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:terhal/constants/Constants.dart';
import 'package:terhal/constants/constants_colors.dart';
import 'package:terhal/ui/screens/auth/reset_password.dart';
import 'package:terhal/ui/screens/settings/customer_service.dart';
import 'package:terhal/ui/screens/settings/favorite.dart';



class Profile extends StatelessWidget {
   Profile({Key key,}) : super(key: key);
 

  get child => null;
/*   Future<void> _signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  } */

  Future<void>_confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await  showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('Logout'),
            content: Text('Are you sure that you want to logout?'),

            actions:<Widget> [
              TextButton(
                  onPressed: () =>
                  
                  avigator.of(context).pop(true),
                  child: Text('Logout'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('Cancel'),
              ),
            ],
          );
        }
      );
     if (didRequestSignOut == true) {
      // _signOut();
     }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: const Color(0xffffffff),

        body:
        Stack(

          children: <Widget>[
            Pinned.fromPins(
              Pin(start: -53.5, end: -5.5),
              Pin(size: 197.7, end: -17.7),
              child: SvgPicture.string(
                _svg_wv9s33,
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
              ),
            ),
            Pinned.fromPins(
              Pin(start: 0.0, end: -79.0),
              Pin(size: 227.7, end: -47.7),
              child: SvgPicture.string(
                _svg_pt2dil,
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
              ),
            ),
            Pinned.fromPins(
              Pin(start: -28.0, end: -51.0),
              Pin(size: 177.7, end: -63.9),
              child: SvgPicture.string(
                _svg_zb60,
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
              ),
            ),
            Pinned.fromPins(
              Pin(start: -35.4, end: 0.0),
              Pin(size: 178.9, start: -29.2),
              child: SvgPicture.string(
                _svg_jvx4q9,
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
              ),
            ),
            Pinned.fromPins(
              Pin(start: 0.0, end: -72.5),
              Pin(size: 237.3, start: -58.4),
              child: SvgPicture.string(
                _svg_j3xkg,
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
              ),
            ),
            Pinned.fromPins(
              Pin(start: -69.7, end: -69.7),
              Pin(size: 208.3, start: -72.4),
              child: SvgPicture.string(
                _svg_yo3ifp,
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
              ),
            ),



            Pinned.fromPins(
              Pin(size: 300.0, middle: 0.503),
              Pin(size: 60.0, middle: 0.2612),
              child: Container(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary:ConstantColor.medblue, // background
                    onPrimary: Colors.black, // foreground
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                  ),
                  onPressed: () {
                    /*Navigator.push
                      (context,
                      MaterialPageRoute(
                          builder: (context) => EditProfile()),
                    );*/
                  }
                  ,
                  icon: Icon(
                    Icons.email,
                    size: 30,
                    color: white,

                  ),
                  label: Text(
                    "Change Email",
                    style: TextStyle(
                      fontSize: 20,
                      color: white,
                    ),
                  ),
                ),
              ),

            ),



            Pinned.fromPins(
              Pin(size: 300.0, middle: 0.503),
              Pin(size: 60.0, middle: 0.5012),
              child: Container(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: medblue, // background
                    onPrimary: Colors.green, // foreground
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                  ),
                  onPressed: () {
                    Navigator.push
                      (context,
                      MaterialPageRoute(
                          builder: (context) => Restpassword()),
                    );
                  }
                  ,
                  icon: Icon(
                    Icons.lock_outline,
                    size: 30,
                    color: white,

                  ),
                  label: Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 20,
                      color: white,
                    ),
                  ),
                ),
              ),

            ),
            Pinned.fromPins(
              Pin(size: 300.0, middle: 0.5039),
              Pin(size: 60.0, middle: 0.3827),
              child: Container(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: medblue, // background
                    onPrimary: Colors.green, // foreground
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                  ),
                  onPressed: () {
                     Navigator.push
                      (context,
                      MaterialPageRoute(
                          builder: (context) => Favorite()),
                    ); 
                  }
                  ,
                  icon: Icon(
                    Icons.favorite,
                    size: 30,
                    color: white,

                  ),
                  label: Text(
                    "Favourite",
                    style: TextStyle(
                      fontSize: 20,
                      color: white,
                    ),
                  ),
                ),
              ),
            ),
            Pinned.fromPins(
              Pin(size: 300.0, middle: 0.5015),
              Pin(size: 60.0, end: 260.0),
              child: Container(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: medblue, // background
                    onPrimary: Colors.green, // foreground
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                  ),
                  onPressed: () {
                     Navigator.push
                      (context,
                      MaterialPageRoute(
                          builder: (context) => Customerservice()),
                    ); 
                  }
                  ,
                  icon: Icon(
                    Icons.support_agent_outlined,
                    size: 30,
                    color: white,

                  ),
                  label: Text(
                    "Support",
                    style: TextStyle(
                      fontSize: 20,
                      color: white,
                    ),
                  ),
                ),
              ),
            ),

            Pinned.fromPins(
              Pin(size: 300.0, middle: 0.5015),
              Pin(size: 60.0, end: 170.0),
              child: Container(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: medblue, // background
                    onPrimary: Colors.green, // foreground
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                  ),
                  onPressed: () =>_confirmSignOut(context),
                  icon: Icon(
                    Icons.logout_outlined,
                    size: 30,
                    color: white,

                  ),
                  label: Text(
                    "Log out",
                    style: TextStyle(
                      fontSize: 20,
                      color: white,
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
        
    );
  }
}
const String _svg_wv9s33 =
    '<svg viewBox="-53.5 632.1 434.0 197.7" ><path transform="matrix(-1.0, 0.0, 0.0, -1.0, 380.5, 829.74)" d="M 0 49.40488433837891 L 0 197.6746826171875 C 15.3505859375 181.7293701171875 32.59451293945312 167.1896514892578 51.25494384765625 154.4613800048828 C 70.05514526367188 141.6377105712891 90.38179016113281 130.5933380126953 111.6695098876953 121.6354141235352 C 133.349853515625 112.512077331543 156.1691589355469 105.4956512451172 179.4941711425781 100.7793884277344 C 203.4646911621094 95.93318176269531 228.1875915527344 93.47618865966797 252.976318359375 93.47618865966797 C 285.6346435546875 93.47618865966797 317.9125671386719 97.7125244140625 348.9139099121094 106.0680236816406 C 378.9366455078125 114.1603927612305 407.5635070800781 126.0520629882812 434.0000305175781 141.414306640625 L 434.0000305175781 121.2627258300781 C 379.8927001953125 48.32815551757812 285.2764892578125 0 177.5977172851562 0 C 111.3180389404297 0 49.98129272460938 18.3150463104248 0 49.40488433837891 Z" fill="#557b09" fill-opacity="0.5" stroke="none" stroke-width="1" stroke-opacity="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_pt2dil =
    '<svg viewBox="0.0 632.1 454.0 227.7" ><path transform="translate(-111.0, 356.74)" d="M 110.9997177124023 446.0971984863281 L 110.9997177124023 275.3253173828125 C 127.0577087402344 293.6905517578125 145.0963134765625 310.4368896484375 164.6166687011719 325.0968627929688 C 184.2832336425781 339.8666687011719 205.5465698242188 352.5872192382812 227.8152923583984 362.9046630859375 C 250.4947509765625 373.4125671386719 274.3656311035156 381.4938354492188 298.7655334472656 386.9258728027344 C 323.8406372070312 392.507568359375 349.702880859375 395.3374328613281 375.6339416503906 395.3374328613281 C 409.7972412109375 395.3374328613281 443.5626525878906 390.4581909179688 475.9926147460938 380.8346252441406 C 507.3988952636719 371.5140686035156 537.344970703125 357.8176879882812 564.999755859375 340.1240234375 L 564.999755859375 363.3338928222656 C 508.3990478515625 447.3373107910156 409.4225463867188 503 296.7816467285156 503 C 227.4476165771484 503 163.2843017578125 481.9053955078125 110.9997177124023 446.0971984863281 Z" fill="#557b09" fill-opacity="0.5" stroke="none" stroke-width="1" stroke-opacity="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_zb60 =
    '<svg viewBox="-28.0 698.2 454.0 177.7" ><path transform="translate(-139.0, 422.91)" d="M 110.9997100830078 408.5937194824219 L 110.9997100830078 275.3253173828125 C 127.0577011108398 289.6573486328125 145.0963134765625 302.7259826660156 164.6166687011719 314.1664428710938 C 184.2832183837891 325.6926574707031 205.5465698242188 335.6195983886719 227.8152923583984 343.6712036132812 C 250.4947357177734 351.8714599609375 274.3655700683594 358.1780090332031 298.7655029296875 362.4170837402344 C 323.8406066894531 366.7729797363281 349.7028503417969 368.9813842773438 375.6338806152344 368.9813842773438 C 409.7972106933594 368.9813842773438 443.5626220703125 365.1736755371094 475.9925537109375 357.6635437011719 C 507.3988952636719 350.3899230957031 537.3450317382812 339.701416015625 564.999755859375 325.8934631347656 L 564.999755859375 344.0061950683594 C 508.3990173339844 409.5614929199219 409.4225158691406 453 296.7816467285156 453 C 227.4476165771484 453 163.2843017578125 436.5379943847656 110.9997100830078 408.5937194824219 Z" fill="#294519" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_jvx4q9 =
    '<svg viewBox="-35.4 -29.2 410.4 178.9" ><path transform="matrix(-1.0, 0.0, 0.0, -1.0, 375.0, 149.74)" d="M 0 134.2107238769531 L 0 0 C 14.51549434661865 14.43336296081543 30.82135772705078 27.59442138671875 48.46662139892578 39.11577224731445 C 66.24406433105469 50.72349166870117 85.46491241455078 60.72063827514648 105.5945434570312 68.82917022705078 C 126.0954513549805 77.08740234375 147.67333984375 83.43854522705078 169.7294616699219 87.70760345458984 C 192.3959197998047 92.09429931640625 215.77392578125 94.31830596923828 239.2140655517578 94.31830596923828 C 270.0957641601562 94.31830596923828 300.6177368164062 90.48366546630859 329.9325256347656 82.92044830322266 C 358.3220520019531 75.59538269042969 385.3916015625 64.83129119873047 410.3898010253906 50.92570495605469 L 410.3898010253906 69.16651916503906 C 359.22607421875 135.1853637695312 269.7570495605469 178.9310302734375 167.9361877441406 178.9310302734375 C 105.2621841430664 178.9310302734375 47.26224899291992 162.3525848388672 0 134.2107238769531 Z" fill="#56a1af" fill-opacity="0.5" stroke="none" stroke-width="1" stroke-opacity="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_j3xkg =
    '<svg viewBox="0.0 -58.4 447.5 237.3" ><path transform="translate(0.0, -58.39)" d="M 0 59.31317138671875 L 0 237.3187408447266 C 15.82677459716797 218.1755523681641 33.60565567016602 200.7198638916016 52.84493255615234 185.4389190673828 C 72.22832489013672 170.0434417724609 93.18551635742188 156.7841033935547 115.1336059570312 146.0296478271484 C 137.4864959716797 135.0766143798828 161.0136566162109 126.6530303955078 185.0622711181641 120.9909286499023 C 209.7763519287109 115.1727981567383 235.2661895751953 112.2230529785156 260.8238830566406 112.2230529785156 C 294.4953308105469 112.2230529785156 327.7745056152344 117.3089828491211 359.737548828125 127.3401870727539 C 390.6916198730469 137.0555114746094 420.20654296875 151.3320770263672 447.4630737304688 169.7752990722656 L 447.4630737304688 145.5821990966797 C 391.6773681640625 58.02051162719727 294.1259765625 1.757990867190529e-05 183.1069488525391 1.757990867190529e-05 C 114.7712326049805 1.757990867190529e-05 51.53176498413086 21.98821067810059 0 59.31317138671875 Z" fill="#56a1af" fill-opacity="0.5" stroke="none" stroke-width="1" stroke-opacity="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_yo3ifp =
    '<svg viewBox="-69.7 -72.4 514.5 208.3" ><path transform="matrix(-1.0, 0.0, 0.0, -1.0, 444.75, 135.87)" d="M 0 156.2105255126953 L 0 0 C 18.19787406921387 16.79926681518555 38.64031600952148 32.11768341064453 60.76192855834961 45.52761459350586 C 83.04926300048828 59.0380744934082 107.1461715698242 70.67393493652344 132.3824157714844 80.11161041259766 C 158.0841064453125 89.72354125976562 185.1360168457031 97.11576080322266 212.7874603271484 102.084602355957 C 241.2041168212891 107.1903610229492 270.5127258300781 109.7789306640625 299.8993835449219 109.7789306640625 C 338.6152648925781 109.7789306640625 376.8802795410156 105.3157119750977 413.6318359375 96.51274108886719 C 449.2233276367188 87.98696136474609 483.1600646972656 75.45841979980469 514.5 59.2734260559082 L 514.5 80.50426483154297 C 450.3567504882812 157.3448944091797 338.1906433105469 208.2613372802734 210.5392303466797 208.2613372802734 C 131.9657592773438 208.2613372802734 59.25202560424805 188.9653930664062 0 156.2105255126953 Z" fill="#336c7e" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_cjlbqr =
    '<svg viewBox="105.0 562.0 165.0 70.0" ><defs><filter id="shadow"><feDropShadow dx="0" dy="5" stdDeviation="10"/></filter></defs><path transform="translate(105.0, 562.0)" d="M 29 0 L 136 0 C 152.0162658691406 0 165 12.98374176025391 165 29 L 165 41 C 165 57.01625823974609 152.0162658691406 70 136 70 L 29 70 C 12.98374176025391 70 0 57.01625823974609 0 41 L 0 29 C 0 12.98374176025391 12.98374176025391 0 29 0 Z" fill="#56a1af" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" filter="url(#shadow)"/></svg>';
 */
