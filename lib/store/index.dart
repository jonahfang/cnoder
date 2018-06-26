import "package:redux/redux.dart";
import "package:redux_epics/redux_epics.dart";
import "package:redux_logging/redux_logging.dart";
import "package:redux_persist/redux_persist.dart";
import "package:redux_persist_flutter/redux_persist_flutter.dart";
import "./root_state.dart";
import "./reducer/root.dart";
import "./epic/topic.dart";
import "./epic/app.dart";

final epic = combineEpics([doLoginEpic, fetchTopicsEpic, fetchTopicEpic]);

final persistor = Persistor<RootState>(
  storage: FlutterStorage('cnoder'),
  decoder: RootState.fromJson,
  debug: true
);

final store = new Store<RootState>(rootReducer,
  initialState: new RootState(), middleware: [
    new LoggingMiddleware.printer(), 
    new EpicMiddleware(epic),
    persistor.createMiddleware()
]);
