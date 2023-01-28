import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:market_app/packages/ui_layout/style_app/consts_app.dart';
import 'package:market_app/packages/ui_layout/style_app/container_style.dart';
import 'package:flutter/services.dart';
import 'package:photo_view/photo_view.dart';

class ContainerForPhotoFuture extends StatelessWidget {
  const ContainerForPhotoFuture({
    Key? key,
    this.isOpenView = false,
    this.isCircular = false,
    this.borderRadius,
    this.imagePathFromNetwork,
  }) : super(key: key);
  final double? borderRadius;

  final bool isOpenView;
  final bool isCircular;
  final String? imagePathFromNetwork;

  @override
  Widget build(BuildContext context) {
    if (imagePathFromNetwork != null && imagePathFromNetwork != "") {
      return GestureDetector(
        onTap: isOpenView
            ? () {
                imageViewBottom(
                  context: context,
                  imagePathForNetworkImage: imagePathFromNetwork,
                  heroTag: 'null',
                );
              }
            : null,
        child: Container(
          clipBehavior: Clip.hardEdge,
          width: double.infinity,
          decoration:
              myStyleContainer(context: context, borderRadius: borderRadius)
                  .copyWith(
            color: isCircular ? Colors.transparent : myColorIsActive,
          ),
          child: CachedNetworkImage(
            imageUrl: imagePathFromNetwork!,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return containerIfNotPhoto(context: context);
    }
  }
}

Container containerIfNotPhoto({required BuildContext context}) => Container(
      clipBehavior: Clip.antiAlias,
      // height: 40,
      width: double.infinity,
      decoration: myStyleContainer(context: context).copyWith(),
      child: Center(
          child: Icon(
        Icons.image_not_supported_outlined,
        color: Colors.black,
      )),
    );

void imageViewBottom({
  required BuildContext context,
  String? imagePathForNetworkImage,
  Uint8List? uint8ListImageForMemoryImage,
  required Object heroTag,
}) =>
    showBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return PhotoViewGestureDetectorScope(
          axis: Axis.vertical,
          child: PhotoView(
            minScale: PhotoViewComputedScale.contained * 1,
            maxScale: PhotoViewComputedScale.contained * 3,
            backgroundDecoration: BoxDecoration(
              color: Colors.black.withOpacity(0.85),
            ),
            imageProvider: (uint8ListImageForMemoryImage != null &&
                    imagePathForNetworkImage == null)
                ? MemoryImage(uint8ListImageForMemoryImage)
                : NetworkImage(imagePathForNetworkImage!) as ImageProvider,
            heroAttributes: PhotoViewHeroAttributes(tag: heroTag),
          ),
        );
      },
    );
