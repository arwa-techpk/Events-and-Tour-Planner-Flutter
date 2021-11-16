import 'package:flutter/material.dart';
import 'package:terhal/components/component_sized_box.dart';
import 'package:terhal/components/component_text_widgets.dart';
import 'package:terhal/constants/constants_colors.dart';

class ExploreDetailScreen extends StatefulWidget {
  const ExploreDetailScreen({Key key}) : super(key: key);

  @override
  _ExploreDetailScreenState createState() => _ExploreDetailScreenState();
}

class _ExploreDetailScreenState extends State<ExploreDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(

                onTap: (){
                  Navigator.pop(context);
                },
                child: ComponentText.buildTextWidget(title: '< Explore',color:Colors.blue,fontSize: 18)),

                
              ComponentSizedBox.topMargin(size: 20),
              ComponentText.buildTextWidget(
                  title: 'Kingdom Tower',
                  color: ConstantColor.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),

              ComponentSizedBox.topMargin(size: 20),
              Image.network(
                'https://images.skyscrapercenter.com/building/kingdom-centre_omrania-associates2.jpg',
                width: MediaQuery.of(context).size.width,
                height: 280,
                fit: BoxFit.cover,
              ),
              ComponentSizedBox.topMargin(size: 30),
              Expanded(
                  child: ComponentText.buildTextWidget(
                      title:
                          'Kingdom Centre continues to be\nunrivaled in being the most authentic\nshopping center in the area. Providing\na diverse mix of options makes shopping\nin the Kingdom Centre\nan unfogettable and exciting one.',
                      color: ConstantColor.black.withOpacity(0.6),
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      height: 1.6)),
            ],
          ),
        ),
      ),
    );
  }
}
