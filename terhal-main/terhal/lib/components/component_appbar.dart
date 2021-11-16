
import 'package:flutter/material.dart';

import 'component_text_widgets.dart';

class ComponentAppBar{
 static Widget buildAppBar(String title){
    return AppBar(title: ComponentText.buildTextWidget(title: title,color: Colors.white,fontSize: 16.0),);

  }
}