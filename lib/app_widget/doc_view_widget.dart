import 'dart:io';

import 'package:diamon_assorter/util/app_color.dart';
import 'package:flutter/material.dart';

class DocViewWidget extends StatelessWidget {
  const DocViewWidget({
    Key key,
    this.height,
    this.onSelectImage,
    this.onDeleteImage,
    this.title,
    this.file,
  }) : super(key: key);

  final double height;
  final Function onSelectImage;
  final Function onDeleteImage;
  final String title;
  final File file;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: onSelectImage,
          child: Container(
            // height: (MediaQuery.of(context).size.width - 100) / 2,
            height: height,
            margin: EdgeInsets.only(right: 5, top: 5),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.grey.shade300,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: (file == null)
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  )
                : Container(
                    width: double.maxFinite,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          file,
                          fit: BoxFit.cover,
                        )),
                  ),
          ),
        ),
        (file != null)
            ? Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: onDeleteImage,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.redAccent),
                    child: Icon(
                      Icons.close,
                      color: AppColors.whiteColor,
                      size: 15,
                    ),
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}