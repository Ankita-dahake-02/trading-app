part of 'watchlist_bloc.dart';

abstract class WatchlistState {}

class ReorderStocksState extends WatchlistState {
  final List<StockModel> stocks;

  ReorderStocksState({required this.stocks});
}
