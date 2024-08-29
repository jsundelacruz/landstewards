enum GoalFilterTypes {
  Playful,
  Bold,
  Futuristic,
  Kind,
  Creative,
  Empath,
  Thoughtful,
  Clever,
  Positive,
  Curious,
  Adventurous
}

class GoalFilterController {
  Set<GoalFilterTypes> selectedFilters = {};

  void setFilters(List<String> filters) {
    selectedFilters =
        filters.map((filter) => GoalFilterTypes.values.firstWhere((element) => element.toString() == filter)).toSet();
  }

  void addFilter(GoalFilterTypes filter) {
    selectedFilters.add(filter);
  }

  void removeFilter(GoalFilterTypes filter) {
    selectedFilters.remove(filter);
  }

  List<String> getFilters() {
    return selectedFilters.map((filter) => filter.toString()).toList();
  }
}
