part of 'watchlist_bloc.dart';

abstract class WatchlistEvent {}

class ReorderStocksEvent extends WatchlistEvent {
  final int oldIndex;
  final int newIndex;

  ReorderStocksEvent(this.oldIndex, this.newIndex);
}
