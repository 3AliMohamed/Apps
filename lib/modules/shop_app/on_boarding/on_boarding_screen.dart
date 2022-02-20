import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:udemy_flutter/modules/shop_app/login/shop_login_screen.dart';
import 'package:udemy_flutter/shared/components/componants.dart';
import 'package:udemy_flutter/shared/styles/colors.dart';
class boardingModel{
  final String image;
  final String title;
  final String body;

  boardingModel({
    @required this.image,
    @required this.title,
    @required this.body,
});

}
class onBoardingScreen extends StatefulWidget {
  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  List<boardingModel> boarding= [
    boardingModel(
        image: 'assets/images/onboard.jpg', title: 'onBoarding title 1', body: 'onboarding body 1'),
    boardingModel(
        image: 'assets/images/onboard.jpg', title: 'onBoarding title 2', body: 'onboarding body 2'),
  boardingModel(
        image: 'assets/images/onboard.jpg', title: 'onBoarding title 3', body: 'onboarding body 3'),
  ];

  var boardController =PageController();
  bool isLast=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions:
        [
          TextButton(
              onPressed: (){
                navigateAndFinish(context, ShopLoginScreen());
                },
              child: Text('Skip'),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children:
          [
            Expanded(
              child: PageView.builder(
                onPageChanged: (index)
                {
                  if(index==boarding.length-1) {
                    setState(() {
                      isLast = true;
                    });
                  }
                  else
                    {
                      setState(() {
                        isLast=false;
                      });
                    }
                },
                physics: BouncingScrollPhysics(),
                controller: boardController,
                itemBuilder: (context, index) => buildBoardingItem(boarding[index]),
              itemCount: boarding.length,
              ),
            ),
            Row(
              children:
              [
                SmoothPageIndicator(
                    controller: boardController ,
                    count: boarding.length,
                    effect: ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      activeDotColor: defaultColor,
                      dotHeight: 10.0,
                      dotWidth: 10.0,
                      expansionFactor: 4.0,
                      spacing: 5,
                    ),
                ),
                Spacer(),
                FloatingActionButton(
                    child: Icon(Icons.arrow_forward_ios_outlined),
                    onPressed: (){
                      if(isLast)
                        {
                          navigateAndFinish(context, ShopLoginScreen());
                        }
                      else
                        {
                          boardController.nextPage(
                              duration: Duration(milliseconds: 750),
                              curve: Curves.fastLinearToSlowEaseIn);
                        }
                    }
                )
              ],
            ),

          ],
        ),
      )
    );
  }

  Widget buildBoardingItem(boardingModel model)=> Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image(
          image: AssetImage('${model.image}')),
      SizedBox(height: 30,),
      Text(
          '${model.title}',
        style: TextStyle(fontSize: 24.0),
      ),
      SizedBox(height: 15.0),
      Text(
          '${model.body}'
      ),
    ],
  );
}
