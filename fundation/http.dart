import 'package:http/http.dart' as http;

main() {
  var url = 'http://127.0.0.1:8089/';
  //向指定URL发送GET请求
  http.get(url).then((response) {
    print("响应状态： ${response.statusCode}");
    print("响应内容： ${response.body}");
  });
}
