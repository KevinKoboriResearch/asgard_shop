// import 'package:nasa_apod_core/nasa_apod_core.dart';

// class ApodReloadPage extends StatelessWidget {
//   final String error;
//   final void Function() reload;

//   const ApodReloadPage({
//     required this.error,
//     required this.reload,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return XPadding(
//       xPadding: const XEdgeInsets.all(XSpacing.extraLarge),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(error,
//               style: const TextStyle(fontSize: 16),
//               textAlign: TextAlign.center),
//           const XGap.small(),
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(),
//             onPressed: reload,
//             child: Text(I18n.strings.reload),
//           )
//         ],
//       ),
//     );
//   }
// }
