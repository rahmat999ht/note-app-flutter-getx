import 'package:get/get.dart';
import '../modules/add_note/views/add_note_view.dart';
import '../modules/show_note/bindings/show_note_binding.dart';
import '../modules/show_note/views/show_note_view.dart';
import '../modules/add_note/bindings/add_note_binding.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ADDNOTE,
      page: () => const AddNoteView(),
      binding: AddNoteBinding(),
    ),
    GetPage(
      name: _Paths.SHOWNOTE,
      page: () => const ShowNoteView(),
      binding: ShowNoteBinding(),
    ),
  ];
}
