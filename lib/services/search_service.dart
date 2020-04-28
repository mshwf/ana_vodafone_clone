import 'package:ana_vodafone_clone/models/search_result.dart';

class SearchService {
  List<SearchResult> search(String query) {
    if (query.isEmpty) return List<SearchResult>();
    query = query.toLowerCase();
    var _results = results.where((s) =>
        s.title.toLowerCase().contains(query) ||
        s.section.toString().contains(query));
    return _results.toList();
  }

  var results = [
    SearchResult()
      ..title = 'Home'
      ..section = 'Home',
    SearchResult()
      ..title = 'Reharge'
      ..section = 'Reharge and balance',
    SearchResult()
      ..title = 'Vodafone Cash'
      ..section = 'Vodafone Cash',
    SearchResult()
      ..title = 'Balance transfer'
      ..section = 'Balance transfer',
    SearchResult()
      ..title = 'Mobile internet'
      ..section = 'Mobile internet',
    SearchResult()
      ..title = 'DSL'
      ..section = 'DSL',
    SearchResult()
      ..title = 'Manage my DSL'
      ..section = 'DSL',
    SearchResult()
      ..title = 'My plan'
      ..section = 'My plan',
    SearchResult()
      ..title = 'Balance details'
      ..section = 'Recharge and balance',
    SearchResult()
      ..title = 'Team010'
      ..section = 'Team010',
  ];
}
