import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_app_mvvm/data/base_error.dart';
import 'package:movie_app_mvvm/domain/repo/home_repo.dart';
import 'package:http/http.dart' as http;

import '../../model/movie_model.dart';
import '../../utils/strings.dart';
class HomeRepoImpl extends HomeRepo{
  @override
  Future<Either<BaseError, Movie>> getMovies() async{
   final connectivity = await (Connectivity().checkConnectivity());
   if(connectivity == ConnectivityResult.mobile || connectivity == ConnectivityResult.wifi){
     Uri url = Uri.parse(Strings.apiLink);
     http.Response response = await http.get(url);

     var json = jsonDecode(response.body);
     var movieResult = Movie.fromJson(json);
     if(response.statusCode >= 200 && response.statusCode < 300){
       return Right(movieResult);
     }
     else {
    return Left(BaseError(message: Strings.errorFetchingMovie));
    }

   }else{
     return Left(BaseError(message: Strings.pleaseCheckInternet));
   }
  }

}