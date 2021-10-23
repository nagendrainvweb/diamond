import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:diamon_assorter/app_widget/app_appbar.dart';
import 'package:diamon_assorter/util/utility.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImagePreView extends StatefulWidget {
  const ImagePreView({Key key, this.image, this.isFile}) : super(key: key);

  final image;
  final bool isFile;

  @override
  _ImagePreViewState createState() => _ImagePreViewState();
}

class _ImagePreViewState extends State<ImagePreView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppAppBar(
            showBackButton: true,
          ),
          Expanded(
              child: Container(
            height: double.maxFinite,
            width: double.maxFinite,
            child:  (widget.isFile)
                          ? Image.file(
                              widget.image,
                              fit: BoxFit.contain,
                            )
                          : CachedNetworkImage(
                              imageUrl: widget.image,
                              fit: BoxFit.contain,
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
            // PhotoView(
            //   backgroundDecoration: BoxDecoration(color: Colors.white),
            //   // errorBuilder: (_, object, stack) {
            //   //   myPrint(stack.toString());
            //   //   return Container(
            //   //     child: Text("Error"),
            //   //   );
            //   // },
            //   imageProvider: 
            //   //(!widget.isFile)
            //      // ? 
            //       NetworkImage(widget.image),
            //      // : FileImage(widget.image),
            //   initialScale: PhotoViewComputedScale.contained * 0.9,
            // ),
          ))
        ],
      ),
    );
  }
}
