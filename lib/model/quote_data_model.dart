class QuoteModel {
  int id;
  String author;
  String quote;

  QuoteModel({required this.id, required this.author, required this.quote});

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
        id: json['id'], author: json['author'], quote: json['quote']);
  }
}

class DataModel {
  int limit;
  int skip;
  int total;
  List<QuoteModel> quotes;

  DataModel(
      {required this.limit,
      required this.skip,
      required this.total,
      required this.quotes});

  factory DataModel.fromJson(Map<String, dynamic> json) {

    List<QuoteModel> mQuotes = [];

    for(Map<String, dynamic> eachMap in json['quotes']){
      mQuotes.add(QuoteModel.fromJson(eachMap));
    }

    return DataModel(
        limit: json['limit'],
        skip: json['skip'],
        total: json['total'],
        quotes: mQuotes);
  }

}
