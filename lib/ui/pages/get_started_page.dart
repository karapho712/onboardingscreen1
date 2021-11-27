import 'package:apptest2/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../models/started_page_model.dart';
import '../widgets/custom_button.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  int currentIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(24),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          contents[i].image,
                          height: 200,
                          width: 200,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          contents[i].title,
                          style: blackTextStyle.copyWith(
                            fontSize: 35,
                            fontWeight: bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          contents[i].discription,
                          maxLines: 3,
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.center,
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            color: kBlackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            // color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(contents.length, (index) => lineDot(index, context)),
            ),
          ),
          Container(
            child: CustomButton(
              title: currentIndex == contents.length - 1 ? "Continue" : "Next",
              width: 220,
              margin: EdgeInsets.only(top: 50, bottom: 80),
              onPressed: () {
                if (currentIndex == contents.length - 1) {
                  print('NEXT PAGE/PRIVIEW/SCAFFOLD');
                }

                _controller!.nextPage(
                  duration: Duration(milliseconds: 100),
                  curve: Curves.bounceIn,
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Container lineDot(int index, BuildContext context) {
    return Container(
      height: 10,
      padding: EdgeInsets.only(top: 10),
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: kPrimaryColor,
      ),
      width: currentIndex == index ? 25 : 10,
    );
  }
}
