import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:terhal/components/component_sized_box.dart';
import 'package:terhal/components/component_text_widgets.dart';
import 'package:terhal/constants/constants_colors.dart';
import 'package:terhal/helpers/utils.dart';
import 'package:terhal/models/discover_model.dart';
import 'package:terhal/ui/screens/explore_screen/discover_screen_tab.dart';
import 'package:terhal/ui/screens/schedule/make_a_plan1_screen.dart';

class DiscoverScreen extends StatefulWidget {
  String placType;
  DiscoverScreen({this.placType});
  

  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  List<DiscoverModel> list = [];
  final urlImages = [
    'https://images.skyscrapercenter.com/building/kingdom-centre_omrania-associates2.jpg',
    'https://lp-cms-production.imgix.net/image_browser/2_Maiden_Saleh.jpg?auto=format&fit=crop&sharp=10&vib=20&ixlib=react-8.6.4&w=850',
    'https://www.arabnews.com/sites/default/files/styles/n_670_395/public/2019/07/07/1655116-1608439442.jpg?itok=wNbz3w3s',
    'https://farm4.static.flickr.com/3020/2989619669_a3f776497f.jpg',
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: Container(
            color: Colors.white,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: ComponentText.buildTextWidget(
                            title: '< Explore',
                            color: Colors.blue,
                            fontSize: 18)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ComponentText.buildTextWidget(
                        title: widget.placType,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  ComponentSizedBox.topMargin(size: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: TabBar(
                        unselectedLabelColor: Colors.grey,
                        unselectedLabelStyle:
                            TextStyle(fontWeight: FontWeight.normal),
                        isScrollable: true,
                        indicatorWeight: 1,
                        labelColor: Colors.black,
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        indicatorColor: Colors.black,
                        tabs: getTabHeaderList()),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(children: [
          DiscoverScreenTab(),
          DiscoverScreenTab(),
          DiscoverScreenTab(),
          DiscoverScreenTab(),
        ]),
        /*  SafeArea(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: ComponentText.buildTextWidget(
                        title: '< Explore',
                        color: ConstantColor.darkblue,
                        fontSize: 18)),
                ComponentSizedBox.topMargin(size: 20),
                ComponentText.buildTextWidget(
                    title: 'Discover',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ],
            ),
          ),
        ), */
      ),
    );
  }

  List<Widget> getTabHeaderList() {
    List<Widget> widgtes = [];
    widgtes.add(Text('Historical'));
    widgtes.add(Text('Entertaining'));
    widgtes.add(Text('Events'));
    widgtes.add(Text('Popular'));

    return widgtes;
  }
}
