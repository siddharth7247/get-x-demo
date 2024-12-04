import 'package:get/get.dart';
import 'package:getx_demo/services/api_services.dart';
class DependencyInjection {
 static void init() async {
   Get.put<GetConnect>(GetConnect()); 
  Get.put<ApiServices>(ApiServices()); 
 }
}