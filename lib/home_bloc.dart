import 'dart:async';
import 'package:rxdart/subjects.dart';

class HomeBloc {




  int _counter = 0;

  //o StreamController tem apenas uma saida e nao guarda o ultimo valor
  //var _streamController = StreamController<int>();


  // O BehaviorSubject guarda o ultimo valor da stream
  var _streamController = BehaviorSubject<int>();


  //saida da stream
  Stream<int> get outCount => _streamController.stream;
  //entrada de stream
  Sink<int> get inCount => _streamController.sink;


  void incrementCounter() {
      _counter++;
      //envia a informacao na stream  para o output
      //assim alterando a stream
      _streamController.sink.add(_counter);
  }

  void decrementCounter() {
    _counter--;
    //envia a informacao na stream  para o output
    //assim alterando a stream
    _streamController.sink.add(_counter);
  }


  //fecha a stream
  void dispose(){
    _streamController.close();
  }



}