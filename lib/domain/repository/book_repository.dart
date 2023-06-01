import 'package:flutter2/data/model/book_model.dart';

abstract class BookRepository {
  Future<List<Book>> getBooks();
}