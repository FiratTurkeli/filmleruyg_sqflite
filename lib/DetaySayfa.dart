import 'package:flutter/material.dart';

import 'Filmler.dart';

class DetaySayfa extends StatefulWidget {

  late Filmler film;


  DetaySayfa({required this.film});

  @override
  _DetaySayfaState createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.film.film_Ad),
        
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
                height: 300,
                width: 400,
                child: Image.asset("resimler/${widget.film.film_resim}")),
            Text(widget.film.film_yil.toString()),
            Text(widget.film.yonetmen.yonetmen_ad)


          ],
        ),
      ),

    );
  }
}
