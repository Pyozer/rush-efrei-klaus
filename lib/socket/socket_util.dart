import 'dart:convert';
import 'dart:io';

import 'package:rush_efrei_klaus/socket/protocol.dart';
import 'package:rush_efrei_klaus/socket/socket_request.dart';

class SocketUtil {
  static void startServer(OnCreateElf onCreateElf) {
    Future<ServerSocket> serverFuture = ServerSocket.bind('0.0.0.0', 3000);

    serverFuture.then((ServerSocket server) {
      print("Server listening...");
      server.listen((Socket socket) {
        print("Socket connected ! ${socket.remoteAddress.address}");
        socket.listen((List<int> data) {
          String result = String.fromCharCodes(data);
          final req = SocketRequest.fromRawJson(result);
          
          switch (req.method) {
            case 'create_elf':
              onCreateElf(req.data as String);
              break;
            default:
          }
        });
      });
    });
  }
}
