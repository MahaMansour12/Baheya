import 'package:flutter/material.dart';
import 'package:untitled2/ui/home/home.dart';
import 'package:video_player/video_player.dart';


class VideoScreen extends StatefulWidget {
  final   material;

  VideoScreen({required this.material});

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.material.url);
    _controller.initialize().then((_) {
      setState(() {});
      _controller.play();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(
      title: const Text('Videos',style: TextStyle(color: Colors.black, fontSize: 18)),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: InkWell(
          onTap: () {
            Navigator.pushReplacementNamed(context,home_screen.routName);
          },
          child: const Icon(Icons.arrow_back_ios_new_outlined,
              color: Colors.black, size: 25)),
    ) ,
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 16),
                  Text(widget.material.title??' ', style: TextStyle(fontSize: 18)),

                  SizedBox(height: 16),
                  Text(widget.material.description??' ', style: TextStyle(fontSize: 18),textAlign: TextAlign.center),
                  SizedBox(height: 8),
                 // Text(widget.material.stage??' ', style: TextStyle(fontSize: 18)),
                  Center(
                    child: _controller.value.isInitialized
                        ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                        : CircularProgressIndicator(),
                  ),
                ],
              ),
            ),

            Center(
              child: FloatingActionButton(
                backgroundColor: Colors.transparent,
                onPressed: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  });
                },
                child: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  color:Colors.white38 ,
                ),
              ),
            ),

          ],
        ),
      ),

    );
  }
}