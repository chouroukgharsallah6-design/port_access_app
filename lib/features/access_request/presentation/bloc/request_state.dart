abstract class RequestState {}

class RequestInitial extends RequestState {}

class RequestLoading extends RequestState {}

class RequestSuccess extends RequestState {}

class RequestLoaded extends RequestState {}

class RequestError extends RequestState {
  final String message;

  RequestError(this.message);
}