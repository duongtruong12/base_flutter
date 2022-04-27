import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../../utils/const.dart';
import '../../utils/global/globals_functions.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage(
      {Key? key,
      required this.url,
      this.height,
      this.width,
      this.enableRefresh = false,
      this.fit = BoxFit.cover})
      : super(key: key);
  final bool enableRefresh;
  final String? url;
  final BoxFit fit;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      child: url == null
          ? Center(
              child: getSvgImage('ic_error'),
            )
          : ExtendedImage.network(
              url!,
              width: width,
              height: height,
              fit: fit,
              cache: true,
              loadStateChanged: (ExtendedImageState state) {
                switch (state.extendedImageLoadState) {
                  case LoadState.loading:
                    return const Center(
                      child: SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator()),
                    );
                  case LoadState.failed:
                    return enableRefresh
                        ? IconButton(
                            onPressed: () {
                              state.reLoadImage();
                            },
                            icon: const Icon(
                              Icons.refresh,
                              color: Const.mainColor,
                            ))
                        : Center(
                            child: getSvgImage('ic_error'),
                          );
                  case LoadState.completed:
                    break;
                }
                return null;
              },
            ),
    );
  }
}
