import 'package:flutter/material.dart';

class SearchController extends ChangeNotifier {
  String _query = '';
  List<String> _results = [];

  String get query => _query;
  List<String> get results => _results;

  void updateQuery(String newQuery) {
    _query = newQuery;
    notifyListeners();
    performSearch();
  }

  void performSearch() {
    // Replace this with your actual search logic
    _results = mockSearch(_query);
    notifyListeners();
  }

  List<String> mockSearch(String query) {
    // Mock data for demonstration purposes
    final allItems = ['Apple', 'Banana', 'Cherry', 'Date', 'Elderberry'];
    return allItems
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
