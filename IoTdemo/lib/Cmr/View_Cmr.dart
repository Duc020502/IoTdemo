import 'package:flutter/material.dart';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:tuple/tuple.dart';
import 'Them_cmr.dart';

class View_cmr extends StatefulWidget {
   const View_cmr({super.key,});

  @override
  State<View_cmr> createState() => _View_cmrState();
}

class _View_cmrState extends State<View_cmr> {
  final FijkPlayer player = FijkPlayer();

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
     final String link = ThemCmr.url;
     final String ipnet = ThemCmr.IP;
     //final camIp = parseIpAndPort(link);
     //final portnet = camIp.item2;
     final String link1 = genCameraUrl(link, ipnet);

    await player.setDataSource(link1, autoPlay: true).catchError((e) {
      print("setDataSource error: $e");

    });

  }
  @override
  void dispose() {
    super.dispose();
    player.release();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        actions: <Widget>[
      IconButton(
      icon: const Icon(Icons.arrow_back_ios_new_outlined),
      tooltip: 'Show Snackbar',
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('This is a snackbar')));
      },
    ),]
      ),*/
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          //Container(width: double.infinity, height: 50, color: Colors.green,),
          Expanded( child: FijkView(color: Colors.deepPurple.shade100,
              // fit: FijkFit.fitHeight,
              player: player),),

          Container(width: double.infinity, height: 550, color: Colors.deepPurple,
          ),

        ]

    )
    );
    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    // Center is a layout widget. It takes a single child and positions it
    // in the middle of the parent.
  }
}

Tuple6<String?, int?, List<String>, List<String>, List<String>, int>
parseIpAndPort(String cameraUrl) {
  final paths = cameraUrl.split('/');
  if (paths.length > 2) {
    final authenticals = paths[2].split('@');
    var authenticalIndex = 0;
    if (authenticals.length > 1) {
      authenticalIndex = 1;
    }
    final ips = authenticals[authenticalIndex].split(':');
    if (ips.length > 1) {
      return Tuple6(ips[0], int.parse(ips[1]), paths, ips, authenticals,
          authenticalIndex);
    }
  }
  return Tuple6(null, null, paths, [], [], 0);
}
String genCameraUrl(String path, String? domain) {
  if (domain == null || domain.isEmpty) {
    return path;
  }
  final camIp = parseIpAndPort(path);
  final paths = camIp.item3;
  final ips = camIp.item4;
  final authentical = camIp.item5;
  final authenticalIndex = camIp.item6;
  ips[0] = domain;
  authentical[authenticalIndex] = ips.join(':');
  paths[2] = authentical.join('@');
  final camUrl = paths.join('/');
  return camUrl;
}