class RendezVous {
  int idRdv;
  String dateRdv;
  String locationFrom;
  String locationTo;
  int idPatient;
  int idOperateur;
  String typeRdv;
  double longDep;
  double latDep;
  double longDes;
  double latDes;

  RendezVous(
      {required this.idRdv,
      required this.dateRdv,
      required this.typeRdv,
      required this.longDep,
      required this.longDes,
      required this.latDep,
      required this.latDes,
      required this.idOperateur,
      required this.idPatient,
      required this.locationFrom,
      required this.locationTo});

  Map<String, dynamic> toJson() => {
        'idrdv': idRdv,
        'daterdv': dateRdv,
        'idoperateur': idOperateur,
        'typerdv': typeRdv,
        'longdep': longDep,
        'longdes': longDes,
        'latdep': latDep,
        'latdes': latDes,
        'idpatient': idPatient,
        'locationfrom': locationFrom,
        'locationto': locationTo,
      };

  static RendezVous fromJson(Map<String, dynamic> json) {
    return RendezVous(
      idRdv: json['idRdv'],
      dateRdv: json['dateRdv'],
      typeRdv: json['typeRdv'],
      idOperateur: json['idOperateur'],
      longDep: json['longDep'],
      idPatient: json['idPatient'],
      locationFrom: json['locationFrom'],
      locationTo: json['locationTo'],
      longDes: json['longDes'],
      latDep: json['latDes'],
      latDes: json['latDes'],
    );
  }
}
