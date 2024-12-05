import 'package:get/get.dart';
import 'package:getx_demo/views/add_todos.dart';
import 'package:getx_demo/views/home_screen.dart';

class RouteManager {
  static const initialRoute = Routes.homeScreen;

  static List<GetPage> getPages(){
    return [
      GetPage(name: Routes.homeScreen, page: () => const HomeScreen(),),
      GetPage(name: Routes.addTodoScreen, page: () => const AddTodosScreen(),)
    ];
  }
}
class Routes{
    static const homeScreen = '/homeScreen';
    static const addTodoScreen = '/addTodoScreen';
}