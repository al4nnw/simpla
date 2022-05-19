import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../estilos/cores.dart';

class ImageViewer extends StatelessWidget {
  final String photoPath;
  final Object heroTag;
  final bool isFile;
  const ImageViewer({Key? key, required this.photoPath, required this.heroTag, required this.isFile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBody: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 20,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 20,
            child: InteractiveViewer(
              maxScale: double.infinity,
              child: Hero(
                  tag: heroTag,
                  child: isFile
                      ? Image.file(File(photoPath), fit: BoxFit.contain)
                      : CachedNetworkImage(
                          imageUrl: photoPath,
                          fit: BoxFit.contain,
                          errorWidget: (context, _url, s) {
                            return Column(
                              children: const [
                                Icon(Icons.error),
                                Text("Não foi possível carregar a imagem com o tamanho inteiro.",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white, fontWeight: FontWeight.normal))
                              ],
                            );
                          },
                          progressIndicatorBuilder: (context, v, progress) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 40),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                                    child: Column(
                                      children: [
                                        LinearProgressIndicator(
                                          value: progress.progress,
                                          color: cinza,
                                          backgroundColor: cinza,
                                          valueColor: const AlwaysStoppedAnimation<Color>(azul),
                                          minHeight: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        )),
            ),
          ),
        ],
      ),
    );
  }
}
