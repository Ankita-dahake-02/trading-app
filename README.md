# trading_app

Approach :-
Started with building UI first using static data.
Created a reusable widgets such as stockSummary, WatchlistTab, stock tile and customButtonWidget widgets to keep code clean.
Used dummy data to match the design before adding logic.
Implemented drag & drop reorder feature using ReorderableListView.
Inatlly implemented logic using setState approch then later replaced setState with BLoC for better state handling.
Note :- On click of sort by button Edit watchlist page is opening 

Project Stucture :-
Have obeyed clean architecture pattern for project structure maintainance

lib/data_layer/
 contains models and dummy data
lib/presentation_layer/
 screens/ : UI screens
 widgets/ : reusable UI components
 bloc/ : BLoC files (event, state, bloc)
