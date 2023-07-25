import 'package:flutter/material.dart';

import '../Cmr/Them_cmr.dart';
import '../Cmr/View_Cmr.dart';


class app_bar extends StatelessWidget {
  const app_bar ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('App Ora Demo'),actions:<Widget> [IconButton(
        icon: const Icon(Icons.video_camera_back_outlined),
        //tooltip: 'Show Snackbar',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>const View_cmr()),
          );
          //ScaffoldMessenger.of(context).showSnackBar(
             // const SnackBar(content: Text('This is a snackbar')));
        },
      ),],),
        
        body: Center(

        ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: const EdgeInsets.fromLTRB(35, 50,0, 0),
          children: [
            ListTile(
              title: const Text('Thêm thiết bị'),
              onTap: () {
                // Update the state of the app.
                // ...


                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ThemCmr()));
              },
            ),
            ListTile(
              title: const Text('Danh sách thiết bị'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Ngôn ngữ'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Mật khẩu'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Chia sẻ dữ liệu'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Dữ liệu'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      )
    );;
  }
}
