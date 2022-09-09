import 'package:get_it/get_it.dart';
import 'google_login_controller.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  sl.registerSingleton<GoogleSignInController>(GoogleSignInController());
}
