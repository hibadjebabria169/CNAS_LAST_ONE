class Patient {
  int Nss;
  String nom;
  String prenom;
  String dateNaissance;
  String emailPatient;
  String passwordPatient;
  int idOperateur;

  Patient(
      {this.Nss = 0,
      required this.nom,
      required this.prenom,
      required this.dateNaissance,
      required this.emailPatient,
      required this.passwordPatient,
      required this.idOperateur});

  Map<String, dynamic> toJson() => {
        "Nss": Nss,
        "nom": nom,
        "prenom": prenom,
        "dateNaissance": dateNaissance,
        "emailPatient": emailPatient,
        "passwordPatient": passwordPatient,
        "idOperateur": idOperateur
      };
  static Patient fromJson(Map<String, dynamic> json) {
    return Patient(
        Nss: json['nss'],
        nom: json['nom'],
        prenom: json['prenom'],
        dateNaissance: json['datenaissance'],
        emailPatient: json['emailpatient'],
        passwordPatient: json['passwordpatient'],
        idOperateur: json['idoperateur']);
  }
}
