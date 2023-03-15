import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kardusinfo_todo/core/util/app_color.dart';
import 'package:kardusinfo_todo/core/util/app_global_function.dart';
import 'package:kardusinfo_todo/presentation/widget/app_textfield.dart';

import '../../widget/app_button.dart';
import 'controller/note_create_controller.dart';

class NoteCreateScreen extends GetView<NoteCreateController> {
  const NoteCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Obx(() => controller.isUpdate
              ? Text("Note Detail")
              : Text("Create new note")),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          height: Get.height,
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //  Title Input
              Text(
                "Title",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              AppTextField(
                  controller: controller.titleController,
                  hintText: "Input your todo title"),

              // Content Input
              SizedBox(
                height: 16,
              ),
              Text(
                "Content",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              AppTextField(
                controller: controller.contentController,
                hintText: "Input your todo content here",
                isLongText: true,
              ),

              // Date Picker
              SizedBox(
                height: 16,
              ),
              Text(
                "Pick a date",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 8,
              ),
              GestureDetector(
                onTap: () async {
                  controller.pickedTime = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.withOpacity(.2),
                  ),
                  child: Row(children: [
                    Icon(
                      Icons.calendar_today,
                      color: AppColor.primaryColorDark,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Obx(() => Text(formatDate(controller.pickedTime!))),
                  ]),
                ),
              ),

              // Color Picker
              SizedBox(
                height: 20,
              ),
              Text(
                "Pick a color",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                width: Get.width,
                height: 35,
                child: Obx(() => ListView(
                      scrollDirection: Axis.horizontal,
                      children: controller.palleteColors
                          .map((e) => GestureDetector(
                                onTap: () => controller.pickedColor = e,
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 300),
                                  margin: const EdgeInsets.only(right: 10),
                                  width: 35,
                                  decoration: BoxDecoration(
                                    color: e,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: controller.pickedColor == e
                                            ? Colors.black.withOpacity(.2)
                                            : Colors.transparent,
                                        width: 2),
                                  ),
                                  child: controller.pickedColor == e
                                      ? Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 14,
                                        )
                                      : null,
                                ),
                              ))
                          .toList(),
                    )),
              ),

              // Button Create
              SizedBox(
                height: 32,
              ),
              Obx(() => SizedBox(
                    width: Get.width,
                    height: 50,
                    child: AppButton(
                      disabled: controller.isLoading,
                      text: controller.isUpdate ? "Update" : "Create",
                      onPressed: controller.isUpdate
                          ? () => controller.updateNote()
                          : () => controller.createNote(),
                      child: controller.isLoading
                          ? Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : SizedBox(),
                    ),
                  ))
            ],
          ),
        ));
  }
}
