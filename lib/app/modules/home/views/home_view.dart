import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_popup_menu_button/custom_popup_menu_button.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:note_app_flutter_getx_firebase/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: context.theme.colorScheme.primary,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(
                  "Notes",
                  style: context.textTheme.titleMedium,
                ),
                popUpMenu(context),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      body: controller.obx(
        (state) {
          // log(state.toString(), name: "isi list");
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state!.notes.length,
            itemBuilder: (context, index) {
              var formattedDate = DateFormat.yMMMd()
                  .format(state.notes[index].creationDate!.toDate());
              Random random = Random();
              Color bg = controller.lightColors[random.nextInt(8)];
              return GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.SHOWNOTE, arguments: {
                    'data': state.notes[index],
                  });
                },
                child: Container(
                  // height: 100,
                  width: Get.width,
                  padding: const EdgeInsets.only(
                    bottom: 10,
                    left: 10,
                    right: 10,
                  ),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: bg,
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
                            state.notes[index].title!,
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
                          state.notes[index].body!,
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
          );
        },
        onEmpty: const Center(child: Text('Kosong')),
        onLoading: Center(
          child: CircularProgressIndicator(
            color: context.theme.colorScheme.surface,
          ),
        ),
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

  Widget popUpMenu(BuildContext context) {
    return controller.obx(
      (state) {
        return FlutterPopupMenuButton(
          direction: MenuDirection.left,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white),
          popupMenuSize: const Size(200, 300),
          child: FlutterPopupMenuIcon(
            key: GlobalKey(),
            child: CircleAvatar(
              child: Text(state!.user.email?[0].toUpperCase() ?? ''),
            ),
          ),
          children: <FlutterPopupMenuItem>[
            FlutterPopupMenuItem(
              child: ListTile(
                leading: const Icon(Icons.person),
                title: Text(state.user.name!),
                subtitle: Text(state.user.email!),
              ),
            ),
            FlutterPopupMenuItem(
              onTap: () => Get.changeThemeMode(ThemeMode.light),
              child: const ListTile(
                title: Text('light_mode'),
                leading: Icon(Icons.light_mode),
              ),
            ),
            FlutterPopupMenuItem(
              onTap: () => Get.changeThemeMode(ThemeMode.dark),
              child: const ListTile(
                title: Text('dark_mode'),
                leading: Icon(Icons.dark_mode),
              ),
            ),
            FlutterPopupMenuItem(
              onTap: controller.logOut,
              child: const ListTile(
                title: Text('logout'),
                leading: Icon(Icons.logout),
              ),
            ),
          ],
        );
      },
      onEmpty: const Center(child: Text('Kosong')),
      onLoading: Center(
        child: CircularProgressIndicator(
          color: context.theme.colorScheme.surface,
        ),
      ),
      onError: (e) => Center(child: Text(e.toString())),
    );
  }
}
