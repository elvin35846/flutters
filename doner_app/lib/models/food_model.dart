class FoodModel {
  final String name;
  final double price;
  final double weight;
  final double calory;
  final double protein;
  final String item;
  final String imgPath;

  FoodModel(
      {this.name,
      this.price,
      this.weight,
      this.calory,
      this.protein,
      this.item,
      this.imgPath});

  static List<FoodModel> list = [
    FoodModel(
        name: "Tacos Nanchas Choco",
        price: 120,
        weight: 130,
        calory: 460,
        protein: 30,
        item:
            "#Chicken #Juicy BBQ #Vegetables #Potato Wedges #Coleslaw Salad #Healthy",
        imgPath: "1.png"),
    FoodModel(
        name: "Porata Masala",
        price: 120,
        weight: 130,
        calory: 460,
        protein: 30,
        item:
            "#Chicken #Juicy BBQ #Vegetables #Potato Wedges #Coleslaw Salad #Healthy",
        imgPath: "2.png"),
    FoodModel(
        name: "Taco Kebab",
        price: 120,
        weight: 130,
        calory: 460,
        protein: 30,
        item:
            "#Chicken #Juicy BBQ #Vegetables #Potato Wedges #Coleslaw Salad #Healthy",
        imgPath: "3.png"),
    FoodModel(
        name: "Chiken Salad",
        price: 120,
        weight: 130,
        calory: 460,
        protein: 30,
        item:
            "#Chicken #Juicy BBQ #Vegetables #Potato Wedges #Coleslaw Salad #Healthy",
        imgPath: "4.png"),
    FoodModel(
        name: "Chiken Eggs",
        price: 120,
        weight: 130,
        calory: 460,
        protein: 30,
        item:
            "#Chicken #Juicy BBQ #Vegetables #Potato Wedges #Coleslaw Salad #Healthy",
        imgPath: "5.png")
  ];
}
