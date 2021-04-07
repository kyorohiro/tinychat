import 'dart:io' as io;
import 'dart:convert' show json, utf8;

import 'dart:typed_data';

class User {
  String? id;
}

Map<String, User> users = {};
void main(List<String> arguments) async {
  var httpServer = await io.HttpServer.bind("0.0.0.0", 8082);
  print("binded");
  await for (var request in httpServer) {
    //
    var path = request.uri.path;
    if (path == "/") {
      print("/");
      //
      request.response.write("Hi!");
      request.response.close();
    }
    if (path == "/m") {
      print("/m");
      //
      var webSocket = await io.WebSocketTransformer.upgrade(request);
      webSocket.listen((event) {
        //
        webSocket.add("Hello!!");
      });
    }
  }
}

/*
    if (path == "/create") {
      //
      int contentLength = request.headers.contentLength;
      if (0 <= contentLength && contentLength <= 1024) {
        request.response.statusCode = 400;
        request.response.write(json.encode({"message": "over contentLength"}));
        return;
      }
      var buffer = Uint8List(contentLength);
      int start = 0;
      await for (var bytes in request) {
        if (start + bytes.length > buffer.length) {
          request.response.statusCode = 400;
          request.response.write(json.encode({"message": "over contentLength"}));
          return;
        }
        buffer.setRange(start, start + bytes.length, bytes);
        start += bytes.length;
      }
      var v = json.decode(utf8.decode(buffer));
      //v[""];
    }
  */
