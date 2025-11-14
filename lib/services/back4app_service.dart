import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class Back4AppService {
  static Future<void> init() async {
    const keyApplicationId = 'ajcWZKh0VFWCAA0zxYz3kE1fj0wVN2DIU8Civjhn';
    const keyClientKey = 'Kibla03A8UVVV1vmYeJ4fEDJSdZLoM99MqVVUUur';
    const keyParseServerUrl = 'https://parseapi.back4app.com';

    await Parse().initialize(
      keyApplicationId,
      keyParseServerUrl,
      clientKey: keyClientKey,
      autoSendSessionId: true,
    );
  }

  static Future<ParseUser?> currentUser() async {
    return await ParseUser.currentUser() as ParseUser?;
  }

  static Future<void> logout() async {
    final user = await currentUser();
    if (user != null) {
      await user.logout();
    }
  }
}
