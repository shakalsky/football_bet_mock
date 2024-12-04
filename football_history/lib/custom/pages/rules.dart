import 'package:flutter/cupertino.dart';

class RulesPage extends StatelessWidget {
  const RulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Rules Page'),
      ),
      child: Column(
        children: [
          SizedBox(height: 50),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    Text(
                      'The Equipment & Gear Required To Play Football',
                      style: TextStyle(fontSize: 35, letterSpacing: 3),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Football involves a lot of running around the field with the ball which is why the players also don’t require sporting much gear to play the game. But here are a few essentials you’ll require whether you are a pro or just exploring your interest in sports. Have a look!',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Football Jersey',
                      style: TextStyle(fontSize: 25, letterSpacing: 3),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Buying a football jersey isn’t rocket science but it’s still better for the players to think through what they are buying. After all, the wrong jersey can impact a player’s performance negatively if it’s the wrong fit or lacks freedom of movement. The most important aspect of choosing a football jersey is that it fits your body correctly. You can wear the most advanced, high-tech jersey in the world, but if it’s too tight, or slides around on your body, it won’t do you any good.This TRAXIUM football shirt is designed for use in training and matches up to three times a week. With providing great freedom of movement, breaking resistance and moisture management it is perfect for easy dressing. What’s more? It dries quickly and imparts good air circulation to ensure you stay dry when you sprint.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Football Shorts',
                      style: TextStyle(fontSize: 25, letterSpacing: 3),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Football clothing has been purchased by a lot of people who love this ‘beautiful game’. You have your jersey you love but you need something to put on your waist too. Similarly, you want your shorts to provide you with easy and quick movement while not restricting your legs in any way since most of the action is done by those. No one wants to feel weighed down by their attire when they are running around playing football.To go with your football jersey, these Adult 3-in-1 Football Shorts Traxium are the ideal choice. Great for training, these match up to three times a week. The Inverted seams and soft fabric prevents chafing. The wide elasticated waistband with drawstring and close-fitting undershorts offers a great deal of stability.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Football Shoes',
                      style: TextStyle(fontSize: 25, letterSpacing: 3),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'You need to cover the foot to allow a player to run on a pitch and kick a ball. Trainers don’t quite cut it if you want to run fast without slipping on wet grass, and you want to turn quickly without skidding sideways. Studs on the base of football boots can help this. The hard buttons that protrude from the base of the shoe are shaped in such a way that they grip the ground each time a player takes a step, but the player can also move on quickly without having to consciously retract the boot from the ground.Designed for intermediate female footballers, these Football Boots Agility 500 FG have Versatile round studs that provide a good grip even on dry pitches. The insole comes with cushioning on the heel and the forefoot for fitting comfort.The Agility 900 Mesh MiD FG Men’s Football Boots are versatile enough to play on both grass and artificial dry pitches. With increased foot support using two lace loops on either side and an easy-to-put-on design using the 2-section liner with straps ensure the perfect fit.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Goalkeeping Gloves',
                      style: TextStyle(fontSize: 25, letterSpacing: 3),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'As one of the world\'s most hands-on sports, football players must keep their hands free of injury. With some players being more susceptible to hand injuries than others, gloves are a must for the goalkeepers in a football game.Skill players often wear gloves to help catch and hold onto the ball, whereas linemen usually wear gloves to protect themselves from bruising and scratching.These F500 Resist Gloves are designed for goalkeepers who have a good mastery of most technical skills (diving and catching). Effective and durable, they are developed with a palm covered with high-grade quality latex.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Sports Bags',
                      style: TextStyle(fontSize: 25, letterSpacing: 3),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Now that you’re sorted with your football essentials, you’ll need a bag to carry all of these to and fro training. The most important criteria when choosing a bag is to decide the size first. Everything else comes later. We have a few options for you that’ll keep you covered on the storing part of your football gears.This backpack with a separate boot pocket and laptop compartment, keeping the central compartment for your football kit is one of the most common choices. With adjustable volume from 25 to 27 litres, this cabin size bag has been cut in water-resistant fabric to protect your items from the weather.This 35-Litre Backpack is the epitome of style when it comes to carrying your football gear. With ​​9 pockets including 5 main pockets and 4 smaller ones, its durable fabric holds up well to everyday use. The shoulder straps and back are padded for extra comfort too.This Football Kitbag Away is a duffle bag that can also be converted into a backpack to make your trips around town easier. Looking for a bag with lots of compartments? This one is created with six pockets, including one for boots, one central pocket, and four for smaller items. It has a volume of 50 litres and is the perfect ally for your daily travels!',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Football Ball',
                      style: TextStyle(fontSize: 25, letterSpacing: 3),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Choosing a football ball sounds like a simple task until you discover the many options available. With different materials, sizes and types, purchasing a soccer ball can be daunting. Soccer balls come in four sizes, and the size best suited for you usually depends on your age.Size 1: Mini footballs or skill balls that are used to improve footworkSize 3: The smallest official ball and used during matches for children under the age of 8Size 4: This is used during matches for children between the ages of 8-12Size 5: The largest official ball and standard for all players above the age of 12‍ Here are a few options that’ll help you narrow down your choices. Check them out!With Lasting air retention Guaranteed to keep ball pressure for longer thanks to Butyl et Latex bladder, this size 4 ball is a good quality starter option. Learning to kick a ball and get it off the ground is not as easy as it looks which is why this ball is created 15% lighter than traditional balls.Size 5, this football ball is designed for footballers looking for an excellent balance between durability, comfort, and game experience. The F550 ball comes with a thicker outer material to increase the ball\'s lifespan. The 24-panel design also improves stability.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 55),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
