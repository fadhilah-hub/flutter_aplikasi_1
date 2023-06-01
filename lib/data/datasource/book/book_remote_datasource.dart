import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter2/data/model/book_model.dart';

class BookDataSource {
  final Dio _client;

  const BookDataSource(this._client);

  Future<BookResponse?> getBooks() async {
    try {
      final result = await _client.get('https://api.itbook.store/1.0/new');
      if (result.statusCode == 200) {
        return BookResponse.fromJson(result.data);
      }
      return null;
    } catch (e, stacktrace) {
      log('Error on BookRemoteDatasource ${e.toString()}: $stacktrace');
      return null;
    }
  }
}