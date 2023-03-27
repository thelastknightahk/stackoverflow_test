import 'dart:async';

class UserNextLoading {
  var  userLoadingBool = StreamController<bool>.broadcast();

  Stream<bool> get userLoadStream => userLoadingBool.stream;

  void userNextLoadFunction(bool userNextLoad){
    userLoadingBool.sink.add(userNextLoad);
  }

    void dispose() {
    userLoadingBool.close();
  }
}