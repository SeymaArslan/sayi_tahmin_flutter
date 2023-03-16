import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sayi_tahmin_uyg/SonucEkrani.dart';

class TahminEkrani extends StatefulWidget {
  const TahminEkrani({Key? key}) : super(key: key);

  @override
  State<TahminEkrani> createState() => _TahminEkraniState();
}

class _TahminEkraniState extends State<TahminEkrani> {

  var tfTahmin = TextEditingController(); // textfielddan bilgi alacağız bunun için bir controller oluşturuyoruz
  int rastgeleSayi = 0;
  int kalanHak = 5;
  int i = 0;
  String yonlendirme = "";  //tahmini azalt veya artır

  @override
  void initState() {
    super.initState(); // sayfa açıldğı anda sayı üretmemiz için
    rastgeleSayi = Random().nextInt(101); // 0-100 aralığında sayı üreteceek
    print("Rastgele Sayı: $rastgeleSayi");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tahmin Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Kalan Hak : $kalanHak", style: TextStyle(color: Colors.blue, fontSize: 30)),
            Text("$yonlendirme", style: TextStyle(color: Colors.black54, fontSize: 24)),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tfTahmin, // textfield içerisine girdiğimiz bilgiyi artık bize iletecek
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: "Tahmin",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),

            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: (){

                  int tahmin = int.parse(tfTahmin.text);

                  if(tahmin == rastgeleSayi){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SonucEkrani(sonuc: true,)));
                    return; //doğru bilinen alan için tasarlıyoruz ve doğru olduğu için sonraki kodları çalıştırmamıza gerek yok bu yüzden returnle bitiriyoruz
                  }
                  if(tahmin > rastgeleSayi){
                    setState(() {
                      i = i + 1;
                      yonlendirme = "$i. Tahmin : $tahmin Değeri Azalt";
                    });
                  }

                  if(tahmin < rastgeleSayi){
                    setState(() {
                      i = i + 1;
                      yonlendirme = "$i. Tahmin : $tahmin Değeri Arttır";
                    });
                  }

                  // her butona bastığımızda kalanhakkı 1 azaltacağız
                  setState(() {
                    kalanHak = kalanHak - 1;
                  });

                  if(kalanHak == 0){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SonucEkrani(sonuc: false)));
                  }

                  tfTahmin.clear(); //önceki tahmini siliyoruz ki tekrar tahmin ettiğimizde alan boş olsun
                },
                child: Text("TAHMİN ET", style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  shadowColor: Colors.blue,
                  elevation: 10,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
