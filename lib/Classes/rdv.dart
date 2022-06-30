class RendezVous {
  int idRdv;
  String dateRdv;
  String typeRdv;
  double longDep;
  double longDes;
  double latDep;
  double latDes;
  int NSS;
  int idOperateur;

  RendezVous(
      {required this.idRdv,
      required this.dateRdv,
      required this.typeRdv,
      required this.longDep,
      required this.longDes,
      required this.latDep,
      required this.latDes,
      required this.idOperateur,
      required this.NSS});

  Map<String, dynamic> toJson() => {
        'idrdv': idRdv,
        'daterdv': dateRdv,
        'idoperateur': idOperateur,
        'nss': NSS,
        'typerdv': typeRdv,
        'longdep': longDep,
        'longdes': longDes,
        'latdep': latDep,
        'latdes': latDes
      };

  static RendezVous fromJson(Map<String, dynamic> json) {
    return RendezVous(
      idRdv: json['idRdv'],
      dateRdv: json['dateRdv'],
      typeRdv: json['typeRdv'],
      idOperateur: json['idOperateur'],
      NSS: json['NSS'],
      longDep: json['longDep'],
      longDes: json['longDes'],
      latDep: json['latDes'],
      latDes: json['latDes'],
    );
  }
}
