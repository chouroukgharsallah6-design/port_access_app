import 'dart:async';
import '../../data/repositories/request_repository.dart';
import 'request_event.dart';
import 'request_state.dart';

class RequestBloc {
  final _controller = StreamController<RequestState>.broadcast();
  RequestState _state = RequestInitial();

  final RequestRepository repository;

  RequestBloc(this.repository);

  Stream<RequestState> get stream => _controller.stream;
  RequestState get state => _state;

  Future<void> add(RequestEvent event) async {
    if (event is CreateRequestEvent) {
      await _handleCreateRequest(event);
    }
  }

  Future<void> _handleCreateRequest(CreateRequestEvent event) async {
    try {
      _emit(RequestLoading());

      await repository.createRequest({
        "nom": event.nom,
        "prenom": event.prenom,
        "cin": event.cin,
        "entreprise": event.entreprise,
        "motif": event.motif,
        "status": "en attente",
      });

      _emit(RequestSuccess());
    } catch (e) {
      _emit(RequestError(e.toString()));
    }
  }

  void _emit(RequestState newState) {
    _state = newState;
    _controller.add(newState);
  }

  Future<void> close() async {
    await _controller.close();
  }
}
