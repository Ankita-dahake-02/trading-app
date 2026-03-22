import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trading_app/presentation_layer/bloc/watchlist_bloc/watchlist_bloc.dart';
import 'package:trading_app/presentation_layer/reusable_widgets/watchlist_flow_widgets.dart';

class EditWatchlistScreen extends StatefulWidget {
  final String watchListNumber;
  const EditWatchlistScreen({super.key, required this.watchListNumber});

  @override
  State<EditWatchlistScreen> createState() => _EditWatchlistScreenState();
}

class _EditWatchlistScreenState extends State<EditWatchlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Watchlist ${widget.watchListNumber}",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Watchlist ${widget.watchListNumber}",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: BlocBuilder<WatchlistBloc, WatchlistState>(
                builder: (context, state) {
                  if (state is ReorderStocksState) {
                    return ReorderableListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: state.stocks.length,
                      onReorder: (oldIndex, newIndex) {
                        context.read<WatchlistBloc>().add(
                          ReorderStocksEvent(oldIndex, newIndex),
                        );
                      },
                      itemBuilder: (context, index) {
                        final stock = state.stocks[index];
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          shape: Border(
                            bottom: BorderSide(
                              color: Color.fromARGB(255, 232, 227, 227),
                            ),
                          ),
                          key: ValueKey(stock.id),
                          leading: Icon(Icons.drag_handle, color: Colors.black),
                          title: Text(
                            stock.name,
                            style: TextStyle(color: Colors.grey),
                          ),
                          trailing: Icon(Icons.delete, color: Colors.black),
                        );
                      },
                    );
                  }
                  return SizedBox();
                },
              ),
            ),

            customButtonWidget(
              btnText: "Edit other watchlist",
              btnTextColor: Colors.black,
              btnBgColor: Colors.white10,
              onPressed: () {},
              isBorder: true,
            ),
            SizedBox(height: 10),
            customButtonWidget(
              btnText: "Save Watchlist",
              btnTextColor: Colors.white,
              btnBgColor: Colors.black,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
