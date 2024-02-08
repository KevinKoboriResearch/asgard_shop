import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';
import 'package:url_strategy/url_strategy.dart';

import 'package:nasa_apod_app/app.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: ImageAspectRatioWidget(
              imageUrl:
                  'https://apod.nasa.gov/apod/image/2401/EarthMoon_Artemis1Saunders_1600.jpg'),
        ),
      ),
    ),
  );
}

class ImageAspectRatioWidget extends StatelessWidget {
  final String imageUrl;

  ImageAspectRatioWidget({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<double>(
      future: getImageAspectRatio(imageUrl),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          return Stack(
            children: [
              Image.network(imageUrl),
              Container(
                color: Colors.white,
                child: Text('Aspect Ratio: ${snapshot.data}'),
              ),
            ],
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

Future<double> getImageAspectRatio(String imageUrl) async {
  final ImageStream imageStream =
      NetworkImage(imageUrl).resolve(ImageConfiguration.empty);
  final Completer<double>? completer = Completer();

  void imageListener(ImageInfo info, bool _) {
    final double aspectRatio = info.image.width / info.image.height;
    completer?.complete(aspectRatio);
  }

  imageStream.addListener(
    ImageStreamListener(imageListener),
  );

  return await completer?.future ?? 1;
}
