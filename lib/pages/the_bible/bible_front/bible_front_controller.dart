import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../../core/custom_assets/custom_assets.dart';
import '../models/bible_book_model.dart';

class BibleFrontController extends GetxController {
  late List<BibleBook> bibleBooks;

  @override
  void onInit() {
    super.onInit();
    _initializeBibleBooks();
  }

  void _initializeBibleBooks() {
    bibleBooks = [
      BibleBook(
        title: 'Genesis',
        backgroundImage: CustomAssets.genesis_background,
        bookIcon: CustomAssets.book_title_icon,
      ),
      BibleBook(
        title: 'Exodus',
        backgroundImage: CustomAssets.exodus_background,
        bookIcon: CustomAssets.book_title_icon,
      ),
      BibleBook(
        title: 'Leviticus',
        backgroundImage: CustomAssets.leviticus_background,
        bookIcon: CustomAssets.book_title_icon,
      ),
      BibleBook(
        title: 'Numbers',
        backgroundImage: CustomAssets.numbers_background,
        bookIcon: CustomAssets.book_title_icon,
      ),
      BibleBook(
        title: 'Joshua',
        backgroundImage: CustomAssets.joshua_background,
        bookIcon: CustomAssets.book_title_icon,
      ),
      BibleBook(
        title: 'Judges',
        backgroundImage: CustomAssets.judges_background,
        bookIcon: CustomAssets.book_title_icon,
      ),
      BibleBook(
        title: 'Ruth',
        backgroundImage: CustomAssets.ruth_background,
        bookIcon: CustomAssets.book_title_icon,
      ),
    ];
  }

  void navigateToBibleBook(BuildContext context, String bookTitle) {
    // TODO: Implement navigation to bible book detail page
    // context.push(AppPath.biblebook, extra: {'title': bookTitle});
  }
}

