import 'package:flutter2/data/model/book_model.dart';
import 'package:flutter2/domain/use_case/book/get_book_use_case.dart';
import 'package:flutter2/presentation/state/data_state.dart';
import 'package:get/get.dart';

class BookController extends GetxController{
  final GetBooksUseCase _getBooksUseCase;
  BookController(this._getBooksUseCase);
  RxList<Book> books = <Book> [].obs;
  Rx<DataState> bookState = Rx(DataState.initial);
  void getBooks () async{
    bookState(DataState.loading);
    update();

    final result = await _getBooksUseCase.call();
    books (result);
    bookState(DataState.success);
    update();
  }
}