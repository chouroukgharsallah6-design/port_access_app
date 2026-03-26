import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/request_repository.dart';
import 'request_event.dart';
import 'request_state.dart';

class RequestBloc extends Bloc<RequestEvent, RequestState> {

  final RequestRepository repository;

  RequestBloc(this.repository) : super(RequestInitial()) {

    on<CreateRequestEvent>((event, emit) async {

      try {

        emit(RequestLoading());

        await repository.createRequest({
          "nom": event.nom,
          "prenom": event.prenom,
          "cin": event.cin,
          "entreprise": event.entreprise,
          "motif": event.motif,
          "status": "en attente"
        });

        emit(RequestSuccess());

      } catch (e) {

        emit(RequestError(e.toString()));

      }

    });

  }
}