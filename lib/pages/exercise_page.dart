import 'package:fitness_app/services/exercise.dart';
import 'package:fitness_app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

class ExercisePage extends StatefulWidget {
  final Exercises exercises;
  final int seconds;

  ExercisePage({this.exercises, this.seconds});

  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  bool _isCompleted = false;
  int _elapsedSeconds = 0;

  Timer timer;

  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache();

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timer.tick == widget.seconds) {
        timer.cancel();
        setState(() {
          _isCompleted = true;
        });

        playAudio();
      }

      setState(() {
        _elapsedSeconds = timer.tick;
      });
    });
  }

  void playAudio() {
    audioCache.play("cheering.mp3");
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: CachedNetworkImage(
              imageUrl: widget.exercises.gif,
              placeholder: (context, url) => Image(
                image: AssetImage("assets/placeholder.jpg"),
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          _isCompleted != true
              ? SafeArea(
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    alignment: Alignment.topCenter,
                    child: Text(
                      "$_elapsedSeconds/${widget.seconds} S",
                      style: textBlackFont.copyWith(fontSize: 20),
                    ),
                  ),
                )
              : Container(),
          SafeArea(
            child: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          )
        ],
      ),
    );
  }
}
