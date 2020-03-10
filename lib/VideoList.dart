import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

class VideoList extends StatefulWidget {
  VideoList({Key key, this.title}) : super(key: key);
  final String title;


  @override
  _VideoListState createState() => new _VideoListState();
}

class _VideoListState extends State<VideoList> {
  VideoPlayerController _controller;
  String videoPath;
  bool isPlaying = false;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        '/var/mobile/Containers/Data/Application/B32AEC55-605C-4AF7-864F-16BDECA073AA/Documents/Videos/1583837416391.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  Widget build(BuildContext context) {

    List<String> videoPaths = ModalRoute.of(context).settings.arguments as List<String>;


    if(isPlaying == false){
      return
        new Scaffold(
          appBar: new AppBar(
            title: new Text("Video History"),
          ),

          body: new ListView.builder(
            itemCount: videoPaths.length,
            itemExtent: 100,
            itemBuilder: (BuildContext context, int index ){
              return ListTile(
                title: Text("Video${index+1} path: ${videoPaths[index]}"),
                onTap: () async {
//                  _launchURL('file://'+videoPaths[index])
               await setState(() {
                    videoPath = "file://${videoPaths[index]}";
                    isPlaying = true;
                  });

               _controller = VideoPlayerController.network(
                   'file://${videoPaths[index]}')
                 ..initialize().then((_) {
                   // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
                   setState(() {});
                 });
                } ,
              );
            },
          ),
        );
    }else{
      return MaterialApp(
        title: 'Video Demo',
        home: Scaffold(
          body: Center(
            child: _controller.value.initialized
                ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
                : Container(),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
              });
            },
            child: Icon(
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
            ),
          ),
        ),
      );
    }

  }

}
