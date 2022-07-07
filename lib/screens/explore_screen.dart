import 'package:flutter/material.dart';
import '../components/components.dart';
import '../models/models.dart';
import '../api/mock_fooderlich_service.dart';


class ExploreScreen extends StatelessWidget {
  final mockService = MockFooderlichService();
   ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //todo: add today recipe listview future builder

    return FutureBuilder(
      future: mockService.getExploreData(),
      builder: (context, AsyncSnapshot<ExploreData> snapShot){

       if(snapShot.connectionState == ConnectionState.done){
         final recipes = snapShot.data?.todayRecipes ?? [];
         //todo: replace this with todayrecipelistview
         return ListView(
          scrollDirection: Axis.vertical,
           children: [
             TodayRecipeListView(recipes: snapShot.data?.todayRecipes ?? []),
             const SizedBox(height: 16,),
             //todo:replace with friendlistview
            FriendPostListView(friendPosts: snapShot.data?.friendPosts ?? [])
           ],
         );

       }else{
         return const Center(
           child: CircularProgressIndicator(),
         );
       }
      },
    );
  }
}
