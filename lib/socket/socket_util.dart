import 'dart:io';

import 'package:rush_efrei_klaus/socket/protocol.dart';
import 'package:rush_efrei_klaus/socket/socket_request.dart';

class SocketUtil {
  static void startServer(OnCreateElf onCreateElf, OnPressBtnIn onPressBtnIn) {
    Future<ServerSocket> serverFuture = ServerSocket.bind('0.0.0.0', 3000);

    serverFuture.then((ServerSocket server) {
      print("Server listening...");
      server.listen((Socket socket) {
        print("Socket connected ! ${socket.remoteAddress.address}");
        socket.listen((List<int> data) {
          String message = String.fromCharCodes(data);
          List<String> messages =
              message.substring(0, message.length - 2).split('||');

          messages.where((msg) => msg.trim().length > 0).forEach((msg) {
            final req = SocketRequest.fromRawJson(msg);

            switch (req.method) {
              case 'create_elf':
                onCreateElf(req.data as String);
                break;
              case 'elf_press_btn_in':
                onPressBtnIn(req.data as String);
                break;
              default:
            }
          });
        });
      });
    });
  }
}
