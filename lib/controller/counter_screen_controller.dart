import 'package:get/get.dart';

class CounterScreenController extends GetxController{
  RxInt counter = 0.obs;

  increment(){
    counter.value ++;
    print("Counter ${counter.value}");
  }
}