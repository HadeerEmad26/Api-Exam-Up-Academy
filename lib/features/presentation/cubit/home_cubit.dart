import 'package:apiexam/features/data/repositry/image_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.repo) : super(HomeInitial());
  final CatRepository repo;

  Future<void> getImages() async {
    emit(HomeLoadingState());
    var response = await repo.getImages();
    response.fold(
      (l) => emit(HomeErrorState(error: l)),
      (r) => emit(HomeSuccessState(catImages: r),
      ),
    );
  }
}
