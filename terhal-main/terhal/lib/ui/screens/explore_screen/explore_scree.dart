import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/route_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:terhal/components/component_sized_box.dart';
import 'package:terhal/components/component_text_widgets.dart';
import 'package:terhal/constants/const_images_paths.dart';
import 'package:terhal/constants/constants_colors.dart';
import 'package:terhal/helpers/utils.dart';
import 'package:terhal/ui/screens/explore_screen/discover_screen.dart';
import 'package:terhal/ui/screens/explore_screen/explore_detail_screen.dart';
import 'package:terhal/ui/screens/schedule/make_a_plan1_screen.dart';
import 'package:weather_icons/weather_icons.dart' as icon;
import 'package:weather_icons/weather_icons.dart';

import 'discover_screen_tab.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final urlImages = [
    'https://images.skyscrapercenter.com/building/kingdom-centre_omrania-associates2.jpg',
    'https://lp-cms-production.imgix.net/image_browser/2_Maiden_Saleh.jpg?auto=format&fit=crop&sharp=10&vib=20&ixlib=react-8.6.4&w=850',
    'https://www.arabnews.com/sites/default/files/styles/n_670_395/public/2019/07/07/1655116-1608439442.jpg?itok=wNbz3w3s',
    'https://farm4.static.flickr.com/3020/2989619669_a3f776497f.jpg',
  ];
  int activeIndex = 0;
  var tmp = '\u00B0';
    final firestoreInstance = FirebaseFirestore.instance;
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
  TextEditingController _controller = TextEditingController();
  String slug = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ComponentText.buildTextWidget(
                              title: 'Where',
                              fontWeight: FontWeight.bold,
                              fontSize: 34,
                              color: Colors.black),
                          ComponentSizedBox.topMargin(size: 12),
                          ComponentText.buildTextWidget(
                              title: 'Will you go today',
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                              color: Colors.grey),
                        ],
                      ),
                      Container(
                        width: 140,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 2.0,
                          color: ConstantColor.medblue,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ComponentText.buildTextWidget(
                                    title: 'Riyad',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white),
                                ComponentSizedBox.topMargin(size: 4),
                                ComponentText.buildTextWidget(
                                    title: '38$tmp',
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16,
                                    color: Colors.white),
                                ComponentSizedBox.topMargin(size: 6),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ComponentText.buildTextWidget(
                                        title: 'Mostly\nSunny',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14,
                                        color: Colors.white),
                                    const Icon(
                                      icon.WeatherIcons.day_sunny,
                                      color: Colors.yellow,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  ComponentSizedBox.topMargin(size: 20),
                  buildSearchWidget(context),
                  ComponentSizedBox.topMargin(size: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        exploreType(
                          title: 'Historic',
                          icon: ImagePath.HISTORIC,
                        ),
                        exploreType(
                          title: 'Entertaining',
                          icon: ImagePath.FUN,
                        ),
                        exploreType(
                          title: 'Events',
                          icon: ImagePath.EVENT,
                        ),
                        exploreType(
                          title: 'Popular',
                          icon: ImagePath.POPULAR,
                        )
                      ],
                    ),
                  ),
                  ComponentText.buildTextWidget(
                      title: 'Most Visited',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: ConstantColor.black.withOpacity(0.5)),
                  const SizedBox(
                    height: 16,
                  ),
                  CarouselSlider.builder(
                    itemCount: urlImages.length,
                    options: CarouselOptions(
                      height: 270,
                      autoPlay: false,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 1000),
                      reverse: false,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      onPageChanged: (index, reasons) =>
                          setState(() => activeIndex = index),
                    ),
                    itemBuilder: (context, index, realIndex) {
                      final urlImage = urlImages[index];
                      return buildImage(urlImage, index);
                    },
                  ),

                  // buildIndicator(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget exploreType({String title, String icon}) {
    return InkWell(
      onTap: (){
       
        Get.to(DiscoverScreenTab(placeType: title,));
      },
      child: Container(
      
        height: 100,
        child: Column(
          children: [
            Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: ConstantColor.lightgreen,
              child: Container(
                width: 55,
                height: 55,
                /*  decoration: BoxDecoration(
                
                  
                  
                    color: ConstantColor.lightgreen,
                    borderRadius: BorderRadius.circular(15)), */
                child: Center(
                    child: Image.asset(
                  icon,
                  fit: BoxFit.contain,
                  width: 40,
                )),
              ),
            ),
            ComponentSizedBox.topMargin(size: 3),
            ComponentText.buildTextWidget(
                title: title, color: Colors.grey, fontSize: 13)
          ],
        ),
      ),
    );
  }

  Widget buildImage(String urlImage, int index) => InkWell(
        onTap: () {
         
        },
        child: Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey,
          ),
          child: Image.network(
            urlImage,
            fit: BoxFit.cover,
          ),
        ),
      );
//Dot Indicator Builder
  buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: urlImages.length, //how many dot we want to display
        effect: JumpingDotEffect(),
      );
  AppBar buildSearchWidget(BuildContext context) {
    return AppBar(
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
        padding: const EdgeInsets.only(left: 0),
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
                hintText: 'What would you like to discover?',
                labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                hintStyle: TextStyle(color: Colors.grey, fontSize: 18)),
          ),
        ),
      ),
      actions: <Widget>[
        Visibility(
          visible: slug != null && slug.isNotEmpty,
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
        IconButton(
          icon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
          onPressed: () {
             searchPlace(slug:_controller.text );
           // Get.to(DiscoverScreen());
            // if (slug.length > 0)

            FocusScope.of(context).requestFocus(new FocusNode());
          },
        ),
      ],
    );
  }
}
