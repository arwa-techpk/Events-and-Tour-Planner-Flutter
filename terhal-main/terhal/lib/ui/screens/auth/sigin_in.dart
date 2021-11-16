import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:terhal/common_widgets/validators.dart';
import 'package:terhal/components/bottom_navigation.dart';
import 'package:terhal/ui/screens/auth/profile.dart';
import 'package:terhal/ui/screens/auth/reset_password.dart';
import 'package:terhal/ui/screens/home_screen.dart';
enum SigninType { signin, register }
class SignIn extends StatefulWidget with EmailAndPasswordValidators{
  static const id = 'SignIn';
   SignIn({ Key key }) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailcontroller = new TextEditingController();
  final TextEditingController _passwordcontroller = new TextEditingController();

  String get _email => _emailcontroller.text;
  String get _password => _passwordcontroller.text;

  bool _submitted = false;
  bool _isLoading = false;
    SigninType _formType = SigninType.signin;
      void _toggleFormType() {
    setState(() {
      _submitted = false;
      _formType = _formType == SigninType.signin
          ? SigninType.register
          : SigninType.signin;
    });
    _emailcontroller.clear();
    _passwordcontroller.clear();
  }


  @override

  Widget build(BuildContext context) {
    final primaryText = _formType == SigninType.signin ? 'Sign in' : 'Sign up';
    final secondaryText = _formType == SigninType.signin
        ? 'Need an account? Register'
        : 'Have an account? Sign in';
    bool submitEnabled = widget.emailValidator.isValid(_email) && widget.passwordValidator.isValid(_password) && !_isLoading;
    bool emailShowErrorText = _submitted && !widget.emailValidator.isValid(_email);
    bool passwordShowErrorText = _submitted && !widget.passwordValidator.isValid(_password);



    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffffffff),
      body: Stack(
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
              Pin(start: 26.0, end: 9.0), Pin(size: 39.0, middle: 0.803),
              child: TextButton(
                onPressed: !_isLoading ? _toggleFormType : null,
                style: TextButton.styleFrom(
                  primary:const Color(0xff56a1af),
                ),
                child: Text(
                  secondaryText,
                  style:const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              )),
          Pinned.fromPins(
            Pin(start: -38.7, end: 0.0),
            Pin(size: 229.4, start: -38.2),
            child: SvgPicture.string(
              _svg_v7cx4a,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: -14.7, end: -37.7),
            Pin(size: 259.1, start: -53.1),
            child: SvgPicture.string(
              _svg_lswb3p,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: -69.7, end: -69.7),
            Pin(size: 208.3, start: -68.4),
            child: SvgPicture.string(
              _svg_vd0i5c,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),

          Pinned.fromPins(
            Pin(start: 38.0, end: 38.0),
            Pin(size: 45.0, middle: 0.3272),
            child: Container(

                child: TextField(
              controller: _emailcontroller,
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xffffffff),
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: const Color(0xff707070), width: 2),
                  borderRadius: BorderRadius.circular(50),
                ),
                hintText: 'Email',
                hintStyle:  TextStyle(
                  fontSize: 20,
                ),
                errorText: emailShowErrorText? widget.invalidEmailErrorText : null,
                enabled: _isLoading == false,
              ),
              keyboardType: TextInputType.emailAddress,
              onChanged: (password) =>  _updateState(),
            )),
          ),
          Pinned.fromPins(
            Pin(start: 38.0, end: 38.0),
            Pin(size: 45.0, middle: 0.4316),
            child: Container(
                child: TextField(
              controller: _passwordcontroller,
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                filled: true,
                fillColor:  Color(0xffffffff),
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color:  Color(0xff707070), width: 2),
                  borderRadius: BorderRadius.circular(50),
                ),
                hintText: 'Password',
                hintStyle: const TextStyle(
                  fontSize: 20,
                ),
                errorText: passwordShowErrorText ? widget.invalidPasswordErrorText : null,
                enabled: _isLoading == false,
              ),
              keyboardType: TextInputType.url,
              onChanged: (password) =>  _updateState(),
            )),
          ),
          Pinned.fromPins(
            Pin(size: 154.0, middle: 0.5023),
            Pin(size: 66.0, middle: 0.6113),
            child: Container(
              child: ElevatedButton(
                child: Text(
                  primaryText,
                  style:const TextStyle(
                    fontSize: 30,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff56a1af),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0)),
                ),
                onPressed:(){
                  if(primaryText  == 'Sign in'){
                    Get.to(BottomNavigation());
                  }
                },
              ),
            ),
          ),
         
           Pinned.fromPins(
              Pin(start: 37.0, end: 7.0),
              Pin(size: 28.0, middle: 0.5005),
              child: const Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: 'InaiMathi',
                    fontSize: 20,
                    color:  Color(0xff707070),
                  ),
                  children: [
                    TextSpan(
                      text: 'Forgot password? ',
                    ),
          
                  ],
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.left,
              ),
            ),
          
        Pinned.fromPins(
                Pin(start: 177.0, end: 0.040), Pin(size: 39.0, middle: 0.498000),
                child: TextButton(
                  onPressed: () {
                    Get.to(Restpassword());
                  },
                  style: TextButton.styleFrom(
                    primary: Color(0xff56a1af),
                  ),
                  child:const Text(
                    'Rest Password',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                )),
          
          Pinned.fromPins(
            Pin(size: 120.0, start: 51.0),
            Pin(size: 50.0, middle: 0.2428),
            child:const Text(
              'Hello! ',
              style: TextStyle(
                fontFamily: 'InaiMathi',
                fontSize: 40,
                color:  Color(0xff000000),
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );

  }
   void _updateState() {
    setState(() {});
  }
}
const String _svg_wv9s33 =
    '<svg viewBox="-53.5 632.1 434.0 197.7" ><path transform="matrix(-1.0, 0.0, 0.0, -1.0, 380.5, 829.74)" d="M 0 49.40488433837891 L 0 197.6746826171875 C 15.3505859375 181.7293701171875 32.59451293945312 167.1896514892578 51.25494384765625 154.4613800048828 C 70.05514526367188 141.6377105712891 90.38179016113281 130.5933380126953 111.6695098876953 121.6354141235352 C 133.349853515625 112.512077331543 156.1691589355469 105.4956512451172 179.4941711425781 100.7793884277344 C 203.4646911621094 95.93318176269531 228.1875915527344 93.47618865966797 252.976318359375 93.47618865966797 C 285.6346435546875 93.47618865966797 317.9125671386719 97.7125244140625 348.9139099121094 106.0680236816406 C 378.9366455078125 114.1603927612305 407.5635070800781 126.0520629882812 434.0000305175781 141.414306640625 L 434.0000305175781 121.2627258300781 C 379.8927001953125 48.32815551757812 285.2764892578125 0 177.5977172851562 0 C 111.3180389404297 0 49.98129272460938 18.3150463104248 0 49.40488433837891 Z" fill="#557b09" fill-opacity="0.5" stroke="none" stroke-width="1" stroke-opacity="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_pt2dil =
    '<svg viewBox="0.0 632.1 454.0 227.7" ><path transform="translate(-111.0, 356.74)" d="M 110.9997177124023 446.0971984863281 L 110.9997177124023 275.3253173828125 C 127.0577087402344 293.6905517578125 145.0963134765625 310.4368896484375 164.6166687011719 325.0968627929688 C 184.2832336425781 339.8666687011719 205.5465698242188 352.5872192382812 227.8152923583984 362.9046630859375 C 250.4947509765625 373.4125671386719 274.3656311035156 381.4938354492188 298.7655334472656 386.9258728027344 C 323.8406372070312 392.507568359375 349.702880859375 395.3374328613281 375.6339416503906 395.3374328613281 C 409.7972412109375 395.3374328613281 443.5626525878906 390.4581909179688 475.9926147460938 380.8346252441406 C 507.3988952636719 371.5140686035156 537.344970703125 357.8176879882812 564.999755859375 340.1240234375 L 564.999755859375 363.3338928222656 C 508.3990478515625 447.3373107910156 409.4225463867188 503 296.7816467285156 503 C 227.4476165771484 503 163.2843017578125 481.9053955078125 110.9997177124023 446.0971984863281 Z" fill="#557b09" fill-opacity="0.5" stroke="none" stroke-width="1" stroke-opacity="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_zb60 =
    '<svg viewBox="-28.0 698.2 454.0 177.7" ><path transform="translate(-139.0, 422.91)" d="M 110.9997100830078 408.5937194824219 L 110.9997100830078 275.3253173828125 C 127.0577011108398 289.6573486328125 145.0963134765625 302.7259826660156 164.6166687011719 314.1664428710938 C 184.2832183837891 325.6926574707031 205.5465698242188 335.6195983886719 227.8152923583984 343.6712036132812 C 250.4947357177734 351.8714599609375 274.3655700683594 358.1780090332031 298.7655029296875 362.4170837402344 C 323.8406066894531 366.7729797363281 349.7028503417969 368.9813842773438 375.6338806152344 368.9813842773438 C 409.7972106933594 368.9813842773438 443.5626220703125 365.1736755371094 475.9925537109375 357.6635437011719 C 507.3988952636719 350.3899230957031 537.3450317382812 339.701416015625 564.999755859375 325.8934631347656 L 564.999755859375 344.0061950683594 C 508.3990173339844 409.5614929199219 409.4225158691406 453 296.7816467285156 453 C 227.4476165771484 453 163.2843017578125 436.5379943847656 110.9997100830078 408.5937194824219 Z" fill="#294519" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_v7cx4a =
    '<svg viewBox="-38.7 -38.2 413.7 229.4" ><path transform="matrix(-1.0, 0.0, 0.0, -1.0, 375.0, 191.14)" d="M 0 172.0567321777344 L 0 0 C 14.63369274139404 18.50341796875 31.07233238220215 35.37575531005859 48.86127471923828 50.14600372314453 C 66.78348541259766 65.0269775390625 86.16084289550781 77.84320831298828 106.4543838500977 88.23825836181641 C 127.1222305297852 98.82523345947266 148.8758239746094 106.9673233032227 171.1115417480469 112.4402160644531 C 193.9625854492188 118.0639114379883 217.5309295654297 120.9150619506836 241.1619720458984 120.9150619506836 C 272.2951049804688 120.9150619506836 303.0656433105469 115.9990921020508 332.6191101074219 106.3031387329102 C 361.2398071289062 96.9124755859375 388.5297546386719 83.11302947998047 413.7315368652344 65.28620910644531 L 413.7315368652344 88.67073822021484 C 362.1512145996094 173.3061981201172 271.9536437988281 229.3876800537109 169.3036651611328 229.3876800537109 C 106.1193237304688 229.3876800537109 47.64710235595703 208.1342926025391 0 172.0567321777344 Z" fill="#56a1af" fill-opacity="0.5" stroke="none" stroke-width="1" stroke-opacity="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_lswb3p =
    '<svg viewBox="-14.7 -53.1 427.5 259.1" ><path transform="translate(-14.73, -53.1)" d="M 0 64.75787353515625 L 0 259.1036376953125 C 15.11937427520752 238.2031860351562 32.10360336303711 219.1451263427734 50.48295211791992 202.4614562988281 C 68.99998474121094 185.6527404785156 89.02046203613281 171.1762390136719 109.987548828125 159.4345703125 C 131.3413391113281 147.4761047363281 153.8169250488281 138.2792663574219 176.7906494140625 132.0973968505859 C 200.4001007080078 125.7451934814453 224.7506408691406 122.5246734619141 249.1660003662109 122.5246734619141 C 281.3324584960938 122.5246734619141 313.1241760253906 128.0774688720703 343.6585693359375 139.0294952392578 C 373.2291259765625 149.6366424560547 401.4248352050781 165.2237548828125 427.4630737304688 185.3599700927734 L 427.4630737304688 158.946044921875 C 374.1708068847656 63.34655380249023 280.9796142578125 1.757990867190529e-05 174.9227294921875 1.757990867190529e-05 C 109.6413650512695 1.757990867190529e-05 49.22847747802734 24.00663757324219 0 64.75787353515625 Z" fill="#56a1af" fill-opacity="0.5" stroke="none" stroke-width="1" stroke-opacity="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_vd0i5c =
    '<svg viewBox="-69.7 -68.4 514.5 208.3" ><path transform="matrix(-1.0, 0.0, 0.0, -1.0, 444.75, 139.87)" d="M 0 156.2105255126953 L 0 0 C 18.19787406921387 16.79926681518555 38.64031600952148 32.11768341064453 60.76192855834961 45.52761459350586 C 83.04926300048828 59.0380744934082 107.1461715698242 70.67393493652344 132.3824157714844 80.11161041259766 C 158.0841064453125 89.72354125976562 185.1360168457031 97.11576080322266 212.7874603271484 102.084602355957 C 241.2041168212891 107.1903610229492 270.5127258300781 109.7789306640625 299.8993835449219 109.7789306640625 C 338.6152648925781 109.7789306640625 376.8802795410156 105.3157119750977 413.6318359375 96.51274108886719 C 449.2233276367188 87.98696136474609 483.1600646972656 75.45841979980469 514.5 59.2734260559082 L 514.5 80.50426483154297 C 450.3567504882812 157.3448944091797 338.1906433105469 208.2613372802734 210.5392303466797 208.2613372802734 C 131.9657592773438 208.2613372802734 59.25202560424805 188.9653930664062 0 156.2105255126953 Z" fill="#336c7e" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
