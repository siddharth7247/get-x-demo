import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int address = 1;
  int time = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('lbl_payment'.tr),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              'lbl_address'.tr,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          RadioListTile(
            title: Text('lbl_home'.tr),
            subtitle: Text(
              'lbl_home_address'.tr,
              style: const TextStyle(fontSize: 15),
            ),
            value: 1,
            groupValue: address,
            onChanged: (value) => setState(
              () {
                address = value!;
              },
            ),
          ),
          RadioListTile(
            title: Text('lbl_office'.tr),
            subtitle: Text(
              'lbl_office_address'.tr,
              style: const TextStyle(fontSize: 15),
            ),
            value: 2,
            groupValue: address,
            onChanged: (value) => setState(
              () {
                address = value!;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 70),
            child: Text(
              'lbl_new_address'.tr,
              style: const TextStyle(fontSize: 17),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              'lbl_time'.tr,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          RadioListTile(
            title: Text('lbl_ASAP'.tr),
            value: 1,
            groupValue: time,
            onChanged: (value) => setState(
              () {
                time = value!;
              },
            ),
          ),
          RadioListTile(
            title: Text('lbl_set_time'.tr),
            value: 2,
            groupValue: time,
            onChanged: (value) => setState(
              () {
                time = value!;
              },
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "lbl_payment_method".tr,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 8, 56, 10),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Card(
                    color: Colors.blue.shade200,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'lbl_apple_pay'.tr,
                            style: const TextStyle(fontSize: 15),
                          ),
                          const Icon(
                            Icons.apple,
                            size: 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'lbl_google_pay'.tr,
                            style: const TextStyle(fontSize: 15),
                          ),
                          const Icon(
                            Icons.g_mobiledata,
                            size: 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'lbl_cash'.tr,
                            style: const TextStyle(fontSize: 15),
                          ),
                          const Icon(
                            Icons.money,
                            size: 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              'lbl_add_info'.tr,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: TextFormField(
              decoration: InputDecoration(
                  border: const OutlineInputBorder(), hintText: "lbl_name".tr),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "lbl_total".tr,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 8, 56, 10),
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade200
                    ),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: Text(
                      "lbl_pay".tr,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 8, 56, 10),
                      ),
                    ),
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
