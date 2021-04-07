import 'dart:html' as html;
import 'package:cl/kywebsocket_html.dart' as cl;
import 'package:cl/kywebsocket.dart' as cl;

void main() {
  html.querySelector("#button1")?.onClick.listen((event) async {
    print("on click");
    var websocket = await cl.KyWebSocketHtml.connect("ws://tetorica.net:8082/m");
    print("connected");

    websocket.onError.listen((event) {
      print("on message : ${event}");
    });
    websocket.onClose.listen((event) {
      print("on close : ${event}");
    });
    print("send");

    try {
      websocket.send("Hello!");
    } catch (e, s) {
      print("error ${e}");
      print("stack ${s}");
    }
  });
}
