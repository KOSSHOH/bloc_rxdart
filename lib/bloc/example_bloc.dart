import 'package:bloc_rxdart/model/eventMessageModel.dart';
import 'package:bloc_rxdart/model/exampleModel.dart';
import 'package:bloc_rxdart/resourses/repository.dart';
import 'package:rxbus/rxbus.dart';
import 'package:rxdart/rxdart.dart';

class ExampleBloc {
  final _repository = Repository();
  final _exampleFetcher = PublishSubject<List<ExampleModel>>();

  Observable<List<ExampleModel>> get allExample => _exampleFetcher.stream;

  fetchAllExample() async {
    List<ExampleModel> example = await _repository.fetchExample();
    if (example != null) {
      _exampleFetcher.sink.add(example);
    } else {
      RxBus.post(EventMessageModel(message: "Internet error"),
          tag: "EVENT_INTERNET_ERROR");
    }
  }

  dispose() {
    _exampleFetcher.close();
  }
}

final blocExample = ExampleBloc();
