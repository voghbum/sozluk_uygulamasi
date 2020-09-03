import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'models/sozluk.dart';

class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  Sozluk sozluk;
  String kelime;
  var myController = TextEditingController();

  Future<List<Sozluk>> _sozlukGetir(String kelime) async {
    var response = await http.get("https://sozluk.gov.tr/gts?ara=$kelime");
    if (response.statusCode == 200) {
      return sozlukFromJson(response.body);
    } else {
      throw Exception("Bağlanamadık");
    }
  }

  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 14, bottom: 8.0, right: 11, left: 11),
              child: TextField(
                onChanged: (aranankelime) {
                  if (myController.text.length < 1) {
                    setState(() {
                      kelime = null;
                    });
                  }
                },
                controller: myController,
                decoration: InputDecoration(
                    hintText: "kelime giriniz", labelText: "kelime giriniz"),
                keyboardType: TextInputType.text,
                onSubmitted: (girilenKelime) {
                  setState(
                    () {
                      kelime = girilenKelime;
                    },
                  );
                },
              ),
            ),
            sayfa()
          ],
        ),
      ),
      appBar: AppBar(title: Text("Kelime Öğren")),
    );
  }

  sayfa() {
    return FutureBuilder(
      future: _sozlukGetir(myController.text),
      builder: (BuildContext context, AsyncSnapshot<List<Sozluk>> snap) {
        if (snap.hasData) {
          return Column(children: [
            Card(
              color: Colors.black,
              child: ListTile(
                title: Text(
                  "girdiğiniz kelime: " + snap.data[0].madde.toUpperCase(),
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                subtitle: Text(
                  snap.data[0].anlamSay.toString() + " farklı anlama sahip",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            ListView.builder(
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 7, right: 7),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4, bottom: 4),
                      child: ListTile(
                        title: snap?.data[0]?.anlamlarListe[index]
                                    ?.ozelliklerListe == null
                            ? Text(snap.data[0].anlamlarListe[index].anlam)
                            : Text(snap.data[0].anlamlarListe[index]
                                    .ozelliklerListe[0].tamAdi +
                                ". " +
                                snap.data[0].anlamlarListe[index].anlam),
                        leading: Icon(
                          Icons.arrow_forward,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: int.parse(snap.data[0].anlamSay),
            ),
          ]);
        } else if (snap.connectionState == ConnectionState.waiting) {
          return Padding(
            child: CircularProgressIndicator(),
            padding: EdgeInsets.all(10),
          );
        }
        return Padding(
          padding: EdgeInsets.all(10),
          child: Text("Kelime Bulunamadı."),
        );
      },
    );
  }
}
