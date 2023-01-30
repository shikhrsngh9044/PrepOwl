import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../../../_utils/configs/theme_config.dart';
import '../../../../_utils/constants/routes.dart';
import '../../../../_utils/constants/string_constants.dart';
import '../../../../_utils/ui_components/widget_extensions.dart';

class DoubtDetail extends StatelessWidget {
  DoubtDetail({super.key});
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppConst.appName,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AppTheme.secondaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              trailing: PopupMenuButton<int>(
                color: Colors.white,
                itemBuilder: (context) => [
                  const PopupMenuItem<int>(value: 0, child: Text("Share")),
                  const PopupMenuItem<int>(value: 1, child: Text("Edit")),
                  const PopupMenuItem<int>(value: 1, child: Text("Close")),
                ],
                onSelected: (item) => selectedItem(item),
              ),
              leading: const CircleAvatar(
                radius: 20.0,
                backgroundImage: NetworkImage(
                    "https://az837918.vo.msecnd.net/publishedimages/articles/1733/en-CA/images/1/free-download-this-stunning-alberta-scene-for-your-device-background-image-L-6.jpg"),
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
              width: 370,
              child: ReadMoreText(
                AppConst.loremIpsum,
                trimLines: 5,
                colorClickableText: Colors.black,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Show more',
                trimExpandedText: 'Show less',
                moreStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
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
            ),
            const SizedBox(
              height: 17,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(
                  width: 2,
                  color: Colors.black,
                ),
              ),
              elevation: 16,
              shadowColor: Colors.grey,
              child: const Padding(
                padding: EdgeInsets.only(
                    left: 20.0, right: 8.0, top: 8.0, bottom: 8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "All comments",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 150,
              child: Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Column(
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
                            width: 370,
                            child: Text(
                              AppConst.loremIpsum,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                        Icons.thumb_up_alt_outlined)),
                                const Text("200"),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                        Icons.thumb_down_alt_outlined)),
                                const Text("1"),
                              ],
                            ),
                          ),
                          const Divider(
                            color: Colors.grey,
                            thickness: 2.0,
                          ),
                        ],
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: "Enter Your Comment",
                        fillColor: Colors.white,
                        filled: true,
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.send,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

void selectedItem(item) {
  switch (item) {
    case 0:
      "Share".logIt;
      break;
    case 1:
      "Edit".logIt;
      Get.toNamed(RouteNames.editDoubt);
      break;
    case 2:
      "Close".logIt;
      break;
  }
}
