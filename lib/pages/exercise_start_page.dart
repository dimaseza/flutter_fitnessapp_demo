import 'package:fitness_app/pages/exercise_page.dart';
import 'package:fitness_app/services/exercise.dart';
import 'package:fitness_app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ExerciseStartPage extends StatefulWidget {
  final Exercises exercises;

  ExerciseStartPage({this.exercises});

  @override
  _ExerciseStartPageState createState() => _ExerciseStartPageState();
}

class _ExerciseStartPageState extends State<ExerciseStartPage> {
  int seconds = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Hero(
          tag: widget.exercises.id,
          child: Stack(
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: widget.exercises.thumbnail,
                placeholder: (context, url) => Image(
                  image: AssetImage("assets/placeholder.jpg"),
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF000000),
                      Color(0x00000000),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                  ),
                ),
              ),
              Positioned(
                bottom: 40,
                left: 0,
                right: 0,
                child: Container(
                  width: 200,
                  height: 200,
                  child: SleekCircularSlider(
                    appearance: CircularSliderAppearance(),
                    onChange: (value) {
                      seconds = value.toInt();
                    },
                    initialValue: 30,
                    min: 10,
                    max: 60,
                    innerWidget: (v) {
                      return Container(
                        alignment: Alignment.center,
                        child: Text(
                          "${v.toInt()} S",
                          style: textWhiteFont.copyWith(fontSize: 20),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: RaisedButton(
                    child: Text(
                      "Start Exercise",
                      style: textWhiteFont.copyWith(fontSize: 18),
                    ),
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: mainColor,
                    splashColor: Colors.white,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ExercisePage(
                                    exercises: widget.exercises,
                                    seconds: seconds,
                                  )));
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
