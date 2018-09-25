import 'package:http_server/http_server.dart' show VirtualDirectory;
import 'dart:io';
void main () {
   //设置根路径
  final MY_HTTP_ROOT_PATH = Platform.script.resolve('http').toFilePath();
  //从根路径获取文件和目录清单
  final virDir = new VirtualDirectory(MY_HTTP_ROOT_PATH)
    //是否获取文件和目录清单，为false则不获取
    ..allowDirectoryListing = true;
  HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8089).then((server){
    print('serving at ${server.address}: ${server.port}');
    server.listen((request){
        
      //将文件和目录清单发送到客户端
      virDir.serveRequest(request);
    });
  });
}



