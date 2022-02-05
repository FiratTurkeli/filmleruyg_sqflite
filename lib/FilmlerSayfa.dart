import 'DetaySayfa.dart';
import 'Filmler.dart';
import 'package:filmleruygulamasi/filmlerdao.dart';
import 'package:flutter/material.dart';
import 'package:filmleruygulamasi/Kategoriler.dart';
import 'Filmler.dart';
import 'Kategoriler.dart';

class FilmlerSayfa extends StatefulWidget {
  Kategoriler kategori;


  FilmlerSayfa({required this.kategori});

  @override
  _FilmlerSayfaState createState() => _FilmlerSayfaState();
}

class _FilmlerSayfaState extends State<FilmlerSayfa> {

  Future<List<Filmler>> filmleriGoster(int kategori_id) async {
    var filmlerListesi = await Filmlerdao().tumFilmlerByKategoriId(kategori_id);
    return filmlerListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filmler : ${widget.kategori.kategori_ad}"),
      ),
      body: FutureBuilder<List<Filmler>>(
        future: filmleriGoster(widget.kategori.kategori_id),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var filmlerListesi = snapshot.data;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3.5,
              ),
              itemCount: filmlerListesi!.length,
              itemBuilder: (context,indeks){
                var film = filmlerListesi[indeks];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(film: film ,)));
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("resimler/${film.film_resim}"),
                        ),
                        Text(film.film_Ad,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                );
              },
            );
          }else{
            return Center();
          }
        },
      ),

    );
  }
}
