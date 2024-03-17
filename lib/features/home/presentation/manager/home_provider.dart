import 'package:cinemax/features/home/data/models/most_popular_movies_model.dart';
import 'package:cinemax/features/home/data/models/movies_model.dart';
import 'package:cinemax/features/home/data/repos/home_repo.dart';
import 'package:flutter/foundation.dart';

class HomeProvider extends ChangeNotifier {
  HomeRepo homeRepo;
  List<MoviesModel> topMoviesList=[];
  List<MostPopularMoviesModel> mostPopularMoviesList=[];
  String ? topMoviesError;
  bool topMoviesIsLoading = false;
  String ? mostPopularMoviesError;
  bool mostPopularMoviesIsLoading = false;
  int index =0;


  HomeProvider(this.homeRepo);

  void topMoviesIsLoadingChange(bool value) {
    topMoviesIsLoading = value;
    notifyListeners();

  }

  void mostPopularMoviesIsLoadingChange(bool value) {
    mostPopularMoviesIsLoading = value;
    notifyListeners();
  }

  Future getTopMovies() async {
    topMoviesIsLoadingChange(true);
    var response = await homeRepo.fetchTopMoviesMovies();
    response.fold((error) {
      topMoviesError = error.errorMessage.toString();
      topMoviesIsLoadingChange(false);
      notifyListeners();
    }, (topMovies) {
     topMoviesList = topMovies;
      topMoviesIsLoadingChange(false);
      notifyListeners();
    });
  }
  Future getMostPopularMovies() async {
    mostPopularMoviesIsLoadingChange(true);
    var response = await homeRepo.fetchMostPopularMovies();
    response.fold((error) {
      mostPopularMoviesError = error.errorMessage.toString();
      mostPopularMoviesIsLoadingChange(false);
      notifyListeners();
    }, (mostPopularMovies) {
     mostPopularMoviesList = mostPopularMovies;
     mostPopularMoviesIsLoadingChange(false);
      notifyListeners();
    });
  }
}