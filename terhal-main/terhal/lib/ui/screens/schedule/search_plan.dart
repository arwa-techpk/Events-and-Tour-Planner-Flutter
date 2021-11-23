import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:terhal/components/component_form_fields.dart';
import 'package:terhal/ui/screens/explore_screen/discover_screen.dart';
import 'package:terhal/ui/screens/schedule/make_a_plan1_screen.dart';
import 'package:terhal/utils/size_config.dart';
import 'package:terhal/utils/utils.dart';

class Searchaplan extends StatefulWidget {
  Searchaplan({
    Key key,
  }) : super(key: key);

  @override
  State<Searchaplan> createState() => _SearchaplanState();
}

class _SearchaplanState extends State<Searchaplan> {
  TextEditingController _controller = TextEditingController();
  final firestoreInstance = FirebaseFirestore.instance;
  String slug = '';
  void searchPlace({String slug}) {
    Utils.showLoader();
    bool isfound=false;
    firestoreInstance.collection("places").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        
        if (slug.toLowerCase() == result['name'].toString().toLowerCase()) {
          isfound=true;
          Utils.hideLoader();
          Get.to(MakeAPlanOneScreen(
            placeName: result['name'],
          ));
         
        }
      });
      if(!isfound){
      Fluttertoast.showToast(msg: 'No place Found');
      }
      Utils.hideLoader();
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 0.0, end: -97.0),
            Pin(size: 191.2, end: 49.8),
            child: SvgPicture.string(
              _svg_ukfjo,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: -97.0, end: 0.0),
            Pin(size: 191.2, end: 56.8),
            child: SvgPicture.string(
              _svg_k8hm2o,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: -64.0, end: -33.0),
            Pin(size: 191.2, end: -51.4),
            child: SvgPicture.string(
              _svg_nqgfh,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: -97.0, end: 0.0),
            Pin(size: 191.2, end: 0.0),
            child: SvgPicture.string(
              _svg_v164it,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              Container(
                child: Image.asset(
                  'image/images/riyadhView.jpg',
                  height: 350,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Make a plan',
                  style: TextStyle(
                    fontFamily: 'InaiMathi',
                    fontSize: 40,
                    color: const Color(0xff336c7e),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Container(child: buildSearchWidget(context)),
              ),
              Container(
                width: 160,
                height: 60,
                child: ElevatedButton(
                  child: Text(
                    'Search',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff56a1af),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0)),
                  ),
                  onPressed: () {
                    searchPlace(slug: _controller.text);
                    //Get.to(MakeAPlanOneScreen());
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildSearchWidget(BuildContext context) {
    return Container(
      height: 70,
      child: AppBar(
        brightness: Brightness.light,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60.0),
            side: BorderSide(width: 1.0, color: Colors.black)),
        backgroundColor: Colors.white,
        leadingWidth: 0.0,
        /*  leading: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.arrow_back,color: Colors.black,))), */
        title: Container(
          padding: const EdgeInsets.only(bottom: 20),
          child: Theme(
            data: ThemeData(
              primaryColor: Colors.white,
              hintColor: Colors.white,
            ),
            child: TextField(
              style: const TextStyle(color: Colors.black),
              controller: _controller,
              onSubmitted: (value) {
                if (value.length > 0) {}
              },
              onChanged: (value) {
                setState(() {
                  slug = value;
                });
              },
              autofocus: true,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.black,
                  hintText: 'Search',
                  labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 18)),
            ),
          ),
        ),
        /* actions: <Widget>[
          Visibility(
            visible: slug != null && slug.isNotEmpty,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: IconButton(
                icon: const Icon(
                  Icons.clear,
                  color: Colors.black,
                ),
                onPressed: () {
                  _controller.clear();
                  setState(() {
                    slug = '';
                  });
                },
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {
              Get.to(DiscoverScreen());
              // if (slug.length > 0)

              FocusScope.of(context).requestFocus(new FocusNode());
            },
          ),
        ], */
      ),
    );
  }
}

const String _svg_ukfjo =
    '<svg viewBox="0.0 571.0 472.0 191.2" ><path transform="translate(0.0, 571.0)" d="M 0 143.4247283935547 L 0 0 C 16.69464492797852 15.42425537109375 35.44844055175781 29.48886108398438 55.74271392822266 41.80119323730469 C 76.18901824951172 54.205810546875 98.29541015625 64.88928985595703 121.4470367431641 73.55449676513672 C 145.0256500244141 82.37969207763672 169.8429412841797 89.16684722900391 195.2102508544922 93.72899627685547 C 221.2795715332031 98.41685485839844 248.1671600341797 100.7935485839844 275.1263122558594 100.7935485839844 C 310.6441345214844 100.7935485839844 345.7482299804688 96.69564819335938 379.4639587402344 88.61319732666016 C 412.1154479980469 80.78524017333984 443.2488403320312 69.28216552734375 472 54.42190551757812 L 472 73.91500854492188 C 413.1552429199219 144.4662628173828 310.2545776367188 191.2152099609375 193.1477508544922 191.2152099609375 C 121.0647811889648 191.2152099609375 54.35754013061523 173.4986267089844 0 143.4247283935547 Z" fill="#56a1af" fill-opacity="0.5" stroke="none" stroke-width="1" stroke-opacity="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_k8hm2o =
    '<svg viewBox="-97.0 564.0 472.0 191.2" ><path transform="matrix(-1.0, 0.0, 0.0, -1.0, 375.0, 755.22)" d="M 0 47.79048538208008 L 0 191.2152099609375 C 16.69464683532715 175.7909545898438 35.44844436645508 161.7263488769531 55.74271774291992 149.4140167236328 C 76.18902587890625 137.0093994140625 98.29541778564453 126.3259201049805 121.4470443725586 117.6607131958008 C 145.0256652832031 108.8355178833008 169.8429565429688 102.0483627319336 195.2102661132812 97.48621368408203 C 221.2795867919922 92.79835510253906 248.1671752929688 90.42166137695312 275.1263427734375 90.42166137695312 C 310.6441650390625 90.42166137695312 345.7482604980469 94.51956176757812 379.4639892578125 102.6020126342773 C 412.115478515625 110.4299697875977 443.2488708496094 121.9330444335938 472.0000305175781 136.7933044433594 L 472.0000305175781 117.3002014160156 C 413.1552734375 46.74895095825195 310.2546081542969 0 193.1477661132812 0 C 121.0647888183594 0 54.3575439453125 17.71658706665039 0 47.79048538208008 Z" fill="#56a1af" fill-opacity="0.5" stroke="none" stroke-width="1" stroke-opacity="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_nqgfh =
    '<svg viewBox="-64.0 672.2 472.0 191.2" ><path transform="matrix(-1.0, 0.0, 0.0, -1.0, 408.0, 863.39)" d="M 0 47.79048538208008 L 0 191.2152099609375 C 16.69464683532715 175.7909545898438 35.44844436645508 161.7263488769531 55.74271774291992 149.4140167236328 C 76.18902587890625 137.0093994140625 98.29541778564453 126.3259201049805 121.4470443725586 117.6607131958008 C 145.0256652832031 108.8355178833008 169.8429565429688 102.0483627319336 195.2102661132812 97.48621368408203 C 221.2795867919922 92.79835510253906 248.1671752929688 90.42166137695312 275.1263427734375 90.42166137695312 C 310.6441650390625 90.42166137695312 345.7482604980469 94.51956176757812 379.4639892578125 102.6020126342773 C 412.115478515625 110.4299697875977 443.2488708496094 121.9330444335938 472.0000305175781 136.7933044433594 L 472.0000305175781 117.3002014160156 C 413.1552734375 46.74895095825195 310.2546081542969 0 193.1477661132812 0 C 121.0647888183594 0 54.3575439453125 17.71658706665039 0 47.79048538208008 Z" fill="#56a1af" fill-opacity="0.5" stroke="none" stroke-width="1" stroke-opacity="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_v164it =
    '<svg viewBox="-97.0 620.8 472.0 191.2" ><path transform="matrix(-1.0, 0.0, 0.0, -1.0, 375.0, 812.0)" d="M 0 47.79048538208008 L 0 191.2152099609375 C 16.69464683532715 175.7909545898438 35.44844436645508 161.7263488769531 55.74271774291992 149.4140167236328 C 76.18902587890625 137.0093994140625 98.29541778564453 126.3259201049805 121.4470443725586 117.6607131958008 C 145.0256652832031 108.8355178833008 169.8429565429688 102.0483627319336 195.2102661132812 97.48621368408203 C 221.2795867919922 92.79835510253906 248.1671752929688 90.42166137695312 275.1263427734375 90.42166137695312 C 310.6441650390625 90.42166137695312 345.7482604980469 94.51956176757812 379.4639892578125 102.6020126342773 C 412.115478515625 110.4299697875977 443.2488708496094 121.9330444335938 472.0000305175781 136.7933044433594 L 472.0000305175781 117.3002014160156 C 413.1552734375 46.74895095825195 310.2546081542969 0 193.1477661132812 0 C 121.0647888183594 0 54.3575439453125 17.71658706665039 0 47.79048538208008 Z" fill="#56a1af" fill-opacity="0.5" stroke="none" stroke-width="1" stroke-opacity="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
