
import 'package:apiexam/core/error/error_model.dart';
import 'package:apiexam/features/data/model/image_model.dart';


abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<ImageModel> catImages;

  HomeSuccessState({required this.catImages});
}

class HomeErrorState extends HomeState {
  final ErrorModel error;

  HomeErrorState({required this.error});
}

class ClickImageSuccessState extends HomeState {}
class ClickImageErrorState extends HomeState {}


