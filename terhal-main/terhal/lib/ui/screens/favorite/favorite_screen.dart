import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:terhal/components/component_sized_box.dart';
import 'package:terhal/components/component_text_widgets.dart';
import 'package:terhal/constants/constants_colors.dart';
import 'package:terhal/models/discover_model.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
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
    list.add(DiscoverModel(
        title: 'Kingdom tower', image: urlImages[0], isFav: false));
    list.add(
        DiscoverModel(title: 'Madain Saleh', image: urlImages[1], isFav: true));
    list.add(DiscoverModel(
        title: 'Kingdom tower', image: urlImages[2], isFav: false));
    list.add(
        DiscoverModel(title: 'Madain Saleh', image: urlImages[3], isFav: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstantColor.medblue,
        automaticallyImplyLeading: false,
        title: Text('Favorite'),),
      body: StaggeredGridView.countBuilder(
          staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
          crossAxisCount: 2,
          itemCount: list.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return item(discoverModel: list[index]);
          }),
    );
  }

  Widget item({DiscoverModel discoverModel}) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(40)),
                height: 250,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(40.0),
                    child: Image.network(
                      discoverModel.image,
                      fit: BoxFit.cover,
                    )),
              )
            ],
          ),
          ComponentSizedBox.topMargin(size: 8),
          ComponentText.buildTextWidget(title: discoverModel.title)
        ],
      ),
    );
  }
}
