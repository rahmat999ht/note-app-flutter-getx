// import 'dart:math';

import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:note_app_flutter_getx_firebase/app/routes/app_pages.dart';

import '../../../../widgets/custom_icon_btn.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.colorScheme.primary,
        title: Obx(
          () => Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIconBtn(
                    color: context.theme.colorScheme.primary,
                    onPressed: () {
                      controller.axisCount.value =
                          controller.axisCount.value == 2 ? 4 : 2;
                    },
                    icon: Icon(controller.axisCount.value == 2
                        ? Icons.list
                        : Icons.grid_on),
                  ),
                  const Text(
                    "Notes",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CustomIconBtn(
                    color: context.theme.colorScheme.primary,
                    onPressed: () {
                      // Get.to(() => Setting());
                    },
                    icon: const Icon(
                      Icons.settings,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      body: controller.obx(
        (state) {
          log(state.toString(), name: "isi list");
          return Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: state!.length,
              itemBuilder: (context, index) {
                var formattedDate = DateFormat.yMMMd()
                    .format(state[index].creationDate!.toDate());
                // Random random = Random();
                // Color bg = controller.lightColors[random.nextInt(8)];
                return GestureDetector(
                  onTap: () {
                    // Get.to(() => ShowNote(
                    //     index: index, noteData: state[index]));
                  },
                  child: Container(
                    height: 100,
                    width: Get.width,
                    padding: const EdgeInsets.only(
                      bottom: 10,
                      left: 10,
                      right: 10,
                    ),
                    decoration: BoxDecoration(
                      color: controller.lightColors[index],
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          contentPadding: const EdgeInsets.only(
                            top: 5,
                            right: 8,
                            left: 8,
                            bottom: 0,
                          ),
                          title: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                            ),
                            child: Text(
                              state[index].title!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          subtitle: Text(
                            state[index].body!,
                            maxLines: 10,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              formattedDate,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
        onEmpty: const Center(child: Text('Kosong')),
        onLoading: const Center(child: SingleChildScrollView()),
        onError: (e) => Center(child: Text(e.toString())),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Add Note",
        onPressed: () => Get.toNamed(Routes.ADDNOTE),
        child: const Icon(
          Icons.note_add,
          size: 30,
        ),
      ),
    );
  }
}
