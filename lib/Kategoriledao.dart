import 'package:filmleruygulamasi/Filmler.dart';
import 'package:filmleruygulamasi/Kategoriler.dart';
import 'package:filmleruygulamasi/VeritabaniYardimcisi.dart';
import 'package:filmleruygulamasi/Yonetmenler.dart';

class Kategorierdao {
  Future<List<Kategoriler>> tumKategoriler() async {

    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM kategoriler");

    return List.generate(maps.length, (index){
      var satir = maps[index];




      return Kategoriler(satir["kategori_id"], satir["kategori_ad"]);;


    });
  }
}