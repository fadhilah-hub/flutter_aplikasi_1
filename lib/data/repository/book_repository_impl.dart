import 'package:flutter2/data/model/book_model.dart';
import 'package:flutter2/domain/repository/book_repository.dart';
import 'package:flutter2/data/datasource/book/book_remote_datasource.dart';
import 'dart:developer';
class BookRepositoryImpl implements BookRepository {
  final BookDataSource _remoteDatasource;
  const BookRepositoryImpl (this._remoteDatasource);
  @override
  Future<List<Book>> getBooks() async {
    try {
      final result = await _remoteDatasource.getBooks();
      if (result!=null && result.books!=null) {
      return result.books !;
      } return [];

    } catch (e, stacktrace) {
      log('Error on BookRemoteDatasource ${e.toString()}: $stacktrace');
      return [];
    }
  }
}