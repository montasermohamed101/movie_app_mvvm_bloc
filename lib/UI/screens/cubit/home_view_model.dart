import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_mvvm/UI/screens/cubit/home_states.dart';
import 'package:movie_app_mvvm/data/base_error.dart';
import 'package:movie_app_mvvm/data/repo/home_repo_impl.dart';
import 'package:movie_app_mvvm/domain/repo/home_repo.dart';

import '../../../model/movie_model.dart';


class HomeViewModel extends Cubit<HomeStats>{
  HomeViewModel() : super(InitialHomeState());

  HomeRepo repo = HomeRepoImpl();

  List<Adventure> forYou = [];
  List<Adventure> action = [];
  List<Adventure> comedy = [];
  List<Adventure> drama = [];
  List<Adventure> adventure = [];
  List<Adventure> animation = [];
  Adventure? getNextRandomImage() {
    if (forYou.isNotEmpty) {
      Random random = Random();
      int randomNumber = random.nextInt(forYou.length);
      return forYou[randomNumber];
    }
    return null;
  }

  getMovies(BuildContext context)async{
    emit(LoadingHomeState());
    Either<BaseError,Movie> either = await repo.getMovies();

    either.fold((error) {
      emit(ErrorHomeState(message: error.message));
      print(error.message);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message),
        ),
      );

    }, (response) {
      forYou = response.foryou;
      action = response.action;
      drama = response.drama;
      comedy = response.comedy;
      adventure = response.adventure;
      animation = response.animation;
      if (forYou != null &&
          action != null &&
          drama != null &&
          comedy != null &&
          adventure != null &&
          animation != null) {
        emit(SuccessHomeState());
      }

    });

  }
}