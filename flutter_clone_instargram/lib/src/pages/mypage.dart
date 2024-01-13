import 'package:flutter/material.dart';
import '../components/avatar_widget.dart';
import '../components/image_data.dart';
import '../components/user_card.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  Widget _statisticsOne(String title, int value) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: const TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Text(title, style: const TextStyle(fontSize: 15, color: Colors.black))
      ],
    );
  }

  Widget _information() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Row(
            children: [
              AvatarWidget(
                type: AvatarType.TYPE3,
                thumbPath:
                    'data:image/jpeg;base64,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',
                size: 80,
              ),
              const SizedBox(width: 10),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: _statisticsOne('Post', 15)),
                  Expanded(child: _statisticsOne('Followers', 11)),
                  Expanded(child: _statisticsOne('Following', 3)),
                ],
              ))
            ],
          ),
          const SizedBox(height: 10),
          const Text('안녕하세요 개발하는 준입니다.',
              style: TextStyle(
                fontSize: 13,
                color: Colors.black,
              ))
        ]));
  }

  Widget _menu() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      child: Row(children: [
        Expanded(
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: 7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(
                    color: const Color(0xffdedede),
                  ),
                ),
                child: const Text(
                  'Edit profile',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ))),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            border: Border.all(
              color: const Color(0xffdedede),
            ),
            color: const Color(0xffefefef),
          ),
          child: ImageData(IconsPath.addFriend),
        )
      ]),
    );
  }

  Widget _discoverPeople() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Discover People',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black,
                  )),
              Text(
                'See All',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: List.generate(
                  10,
                  (index) => UserCard(
                        userId: '준님$index',
                        description: '준님e$index님이 팔로우합니다.',
                      )).toList(),
            )),
      ],
    );
  }

  Widget _tabMenu() {
    return TabBar(
        controller: tabController,
        indicatorColor: Colors.black,
        indicatorWeight: 1,
        tabs: [
          Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ImageData(IconsPath.gridViewOn)),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ImageData(IconsPath.myTagImageOff)),
        ]);
  }

  Widget _tabView() {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 100,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.grey,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          title: const Text(
            '개발하는준',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          actions: [
            GestureDetector(
                onTap: () {},
                child: ImageData(
                  IconsPath.uploadIcon,
                  width: 50,
                )),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ImageData(
                  IconsPath.menuIcon,
                  width: 50,
                ),
              ),
            )
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _information(),
            _menu(),
            _discoverPeople(),
            const SizedBox(height: 20),
            _tabMenu(),
            _tabView(),
          ],
        ),
      ),
    );
  }
}
