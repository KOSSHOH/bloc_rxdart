import 'package:bloc_rxdart/database/database_helper.dart';
import 'package:bloc_rxdart/model/eventMessageModel.dart';
import 'package:bloc_rxdart/model/exampleModel.dart';
import 'package:bloc_rxdart/resourses/repository.dart';
import 'package:rxbus/rxbus.dart';
import 'package:rxdart/rxdart.dart';

class ExampleBloc {
  DatabaseHelper dataBase = new DatabaseHelper();
  final _repository = Repository();
  final _exampleFetcher = PublishSubject<List<ExampleModel>>();

  Observable<List<ExampleModel>> get allExample => _exampleFetcher.stream;

  fetchAllExample(bool isConnect) async {
    if (isConnect) {
      List<ExampleModel> example = await _repository.fetchExample();
      if (example != null) {
        dataBase.clear();
        for (int i = 0; i < example.length; i++) {
          dataBase.saveProducts(example[i]);
        }
        _exampleFetcher.sink.add(example);
      } else {
        RxBus.post(EventMessageModel(message: "Internet error"),
            tag: "EVENT_INTERNET_ERROR");
      }
    } else {
      List<ExampleModel> database = await _repository.databaseItem();
      print(database.length);
      _exampleFetcher.sink.add(database);
    }
  }

  dispose() {
    _exampleFetcher.close();
  }
}

final blocExample = ExampleBloc();
