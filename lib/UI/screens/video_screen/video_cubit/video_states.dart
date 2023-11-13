
abstract class VideoStates {}

class InitialVideoState extends VideoStates {}

class LoadingVideoState extends VideoStates {}

class SuccessVideoState extends VideoStates {}

class ErrorVideoState extends VideoStates {
  final String message;

  ErrorVideoState({required this.message});
}
class DisposeVideoState extends VideoStates {}