import 'package:filmleruygulamasi/Kategoriler.dart';
import 'package:filmleruygulamasi/Yonetmenler.dart';

class Filmler {
  late int film_id;
  late String film_Ad;
  late int film_yil;
  late String film_resim;
  late Kategoriler kategori;
  late Yonetmenler yonetmen;

  Filmler(this.film_id, this.film_Ad, this.film_yil, this.film_resim,
      this.kategori, this.yonetmen);
}