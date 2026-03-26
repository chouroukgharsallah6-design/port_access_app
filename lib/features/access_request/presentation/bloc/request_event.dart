abstract class RequestEvent {}

class CreateRequestEvent extends RequestEvent {

  final String nom;
  final String prenom;
  final String cin;
  final String entreprise;
  final String motif;

  CreateRequestEvent({
    required this.nom,
    required this.prenom,
    required this.cin,
    required this.entreprise,
    required this.motif,
  });

}

class LoadRequestsEvent extends RequestEvent {}