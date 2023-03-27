import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gl_tasks/appdata/appdata.dart';
import 'package:gl_tasks/riverpod.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  final ScrollController _controllerTask = ScrollController();
  final ScrollController _controllerStaff = ScrollController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // print('gsgbfdyb => width : $width , height : $height');

    double titleList = 15;
    double contentList = 12;

    AppData().getCardData();
    AppData().getOnGoingData();
    AppData().getStaffData();

    Widget homeTopCard() => SizedBox(
          width: width / 2,
          height: height / 5,
          child: Row(
            children: [
              ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: AppData.cardData.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Container(
                        width: width / 2 / 3 - 50,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: AppData.cardData[index]!['color'],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: RichText(
                              text: TextSpan(
                                  text: AppData.cardData[index]!['value']
                                      .toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 30),
                                  children: [
                                TextSpan(
                                    text:
                                        '\n ${AppData.cardData[index]!['title']}',
                                    style: const TextStyle(fontSize: 15))
                              ])),
                        ),
                      )),
            ],
          ),
        );

    Widget taskList() => Expanded(
          child: ListView.separated(
              controller: _controllerTask,
              scrollDirection: Axis.vertical,
              itemCount: AppData.onGoingData.length,
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) => SizedBox(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Checkbox(
                            shape: const CircleBorder(),
                            value: false,
                            onChanged: (_) {}),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: SizedBox(
                              width: width / 2 - (width / 6) - 100,
                              child: RichText(
                                  text: TextSpan(
                                      text:
                                          AppData.onGoingData[index]!['title'],
                                      style: TextStyle(
                                          color: const Color(0xFF526185),
                                          fontWeight: FontWeight.w600,
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: titleList),
                                      children: [
                                    TextSpan(
                                        text:
                                            '\n ${AppData.onGoingData[index]!['date']}',
                                        style: TextStyle(
                                            color: const Color(0xFF7995B7),
                                            fontWeight: FontWeight.w100,
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: contentList))
                                  ])),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Container(
                              margin: const EdgeInsets.only(top: 4),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 1),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  color: AppData.onGoingData[index]!['color']
                                      .withOpacity(0.5)),
                              child: Text(
                                AppData.onGoingData[index]!['progress'],
                                style: TextStyle(
                                    fontSize: 10,
                                    overflow: TextOverflow.ellipsis,
                                    color:
                                        AppData.onGoingData[index]!['color']),
                              )),
                        )
                      ],
                    ),
                  ),
              separatorBuilder: (context, index) => const Divider(
                    thickness: 0.1,
                    color: Colors.black38,
                  )),
        );

    Widget staffList() => Expanded(
          child: ListView.separated(
              controller: _controllerStaff,
              scrollDirection: Axis.vertical,
              itemCount: AppData.staffData.length,
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) => SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage:
                                  AppData.staffData[index]!['image'] != ''
                                      ? AssetImage(
                                          AppData.staffData[index]!['image'])
                                      : null,
                              backgroundColor:
                                  AppData.staffData[index]!['color'],
                              child: AppData.staffData[index]!['image'] == ''
                                  ? Text(AppData.staffData[index]!['code'],
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300))
                                  : null,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: SizedBox(
                                width: width / 2 - (width / 6) - 100,
                                child: RichText(
                                    text: TextSpan(
                                        text: AppData.staffData[index]!['name'],
                                        style: TextStyle(
                                            color: const Color(0xFF526185),
                                            fontWeight: FontWeight.w600,
                                            fontSize: titleList),
                                        children: [
                                      TextSpan(
                                          text:
                                              '\n ${AppData.staffData[index]!['job']}',
                                          style: TextStyle(
                                              color: const Color(0xFF7995B7),
                                              fontWeight: FontWeight.w100,
                                              fontSize: contentList))
                                    ])),
                              ),
                            ),
                          ],
                        ),
                        Flexible(
                          child: Container(
                              margin: const EdgeInsets.only(top: 10),
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  color: Color(0xFFE9EFF6)),
                              child: Text(
                                AppData.staffData[index]!['task'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Color(0xFF526185)),
                              )),
                        )
                      ],
                    ),
                  ),
              separatorBuilder: (context, index) => const Divider(
                    thickness: 0.1,
                    color: Colors.black38,
                  )),
        );

    Widget boxOne() => Padding(
          padding: const EdgeInsets.all(30),
          child: SizedBox(
            width: width / 2 - 60,
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Hello GetLead',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Image.asset(
                              'assets/emoji.png',
                              height: 24,
                              width: 24,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      homeTopCard(),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Ongoing tasks',
                    style: TextStyle(
                        color: Color(0xFF526185),
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                ),
                taskList()
              ],
            ),
          ),
        );

    Widget boxTwo() => Padding(
          padding: const EdgeInsets.all(30),
          child: SizedBox(
            width: width / 2 - 60,
            height: height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Flexible(
                          flex: 2,
                          child: Text(
                            'Staffwise analytics',
                            style: TextStyle(
                                color: Color(0xFF526185),
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            'Due Tasks',
                            style: TextStyle(
                                color: Color(0xFFF15623),
                                fontWeight: FontWeight.w200,
                                fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  staffList()
                ],
              ),
            ),
          ),
        );

    return Scaffold(
        // appBar: AppBar(title: const Text('Demo')),
        // body: Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [boxOne(), boxTwo()],
        // ),
        body: Consumer(builder: (_, ref, __) {
      final data = ref.watch(testProvider);
      return Column(
        children: [
          const SizedBox(height: 50),
          IconButton(
              onPressed: () => data.addToList('index'),
              icon: const Icon(Icons.add)),
          Expanded(
            child: ListView.builder(
                itemCount: data.testList.length,
                itemBuilder: (context, index) {
                  return ListTile(title: Text(data.testList[index]));
                }),
          )
        ],
      );
    }));
  }
}
