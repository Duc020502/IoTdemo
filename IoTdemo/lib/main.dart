import 'package:flutter/material.dart';

import 'package:untitled10/ui/Menu.dart';
//import 'package:states_rebuilder/states_rebuilder.dart';
void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      home: const app_bar()
      // MyHomePage(url: 'rtsp://admin:L245A4DD@113.161.85.25:1025/cam/realmonitor?channel=1&subtype=0',),
    );
  }
}/*
class MyHomePage1 extends StatelessWidget {
  final String title;
   MyHomePage1({super.key, required this.title});
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          TextField(
            maxLines: 4,
            controller: _controller,
            autofocus: true,
            decoration: InputDecoration(
                fillColor: Theme.of(context).hoverColor,
                filled: true,
                labelText: 'Media Url'),
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
                onPressed: () {
                  print(_controller.text);
                  //addToHistory(MediaUrl(url: _controller.text));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              MyHomePage(url: _controller.text, )));
                },
                child: Text("Play"),
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

class MyHomePage extends StatefulWidget {
  final String url;
  const MyHomePage({super.key, required this.url});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FijkPlayer player = FijkPlayer();
  /*final playerRM = RM.inject<FijkPlayer>(
        () => FijkPlayer(),
  );*/




  @override
  void initState() {
    super.initState();
   // player.setOption(FijkOption.hostCategory, "enable-snapshot", 1);
   // player.setOption(FijkOption.playerCategory, "mediacodec-all-videos", 1);
    player.setOption(FijkOption.formatCategory, 'analyzeduration', 2000000);
    player.setOption(FijkOption.formatCategory, 'probesize', 1048576);
    player.setOption(FijkOption.formatCategory, 'flush_packets', 1);
    player.setOption(FijkOption.playerCategory, 'packet-buffering', 0);
    player.setOption(FijkOption.playerCategory, 'framedrop', 1);
    player.setOption(FijkOption.playerCategory, 'start-on-prepared', 0);
    player.setOption(FijkOption.playerCategory, 'reconnect', 5);
    player.setOption(FijkOption.playerCategory, 'max-buffer-size', 2097152);
    player.setOption(FijkOption.playerCategory, 'min-frames', 1);
    player.setOption(
        FijkOption.playerCategory, 'first-high-water-mark-ms', 100);
    player.setOption(
        FijkOption.playerCategory, 'next-high-water-mark-ms', 100);
    player.setOption(
        FijkOption.playerCategory, 'mediacodec-handle-resolution-change', 1);
    player.setOption(FijkOption.playerCategory, 'mediacodec', 0);
    player.setOption(FijkOption.playerCategory, 'mediacodec-auto-rotate', 1);
    player.setOption(FijkOption.playerCategory, 'mediacodec-all-videos', 1);
    player.setOption(FijkOption.playerCategory, 'mediacodec-sync', 1);
    player.setOption(FijkOption.playerCategory, 'mediacodec-hevc', 1);
    player.setOption(FijkOption.playerCategory, 'enable-accurate-seek', 1);
    player.setOption(FijkOption.playerCategory, 'opensles', 0);
    player.setOption(FijkOption.playerCategory, "soundtouch", 1);
    player.setOption(FijkOption.playerCategory, "fast", 1);

    player.setOption(FijkOption.formatCategory, 'fflags', 'nobuffer');
    player.setOption(
        FijkOption.formatCategory, 'http-detect-range-support', 1);
    player.setOption(FijkOption.formatCategory, 'rtsp_transport', 'tcp');

    player.setOption(FijkOption.codecCategory, 'skip_frame', 1);
    player.setOption(FijkOption.codecCategory, 'skip_loop_filter', 48);
    player.setOption(FijkOption.codecCategory, 'dns_cache_clear', 1);

    startPlay();
  }

  void startPlay() async {
    //await player.setOption(FijkOption.formatCategory, "max-fps", 15);
   // await player.setOption(FijkOption.formatCategory, "timeout", 0);
   //await player.setOption(FijkOption.formatCategory, "pixel_format","yuv420p");
    //await player.setOption(FijkOption.formatCategory, "rtsp_transport", "tcp");
    //await player.setOption(FijkOption.formatCategory, "rtsp_flags", "prefer_tcp");
   // await player.setOption(FijkOption.formatCategory, "max_delay", "0");
    //await player.setOption(FijkOption.hostCategory, "request-screen-on", 0);
   // await player.setOption(FijkOption.hostCategory, "request-audio-focus", 1);
    await player.setDataSource(widget.url, autoPlay: true).catchError((e) {
      print("setDataSource error: $e");
    });
  }
  @override
  void initState() {
    super.initState();

    player.setOption(FijkOption.hostCategory, "enable-snapshot", 1);
    player.setOption(FijkOption.playerCategory, "mediacodec-all-videos", 1);
    player.setOption(FijkOption.formatCategory, "rtsp_transport", "tcp");
    startPlay();
  }

  void startPlay() async {
    await playerRM.setState((player) async {
    if (player.state == FijkState.end) {
      player.release();
      return;
    }
     //player.setOption(FijkOption.formatCategory, "rtsp_transport", "tcp");
    await player.setOption(FijkOption.hostCategory, "request-screen-on", 1);
    await player.setOption(FijkOption.hostCategory, "request-audio-focus", 1);
    await player.setDataSource(widget.url, autoPlay: true).catchError((e) {
      print("setDataSource error: $e");
    });
  });
    playerRM.state.addListener(playListener);
  }
  void playListener() {
    //logD('player state: ${playerRM.state.state}');
    if (playerRM.hasObservers) {
      playerRM.setState((s) {});
    } else {
      playerRM.state.release();
    }
  }
  @override
  void dispose() {
    super.dispose();
     player.release();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          //Container(width: double.infinity, height: 50, color: Colors.green,),
          Expanded( child: FijkView(color: Colors.deepPurple.shade100,
         // fit: FijkFit.fitHeight,
          player: player),),
          Container(width: double.infinity, height: 550, color: Colors.deepPurple,),

        ]

    );
         // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         // Center is a layout widget. It takes a single child and positions it
         // in the middle of the parent.
  }
}
Stack(children: <Widget>[
BackButton(vm: vm),
const FourBounceDotLoading(),
], required child);
Scaffold(
appBar: AppBar(
// Here we take the value from the MyHomePage object that was created by
// the App.build method, and use it to set our appbar title.
title: Text('Video'),
automaticallyImplyLeading: true
),
body:
return FijkView(
              color: Colors.black,
              fit: FijkFit.fitHeight,
              player: player,
              panelBuilder: (_, __, ___, ____, _____) =>
                  BackButton(vm: cameraVM.state),
            );
*/