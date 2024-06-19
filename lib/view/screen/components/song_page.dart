import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/Music_provider.dart';

class SongPage extends StatelessWidget {
  SongPage({super.key, required this.musicProvider});

  MusicProvider musicProvider = MusicProvider();

  String _printDuration(Duration? duration) {
    if (duration == null) return '--:--';

    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '${twoDigits(duration.inMinutes)}:$twoDigitSeconds';
  }

  @override
  Widget build(BuildContext context) {
    MusicProvider providerTrue =
    Provider.of<MusicProvider>(context, listen: true);
    MusicProvider providerFalse =
    Provider.of<MusicProvider>(context, listen: false);
    return Scaffold(
        backgroundColor: const Color(0xff0d0d31),
        appBar: AppBar(
          backgroundColor: const Color(0xff0d0d31),
          title: Center(
            child: const Text(
              "Ganna App",
              style: TextStyle(
                  color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          actions: const [
            Icon(Icons.more_horiz_rounded, color: Colors.white, size: 30),
          ],
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(height: 30),
          Container(
            height: 350,
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey,
            ),
            child: Image.asset(
              musicProvider.songList[musicProvider.currentIndex]['img'],
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  musicProvider.songList[musicProvider.currentIndex]['name'],
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Spacer(),
                Icon(Icons.refresh, color: Colors.white, size: 35),
                SizedBox(width: 10),
                Icon(Icons.favorite_border, color: Colors.white, size: 35),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  "  Lyrics",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 20),
                Container(
                    height: 20,
                    width: 70,
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        Text("Follow",style: TextStyle(color: Colors.white),)
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey,
                    ))
              ],
            ),
          ),
          const SizedBox(height: 30),
          Consumer<MusicProvider>(

            builder: (context, music, child) =>  Slider(
              activeColor: Colors.red,
              value: music.currentPosition.inMilliseconds.toDouble(),
              min: 0,
              max:  music.totalDuration.inMilliseconds.toDouble(),
              onChanged: (value) {
                music.seek(value);

              },
            ),
          ),

          Row(
            // mainAxisAlignment: MainAxisAlignment.,
            children: [
              SizedBox(
                width: 20,
              ),
            Consumer<MusicProvider>(
              builder: (context, music, child) => Text(
                '${_printDuration(music.currentPosition)} ',
                style: TextStyle(color: Colors.white),
              ),
            ),
             Spacer(),
              Consumer<MusicProvider>(
              builder: (context, music, child) => Text(
                ' ${_printDuration(music.totalDuration)}',
                style: TextStyle(color: Colors.white),
              ),
            ),
              SizedBox(
                width: 20,
              ),
          ],
          ),

          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {

                },
                icon: const Icon(Icons.shuffle, size: 45, color: Colors.white),
              ),
              IconButton(
                onPressed: () {
                 // providerTrue.assetsAudioPlayer!.previous();
                  providerFalse.playPreviousSong();
                },
                icon: const Icon(Icons.fast_rewind,
                    color: Colors.white, size: 45),
              ),
              (providerTrue.isplay)?
              IconButton(
                onPressed: () {
                  providerFalse.assetsAudioPlayer!.play();
                  providerFalse.songplay();
                },
                icon: const Icon(Icons.play_circle_fill_outlined,
                    color: Colors.white, size: 80),
                )
              :
              IconButton(
                onPressed: () {
                  providerTrue.assetsAudioPlayer!.pause();
                  providerTrue.songplay();
                },
                icon:
                    const Icon(Icons.pause_circle,
                        color: Colors.white, size: 80),

              ),
              IconButton(
                onPressed: () {
                  // providerTrue.assetsAudioPlayer!.previous();
                  providerFalse.nextAudio();
                },
                icon: const Icon(Icons.fast_forward,
                    size: 45, color: Colors.white),
              ),
              IconButton(
                onPressed: () {
                 // condition apply
                },
                icon: const Icon(Icons.rectangle_rounded,
                    size: 45, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Container(
            height: 6,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {

                },
                child: const Icon(Icons.lyrics, size: 25, color: Colors.white),
              ),
              const Text(
                "Lyrics",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 60),
              InkWell(
                onTap: () {

                },
                child: const Icon(Icons.queue_music,
                    size: 25, color: Colors.white),
              ),
              const Text(
                "Queue",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 60),
              InkWell(
                onTap: () {

                },
                child: const Icon(Icons.list_rounded,
                    size: 25, color: Colors.white),
              ),
              const Text(
                "Similar",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ]
        )
    );

  }
}

