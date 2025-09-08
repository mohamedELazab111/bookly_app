import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/models/book_model/item.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<Item>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
        endpoint: 'volumes?q=subject:Programming&Filtering=free-ebooks',
      );
      List<Item>? books = BookModel.fromJson(data).items;
      return right(books ?? []);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Item>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
        endpoint:
            'volumes?q=Computer Science&Filtering=free-ebooks&Sorting=newest',
      );
      List<Item>? books = BookModel.fromJson(data).items;
      return right(books ?? []);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Item>>> fetchSimilarBooks({
    required String category,
  }) async {
    try {
      var data = await apiService.get(
        endpoint:
            'volumes?Filtering=free-ebooks&Sorting=relevance:$category &q=subject:Programming',
      );
      List<Item>? books = BookModel.fromJson(data).items;
      return right(books ?? []);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
