class ListaPlatosTerceroData {
  ListaPlatosTerceroData({
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

  static List<ListaPlatosTerceroData> tabIconsList = <ListaPlatosTerceroData>[
    ListaPlatosTerceroData(
      imagePath: 'assets/fitness_app/plato1.png',
      titleTxt: '',
      startColor: '#2a110e',
      endColor: '#00beeb',
    ),
    ListaPlatosTerceroData(
      imagePath: 'assets/fitness_app/glass.png',
      titleTxt: '',

      //meals: <String>['Salmon,', 'Mixed veggies,', 'Avocado'],
      startColor: '#000000',
      endColor: '#5C5EDD',
    ),
    ListaPlatosTerceroData(
      imagePath: 'assets/fitness_app/bell.png',
      titleTxt: '',

      //meals: <String>['Recommend:', '800 kcal'],
      startColor: '#000000',
      endColor: '#FF5287',
    ),
    ListaPlatosTerceroData(
      imagePath: 'assets/fitness_app/eaten.png',
      titleTxt: 'Dinner',

      //meals: <String>['Recommend:', '703 kcal'],
      startColor: '#000000',
      endColor: '#1E1466',
    ),
    ListaPlatosTerceroData(
      imagePath: 'assets/fitness_app/plato1.png',
      titleTxt: '',
      startColor: '#2a110e',
      endColor: '#00beeb',
    ),
    ListaPlatosTerceroData(
      imagePath: 'assets/fitness_app/glass.png',
      titleTxt: '',

      //meals: <String>['Salmon,', 'Mixed veggies,', 'Avocado'],
      startColor: '#000000',
      endColor: '#5C5EDD',
    ),
    ListaPlatosTerceroData(
      imagePath: 'assets/fitness_app/bell.png',
      titleTxt: '',

      //meals: <String>['Recommend:', '800 kcal'],
      startColor: '#000000',
      endColor: '#FF5287',
    ),
    ListaPlatosTerceroData(
      imagePath: 'assets/fitness_app/eaten.png',
      titleTxt: 'Dinner',

      //meals: <String>['Recommend:', '703 kcal'],
      startColor: '#000000',
      endColor: '#1E1466',
    ),
  ];
}
