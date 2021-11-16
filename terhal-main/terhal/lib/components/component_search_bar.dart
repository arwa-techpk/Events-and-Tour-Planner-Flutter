

import 'package:flutter/material.dart';
class ComponentSearchbar extends StatefulWidget {
  const ComponentSearchbar({ Key key }) : super(key: key);

  @override
  _ComponentSearchbarState createState() => _ComponentSearchbarState();
}

class _ComponentSearchbarState extends State<ComponentSearchbar> {
  TextEditingController _controller = TextEditingController();
  String slug='';
  @override
  Widget build(BuildContext context) {
    return AppBar(
        brightness: Brightness.light,
        elevation: 1.0,
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child:IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios))),
        title: Container(
          padding: EdgeInsets.only(left: 15),
          child: Theme(
            data: ThemeData(
              primaryColor: Colors.white,
              hintColor: Colors.white,
            ),
            child: TextField(
              style: TextStyle(color: Colors.black),
              controller: _controller,
              onSubmitted: (value) {
                // if (value.length > 0)
              
              },
              onChanged: (value) {
                setState(() {
                  slug = value;
                });
              },
              autofocus: true,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.black,
                  hintText: 'Search',
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
                /*  setState(() {
                  slug = '';
                }); */
              },
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {
              // if (slug.length > 0)
             

              FocusScope.of(context).requestFocus(new FocusNode());
            },
          ),
        ],
      );
  }
}