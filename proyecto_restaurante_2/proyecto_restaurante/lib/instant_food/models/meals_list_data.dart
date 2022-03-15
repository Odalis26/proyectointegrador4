class MealsListData {
  MealsListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.startColor = '',
    this.endColor = '',
    //this.//meals,
    this.kacl = 0,
  });

  String imagePath;
  String titleTxt;
  String startColor;
  String endColor;
  //List<String>? //meals;
  int kacl;

  static List<MealsListData> tabIconsList = <MealsListData>[
    MealsListData(
      imagePath: 'assets/fitness_app/breakfast.png',
      titleTxt: '',
      startColor: '#2a110e',
      endColor: '#00beeb',
    ),
    MealsListData(
      imagePath: 'assets/fitness_app/lunch.png',
      titleTxt: '',

      //meals: <String>['Salmon,', 'Mixed veggies,', 'Avocado'],
      startColor: '#000000',
      endColor: '#5C5EDD',
    ),
    MealsListData(
      imagePath: 'assets/fitness_app/snack.png',
      titleTxt: '',

      //meals: <String>['Recommend:', '800 kcal'],
      startColor: '#000000',
      endColor: '#FF5287',
    ),
    MealsListData(
      imagePath: 'assets/fitness_app/dinner.png',
      titleTxt: 'Dinner',

      //meals: <String>['Recommend:', '703 kcal'],
      startColor: '#000000',
      endColor: '#1E1466',
    ),
  ];
}
