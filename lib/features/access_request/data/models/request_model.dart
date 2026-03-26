class RequestModel {

  final String id;
  final String nom;
  final String prenom;
  final String cin;
  final String entreprise;
  final String motif;
  final String status;

  RequestModel({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.cin,
    required this.entreprise,
    required this.motif,
    required this.status,
  });

  Map<String, dynamic> toMap() {

    return {
      "nom": nom,
      "prenom": prenom,
      "cin": cin,
      "entreprise": entreprise,
      "motif": motif,
      "status": status,
    };
  }

  factory RequestModel.fromMap(Map<String, dynamic> map, String id) {

    return RequestModel(
      id: id,
      nom: map["nom"],
      prenom: map["prenom"],
      cin: map["cin"],
      entreprise: map["entreprise"],
      motif: map["motif"],
      status: map["status"],
    );
  }
}