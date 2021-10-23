import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:diamon_assorter/util/app_color.dart';
import 'package:flutter/material.dart';

class DocViewWidget extends StatelessWidget {
  const DocViewWidget(
      {Key key,
      this.height,
      this.onSelectImage,
      this.onEditImage,
      this.title,
      this.image,
      this.isFile, this.onViewImage})
      : super(key: key);

  final double height;
  final Function onSelectImage;
  final Function onEditImage;
  final String title;
  final String image;
  final bool isFile;
  final Function onViewImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: (image == null) ? onSelectImage : onViewImage,
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
            child: (image == null)
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
                      child: (isFile)
                          ? Image.file(
                              File(image),
                              fit: BoxFit.cover,
                            )
                          : CachedNetworkImage(
                              imageUrl: image,
                              fit: BoxFit.cover,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) => SizedBox(
                                height: 50,
                                width: 50,
                                child: CircularProgressIndicator(
                                  value: downloadProgress.progress,
                                  strokeWidth: 3,
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                    ),
                  ),
          ),
        ),
        (image != null)
            ? Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: onEditImage,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.grey500),
                        shape: BoxShape.circle,
                        color: AppColors.whiteColor),
                    child: Icon(
                      Icons.edit_outlined,
                      color: AppColors.grey600,
                      size: 20,
                    ),
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}
