
import 'package:filmleruygulamasi/FilmlerSayfa.dart';
import 'package:filmleruygulamasi/Kategoriledao.dart';

import 'package:flutter/material.dart';

import 'Kategoriler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {


  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {

  Future<List<Kategoriler>> kategorileriGoster() async {

    var kategoriListesi = await Kategorierdao().tumKategoriler();
    return kategoriListesi;

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filmler Uygulama"),
      ),
      body: FutureBuilder<List<Kategoriler>>(
        future: kategorileriGoster(),
        builder: (context, snapshot){
          if (snapshot.hasData) {

            var kategoriListesi = snapshot.data;

            return ListView.builder(
                itemCount: kategoriListesi!.length,
                itemBuilder: (context, indeks){

                  var kategori = kategoriListesi[indeks];

                  return GestureDetector(
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FilmlerSayfa(kategori: kategori,)));

                    },
                    child: Card(
                      child: SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(kategori.kategori_ad),
                            

                          ],
                        ),
                      ),
                    ),
                  );

                }

            );

          }  else {
            return const Center();
          }
        },
      )

    );
  }
}
