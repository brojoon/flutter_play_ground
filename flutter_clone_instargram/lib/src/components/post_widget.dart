import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_instargram/src/components/image_data.dart';

import 'avatar_widget.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AvatarWidget(
            type: AvatarType.TYPE3,
            nickname: 'brojoon',
            size: 40,
            thumbPath:
                "https://img.freepik.com/free-photo/ultra-detailed-nebula-abstract-wallpaper-4_1562-749.jpg?size=626&ext=jpg&ga=GA1.1.1546980028.1704067200&semt=ais",
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: ImageData(
                IconsPath.postMoreIcon,
                width: 30,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _image() {
    return CachedNetworkImage(
        width: 2000,
        imageUrl:
            "https://a.cdn-hotels.com/gdcs/production72/d1563/ea17ae2b-867f-41c5-bb4f-f2e4582cf777.jpg?impolicy=fcrop&w=1600&h=1066&q=medium");
  }

  Widget _infoCount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ImageData(
                IconsPath.likeOffIcon,
                width: 65,
              ),
              const SizedBox(width: 15),
              ImageData(
                IconsPath.replyIcon,
                width: 60,
              ),
              const SizedBox(width: 15),
              ImageData(
                IconsPath.directMessage,
                width: 55,
              ),
            ],
          ),
          ImageData(
            IconsPath.bookMarkOffIcon,
            width: 50,
          ),
        ],
      ),
    );
  }

  Widget _infoDescription() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('좋아요 150개', style: TextStyle(fontWeight: FontWeight.bold)),
          ExpandableText(
            '콘텐츠 1입니다.\n콘텐츠 1입니다.\n콘텐츠 1입니다.\n콘텐츠 1입니다.\n콘텐츠 1입니다.\n',
            prefixText: 'brojoon',
            // onPrefixTap: () {},
            prefixStyle: TextStyle(fontWeight: FontWeight.bold),
            expandText: '더보기',
            collapseText: '접기',
            maxLines: 3,
            expandOnTextTap: true,
            linkColor: Colors.grey,
          )
        ],
      ),
    );
  }

  Widget _replyTextBtn() {
    return GestureDetector(
      onTap: () {},
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          '댓글 199개 모두 보기',
          style: TextStyle(color: Colors.grey, fontSize: 13),
        ),
      ),
    );
  }

  Widget _dateAgo() {
    return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Text('1일전', style: TextStyle(color: Colors.grey, fontSize: 11)));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _header(),
            const SizedBox(height: 15),
            _image(),
            const SizedBox(height: 15),
            _infoCount(),
            const SizedBox(height: 5),
            _infoDescription(),
            const SizedBox(height: 5),
            _replyTextBtn(),
            const SizedBox(height: 5),
            _dateAgo(),
          ],
        ));
  }
}
