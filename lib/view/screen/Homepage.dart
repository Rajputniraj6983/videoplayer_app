import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:videoplayer_app/modal/music_list.dart';
import 'package:videoplayer_app/provider/Music_provider.dart';
import 'package:videoplayer_app/view/screen/components/song_page.dart';



class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    MusicProvider musicProviderTrue =
        Provider.of<MusicProvider>(context, listen: true);
    MusicProvider musicProviderFalse =
        Provider.of<MusicProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff0d0d31),
        appBar: AppBar(
          backgroundColor: const Color(0xff0d0d31),
          automaticallyImplyLeading: false,
          title: const Text(
            'Hello there!',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          actions: const [
            Icon(
              Icons.settings,
              size: 25,
              color: Colors.white,
            )
          ],
        ),
        body: SingleChildScrollView(scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 50,
                    width: 380,
                    child: Row(
                      children: [
                        Container(
                          child: Image.asset(
                            'assets/images (5).jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 15),
                        const Text(
                          'Start @ 299/year.Hurry\nbefore prices go up',
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(width: 30),
                        Container(
                          height: 50,
                          width: 80,
                          child: Center(
                            child: Text(
                              'Subscribe',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  backgroundColor: Colors.red),
                            ),
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey)),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: const EdgeInsets.only(right: 250),
                child: Text(
                  "Top Picks",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              CarouselSlider(
                  items: List.generate(
                    Music.length,
                        (index) {
                      return Container(
                        width: double.infinity,
                        child: Image.asset(
                          Music[index]['img'],
                          fit: BoxFit.cover,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30)),
                      );
                    },
                  ),
                  options: CarouselOptions(
                      aspectRatio: 32 / 12,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayAnimationDuration: const Duration(milliseconds: 800),
                      autoPlayInterval: const Duration(seconds: 2),
                      enlargeFactor: 0.3,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal)),
              const SizedBox(height: 15),
              Container(
                height: 150,
                width: 350,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 30,
                          width: 80,
                          child: Image.asset("assets/logo.png"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            "Your Favourite Gaana App\n   Now Has All The Songs!",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        )
                      ],
                    ),
                    const  SizedBox(height: 5),
                    Container(
                      height: 35,
                      width: 250,
                      child: Center(
                          child: Text(
                            'Start Trial @ 1 Now!',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          )),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Ads-Free\n  Music",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        Divider(),
                        Text(
                          "    Downlaod   \nUnlimited Songs",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        Divider(color: Colors.white,),
                        Text(
                          "HD Quality\n     Music",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ],
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(
                      colors: [
                        Colors.blue,
                        Colors.pink,
                        Color(0xff0d0d31),
                        Colors.pinkAccent
                      ],
                    )),
              ),
              const  SizedBox(height: 20),
              const Row(
                children: [
                  Text("  Trending Songs",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                  SizedBox(width: 160,),
                  Text("See All",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),)
                ],
              ),
              SizedBox(
                height: 150,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: List.generate(
                        Music.length,
                            (inde) => Column(
                              children: [
                                InkWell(onTap: () {
                                  musicProviderFalse.songAdd(Music,inde);
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SongPage(musicProvider: musicProviderTrue,),));
                                },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 10),
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: AssetImage(Music[inde]['img']),fit: BoxFit.fill)),
                                  ),
                                ),
                                Text(Music[inde]['name'], style: TextStyle(color: Colors.white),),
                              ],
                            ),
                      ),
                    ),
                  ),
                ),
              ),
              const  Row(
                children: [
                  Text("  Top Charts",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                  SizedBox(width: 210),
                  Text("See All",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                  SizedBox(height: 10),
                ],
              ),
              SizedBox(
                height: 150,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                        children:
                        List.generate(top_song_audio.length,(index) => InkWell(onTap: () {
                          musicProviderFalse.songAdd(top_song_audio, index);
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SongPage(musicProvider: musicProviderTrue,),));
                        },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            height: 100,width: 100,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(image: AssetImage("${top_song_audio[index]['img']}"),fit: BoxFit.fill)),
                          ),
                        )
                        )
                    ),
                  ),
                ),

              ),
              const  Row(
                children: [
                  Text("  Party Song",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                  SizedBox(width: 210),
                  Text("See All",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                  SizedBox(height: 10),
                ],
              ),
              SizedBox(
                height: 150,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                        children:
                        List.generate(Hit_Song_list.length,(index) => InkWell(onTap: () {
                          musicProviderFalse.songAdd(Hit_Song_list, index);
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SongPage(musicProvider: musicProviderTrue,),));
                        },
                          child: Container(margin:EdgeInsets.symmetric(horizontal: 10),
                            height: 100,width: 100,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(image: AssetImage("${Hit_Song_list[index]['img']}"),fit: BoxFit.fill)),
                          ),
                        )
                        )
                    ),
                  ),
                ),

              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Color(0xff0d0d31),
            items:[
              BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search'),
              BottomNavigationBarItem(icon: Icon(Icons.podcasts),label: 'Podcast')


            ]),
      ),
    );
  }
}
