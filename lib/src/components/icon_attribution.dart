import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class IconAttribution extends StatelessWidget {
  const IconAttribution({
    Key? key,
    required this.authorUrl,
    required this.authorName,
    required this.iconPaths,
  }) : super(key: key);

  final String authorUrl;
  final String authorName;
  final List<String> iconPaths;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text('Icons made by '),
            GestureDetector(
              onTap: () async {
                Uri url = Uri.parse(authorUrl);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Text(
                authorName,
                style: const TextStyle(color: Colors.blue),
              ),
            ),
            const Text(' from '),
            GestureDetector(
              onTap: () async {
                Uri url = Uri.parse('https://www.flaticon.com/');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: const Text(
                'www.flaticon.com',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
        Row(
          children: iconPaths
              .map((iconPath) => Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                    child: Image.asset(
                      iconPath,
                      width: 20,
                    ),
                  ))
              .toList(),
        )
      ],
    );
  }
}
