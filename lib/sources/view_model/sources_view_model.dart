import 'package:flutter/material.dart';
import 'package:news_app/shared/service_locator.dart';
import 'package:news_app/sources/data/models/source.dart';
import 'package:news_app/sources/data/repository/sources_repository.dart';

class SourcesViewModel with ChangeNotifier {
  late final SourcesRepository sourcesRepository;

  SourcesViewModel() {
    sourcesRepository = SourcesRepository(ServiceLocator.sourcesDataSource);
  }

  List<Source> sources = [];
  String? errorMessage;
  bool isLoading = false;

  Future<void> getSources(String categoryId) async {
    isLoading = true;
    notifyListeners();
    try {
      sources = await sourcesRepository.getSources(categoryId);
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
