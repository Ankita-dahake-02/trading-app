import 'package:flutter/material.dart';
import 'package:trading_app/presentation_layer/reusable_widgets/watchlist_flow_widgets.dart';

class WatchlistScreen extends StatefulWidget {
  const WatchlistScreen({super.key});

  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: Column(
          children: [
            // 1. Top Section
            Row(
              children: [
                Expanded(
                  child: stockSummaryWidget(
                    title: "SENSEX 18TH SEP 8",
                    subTitle: "BSE",
                    prize: "1225.55",
                    change: "144.50(13.333)",
                    isProfit: true,
                  ),
                ),
                Container(
                  height: 50,
                  width: 1,
                  color: const Color.fromARGB(255, 232, 227, 227),
                  margin: EdgeInsets.symmetric(horizontal: 10),
                ),
                Expanded(
                  child: stockSummaryWidget(
                    title: "NIFTY BANK",
                    subTitle: "",
                    prize: "54174.80",
                    change: "-12.10(0.022)",
                    isProfit: false,
                  ),
                ),
                SizedBox(width: 2,),
                Icon(Icons.chevron_right_rounded)
              ],
            ),
            SizedBox(height: 20),
            // 2. Serach Bar
            TextField(
              controller: _searchController,
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide.none,
                ),
                hintText: "Search for instruments",
                prefixIcon: Icon(Icons.search, color: Colors.grey),

                hintStyle: TextStyle(color: Colors.grey),
              ),
              onChanged: (value) {},
            ),
            SizedBox(height: 10),
            // 3. Tabbar Section
            Expanded(
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    TabBar(
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      unselectedLabelStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                      indicatorColor: Colors.black,
                      indicatorWeight: 3,
                      indicatorPadding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      dividerColor: const Color.fromARGB(255, 232, 227, 227),
                      tabs: [
                        Tab(text: "Watchlist 1"),
                        Tab(text: "Watchlist 5"),
                        Tab(text: "Watchlist 6"),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          WatchlistTab(watchListNumber: "1"),
                          WatchlistTab(watchListNumber: "5"),
                          WatchlistTab(watchListNumber: "6"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
