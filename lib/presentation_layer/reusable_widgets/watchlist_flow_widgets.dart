import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trading_app/data_layer/dummy_data/stock_dummy_list.dart';
import 'package:trading_app/data_layer/mdoels/stock_model.dart';
import 'package:trading_app/presentation_layer/bloc/watchlist_bloc/watchlist_bloc.dart';
import 'package:trading_app/presentation_layer/ui_screens/edit_watchlist_screen.dart';

Widget stockSummaryWidget({
  required String title,
  required String subTitle,
  required String prize,
  required String change,
  required bool isProfit,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Flexible(
            child: Text(
              title,
              style: TextStyle(color: Colors.black, fontSize: 16),
              overflow: TextOverflow.ellipsis,
              softWrap: true,
            ),
          ),
          SizedBox(width: 5),
          Text(subTitle, style: TextStyle(color: Colors.grey, fontSize: 16)),
        ],
      ),
      SizedBox(height: 5),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(prize, style: TextStyle(color: Colors.black, fontSize: 14)),
          SizedBox(width: 10),
          Flexible(
            child: Text(
              change,
              style: TextStyle(
                color: isProfit ? Colors.greenAccent : Colors.redAccent,
                fontSize: 14,
              ),
              overflow: TextOverflow.ellipsis,
              softWrap: true,
            ),
          ),
        ],
      ),
    ],
  );
}

class WatchlistTab extends StatelessWidget {
  final String watchListNumber;
  const WatchlistTab({super.key, required this.watchListNumber});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return BlocProvider(
                    create: (_) => WatchlistBloc(stockModelList),
                    child: EditWatchlistScreen(
                      watchListNumber: watchListNumber,
                    ),
                  );
                },
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 232, 227, 227),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.sort_rounded),
                SizedBox(width: 5),
                Text("Sort by", style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        Flexible(
          child: ListView.separated(
            padding: EdgeInsets.zero,
            itemCount: stockModelList.length,
            separatorBuilder: (_, _) {
              return Divider(color: const Color.fromARGB(255, 238, 237, 237));
            },
            itemBuilder: (context, index) {
              return stockListTile(stockModelList[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget stockListTile(StockModel stock) {
    final isPositive = stock.change >= 0;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              stock.name,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            Text(
              stock.price.toString(),
              style: TextStyle(
                color: isPositive ? Colors.green : Colors.red,
                fontSize: 16,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${stock.exchange} | ${stock.type}",
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              "${stock.change} (${stock.percentChange}%)",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}

Widget customButtonWidget({
  required String btnText,
  required Color btnTextColor,
  required Color btnBgColor,
  required VoidCallback onPressed,
  bool isBorder = false,
}) {
  return SizedBox(
    width: double.infinity,
    height: 50,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: btnBgColor,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        side: isBorder ? BorderSide(color: Colors.grey, width: 1) : null,
      ),
      child: Text(
        btnText,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: btnTextColor,
        ),
      ),
    ),
  );
}
