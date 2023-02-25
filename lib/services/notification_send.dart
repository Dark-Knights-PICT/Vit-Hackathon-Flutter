import 'package:http/http.dart' as http;

class Api {
  final String fcmUrl = 'https://fcm.googleapis.com/fcm/send';
  final fcmKey =
      "AAAAhvAW3PY:APA91bGbSHgEwZGrmBS6mVmqnLVGMyL7Q3ZN9M9cZV8aoVDz5L56IU0D_e3Ugzb3p4Ox0PGgwsxS7jyC7vDkbHnpUpbh3D4WcuJLth1SQTZATBEXDSfW9KRvPFu1KTgxn93MN0g6U75a";
  void sendFcm(String title, String body, String fcmToken) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'key=$fcmKey'
    };
    var request = http.Request('POST', Uri.parse(fcmUrl));
    request.body =
        '''{"to":"$fcmToken","priority":"high","notification":{"title":"$title","body":"$body","sound": "default"}}''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
