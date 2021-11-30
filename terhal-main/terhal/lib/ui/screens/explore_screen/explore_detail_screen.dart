import 'package:flutter/material.dart';
import 'package:terhal/components/component_sized_box.dart';
import 'package:terhal/components/component_text_widgets.dart';
import 'package:terhal/constants/constants_colors.dart';
import 'package:terhal/models/explore_model.dart';

class ExploreDetailScreen extends StatefulWidget {
  ExploreModel exploreModel;
  ExploreDetailScreen({Key key, this.exploreModel}) : super(key: key);

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
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: ComponentText.buildTextWidget(
                      title: '< Explore', color: Colors.blue, fontSize: 18)),
              ComponentSizedBox.topMargin(size: 20),
              ComponentText.buildTextWidget(
                  title: widget.exploreModel.name,
                  color: ConstantColor.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
              ComponentSizedBox.topMargin(size: 20),
              Image.network(
                widget.exploreModel.image,
                width: MediaQuery.of(context).size.width,
                height: 280,
                fit: BoxFit.cover,
              ),
              ComponentSizedBox.topMargin(size: 30),
              Expanded(
                  child: ComponentText.buildTextWidget(
                      maxLines: 6,
                      title: widget.exploreModel.descrription,
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
