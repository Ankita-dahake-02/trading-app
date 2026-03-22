import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trading_app/data_layer/mdoels/stock_model.dart';

part 'watchlist_event.dart';
part 'watchlist_state.dart';

class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  WatchlistBloc(List<StockModel> initialStocks)
    : super(ReorderStocksState(stocks: initialStocks)) {
    on<ReorderStocksEvent>((event, emit) {
      if (state is ReorderStocksState) {
        final currentState = state as ReorderStocksState;
        final updatedList = List<StockModel>.from(currentState.stocks);

        int newIndex = event.newIndex;

        if (newIndex > event.oldIndex) {
          newIndex--;
        }

        final item = updatedList.removeAt(event.oldIndex);
        updatedList.insert(newIndex, item);

        emit(ReorderStocksState(stocks: updatedList));
      }
    });
  }
}
