class StockModel {
  final String id;
  final String name;
  final String exchange;
  final String type;
  final double price;
  final double change;
  final double percentChange;

  StockModel({
    required this.id,
    required this.name,
    required this.exchange,
    required this.type,
    required this.price,
    required this.change,
    required this.percentChange,
  });
}