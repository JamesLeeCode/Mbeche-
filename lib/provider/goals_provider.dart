import 'package:flutter/material.dart';
import 'package:wallet_ui_kit/data/models/my_goals_model.dart';
import 'package:wallet_ui_kit/data/repository/goals_repo.dart';

class GoalsProvider extends ChangeNotifier {
  final GoalsRepo goalsRepo;
  GoalsProvider({@required this.goalsRepo});

  List<MyGoalsModel> getGoalsList() {
    return goalsRepo.getGoalsList();
  }
}