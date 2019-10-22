main() {
  // var liste = ["elvin", "leyla", 5, 15];
  // List liste2 = ['zeyd', 'aysel'];
  // List<int> notlar = [5,8,7,9,];
  // liste[1]='asif';
  // print(liste);
  
  // var liste = ["elvin", "leyla", 5, 15];
  // liste.forEach((f)=>print(f));
  
  Qapi yeniQapi = new Qapi();
  yeniQapi.eni = 120;
  yeniQapi.materiali = 'Demir';
  yeniQapi.hundurluk = 220;
  yeniQapi.buraxilish_ili = '2016';
  yeniQapi.renk = 'Gray';
  yeniQapi.marka = 'Gucci';

  print(yeniQapi.eni);
  yeniQapi.qapiniAch();
  yeniQapi.qapiniBagla();

}



abstract class Madde {
  //Abstrakt metod - ici bosh metodlardi
  kutleGetir();
  hecimGetir();
  bool renglidimi(deyer) {
    return true;
  }
}
class Eshya extends Madde {
  String marka;

  @override
  hecimGetir() {
    // TODO: implement hecimGetir
    print('Eshyanin hecmi');
  }

  @override
  kutleGetir() {
    // TODO: implement kutleGetir
    print('Eshyanin kutlesi');
  }
}
class Qapi extends Eshya {
    String renk;
    String buraxilish_ili;
    num hundurluk;
    num eni;
    String materiali;

    qapiniAch() {
      print('Qapi achildi');
    }
    qapiniBagla() {
      print('Qapi baglandi');
    }
  }