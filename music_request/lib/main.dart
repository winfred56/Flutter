
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/user/data/database/user_local_database.dart';
import 'firebase_options.dart';
import 'shared/data/hive_adapters.dart';
import 'shared/platform/push_notification.dart';
import 'injection_container.dart' as di;
import 'src/home/presentation/pages/home.dart';
import 'src/onboarding/presentation/pages/onboarding.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  di.init();
  await dotenv.load();
  await HiveAdapters.setUp();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  final authState = await di.sl<UserLocalDatabase>().authenticationStatus();
  await di.sl<PushNotification>().initializeNotification();
  await Future<void>(() async {
    runApp(DevicePreview(
        enabled: false, //!kReleaseMode,
        builder: (context) => MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: DevicePreview.locale(context),
            useInheritedMediaQuery: true,
            builder: DevicePreview.appBuilder,
            home: authState ? const HomePage() : OnboardingPage(),
            // themeMode: ThemeMode.dark,
            // theme: CustomTheme.darkTheme,
            title: 'DJ')));
  });
}



// Future<String> auth() async{
//   String url = "https://accounts.spotify.com/api/token";
//   String clientId = dotenv.get('client_id', fallback: '');
//   String clientSecret = dotenv.get('client_secret', fallback: '');
//
//   Map<String, String> headers = {
//     'Content-Type': 'application/x-www-form-urlencoded',
//   };
//
//   String body = "grant_type=client_credentials&client_id=$clientId&client_secret=$clientSecret";
//
//   try {
//     http.Response response = await http.post(Uri.parse(url), headers: headers, body: body);
//
//     if (response.statusCode == 200) {
//       // Request successful, handle the response
//       Map<String, dynamic> responseData = json.decode(response.body);
//       String accessToken = responseData['access_token'];
//       print("Access Token: $accessToken");
//       return accessToken;
//     } else {
//       // Request failed
//       print("Request failed with status: ${response.statusCode}");
//       print("Request failed with status: ${response.body}");
//       return 'accessToken';
//     }
//   } catch (e) {
//     // Error occurred during the request
//     print("Error: $e");
//     return 'accessToken';
//   }
// }

// Future<void> getArtist()async{
//   String url = "https://api.spotify.com/v1/artists/4Z8W4fKeB5YxbusRsdQVPb";
//   String accessToken = await auth();
//
//   Map<String, String> headers = {
//     'Authorization': 'Bearer $accessToken',
//   };
//
//   try {
//     http.Response response = await http.get(Uri.parse(url), headers: headers);
//
//     if (response.statusCode == 200) {
//       // Request successful, handle the response
//       Map<String, dynamic> responseData = json.decode(response.body);
//       // Process the responseData as needed
//       print("Response: $responseData");
//     } else {
//       // Request failed
//       print("Request failed with status: ${response.statusCode}");
//     }
//   } catch (e) {
//     // Error occurred during the request
//     print("Error: $e");
//   }
// }

// Future<void> search()async{
//   String accessToken =await auth();
//
//   String baseUrl = "https://api.spotify.com/v1/search";
//   String searchQuery = "heaven"; // Replace with your custom search query
//
//   String url = "$baseUrl?q=$searchQuery";
//
//   Map<String, String> headers = {
//     'Authorization': 'Bearer $accessToken',
//   };
//
//   try {
//     http.Response response = await http.get(Uri.parse(url), headers: headers);
//
//     if (response.statusCode == 200) {
//       // Request successful, handle the response
//       Map<String, dynamic> responseData = json.decode(response.body);
//       // Process the responseData as needed
//       print("Response: $responseData");
//     } else {
//       // Request failed
//       print("Request failed with status: ${response.statusCode}");
//     }
//   } catch (e) {
//     // Error occurred during the request
//     print("Error: $e");
//   }
// }

// Future<void> research() async {
//   String accessToken = await auth();
//   String baseUrl = "https://api.spotify.com/v1/search";
//   String searchQuery = "dilemma"; // Replace with your custom search query
//   int limit = 5; // Number of results to limit
//   bool includeExternal = true; // Include external audio sources
//
//
//   String url = "$baseUrl?q=$searchQuery&type=track&limit=$limit&include_external=$includeExternal";
//
//   Map<String, String> headers = {
//     'Authorization': 'Bearer $accessToken',
//   };
//
//   try {
//     http.Response response = await http.get(Uri.parse(url), headers: headers);
//
//     if (response.statusCode == 200) {
//       // Request successful, handle the response
//       Map<String, dynamic> responseData = await json.decode(response.body);
//       for(int i = 0; i < responseData['tracks']['items'].length; i++){
//         print("Response Song Name: ${await responseData['tracks']['items'][i]['name']}");
//         print("Response Artist name: ${await responseData['tracks']['items'][i]['artists'][0]['name']}");
//       }
//       // for(final result in responseData['tracks']['items']){
//       //   print('result: $result');
//       // }
//       // // Process the responseData as needed
//       // print("Response: ${await responseData['tracks']['items'][0]['name']}");
//       // print("Response: ${await responseData['tracks']['items'][1]['album']}");
//       // print("Response: ${await responseData['tracks']['items'][2]['album']}");
//       // print("Response: ${await responseData['tracks']['items'][3]['album']}");
//       // print("Response: $response");
//     } else {
//       // Request failed
//       print("Request failed with status: ${response.statusCode}");
//     }
//   } catch (e) {
//     // Error occurred during the request
//     print("Error: $e");
//   }
// }