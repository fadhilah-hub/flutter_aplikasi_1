import 'package:flutter2/data/model/book_model.dart';
import 'package:flutter2/domain/repository/book_repository.dart';

class GetBooksUseCase{
  final BookRepository _repository;
  const GetBooksUseCase (this._repository);
  Future<List<Book>> call() async => _repository.getBooks();
}