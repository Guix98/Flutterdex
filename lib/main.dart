import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutterdex/controllers/pokedex_controller.dart';
import 'package:flutterdex/controllers/pokemon_search_controller.dart';
import 'package:flutterdex/theme/index.dart';
import 'package:get/get.dart';
import 'routes/routes.dart' as routes;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    Get.put<PokedexController>(PokedexController(), permanent: true);
    Get.put<PokemonSearchController>(PokemonSearchController(),
        permanent: true);
  }

  @override
  Widget build(BuildContext context) {
    return Main();
  }
}

class Main extends StatefulWidget {
  Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      defaultTransition: Transition.fade,
      getPages: routes.routes,
      theme: myTheme,
    );
  }
}
