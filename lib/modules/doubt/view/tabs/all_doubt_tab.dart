import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../../../_utils/constants/routes.dart';
import '../../../../_utils/constants/string_constants.dart';

class AllDoubtScreen extends StatelessWidget {
  const AllDoubtScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
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
                elevation: 16,
                shadowColor: Colors.grey,
                child: Column(
                  children: [
                    ListTile(
                      leading: const CircleAvatar(
                        radius: 20.0,
                        backgroundImage: NetworkImage(
                          "https://az837918.vo.msecnd.net/publishedimages/articles/1733/en-CA/images/1/free-download-this-stunning-alberta-scene-for-your-device-background-image-L-6.jpg",
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                      title: const Text(
                        AppConst.name,
                        style: TextStyle(fontSize: 18),
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
                        moreStyle: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              "https://c0.wallpaperflare.com/preview/413/863/685/hand-written-page-notes.jpg",
                              width: 50,
                              height: 50,
                            ),
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
      ),
    );
  }
}
