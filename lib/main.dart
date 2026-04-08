import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: AudioPage());
  }
}

class AudioPage extends StatefulWidget {
  const AudioPage({super.key});

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    initAudio();
  }

  Future<void> initAudio() async {
    await player.setAsset('assets/goat_scream.wav');
    await player.setVolume(0);
    await player.play();
    await player.pause();
    await player.seek(Duration.zero);
    await player.setVolume(1);
  }

  Future<void> playAudio(String path) async {
    await player.setAsset('assets/$path');
    await player.play();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Audio Player')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () async {
                await playAudio('fahhhhh.wav');
              },
              child: Text('FAAHHH'),
            ),

            SizedBox(height: 10),

            ElevatedButton(
              onPressed: () async {
                await playAudio('goat_scream.wav');
              },
              child: Text('Goat scream'),
            ),
          ],
        ),
      ),
    );
  }
}
