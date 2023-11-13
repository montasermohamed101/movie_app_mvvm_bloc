import 'package:dartz/dartz.dart';
import 'package:movie_app_mvvm/data/base_error.dart';

import '../../model/movie_model.dart';
abstract class HomeRepo{

  Future<Either<BaseError,Movie>> getMovies();
}