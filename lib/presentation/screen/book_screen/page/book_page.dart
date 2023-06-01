import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/data/datasource/book/book_remote_datasource.dart';
import 'package:flutter2/data/repository/book_repository_impl.dart';
import 'package:flutter2/domain/use_case/book/get_book_use_case.dart';
import 'package:flutter2/presentation/screen/book_screen/controller/book_controller.dart';
import 'package:flutter2/presentation/state/data_state.dart';
import 'package:get/get.dart';

class  BookPage extends StatelessWidget {
   BookPage({super.key});

      final bookController = BookController(GetBooksUseCase(BookRepositoryImpl(BookDataSource(Dio()),
        ),
      ),
    );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<BookController>(
        init: bookController,
        initState: (state) => bookController.getBooks(),
        builder: (controller) {
          if (controller.bookState.value == DataState.success);
          return ListView.separated(
            shrinkWrap: true,
            itemCount: bookController.books.length,
            itemBuilder: (context, index) {
              final book = bookController.books[index];

              return Card(
                child: Row(
                  children: [
                    Image.network(
                      book.image ?? '',
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                    Text(book.title ?? 'Title is Null'),
                  ],
                )
              );
            },
            separatorBuilder: (context, index) =>
            const Divider(
              thickness: 2,
              color: Colors.lightBlueAccent,
            ),
          );
        }



      ),
   );
  }
}
