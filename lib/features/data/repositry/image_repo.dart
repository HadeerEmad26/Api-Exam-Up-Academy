import 'package:apiexam/core/database/api/api_consumer.dart';
import 'package:apiexam/core/database/api/end_points.dart';
import 'package:apiexam/core/error/error_model.dart';
import 'package:apiexam/core/error/exceptions.dart';
import 'package:dartz/dartz.dart';
import '../model/image_model.dart';

class CatRepository{
  final ApiConsumer apiConsumer;

  CatRepository({required this.apiConsumer});
  Future<Either<ErrorModel,List<ImageModel>>> getImages() async{
    try{
      var response = await apiConsumer.get(EndPoint.endPoint,queryParameters:EndPoint.queryParameters);
      List<ImageModel> catImages=[];
      for (var element in response!) {
        catImages.add(ImageModel.fromJson(element));
      }
      print(catImages[0]);
      return Right(catImages);
    }on ServerException catch(e){
      return Left(e.errorModel);
    }
  }
}