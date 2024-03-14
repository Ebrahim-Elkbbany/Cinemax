import 'package:cinemax/core/api_service/api_service.dart';
import 'package:cinemax/core/api_service/failures.dart';
import 'package:cinemax/features/home/data/models/most_popular_movies_model.dart';
import 'package:cinemax/features/home/data/models/movies_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepo {
  ApiService apiService;

  HomeRepo(this.apiService);

  Future<Either<Failure, List<MoviesModel>>> fetchTopMoviesMovies() async {
    try {
      var response = await apiService.get(urlEndPoint: 'series/');
      List<MoviesModel> topMoviesList=[];
      for (int i = 0; i < response.length; i++) {
        topMoviesList.add(MoviesModel.fromJson(response[i]));
      }
      return Right(topMoviesList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
    
        return Left(ServerFailure(e.toString()));
      }
    }
  }
  Future<Either<Failure, List<MostPopularMoviesModel>>> fetchMostPopularMovies() async {
    try {
      var response = await apiService.get(urlEndPoint: '');
      List<MostPopularMoviesModel> mostPopularMoviesList=[];
      for (int i = 0; i < response.length; i++) {
        mostPopularMoviesList.add(MostPopularMoviesModel.fromJson(response[i]));
      }
      return Right(mostPopularMoviesList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {

        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
