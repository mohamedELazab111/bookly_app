import 'package:bookly_app/core/models/book_model/item.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<Item>>> fetchSearchResults({
    required String searchInfo,
  });
}
