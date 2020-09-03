// To parse this JSON data, do
// final sozluk = sozlukFromJson(jsonString);

import 'dart:convert';

List<Sozluk> sozlukFromJson(String str) => List<Sozluk>.from(json.decode(str).map((x) => Sozluk.fromJson(x)));

String sozlukToJson(List<Sozluk> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Sozluk {
  Sozluk({
    this.maddeId,
    this.kac,
    this.kelimeNo,
    this.cesit,
    this.anlamGor,
    this.onTaki,
    this.madde,
    this.cesitSay,
    this.anlamSay,
    this.taki,
    this.cogulMu,
    this.ozelMi,
    this.lisanKodu,
    this.lisan,
    this.telaffuz,
    this.birlesikler,
    this.font,
    this.maddeDuz,
    this.gosterimTarihi,
    this.anlamlarListe,
    this.atasozu,
  });

  String maddeId;
  String kac;
  String kelimeNo;
  String cesit;
  String anlamGor;
  dynamic onTaki;
  String madde;
  String cesitSay;
  String anlamSay;
  dynamic taki;
  String cogulMu;
  String ozelMi;
  String lisanKodu;
  String lisan;
  dynamic telaffuz;
  String birlesikler;
  dynamic font;
  String maddeDuz;
  dynamic gosterimTarihi;
  List<AnlamlarListe> anlamlarListe;
  List<Atasozu> atasozu;

  factory Sozluk.fromJson(Map<String, dynamic> json) => Sozluk(
    maddeId: json["madde_id"] == null ? null : json["madde_id"],
    kac: json["kac"] == null ? null : json["kac"],
    kelimeNo: json["kelime_no"] == null ? null : json["kelime_no"],
    cesit: json["cesit"] == null ? null : json["cesit"],
    anlamGor: json["anlam_gor"] == null ? null : json["anlam_gor"],
    onTaki: json["on_taki"],
    madde: json["madde"] == null ? null : json["madde"],
    cesitSay: json["cesit_say"] == null ? null : json["cesit_say"],
    anlamSay: json["anlam_say"] == null ? null : json["anlam_say"],
    taki: json["taki"],
    cogulMu: json["cogul_mu"] == null ? null : json["cogul_mu"],
    ozelMi: json["ozel_mi"] == null ? null : json["ozel_mi"],
    lisanKodu: json["lisan_kodu"] == null ? null : json["lisan_kodu"],
    lisan: json["lisan"] == null ? null : json["lisan"],
    telaffuz: json["telaffuz"],
    birlesikler: json["birlesikler"] == null ? null : json["birlesikler"],
    font: json["font"],
    maddeDuz: json["madde_duz"] == null ? null : json["madde_duz"],
    gosterimTarihi: json["gosterim_tarihi"],
    anlamlarListe: json["anlamlarListe"] == null ? null : List<AnlamlarListe>.from(json["anlamlarListe"].map((x) => AnlamlarListe.fromJson(x))),
    atasozu: json["atasozu"] == null ? null : List<Atasozu>.from(json["atasozu"].map((x) => Atasozu.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "madde_id": maddeId == null ? null : maddeId,
    "kac": kac == null ? null : kac,
    "kelime_no": kelimeNo == null ? null : kelimeNo,
    "cesit": cesit == null ? null : cesit,
    "anlam_gor": anlamGor == null ? null : anlamGor,
    "on_taki": onTaki,
    "madde": madde == null ? null : madde,
    "cesit_say": cesitSay == null ? null : cesitSay,
    "anlam_say": anlamSay == null ? null : anlamSay,
    "taki": taki,
    "cogul_mu": cogulMu == null ? null : cogulMu,
    "ozel_mi": ozelMi == null ? null : ozelMi,
    "lisan_kodu": lisanKodu == null ? null : lisanKodu,
    "lisan": lisan == null ? null : lisan,
    "telaffuz": telaffuz,
    "birlesikler": birlesikler == null ? null : birlesikler,
    "font": font,
    "madde_duz": maddeDuz == null ? null : maddeDuz,
    "gosterim_tarihi": gosterimTarihi,
    "anlamlarListe": anlamlarListe == null ? null : List<dynamic>.from(anlamlarListe.map((x) => x.toJson())),
    "atasozu": atasozu == null ? null : List<dynamic>.from(atasozu.map((x) => x.toJson())),
  };
}

class AnlamlarListe {
  AnlamlarListe({
    this.anlamId,
    this.maddeId,
    this.anlamSira,
    this.fiil,
    this.tipkes,
    this.anlam,
    this.gos,
    this.ozelliklerListe,
    this.orneklerListe,
  });

  String anlamId;
  String maddeId;
  String anlamSira;
  String fiil;
  String tipkes;
  String anlam;
  String gos;
  List<OzelliklerListe> ozelliklerListe;
  List<OrneklerListe> orneklerListe;

  factory AnlamlarListe.fromJson(Map<String, dynamic> json) => AnlamlarListe(
    anlamId: json["anlam_id"] == null ? null : json["anlam_id"],
    maddeId: json["madde_id"] == null ? null : json["madde_id"],
    anlamSira: json["anlam_sira"] == null ? null : json["anlam_sira"],
    fiil: json["fiil"] == null ? null : json["fiil"],
    tipkes: json["tipkes"] == null ? null : json["tipkes"],
    anlam: json["anlam"] == null ? null : json["anlam"],
    gos: json["gos"] == null ? null : json["gos"],
    ozelliklerListe: json["ozelliklerListe"] == null ? null : List<OzelliklerListe>.from(json["ozelliklerListe"].map((x) => OzelliklerListe.fromJson(x))),
    orneklerListe: json["orneklerListe"] == null ? null : List<OrneklerListe>.from(json["orneklerListe"].map((x) => OrneklerListe.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "anlam_id": anlamId == null ? null : anlamId,
    "madde_id": maddeId == null ? null : maddeId,
    "anlam_sira": anlamSira == null ? null : anlamSira,
    "fiil": fiil == null ? null : fiil,
    "tipkes": tipkes == null ? null : tipkes,
    "anlam": anlam == null ? null : anlam,
    "gos": gos == null ? null : gos,
    "ozelliklerListe": ozelliklerListe == null ? null : List<dynamic>.from(ozelliklerListe.map((x) => x.toJson())),
    "orneklerListe": orneklerListe == null ? null : List<dynamic>.from(orneklerListe.map((x) => x.toJson())),
  };
}

class OrneklerListe {
  OrneklerListe({
    this.ornekId,
    this.anlamId,
    this.ornekSira,
    this.ornek,
    this.kac,
    this.yazarId,
    this.yazar,
  });

  String ornekId;
  String anlamId;
  String ornekSira;
  String ornek;
  String kac;
  String yazarId;
  List<Yazar> yazar;

  factory OrneklerListe.fromJson(Map<String, dynamic> json) => OrneklerListe(
    ornekId: json["ornek_id"] == null ? null : json["ornek_id"],
    anlamId: json["anlam_id"] == null ? null : json["anlam_id"],
    ornekSira: json["ornek_sira"] == null ? null : json["ornek_sira"],
    ornek: json["ornek"] == null ? null : json["ornek"],
    kac: json["kac"] == null ? null : json["kac"],
    yazarId: json["yazar_id"] == null ? null : json["yazar_id"],
    yazar: json["yazar"] == null ? null : List<Yazar>.from(json["yazar"].map((x) => Yazar.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "ornek_id": ornekId == null ? null : ornekId,
    "anlam_id": anlamId == null ? null : anlamId,
    "ornek_sira": ornekSira == null ? null : ornekSira,
    "ornek": ornek == null ? null : ornek,
    "kac": kac == null ? null : kac,
    "yazar_id": yazarId == null ? null : yazarId,
    "yazar": yazar == null ? null : List<dynamic>.from(yazar.map((x) => x.toJson())),
  };
}

class Yazar {
  Yazar({
    this.yazarId,
    this.tamAdi,
    this.kisaAdi,
    this.ekno,
  });

  String yazarId;
  String tamAdi;
  String kisaAdi;
  String ekno;

  factory Yazar.fromJson(Map<String, dynamic> json) => Yazar(
    yazarId: json["yazar_id"] == null ? null : json["yazar_id"],
    tamAdi: json["tam_adi"] == null ? null : json["tam_adi"],
    kisaAdi: json["kisa_adi"] == null ? null : json["kisa_adi"],
    ekno: json["ekno"] == null ? null : json["ekno"],
  );

  Map<String, dynamic> toJson() => {
    "yazar_id": yazarId == null ? null : yazarId,
    "tam_adi": tamAdi == null ? null : tamAdi,
    "kisa_adi": kisaAdi == null ? null : kisaAdi,
    "ekno": ekno == null ? null : ekno,
  };
}

class OzelliklerListe {
  OzelliklerListe({
    this.ozellikId,
    this.tur,
    this.tamAdi,
    this.kisaAdi,
    this.ekno,
  });

  String ozellikId;
  String tur;
  String tamAdi;
  String kisaAdi;
  String ekno;

  factory OzelliklerListe.fromJson(Map<String, dynamic> json) => OzelliklerListe(
    ozellikId: json["ozellik_id"] == null ? null : json["ozellik_id"],
    tur: json["tur"] == null ? null : json["tur"],
    tamAdi: json["tam_adi"] == null ? null : json["tam_adi"],
    kisaAdi: json["kisa_adi"] == null ? null : json["kisa_adi"],
    ekno: json["ekno"] == null ? null : json["ekno"],
  );

  Map<String, dynamic> toJson() => {
    "ozellik_id": ozellikId == null ? null : ozellikId,
    "tur": tur == null ? null : tur,
    "tam_adi": tamAdi == null ? null : tamAdi,
    "kisa_adi": kisaAdi == null ? null : kisaAdi,
    "ekno": ekno == null ? null : ekno,
  };
}

class Atasozu {
  Atasozu({
    this.maddeId,
    this.madde,
    this.onTaki,
  });

  String maddeId;
  String madde;
  dynamic onTaki;

  factory Atasozu.fromJson(Map<String, dynamic> json) => Atasozu(
    maddeId: json["madde_id"] == null ? null : json["madde_id"],
    madde: json["madde"] == null ? null : json["madde"],
    onTaki: json["on_taki"],
  );

  Map<String, dynamic> toJson() => {
    "madde_id": maddeId == null ? null : maddeId,
    "madde": madde == null ? null : madde,
    "on_taki": onTaki,
  };
}
