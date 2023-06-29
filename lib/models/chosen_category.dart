class ChosenCategory {

  static dynamic chosenCategory = 'random';
  // I gave it broken default value for easier debugging

  static void setCategory (dynamic category) => chosenCategory = category;

  static dynamic getCategory () => chosenCategory;



}

// I unwillingly used encapsulation there bc
// I couldn't find a way use the static variable globally without that
// Now i can use it in WordEngine or wherever i want (i think)
// but it's seems better now !