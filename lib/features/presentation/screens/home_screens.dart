import 'package:apiexam/core/database/api/end_points.dart';
import 'package:apiexam/core/utils/commens.dart';
import 'package:apiexam/features/data/model/image_model.dart';
import 'package:apiexam/features/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/services/service_locator.dart';
import '../../../core/utils/app_color.dart';
import '../cubit/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGround,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: AppBar(
          title: const Text("Flutter Cats App"),
          actions: [
            IconButton(
              onPressed: () {
                sl<HomeCubit>().getImages();
              },
              icon: Icon(Icons.replay),
            ),
          ],
          bottom: const PreferredSize(
              preferredSize: Size.square(20),
              child: Column(
                children: [
                  Text(
                    "cats",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              )),
        ),
      ),
      body: Center(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (BuildContext context, HomeState state) {
            if (state is HomeSuccessState) {
              return GridView.builder(
                  itemCount: state.catImages.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    ImageModel currentImage = state.catImages[index];
                    return InkWell(
                      onTap: () {
                        showToast(
                            message: currentImage.id,
                            state: ToastStates.success);
                      },
                      child: Image.network(
                        currentImage.url,
                        // width: 60,
                        // height: 30,
                      ),
                    );
                  });
            } else if (state is HomeLoadingState) {
              return const CircularProgressIndicator();
            } else if (state is HomeErrorState) {
              return Text(state.error.errorMessage);
            } else {
              return Image.network(EndPoint.pageNum);
            }
          },
        ),
      ),
    );
  }
}
