import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../widgets/custom_icon_btn.dart';
import '../controllers/show_note_controller.dart';

class ShowNoteView extends GetView<ShowNoteController> {
  const ShowNoteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(
            16.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIconBtn(
                    color: context.theme.colorScheme.primary,
                    onPressed: Get.back,
                    icon: const Icon(
                      Icons.arrow_back_ios_outlined,
                    ),
                  ),
                  Obx(
                    () => CustomIconBtn(
                      color: context.theme.colorScheme.primary,
                      onPressed: controller.isLoading.isFalse
                          ? controller.showDialogDelete
                          : null,
                      icon: controller.isLoading.isFalse
                          ? const Icon(Icons.delete)
                          : const CircularProgressIndicator(),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Obx(
                        () => Text(
                          "${controller.formattedDate.value} at ${controller.time.value}",
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: controller.titleController,
                        maxLines: null,
                        cursorColor: context.theme.colorScheme.surface,
                        decoration: const InputDecoration.collapsed(
                          hintText: "Title",
                        ),
                        style: const TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        autofocus: true,
                        cursorColor: context.theme.colorScheme.surface,
                        controller: controller.bodyController,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: const InputDecoration.collapsed(
                          hintText: "Type something...",
                        ),
                        style: const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Obx(
        () => FloatingActionButton.extended(
          onPressed: controller.isLoading.isFalse ? controller.save : null,
          label: controller.isLoading.isFalse
              ? const Text("Save")
              : const CircularProgressIndicator(),
          icon: controller.isLoading.isFalse ? const Icon(Icons.save) : null,
        ),
      ),
    );
  }
}
