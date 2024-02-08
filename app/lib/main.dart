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

class ImageAspectRatioWidget extends StatefulWidget {
  final String imageUrl;

  ImageAspectRatioWidget({required this.imageUrl});

  @override
  State<ImageAspectRatioWidget> createState() => _ImageAspectRatioWidgetState();
}

class _ImageAspectRatioWidgetState extends State<ImageAspectRatioWidget> {
  double? _aspectRatio;
  bool _isLoading = true; // Initial state is loading

  @override
  void initState() {
    super.initState();
    _loadAspectRatio();
  }

  Future<void> _loadAspectRatio() async {
    try {
      final double aspectRatio = await getImageAspectRatio(widget.imageUrl);
      if (mounted) {
        setState(() {
          _aspectRatio = aspectRatio;
          _isLoading = false; // Loading is complete
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false; // Ensure loading state is disabled even on error
        });
      }
      // Handle any errors here
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      // Show loading indicator while loading
      return CircularProgressIndicator();
    } else if (_aspectRatio == null) {
      // Handle error or case where aspect ratio could not be loaded
      return Text('Error loading image aspect ratio');
    } else {
      // Once loaded, use the aspect ratio for your widget
      return Stack(
        children: [
          Image.network(widget.imageUrl),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(4),
              child: Text('Aspect Ratio: $_aspectRatio'),
            ),
          ),
        ],
      );
    }
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
