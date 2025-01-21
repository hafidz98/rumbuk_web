// import 'dart:html';
//
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
//
// class Sidebar extends StatelessWidget {
//   const Sidebar({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       shape: const BeveledRectangleBorder(),
//       child: Container(
//         decoration: const BoxDecoration(
//           color: Colors.white,
//           border: Border(right: BorderSide(color: Colors.grey, width: 1)),
//         ),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               CircularImage(
//                 width: 100,
//                 height: 100,
//                 image: logo.png,
//                 backgroundColor: Colors.transparent,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class CircularImage extends StatelessWidget {
//   const CircularImage({
//     super.key,
//     this.fit = BoxFit.cover,
//     this.image,
//     this.file,
//     this.imageType = ImageType.asset,
//     this.overlayColor,
//     this.backgroundColor,
//     this.memoryImage,
//     this.width = 56,
//     this.height = 56,
//     this.padding = 8,
//   });
//
//   final BoxFit? fit;
//   final String? image;
//   final File? file;
//   final ImageType imageType;
//   final Color? overlayColor;
//   final Color? backgroundColor;
//   final Uint8List? memoryImage;
//   final double width, height, padding;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width,
//       height: height,
//       padding: EdgeInsets.all(padding),
//       decoration: BoxDecoration(
//         color: backgroundColor ??
//             (Theme.of(context).brightness == Brightness.dark
//                 ? Colors.black
//                 : Colors.white),
//         borderRadius: BorderRadius.circular(width >= height ? width : height),
//       ),
//       child: _buildImageWidget(),
//     );
//   }
//
//   Widget _buildImageWidget() {
//     Widget imageWidget;
//
//     switch (imageType) {
//       case ImageType.network:
//         imageWidget = _buildNetworkImage();
//         break;
//       case ImageType.memory:
//         imageWidget = _buildMemoryImage();
//         break;
//       case ImageType.file:
//         imageWidget = _buildFileImage();
//         break;
//       case ImageType.asset:
//         imageWidget = _buildAssetImage();
//         break;
//     }
//
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(width >= height ? width : height),
//       child: imageWidget,
//     );
//   }
//
//   Widget _buildNetworkImage() {
//     if (image != null) {
//       return CachedNetworkImage();
//     } else {
//       return Container();
//     }
//   }
//
//   Widget _buildMemoryImage() {
//     if (image != null) {
//       return Image(
//         fit: fit,
//         image: MemoryImage(memoryImage!),
//         color: overlayColor,
//       );
//     } else {
//       return Container();
//     }
//   }
//
//   Widget _buildFileImage() {
//     if (image != null) {
//       return Image(
//         fit: fit,
//         image: FileImage(file!),
//         color: overlayColor,
//       );
//     } else {
//       return Container();
//     }
//   }
//
//   Widget _buildAssetImage() {
//     if (image != null) {
//       return Image(
//         fit: fit,
//         image: AssetImage(image!),
//         color: overlayColor,
//       );
//     } else {
//       return Container();
//     }
//   }
// }
