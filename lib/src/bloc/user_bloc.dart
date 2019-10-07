import 'dart:async';

import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/user_model.dart';

import '../utils/strings.dart';

class UserBloc {
  final _repository = Repository();
  final _id = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _isSignedIn = BehaviorSubject<bool>();
  final _inquiriesFetcher = PublishSubject<List<Inquiry>>();

  Observable<String> get id => _id.stream.transform(_validateID);
  Observable<String> get password => _password.stream.transform(_validatePassword);
  Observable<bool> get isSignedIn => _isSignedIn.stream;
  Observable<List<Inquiry>> get inquiries => _inquiriesFetcher.stream;

  Function(String) get changeID => _id.sink.add;
  Function(String) get changePassword => _password.sink.add;

  fetchAllInquiries() async {
    List<Inquiry> inquiries = await _repository.fetchInquiries();
    _inquiriesFetcher.sink.add(inquiries);
  }

  Future<bool> signIn(String id, String password) {
    changeID(id);
    changePassword(password);

    return _repository.signIn(_id.value, _password.value);
  }

  Future<bool> register(String username, String id, String password) {
    changeID(id);
    changePassword(password);

    return _repository.register(username, _id.value, _password.value);
  }

  Future<bool> isSignIn() {
    return _repository.isSignIn();
  }

  final _validateID = StreamTransformer<String, String>.fromHandlers(handleData: (id, sink) {
    if (id.contains('@')) {
      sink.add(id);
    } else {
      throw Exception(Strings.idValidateMessage);
    }
  });

  final _validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 3) {
      sink.add(password);
    } else {
      throw Exception(Strings.passwordValidateMessage);
    }
  });

  dispose() async {
    await _id.drain();
    _id.close();

    await _password.drain();
    _password.close();

    await _isSignedIn.drain();
    _isSignedIn.close();

    await _inquiriesFetcher.drain();
    _inquiriesFetcher.close();
  }

  bool validateFields() {
    if (_id.value != null &&
        _id.value.isNotEmpty &&
        _password.value != null &&
        _password.value.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}

final bloc = UserBloc();