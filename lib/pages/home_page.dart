import 'package:fitness_app/pages/exercise_start_page.dart';
import 'package:fitness_app/services/exercise.dart';
import 'package:fitness_app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String apiURL =
      "https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json";

  Exercise exercise;

  @override
  void initState() {
    super.initState();

    setState(() {
      getExercise();
    });
  }

  void getExercise() async {
    var response = await http.get(apiURL);
    var body = response.body;

    var decodeJson = jsonDecode(body);

    exercise = Exercise.fromJson(decodeJson);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fitness App"),
      ),
      body: Container(
          child: (exercise != null)
              ? ListView(
                  children: exercise.exercises.map((e) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ExerciseStartPage(
                                      exercises: e,
                                    )));
                      },
                      child: Hero(
                        tag: e.id,
                        child: Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16)),
                          child: Stack(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: CachedNetworkImage(
                                  imageUrl: e.thumbnail,
                                  placeholder: (context, url) => Image(
                                    image: AssetImage("assets/placeholder.jpg"),
                                    width: MediaQuery.of(context).size.width,
                                    height: 250,
                                    fit: BoxFit.cover,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                  fit: BoxFit.cover,
                                  height: 250,
                                  width: MediaQuery.of(context).size.width,
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 250,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [
                                        Colors.black,
                                        Colors.black.withOpacity(0.1)
                                      ],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.center)),
                                ),
                              ),
                              Container(
                                height: 250,
                                alignment: Alignment.bottomLeft,
                                padding: EdgeInsets.only(left: 10, bottom: 10),
                                child: Text(
                                  e.title,
                                  style: textWhiteFont.copyWith(fontSize: 18),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                )
              : LinearProgressIndicator()),
    );
  }
}
