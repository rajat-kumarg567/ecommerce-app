import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:intl/intl.dart';

import '../componants/cart_item.dart';


class Restaurant extends ChangeNotifier{
  final List<Food> _menu=[
    //List for burger


    Food(
        name: "CheeseBurger",
        description: "A hamburger with cheese added",
        imagePath: "lib/images/burgers/amirali-mirhashemian-88YAXjnpvrM-unsplash.jpg",
        price: 8.99,
        category: FoodCategory.burgers,
        availableAddons:[
          Addon(name: "Extra Cheese", price: 0.99),
          Addon(name: "Baccon", price: 1.49),
          Addon(name: "Avacado", price: 1.99),
        ]
    ),
    Food(
        name: "Veggie burger",
        description: "A burger made with plant-based ingredients like beans, lentils, mushrooms, or vegetables",
        imagePath: "lib/images/burgers/amirali-mirhashemian-j-MPEwH9LM4-unsplash.jpg",
        price: 10.88,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "grilled onion", price: 0.99),
          Addon(name: "Extra BBQ sauce", price: 1.49),
          Addon(name: "jalepenos", price: 1.49),
        ]),
    Food(
        name: "Rice burger",
        description: "A burger made with compressed rice cakes instead of hamburger buns",
        imagePath: "lib/images/burgers/amirali-mirhashemian-JqnuWlHmDfE-unsplash.jpg",
        price: 9.49, category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "grilled onion", price: 0.99),
          Addon(name: "Extra BBQ sauce", price: 1.49),
          Addon(name: "Grilled Mushrooms", price: 1.49),
        ]),
    Food(
        name: "Wild salmon burger",
        description: "A light, tender, and moist burger made from salmon, which is a popular fish because of its health benefits",
        imagePath: "lib/images/burgers/food-photographer-E94j3rMcxlw-unsplash.jpg",
        price: 11.10,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "grilled onion", price: 0.99),
          Addon(name: "Fried egg ", price: 1.49),
          Addon(name: "Spicy Mayo", price: 1.49),

        ]),
    Food(
        name: "Afghani burger",
        description: "An Afghan fast food wrap made from Afghan bread rolled around french fries, along with chutney and other condiments, vegetables, and often sausages or other meat",
        imagePath: "lib/images/burgers/mae-mu-I7A_pHLcQK8-unsplash.jpg",
        price: 8.49,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "grilled onion", price: 0.99),
          Addon(name: "Fried egg ", price: 1.49),
          Addon(name: "Spicy Mayo", price: 1.49),
        ]),

    //list for salads
    Food(
        name: "French green bean salad",
        description: "A salad with warm goat cheese",
        imagePath: "lib/images/salads/adam-bartoszewicz-MaqdFCtH8Oo-unsplash.jpg",
        price: 9.99,
        category: FoodCategory.salads,
        availableAddons: [
          Addon(name: "Avocado", price: 0.99),
          Addon(name: "Feta Cheese", price: 1.49),
          Addon(name: "Grilled Cheese", price: 1.49)
        ]),
    Food(
        name: "Fruit salad",
        description: "A popular party and holiday fare in the Philippines, often made with young coconut, condensed milk, and other canned or fresh fruit",
        imagePath: "lib/images/salads/israel-pina-xxnkDPKS5_c-unsplash.jpg",
        price: 8.9,
        category: FoodCategory.salads,
        availableAddons: [
          Addon(name: "Avocado", price: 0.99),
          Addon(name: "Feta Cheese", price: 1.49),
          Addon(name: "Extra parmesan", price: 1.49)

        ]),
    Food(
        name: "Garden salad",
        description: "A platter of lettuce, beetroot, cucumber, scallions, cherry tomatoes, olives, sun-dried tomatoes, and feta",
        imagePath: "lib/images/salads/kim-ick-gZI8z-6LxMo-unsplash.jpg",
        price: 10.9,
        category: FoodCategory.salads,
        availableAddons: [
          Addon(name: "Avocado", price: 0.99),
          Addon(name: "Feta Cheese", price: 1.49),
          Addon(name: "Extra parmesan", price: 1.49)

        ]),
    Food(
        name: "Chicken salad",
        description: " A classic chicken salad",
        imagePath: "lib/images/salads/pavel-subbotin-V2En058dQ_8-unsplash.jpg",
        price: 12.9,
        category: FoodCategory.salads,
        availableAddons: [
          Addon(name: "Avocado", price: 0.99),
          Addon(name: "Almond Sliver ", price: 1.49),
          Addon(name: "Mandarin Oranges ", price: 1.49)
        ]),
    Food(
        name: "Vegetables",
        description: "Lettuce, tomatoes, cucumbers, radishes, beetroot, scallions, and more ",
        imagePath: "lib/images/salads/vita-marija-murenaite-gNfZVRZOdlY-unsplash.jpg",
        price: 15,
        category: FoodCategory.salads,
        availableAddons: [
          Addon(name: "Avocado", price: 0.99),
          Addon(name: "Feta Cheese", price: 1.49),
          Addon(name: "Extra parmesan", price: 1.49)
        ]),

    //list for desserts
    Food(
        name: "Black Forest Cake",
        description: "A frothy cake made with chocolate cake, cherry syrup, whipped cream, and cherries",
        imagePath: "lib/images/desserts/abhishek-hajare-8c7TLVqzLbE-unsplash.jpg",
        price: 15,
        category: FoodCategory.desserts,
        availableAddons: [
          Addon(name: "vanilla ice cream", price: 0.49),
          Addon(name: "Caramel Sauce", price: 1.49),
          Addon(name: "Cinnamon spice", price: 1.49),
        ]),
    Food(
        name: "Cardamom Buns",
        description: "Aromatic buns that are part of the Swedish coffee break",
        imagePath: "lib/images/desserts/abhishek-hajare-lJfeBZCleqc-unsplash.jpg",
        price: 9.10,
        category: FoodCategory.desserts,
        availableAddons: [
          Addon(name: "vanilla ice cream", price: 0.49),
          Addon(name: "Caramel Sauce", price: 1.49),
          Addon(name: "Cinnamon spice", price: 1.49),
        ]),
    Food(
        name: "Baklava",
        description: "A pastry made with layers of filo, nuts, syrup, or honey",
        imagePath: "lib/images/desserts/imad-786-Ff_gCH3HvCc-unsplash.jpg",
        price: 8,
        category: FoodCategory.desserts,
        availableAddons: [
          Addon(name: "vanilla ice cream", price: 0.49),
          Addon(name: "Caramel Sauce", price: 1.49),
          Addon(name: "Cinnamon spice", price: 1.49),
        ]),
    Food(
        name: "Sohan halwa",
        description: " A halva made with corn flour, ghee, and dry fruit",
        imagePath: "lib/images/desserts/serghei-savchiuc-kAajTkiUQ74-unsplash.jpg",
        price: 10,
        category: FoodCategory.desserts,
        availableAddons: [
          Addon(name: "vanilla ice cream", price: 0.49),
          Addon(name: "Caramel Sauce", price: 1.49),
          Addon(name: "Cinnamon spice", price: 1.49),
        ]),
    Food(
        name: "Singori",
        description: "A milk-based dessert made with khoa, coconut, and molu leaf",
        imagePath: "lib/images/desserts/tim-bish-XZq-m5XwIw4-unsplash.jpg",
        price: 11,
        category: FoodCategory.desserts,
        availableAddons: [
          Addon(name: "vanilla ice cream", price: 0.49),
          Addon(name: "Caramel Sauce", price: 1.49),
          Addon(name: "Cinnamon spice", price: 1.49),
        ]),

    //list for drinks
    Food(
        name: "Coca-Cola",
        description: "A classic American soda invented in 1886 as a headache remedy ",
        imagePath: "lib/images/drinks/brooke-lark-HjWzkqW1dgI-unsplash.jpg",
        price: 5,
        category: FoodCategory.drinks,
        availableAddons: [
          Addon(name: "strawberry flavour", price: 0.49),
          Addon(name: "Ginger jest", price: 1.49),
          Addon(name: "Mint leaves", price: 1.49),
        ]),
    Food(
        name: "Pastis",
        description:" A potent French drink with licorice, floral, and herbal qualities",
        imagePath: "lib/images/drinks/patrick-schopflin-Ebsvxw5aTK8-unsplash.jpg",
        price: 6,
        category: FoodCategory.drinks,
        availableAddons: [
          Addon(name: "strawberry flavour", price: 0.49),
          Addon(name: "Ginger jest", price: 1.49),
          Addon(name: "Mint leaves", price: 1.49),
        ]),
    Food(
        name: "Aam panna",
        description: "An Indian drink made from raw mango",
        imagePath: "lib/images/drinks/roman-kraft-i-IFVE1qXGQ-unsplash.jpg",
        price: 3,
        category: FoodCategory.drinks,
        availableAddons: [
          Addon(name: "strawberry flavour", price: 0.49),
          Addon(name: "Ginger jest", price: 1.49),
          Addon(name: "Mint leaves", price: 1.49),
        ]),
    Food(
        name: "Sake",
        description: " A Japanese rice wine that is stronger than wine but weaker than vodka",
        imagePath: "lib/images/drinks/toa-heftiba-yFLd5x6vfYM-unsplash.jpg",
        price: 7,
        category: FoodCategory.drinks,
        availableAddons: [
          Addon(name: "strawberry flavour", price: 0.49),
          Addon(name: "Ginger jest", price: 1.49),
          Addon(name: "Mint leaves", price: 1.49),
        ]),
    Food(
        name: "Sangria",
        description: "A Spanish drink made with red wine and fruit",
        imagePath: "lib/images/drinks/tomasz-rynkiewicz-VEjN2jMxf0A-unsplash.jpg",
        price: 4,
        category: FoodCategory.drinks,
        availableAddons: [
          Addon(name: "strawberry flavour", price: 0.49),
          Addon(name: "Ginger jest", price: 1.49),
          Addon(name: "Mint leaves", price: 1.49),
        ]),

    //list for sides
    Food(
        name: "Radish leaves",
        description: " Sometimes used in recipes, like potato soup or as a sauteed side dish ",
        imagePath: "lib/images/sides/alex-munsell-auIbTAcSH6E-unsplash.jpg",
        price: 2,
        category: FoodCategory.sides,
        availableAddons: [
          Addon(name: "Ranch dip", price: 0.49),
          Addon(name: "Spicy mayo", price: 1.49),
          Addon(name: "Parmesan Dust", price: 1.49)
        ]),
    Food(
        name: "Brsi",
        description:" Most commonly served thinly sliced at the start of main meals, or else as a side dish with fondues",
        imagePath: "lib/images/sides/anda-ambrosini-AlwIBbFJaX8-unsplash.jpg",
        price: 4,
        category: FoodCategory.sides,
        availableAddons: [
          Addon(name: "Ranch dip", price: 0.49),
          Addon(name: "Spicy mayo", price: 1.49),
          Addon(name: "Parmesan Dust", price: 1.49)
        ]),
    Food(
        name: "Baked beans",
        description: " A side dish",
        imagePath: "lib/images/sides/joanna-kosinska-eVQBXxeCre4-unsplash.jpg",
        price: 6,
        category: FoodCategory.sides,
        availableAddons: [
          Addon(name: "Ranch dip", price: 0.49),
          Addon(name: "Spicy mayo", price: 1.49),
          Addon(name: "Parmesan Dust", price: 1.49)
        ]),
    Food(
        name: "Cauliflower",
        description: " A side dish ",
        imagePath: "lib/images/sides/katherine-chase-0DtoVEDaJbs-unsplash.jpg",
        price: 8,
        category: FoodCategory.sides,
        availableAddons: [
          Addon(name: "Ranch dip", price: 0.49),
          Addon(name: "Spicy mayo", price: 1.49),
          Addon(name: "Parmesan Dust", price: 1.49)
        ]),
    Food(
        name: "Coleslaw",
        description: "A sides dish",
        imagePath: "lib/images/sides/tiago-faifa-NXDr9mDZ3cw-unsplash.jpg",
        price: 3,
        category: FoodCategory.sides,
        availableAddons: [
          Addon(name: "Ranch dip", price: 0.49),
          Addon(name: "Spicy mayo", price: 1.49),
          Addon(name: "Parmesan Dust", price: 1.49)
        ]),
  ];
  //Getters
  List<Food> get menu=>_menu;
  List<cartItem> get cart=>_cart;

  //user cart
 final List<cartItem> _cart=[];

 //add to cart
 void addToCart(Food food,List<Addon> selectedAddons){
   //see if there is a cart already with the same food and selected addons
   cartItem? cartitem =_cart.firstWhereOrNull((item){
     //check if the food item are the same
     bool isSameFood=item.food==food;
     //check if the same selected Addon
     bool isSameAddon=ListEquality().equals(item.selectedAddons, selectedAddons);

     return isSameFood && isSameAddon;

   });
   // if items are already exists,than increase the quantity
   if(cartitem!=null){
     cartitem.quantity++;
   }
   //otherwise add a new cart
   else{
     _cart.add(cartItem(
         food: food,
         selectedAddons: selectedAddons));
   }
   notifyListeners();
 }
  //remove from cart
  void removeFromCart(cartItem cartitem){
   int cartIndex=_cart.indexOf(cartitem);
   if(cartIndex!=-1){
     if(_cart[cartIndex].quantity>1){
       _cart[cartIndex].quantity--;
     }else{
       _cart.removeAt(cartIndex);
     }
     notifyListeners();
   }
  }

  //get the total price
  double getTotalPrice(){
   double total=0.0;
   for(cartItem cartitem in _cart){
     double itemTotal=cartitem.food.price;
     for(Addon addon in cartitem.selectedAddons){
       itemTotal+=addon.price;
     }
     total+=itemTotal*cartitem.quantity;
   }
   return total;
  }
  // get total number of item
int getTotalItemCount(){
   int totalItemCount=0;
   for(cartItem cartitem in _cart){
     totalItemCount+=cartitem.quantity;
   }
   return totalItemCount;
}

//clear cart
void clearCart(){
   _cart.clear();
   notifyListeners();
}

//generate receipt
String displayCartReceipt(){
   final receipt=StringBuffer();
   receipt.writeln("here's your receipt.");
   receipt.writeln();

   //format to include up to date
  String formatToDate=DateFormat('yyyy-MM-dd:mm:ss').format(DateTime.now());
  receipt.writeln(formatToDate);
  receipt.writeln();
  receipt.writeln("------------");

  for(final cartitem in _cart){
    receipt.writeln(
      "${cartitem.quantity}*${cartitem.food.name}-${_formatPrice(cartitem.food.price)}"
    );
    if(cartitem.selectedAddons.isNotEmpty){
      receipt.writeln(
        "     Add-ons: ${_formatAddon(cartitem.selectedAddons)}"
      );
    }
    receipt.writeln();
  }

   receipt.writeln("------------");
   receipt.writeln();
   receipt.writeln("total item: ${getTotalItemCount()}");
   receipt.writeln("total price: ${_formatPrice(getTotalPrice())}");

return receipt.toString();
}

  //format double value into money
String _formatPrice(double price){
  return "\$${price.toStringAsFixed(2)}";
}

//format list of Addon into a String summary
String _formatAddon(List<Addon> addons){
   return addons.
  map((addon)=>"${addon.name}(${_formatPrice(addon.price)})").join(",");
}



}