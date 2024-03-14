import 'package:cinemax/core/api_service/api_service.dart';
import 'package:cinemax/core/api_service/failures.dart';
import 'package:cinemax/features/details/data/model/most_popular_details_model.dart';
import 'package:cinemax/features/details/data/model/top_movies_details_model.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class DetailsRepo {
  ApiService apiService;

  DetailsRepo(this.apiService);

  Future<Either<Failure, TopMoviesDetailsModel>> fetchTopMoviesDetailsMovies(String id) async {
    try {
      var response = await apiService.get(urlEndPoint: 'series/$id');
      TopMoviesDetailsModel topMoviesList=TopMoviesDetailsModel.fromJson(response);
      return Right(topMoviesList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  Future<Either<Failure, MostPopularDetailsModel>> fetchMostPopularDetailsMovies(String id) async {
    try {
      var response = await apiService.get(urlEndPoint: id);
      MostPopularDetailsModel mostPopularDetailsModel = MostPopularDetailsModel.fromJson(response) ;
      return Right(mostPopularDetailsModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {

        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
