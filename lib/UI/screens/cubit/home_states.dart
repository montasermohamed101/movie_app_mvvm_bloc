abstract class HomeStats{}
class InitialHomeState extends HomeStats{}
class LoadingHomeState extends HomeStats{}
class SuccessHomeState extends HomeStats{}
class ErrorHomeState extends HomeStats{
  final String message;

  ErrorHomeState({required this.message});
}