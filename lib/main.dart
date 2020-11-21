import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

void main() {
  AssetsAudioPlayer.setupNotificationsOpenAction((notification) {
    print(notification.audioId);
    return true;
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kabaddi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Kabaddi Timer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Audio audio = Audio('assets/audios/countdown.mp3');
  AssetsAudioPlayer get _assetsAudioPlayer => AssetsAudioPlayer.withId("music");
  _playAudio(){
    _assetsAudioPlayer.open(audio);
    _assetsAudioPlayer.play();
  }
  int _counter = 30;
  Timer _timer;
  String buttonText = "Start";

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) =>
          setState(() {
              if (_counter == 0) {
                _counter = 30;
                buttonText="Start";
                _assetsAudioPlayer.stop();
                _assetsAudioPlayer.dispose();
                timer.cancel();
              } else {
                _counter = _counter - 1;
              }
              if(_counter==11){
                _playAudio();
                // playRing();
                // AssetsAudioPlayer.playAndForget(Audio("assets/countdown.mp3"));
                // _assetsAudioPlayer.play();
              }else if(_counter>10){
                _assetsAudioPlayer.stop();
                _assetsAudioPlayer.dispose();
              }
            },
          ),
    );
  }

  void stopTimer() {
    _counter = 30;
    _timer.cancel();
    _assetsAudioPlayer.stop();
    _assetsAudioPlayer.dispose();
  }

  // AssetsAudioPlayer get _assetsAudioPlayer => AssetsAudioPlayer.withId("music");
  // final List<StreamSubscription> _subscriptions = [];


  @override
  void dispose() {
    _timer.cancel();
    _assetsAudioPlayer.stop();
    _assetsAudioPlayer.dispose();
    super.dispose();
  }
  @override
  void initState() {
    // _subscriptions.add(_assetsAudioPlayer.playlistAudioFinished.listen((data) {
    //   print("playlistAudioFinished : $data");
    // }));
    // _subscriptions.add(_assetsAudioPlayer.audioSessionId.listen((sessionId) {
    //   print("audioSessionId : $sessionId");
    // }));
    // _subscriptions.add(_assetsAudioPlayer.playlistAudioFinished.listen((data) {
    //   print("playlistAudioFinished : $data");
    // }));
    // _subscriptions.add(_assetsAudioPlayer.audioSessionId.listen((sessionId) {
    //   print("audioSessionId : $sessionId");
    // }));
    // _subscriptions.add(AssetsAudioPlayer.addNotificationOpenAction((notification) {
    //   return false;
    // }));
    // _subscriptions.add(AssetsAudioPlayer.addNotificationOpenAction((notification) {
    //   return false;
    // }));
    super.initState();
  }

  // Audio find(List<Audio> source, String fromPath) {
  //   return source.firstWhere((element) => element.path == fromPath);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_counter',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline1,
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  if (buttonText == "Start") {
                    buttonText = "Stop";
                    startTimer();
                  } else {
                    buttonText="Start";
                    _counter=30;
                    stopTimer();
                  }
                });
              },
              textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xFF0D47A1),
                      Color(0xFF1976D2),
                      Color(0xFF42A5F5),
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(10.0),
                child: Text(
                    '$buttonText',
                    style: TextStyle(fontSize: 20)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
