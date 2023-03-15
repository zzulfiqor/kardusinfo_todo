import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kardusinfo_todo/core/router/route_name.dart';
import 'package:kardusinfo_todo/presentation/feature/note/controller/note_controller.dart';
import 'package:kardusinfo_todo/presentation/widget/note_item.dart';

import '../../../core/util/app_color.dart';

class NoteScreen extends GetView<NoteController> {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/images/logo.png',
          width: 100,
        ),
        actions: [
          // logout
          IconButton(
            onPressed: () async {
              await controller.logout();
            },
            icon: Icon(
              Icons.logout,
              color: AppColor.primaryColor,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Get.toNamed(RouteName.noteCreate);
          controller.getAllNotes();
        },
        child: Icon(
          Icons.note_add,
          color: Colors.deepPurple,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColor.primaryColorDark,
                      AppColor.primaryColor,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Stack(
                  children: [
                    // Background
                    Positioned(
                      top: -20,
                      right: -20,
                      child: Image.asset(
                        'assets/images/bg_circle.png',
                        height: 125,
                      ),
                    ),

                    // Background
                    Positioned(
                      bottom: -20,
                      left: 0,
                      child: Image.asset(
                        'assets/images/bg_circle.png',
                        height: 120,
                      ),
                    ),

                    // Today Reminder
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 24),
                      child: Row(
                        children: [
                          // Today Reminder
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Today Reminder',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Obx(() => Text(
                                      '${controller.todayReminder.length} Tasks',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          // bel
                          Image.asset(
                            'assets/images/bell.png',
                            height: 75,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Today
              const SizedBox(height: 20),
              const Text(
                'Today',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Obx(() => controller.todayReminder.isEmpty
                  ? Container(
                      child: Center(
                        child: Column(
                          children: [
                            // Text
                            Text(
                              'No Reminder Today',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.todayReminder.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, i) {
                        return NoteItem(
                          controller.todayReminder[i],
                        );
                      },
                    )),

              // All Notes
              const SizedBox(
                height: 16,
              ),
              const Text(
                'All Todos',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Obx(() => controller.allReminder.isEmpty
                  ? Container(
                      child: Center(
                        child: Column(
                          children: [
                            // Text
                            Text(
                              'No Reminder Created',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.allReminder.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, i) {
                        return NoteItem(
                          controller.allReminder[i],
                        );
                      },
                    )),
            ],
          ),
        ),
      ),
    );
  }
}
