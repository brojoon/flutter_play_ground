import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_instargram/src/components/avatar_widget.dart';
import '../components/image_data.dart';
import '../components/post_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Widget _myStory() {
    return Stack(
      children: [
        AvatarWidget(
          type: AvatarType.TYPE2,
          thumbPath:
              "https://img.freepik.com/free-photo/ultra-detailed-nebula-abstract-wallpaper-4_1562-749.jpg?size=626&ext=jpg&ga=GA1.1.1546980028.1704067200&semt=ais",
          size: 70,
        ),
        Positioned(
            right: 5,
            bottom: 0,
            child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: const Center(
                    child: Text('+',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          height: 1,
                        )))))
      ],
    );
  }

  Widget _storyBoardList() {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          const SizedBox(width: 20),
          _myStory(),
          const SizedBox(width: 5),
          ...List.generate(
              100,
              (index) => AvatarWidget(
                    type: AvatarType.TYPE1,
                    thumbPath:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpiDR537gdwrJASfaDjj5uId0GB4lO5y1qcw&usqp=CAU',
                  ))
        ]));
  }

  Widget _postList() {
    return Column(
      children: List.generate(50, (index) => PostWidget()).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: ImageData(IconsPath.logo, width: 270),
          actions: [
            GestureDetector(
                onTap: () {},
                child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ImageData(
                      IconsPath.directMessage,
                      width: 50,
                    )))
          ],
        ),
        body: ListView(
          children: [
            _storyBoardList(),
            _postList(),
          ],
        ));
  }
}
