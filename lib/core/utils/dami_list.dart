class DamiList {
  static List<Map<String, String>> bannerImagesList = [
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1678669701650-46851754bcef?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80',
      'linkUrl': 'https://example.com/link1',
    },
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1678872537245-296b738873ad?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',
      'linkUrl': 'https://example.com/link2',
    },
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1678846912726-667eda5a850f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      'linkUrl': 'https://example.com/link3',
    },
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1678846912726-667eda5a850f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      'linkUrl': 'https://example.com/link4',
    },
  ];


 static  List<InformationModel> informationItems = [
    InformationModel(id: 1, name: "Fish harvesting information",des:"Fish harvesting information dami data "),
    InformationModel(id: 2, name: "Concern about fish ",des:"Concern about fish dami data "),
    InformationModel(id: 3, name: "Specific Fish with food ",des:"Specific Fish with food  dami data "),
    InformationModel(id: 4, name: "Weather information'",des:"Weather information dami data "),
    InformationModel(id: 5, name: "Custom fish harvesting",des:"Custom fish harvesting dami data "),
    InformationModel(id: 6, name: "Fish size with food info",des:"Fish size with food info dami data "),
    InformationModel(id: 7, name: "Fish information",des:"Fish information dami data "),
    InformationModel(id: 8, name: "General fish harvesting",des:"General fish harvesting dami data "),
  ];


  static String damiText1 =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. " +
          "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s," +
          "when an unknown printer took a galley of type and scrambled it to make a type " +
          "specimen book. It has survived not only five centuries, " +
          "but also the leap into electronic typesetting, remaining essentially unchanged." +
          "It was popularised in the 1960s with the release of Letraset sheets containing" +
          "Lorem Ipsum passages, and more recently with desktop publishing software " +
          "like Aldus PageMaker including versions of Lorem Ipsum.";

  static String damiText2 = "Contrary to popular belief, Lorem Ipsum is not simply random text." +
      " It has roots in a piece of classical Latin literature from 45 BC, making it over " +
      "2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia," +
      "looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, " +
      " and going through the cites of the word in classical literature, " +
      "discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 " +
      "and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) " +
      "by Cicero, written in 45 BC. This book is a treatise on the theory of ethics," +
      " very popular during the Renaissance. The first line of Lorem Ipsum, " +
      "Lorem ipsum dolor sit amet, comes from a line in section 1.10.32.";
}

class InformationModel {
  int? id;
  String? name;
  String? des;
  InformationModel(
      {  this.id,
         this.name,
        this.des,
      });

}


