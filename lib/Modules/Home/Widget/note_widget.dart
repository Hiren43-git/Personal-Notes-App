import 'package:flutter/material.dart';
import 'package:personal_notes_app/Utils/Constants/Color/colors.dart';
import 'package:personal_notes_app/Utils/Constants/Common%20Widget/icon_widget.dart';
import 'package:personal_notes_app/Utils/Constants/Images/images.dart';

class NoteWidget extends StatefulWidget {
  final String? title;
  final String? date;
  final String? content;
  const NoteWidget({super.key, this.title, this.date, this.content});

  @override
  State<NoteWidget> createState() => _NoteWidgetState();
}

class _NoteWidgetState extends State<NoteWidget> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title!,
                  style: TextStyle(
                    fontSize: w * 0.046,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  'Created on ${widget.date!}',
                  style: TextStyle(
                    fontSize: w * 0.04,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
            IconWidget(
              image: AppImages.rightArrow,
              height: w * 0.056,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 32.0),
          child: Text(
            widget.content!,
            style: TextStyle(
              fontSize: w * 0.036,
              fontWeight: FontWeight.w400,
              color: AppColors.textColor,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
        ),
        SizedBox(
          height: w * 0.06,
        )
      ],
    );
  }
}
