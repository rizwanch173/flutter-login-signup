import 'package:flutter/material.dart';
import 'package:new_app/pages/Splash_Screen/Splash_Screen.dart';
import 'package:new_app/widgets/customWidgets.dart';

class Routes {
  static dynamic route() {
    return {
      'SplashPage': (BuildContext context) => SplashScreen(),
    };
  }

  static Route onGenerateRoute(RouteSettings settings) {
    final List<String> pathElements = settings.name.split('/');
    print("pathElements");
    if (pathElements[0] != '' || pathElements.length == 1) {
      return null;
    }
    // switch (pathElements[1]) {
    //   case "ComposeTweetPage":
    //     bool isRetweet = false;
    //     bool isTweet = false;
    //     if (pathElements.length == 3 && pathElements[2].contains('retweet')) {
    //       isRetweet = true;
    //     } else if (pathElements.length == 3 &&
    //         pathElements[2].contains('tweet')) {
    //       isTweet = true;
    //     }
    //     return CustomRoute<bool>(
    //         builder: (BuildContext context) =>
    //             ChangeNotifierProvider<ComposeTweetState>(
    //               create: (_) => ComposeTweetState(),
    //               child:
    //                   ComposeTweetPage(isRetweet: isRetweet, isTweet: isTweet),
    //             ));
    //   case "FeedPostDetail":
    //     var postId = pathElements[2];
    //     return SlideLeftRoute<bool>(
    //         builder: (BuildContext context) => FeedPostDetail(
    //               postId: postId,
    //             ),
    //         settings: RouteSettings(name: 'FeedPostDetail'));
    //   case "ProfilePage":
    //     String profileId;
    //     if (pathElements.length > 2) {
    //       profileId = pathElements[2];
    //     }
    //     return CustomRoute<bool>(
    //         builder: (BuildContext context) => ProfilePage(
    //               profileId: profileId,
    //             ));
    //
    //   default:
    //     return onUnknownRoute(RouteSettings(name: '/Feature'));
    // }
  }

  static Route onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: customTitleText(settings.name.split('/')[1]),
          centerTitle: true,
        ),
        body: Center(
          child: Text('${settings.name.split('/')[1]} Comming soon..'),
        ),
      ),
    );
  }
}
