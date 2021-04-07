import 'dart:io' as io;

//
// regist
//
main() async {
  var websocket = await io.WebSocket.connect("ws://tetorica.net:8082/m");
  websocket.listen((event) {
    print("event: ${event}");
  }, onDone: () {
    print("onDone");
  }, onError: (e) {
    print("onError ${e}");
  });
  websocket.add("Hi");
}
