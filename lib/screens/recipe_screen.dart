import 'package:flutter/material.dart';
import '../models/models.dart';
import '../api/mock_fooderlich_service.dart';
import '../components/components.dart';

class RecipeScreen extends StatelessWidget {
  static final exploreService = MockFooderlichService();
  const RecipeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: exploreService.getRecipes(),
      builder: (context, AsyncSnapshot<List<SimpleRecipe>> snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          //todo: add grieview here
          return RecipeGridView(recipe: snapshot.data??[]);
        }else{
          return const  Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
}
