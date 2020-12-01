import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache(prefix: "audios/");
  bool primeiraExecucao = true;
  double volume = 0.5;

  _executar() async {
    // definir a primeira marcacao de volume
    audioPlayer.setVolume(volume);
    if (primeiraExecucao) {
      audioPlayer = await audioCache.play("musica.mp3");
      primeiraExecucao = false;
    } else {
      audioPlayer.resume();
    }
    // String url =
    //     'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-16.mp3';
    // int result = await audioPlayer.play(url);
    // if (result == 1) {
    //   // success
    // }
  }

  _pausar() async {
    int resultado = await audioPlayer.pause();
    if (resultado == 1) {
      // pausado
    }
  }

  _parar() async {
    int resultado = await audioPlayer.stop();
    if (resultado == 1) {
      // pausado
    }
  }

  @override
  Widget build(BuildContext context) {
    // _executar();

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Play musics'),
          centerTitle: true,
        ),
        body: Container(
            child: Column(
          children: [
            Slider(
              value: volume,
              min: 0,
              max: 1,
              onChanged: (novoVolume) {
                setState(() {
                  volume = novoVolume;
                });
                audioPlayer.setVolume(novoVolume);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: GestureDetector(
                    child: Image.asset('assets/img/executar.png'),
                    onTap: () => _executar(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: GestureDetector(
                    child: Image.asset('assets/img/pausar.png'),
                    onTap: () => _pausar(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: GestureDetector(
                    child: Image.asset('assets/img/parar.png'),
                    onTap: () => _parar(),
                  ),
                )
              ],
            )
          ],
        )
            //
            ),
      ),
    );
  }
}
