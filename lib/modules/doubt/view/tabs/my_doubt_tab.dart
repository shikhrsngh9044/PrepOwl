import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prepowl/_utils/constants/routes.dart';
import 'package:prepowl/_utils/constants/string_constants.dart';
import 'package:readmore/readmore.dart';

class MyDoubtScreen extends StatelessWidget {
  const MyDoubtScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.toNamed(RouteNames.doubtdetail);
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(
                  width: 2,
                  color: Colors.black,
                ),
              ),
              elevation: 15,
              shadowColor: Colors.grey,
              child: Column(
                children: [
                  ListTile(
                    leading: const CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage(
                          "https://miro.medium.com/max/720/1*mk1-6aYaf_Bes1E3Imhc0A.webp"),
                      backgroundColor: Colors.transparent,
                    ),
                    title: const Text(
                      AppConst.name,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Row(
                      children: const [
                        Text(
                          AppConst.topic,
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(AppConst.time),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 365,
                    child: ReadMoreText(
                      AppConst.loremIpsum,
                      trimLength: 5,
                      trimLines: 1,
                      colorClickableText: Colors.black,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: 'Show less',
                      moreStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.network(
                          "https://c0.wallpaperflare.com/preview/413/863/685/hand-written-page-notes.jpg",
                          width: 50,
                          height: 50,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Image.network(
                          "https://c0.wallpaperflare.com/preview/413/863/685/hand-written-page-notes.jpg",
                          width: 50,
                          height: 50,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Image.network(
                          "https://c0.wallpaperflare.com/preview/413/863/685/hand-written-page-notes.jpg",
                          width: 50,
                          height: 50,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Image.network(
                          "https://c0.wallpaperflare.com/preview/413/863/685/hand-written-page-notes.jpg",
                          width: 50,
                          height: 50,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: SizedBox(
        height: 80,
        width: 80,
        child: FloatingActionButton(
          backgroundColor: Colors.grey,
          onPressed: () {
            Get.toNamed(RouteNames.addmydoubt);
          },
          child: const Icon(
            Icons.favorite,
            size: 32,
          ),
        ),
      ),
    );
  }
}
