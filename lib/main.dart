import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_cupertino_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'global/route_management/app_pages.dart';
import 'global/route_management/initial_bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetCupertinoApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial,
      getPages: AppPages.getPages(),
      initialBinding: InitialBindings(),
      defaultTransition: Transition.cupertino,
      localizationsDelegates: const [
        DefaultMaterialLocalizations.delegate,
      ],
    );
  }
}

//For Development Mode
/*class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}*/



