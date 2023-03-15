import 'package:flutter/material.dart';
import 'package:kardusinfo_todo/core/util/app_color.dart';
import 'package:kardusinfo_todo/core/util/app_global_function.dart';
import '../../data/model/note_model.dart';

class NoteItem extends StatelessWidget {
  final NoteModel data;
  const NoteItem(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 8),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      clipBehavior: Clip.none,
      child: Row(
        children: [
          // color
          Container(
            height: 60,
            width: 8,
            decoration: BoxDecoration(
              color: Color(data.color!),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              ),
            ),
          ),

          // isCompleted
          const SizedBox(
            width: 8,
          ),
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              color: data.isCompleted! ? AppColor.pastelGreen : Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: data.isCompleted!
                    ? AppColor.pastelGreen
                    : AppColor.pastelGrey.withOpacity(.75),
                width: 1,
              ),
            ),
            child: data.isCompleted!
                ? Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 14,
                  )
                : Container(),
          ),

          // Title and Date Created / modified
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    data.title!,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColor.pastelBlack,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  // Date Created
                  data.dateCreated == data.dateModified
                      ? Text(
                          "Created on : " + data.dateCreated.toString()!,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        )
                      : Text(
                          "Last modified : " + formatDate(data.dateModified!),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
