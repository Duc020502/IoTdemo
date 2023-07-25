import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';

//import 'View_Cmr.dart';

class ThemCmr extends StatelessWidget {
 static late String url;
 static late String IP;

  ThemCmr({super.key,});
  final TextEditingController _controller = TextEditingController();
 final TextEditingController _controller1 = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Thêm Camera'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          TextField(
            maxLines: 2,
            controller: _controller,
            autofocus: true,
            decoration: InputDecoration(
                fillColor: Theme.of(context).hoverColor,
                filled: true,
                labelText: 'Media Url'),
          ),
          TextField(
            maxLines: 2,
            controller: _controller1,
            autofocus: true,
            decoration: InputDecoration(
                fillColor: Theme.of(context).hoverColor,
                filled: true,
                labelText: 'IP'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  _controller.clear();
                },
                child: Text("Clean"),
              ),
              Container(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () async {

                  print(_controller.text);
                  //addToHistory(MediaUrl(url: _controller.text));
                  IP = _controller1.text;
                  url  = _controller.text ;
                  // Obtain shared preferences.
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Thêm camera thành công ')));
                  /*
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              View_cmr(url: url, )));*/
                },
                child: Text("Thêm"),
              ),
              Container(
                width: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}