import 'package:flutter/material.dart';

class SonucEkrani extends StatefulWidget {

  bool? sonuc;

  SonucEkrani({required this.sonuc});

  @override
  State<SonucEkrani> createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {
  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    final double  ekYukseklik = ekranBilgisi.size.height;
    final double ekGenislik = ekranBilgisi.size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Sonuç Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: ekYukseklik/100),
              child: SizedBox(
                  width: ekGenislik/2,
                  height: ekGenislik/5,
                  child: widget.sonuc! ? Image.asset("fotolar/smiley.jpeg") : Image.asset("fotolar/sad.jpeg")),
            ),
            Text(widget.sonuc! ? "KAZANDINIZ" : "KAYBETTİNİZ", style: TextStyle(color: Colors.black54, fontSize: 36)),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.pop(context); // geri tuşu gibi işliyor
                },
                child: Text("TEKRAR DENE", style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal,
                  shadowColor: Colors.teal,
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
