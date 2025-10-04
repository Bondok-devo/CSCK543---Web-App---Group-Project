CREATE DATABASE  IF NOT EXISTS `Recipe_web_app` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `Recipe_web_app`;
-- MySQL dump 10.13  Distrib 8.0.43, for macos15 (arm64)
--
-- Host: localhost    Database: Recipe_web_app
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (3,'Brunch'),(8,'Dairy-free'),(2,'Dessert'),(6,'Egg-free'),(9,'Gluten-free'),(1,'Main'),(7,'Nut-free'),(10,'Side Dish'),(5,'Vegan'),(4,'Vegetarian');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favourites`
--

DROP TABLE IF EXISTS `favourites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favourites` (
  `user_id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`user_id`,`recipe_id`),
  KEY `recipe_id` (`recipe_id`),
  CONSTRAINT `fk_fav_recipe` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_fav_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favourites`
--

LOCK TABLES `favourites` WRITE;
/*!40000 ALTER TABLE `favourites` DISABLE KEYS */;
INSERT INTO `favourites` VALUES (2,1,'2025-10-04 18:12:14'),(2,3,'2025-10-04 18:46:16');
/*!40000 ALTER TABLE `favourites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES (73,'Alfonso mango pulp'),(9,'antipasti marinated mushrooms'),(21,'baking powder'),(13,'balsamic vinegar'),(50,'basmati rice'),(10,'bay leaves'),(15,'black pepper'),(46,'boneless lamb tenderloin or leg'),(64,'brown sugar'),(62,'butter'),(20,'caster sugar'),(82,'celery salt'),(8,'chopped tomatoes'),(43,'coriander leaves and stalks'),(29,'courgette'),(52,'couscous'),(72,'cream cheese'),(67,'digestive biscuits'),(47,'double cream'),(32,'dried chilli flakes'),(54,'dried cranberries'),(77,'dried mint'),(11,'dried oregano'),(17,'dried spaghetti'),(12,'dried thyme'),(31,'extra virgin olive oil'),(38,'finely grated garlic'),(37,'finely grated ginger'),(65,'flaked almonds'),(57,'flatleaf parsley'),(61,'free-range eggs'),(16,'fresh basil leaves'),(48,'full-fat milk'),(27,'full-fat plain yoghurt'),(5,'garlic cloves'),(83,'garlic granules'),(79,'garlic oil'),(68,'granulated sugar'),(33,'grated mozzarella or cheddar'),(36,'Greek or natural yoghurt'),(45,'green chillies'),(69,'ground cardamom'),(41,'ground cardamom seeds'),(81,'ground coriander'),(40,'ground cumin'),(66,'icing sugar'),(39,'Kashmiri red chilli powder'),(6,'lean minced beef'),(75,'lemon juice'),(42,'lime'),(60,'milk'),(44,'mint leaves'),(1,'olive oil'),(4,'onions'),(78,'oyster mushrooms'),(18,'parmesan'),(34,'passata sauce'),(87,'pickled chillies'),(55,'pine nuts'),(63,'plums'),(51,'pomegranate seeds'),(71,'powdered gelatine'),(53,'preserved lemons'),(30,'red onion'),(7,'red wine'),(58,'red wine vinegar'),(59,'rocket leaves'),(74,'rose harissa'),(49,'saffron strands'),(22,'sea salt'),(26,'self-raising brown or wholemeal flour'),(19,'self-raising flour'),(85,'small white cabbage'),(3,'smoked streaky bacon'),(23,'soya milk or almond milk'),(14,'sun-dried tomato halves'),(2,'sun-dried tomato oil'),(25,'sunflower oil'),(80,'sweet paprika'),(86,'tomatoes'),(70,'unsalted butter'),(56,'unsalted shelled pistachio nuts'),(24,'vanilla extract'),(35,'vegetable oil'),(84,'white pitta breads'),(76,'white wine vinegar'),(28,'yellow or orange pepper');
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ratings` (
  `user_id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `overall` tinyint(4) NOT NULL CHECK (`overall` between 1 and 5),
  `taste` tinyint(4) DEFAULT NULL CHECK (`taste` between 1 and 5),
  `aesthetics` tinyint(4) DEFAULT NULL CHECK (`aesthetics` between 1 and 5),
  `difficulty_score` tinyint(4) DEFAULT NULL CHECK (`difficulty_score` between 1 and 5),
  PRIMARY KEY (`user_id`,`recipe_id`),
  KEY `recipe_id` (`recipe_id`),
  CONSTRAINT `fk_rating_recipe` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rating_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` VALUES (1,1,5,5,4,2),(1,4,4,5,4,2),(2,2,5,NULL,NULL,NULL),(2,4,1,NULL,NULL,NULL),(2,5,5,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_categories`
--

DROP TABLE IF EXISTS `recipe_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_categories` (
  `recipe_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`recipe_id`,`category_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `fk_rc_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rc_recipe` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_categories`
--

LOCK TABLES `recipe_categories` WRITE;
/*!40000 ALTER TABLE `recipe_categories` DISABLE KEYS */;
INSERT INTO `recipe_categories` VALUES (1,1),(1,6),(1,7),(2,2),(2,3),(2,4),(2,5),(2,6),(2,8),(3,1),(3,4),(3,6),(3,7),(4,1),(4,6),(4,9),(5,4),(5,5),(5,6),(5,10),(6,2),(6,4),(7,2),(7,6),(7,7),(8,1),(8,4),(8,6),(8,7);
/*!40000 ALTER TABLE `recipe_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_ingredients`
--

DROP TABLE IF EXISTS `recipe_ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_ingredients` (
  `recipe_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `quantity_text` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`recipe_id`,`ingredient_id`),
  KEY `ingredient_id` (`ingredient_id`),
  CONSTRAINT `fk_ri_ingredient` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ri_recipe` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_ingredients`
--

LOCK TABLES `recipe_ingredients` WRITE;
/*!40000 ALTER TABLE `recipe_ingredients` DISABLE KEYS */;
INSERT INTO `recipe_ingredients` VALUES (1,1,'2 tbsp'),(1,2,'or sun-dried tomato oil from the jar'),(1,3,'6 rashers of, chopped'),(1,4,'2 large, chopped'),(1,5,'3, crushed'),(1,6,'1kg/2¼lb'),(1,7,'2 large glasses'),(1,8,'2x400g cans'),(1,9,'1x290g jar, drained'),(1,10,'2 fresh or dried'),(1,11,'1 tsp or a small handful of fresh leaves, chopped'),(1,12,'1 tsp or a small handful of fresh leaves, chopped'),(1,13,'Drizzle'),(1,14,'12-14, in oil'),(1,15,'Salt and freshly ground'),(1,16,'A good handful of, torn into small pieces'),(1,17,'800g-1kg/1¾-2¼lb'),(1,18,'Lots of freshly grated, to serve'),(2,19,'125g/4½oz'),(2,20,'2 tbsp'),(2,21,'1 tsp'),(2,22,'good pinch'),(2,23,'150ml/5fl oz'),(2,24,'¼ tsp'),(2,25,'4 tsp, for frying'),(3,11,'1 tsp'),(3,15,'freshly ground black pepper'),(3,16,'fresh basil leaves, to serve (optional)'),(3,22,'pinch fine'),(3,26,'125g/4½oz'),(3,27,'125g/4½oz'),(3,28,'1, seeds removed and thinly sliced'),(3,29,'1, cut into 1cm/½in slices'),(3,30,'1, cut into thin wedges'),(3,31,'1 tbsp, plus extra for drizzling'),(3,32,'½ tsp'),(3,33,'50g/1¾oz'),(3,34,'6 tbsp (approx 100g/3½oz)'),(4,4,'2, finely sliced'),(4,22,'4 tsp'),(4,35,'5 tbsp'),(4,36,'200g/7oz'),(4,37,'4 tbsp'),(4,38,'3 tbsp'),(4,39,'1-2 tsp'),(4,40,'5 tsp'),(4,41,'1 tsp'),(4,42,'1, juice only'),(4,43,'30g/1oz, finely chopped'),(4,44,'30g/1oz, finely chopped'),(4,45,'3-4, finely chopped'),(4,46,'800g/1lb 12oz, cut into bite-sized pieces'),(4,47,'4 tbsp'),(4,48,'1½ tbsp'),(4,49,'1 tsp (a large pinch)'),(5,1,'125ml/4fl oz'),(5,5,'4 cloves, crushed'),(5,22,'1 tsp, or to taste'),(5,30,'1, finely chopped'),(5,52,'225g/8oz, prepared to packet instructions'),(5,53,'8 small, flesh and rind finely chopped'),(5,54,'180g/6½oz'),(5,55,'120g/4½oz, toasted'),(5,56,'160g/5¾oz, roughly chopped'),(5,57,'60g/2¼oz, finely chopped'),(5,58,'4 tbsp'),(5,59,'80g/2¾oz'),(6,20,'170g/6oz'),(6,24,'2-3 drops'),(6,47,'125ml/4½fl oz, plus double cream to serve'),(6,56,'1 tbsp'),(6,60,'125ml/4½fl oz'),(6,61,'4 free-range'),(6,62,'30g/1oz'),(6,63,'500g/1lb 2oz, cut in half, stones removed'),(6,64,'2 tbsp'),(6,65,'30g/1oz (optional)'),(6,66,'icing sugar, for dusting'),(7,22,'large pinch (for base) + large pinch (for filling)'),(7,47,'120ml/4fl oz'),(7,67,'280g/10oz'),(7,68,'65g/2½oz (for base) + 100g/3½oz (for filling)'),(7,69,'¼ tsp'),(7,70,'128g/4½oz, melted'),(7,71,'2 tbsp plus ¼ tsp powdered'),(7,72,'115g/4oz, at room temperature'),(7,73,'850g tin'),(8,4,'1, very thinly sliced into half moons'),(8,8,'1 x 400g tin'),(8,15,'salt and freshly ground'),(8,20,'2 tsp'),(8,36,'150g/5½oz'),(8,57,'20g/¾oz, finely chopped'),(8,74,'2 tbsp'),(8,75,'good squeeze'),(8,76,'2 level tsp'),(8,77,'1 heaped tsp'),(8,78,'500g/1lb 2oz, very thinly sliced lengthways'),(8,79,'2 tsp'),(8,80,'2 tsp'),(8,81,'2 heaped tsp'),(8,82,'½ tsp'),(8,83,'½ tsp'),(8,84,'4 white'),(8,85,'¼ small, very finely shredded'),(8,86,'2, sliced cut into half moons'),(8,87,'4-6, thinly sliced (optional)'),(50,50,'400g/14oz'),(51,51,'2 tbsp, to garnish (optional)');
/*!40000 ALTER TABLE `recipe_ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_steps`
--

DROP TABLE IF EXISTS `recipe_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_steps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipe_id` int(11) NOT NULL,
  `step_no` int(11) NOT NULL,
  `instruction` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recipe_id` (`recipe_id`),
  CONSTRAINT `fk_rs_recipe` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_steps`
--

LOCK TABLES `recipe_steps` WRITE;
/*!40000 ALTER TABLE `recipe_steps` DISABLE KEYS */;
INSERT INTO `recipe_steps` VALUES (1,1,1,'Heat the oil in a large, heavy-based saucepan and fry the bacon until golden over a medium heat. Add the onions and garlic, frying until softened.'),(2,1,2,'Increase the heat and add the minced beef. Fry it until it has browned, breaking down any chunks of meat with a wooden spoon. Pour in the wine and boil until it has reduced in volume by about a third.'),(3,1,3,'Reduce the temperature and stir in the tomatoes, drained mushrooms, bay leaves, oregano, thyme and balsamic vinegar.'),(4,1,4,'Either blitz the sun-dried tomatoes in a small blender with a little of the oil to loosen, or just finely chop before adding to the pan. Season well with salt and pepper. Cover with a lid and simmer the Bolognese sauce over a gentle heat for 1-1½ hours until it\'s rich and thickened, stirring occasionally.'),(5,1,5,'At the end of the cooking time, stir in the basil and add any extra seasoning if necessary.'),(6,1,6,'Remove from the heat to \'settle\' while you cook the spaghetti in plenty of boiling salted water (for the time stated on the packet). Drain and divide between warmed plates. Scatter a little parmesan over the spaghetti before adding a good ladleful of the Bolognese sauce, finishing with a scattering of more cheese and a twist of black pepper.'),(7,2,1,'Put the flour, sugar, baking powder and salt in a bowl and mix thoroughly. Add the milk and vanilla extract and mix with a whisk until smooth.'),(8,2,2,'Place a large non-stick frying pan over a medium heat. Add 2 teaspoons of the oil and wipe around the pan with a heatproof brush or carefully using a thick wad of kitchen paper.'),(9,2,3,'Once the pan is hot, pour a small ladleful (around two dessert spoons) of the batter into one side of the pan and spread with the back of the spoon until around 10cm/4in in diameter. Make a second pancake in exactly the same way, greasing the pan with the remaining oil before adding the batter.'),(10,2,4,'Cook for about a minute, or until bubbles are popping on the surface and just the edges look dry and slightly shiny. Quickly and carefully flip over and cook on the other side for a further minute, or until light, fluffy and pale golden brown. If you turn the pancakes too late, they will be too set to rise evenly. You can always flip again if you need the first side to go a little browner.'),(11,2,5,'Transfer to a plate and keep warm in a single layer (so they don\'t get squished) on a baking tray in a low oven while the rest of the pancakes are cooked in exactly the same way. Serve with your preferred toppings.'),(12,3,1,'Preheat the oven to 220C/200C Fan/Gas 7.'),(13,3,2,'To prepare the topping, put the pepper, courgette, red onion and oil in a bowl, season with lots of black pepper and mix together. Scatter the vegetables over a large baking tray and roast for 15 minutes.'),(14,3,3,'Meanwhile, make the pizza base. Mix the flour and salt in a large bowl. Add the yoghurt and 1 tablespoon of cold water and mix with a spoon, then use your hands to form a soft, spongy dough. Turn out onto a lightly floured surface and knead for about 1 minute.'),(15,3,4,'Using a floured rolling pin, roll the dough into a roughly oval shape, approx. 3mm/⅛in thick, turning regularly.'),(16,3,5,'Transfer the roasted vegetables to a bowl. Slide the pizza dough onto the baking tray and bake for 5 minutes. Take the tray out of the oven and turn the dough over.'),(17,3,6,'For the tomato sauce, mix the passata with the oregano and spread over the dough. Top with the roasted vegetables, sprinkle with the chilli flakes and then the cheese. Bake the pizza for a further 8–10 minutes, or until the dough is cooked through and the cheese beginning to brown.'),(18,3,7,'Season with black pepper, drizzle with a slurp of olive oil and, if you like, scatter fresh basil leaves on top just before serving.'),(19,4,1,'Heat the oil in a non-stick frying pan over a medium heat. Add the onions and stir-fry for 15–18 minutes, or until lightly browned and crispy.'),(20,4,2,'Put half the onions in a non-metallic mixing bowl with the yoghurt, ginger, garlic, chilli powder, cumin, cardamom, half of the salt, the lime juice, half of the chopped coriander and mint and the green chillies. Stir well to combine. Set aside the remaining coriander and mint for layering the biryani.'),(21,4,3,'Add the lamb to the mixture and stir to coat evenly. Cover and marinate in the fridge for 6–8 hours, or overnight if possible.'),(22,4,4,'Preheat the oven to 240C/Fan 220C/Gas 9.'),(23,4,5,'Heat the cream and milk in a small saucepan, add the saffron, remove from the heat and leave to infuse for 30 minutes.'),(24,4,6,'Cook the rice in a large saucepan in plenty of boiling water with the remaining salt for 6-8 minutes, or until it is just cooked, but still has a bite. Drain the rice.'),(25,4,7,'Spread half of the lamb mixture evenly in a wide, heavy-based casserole and cover with a layer of half the rice. Sprinkle over half of the reserved onions and half of the reserved coriander and mint. Sprinkle over half of the saffron mixture. Repeat with the remaining lamb, rice, onions, herbs and saffron mixture.'),(26,4,8,'Cover with a tight fitting lid, turn down the oven to 200C/Fan 180C/Gas 6 and cook for 1 hour. Remove and allow to stand for 15-20 minutes before serving. Garnish with pomegranate seeds if desired.'),(27,5,1,'In a large bowl mix all the ingredients together except the rocket, then taste and adjust the seasoning, adding more salt if necessary. Toss in the rocket and serve immediately.'),(28,6,1,'Preheat the oven to 180C/350F/Gas 4.'),(29,6,2,'Pour the milk, cream and vanilla into a pan and boil for a minute. Remove from the heat and set aside to cool.'),(30,6,3,'Tip the eggs and sugar into a bowl and beat together until light and fluffy. Fold the flour into the mixture, a little at a time.'),(31,6,4,'Pour the cooled milk and cream onto the egg and sugar mixture, whisking lightly. Set aside.'),(32,6,5,'Place a little butter into an ovenproof dish and heat in the oven until foaming. Add the plums and brown sugar and bake for 5 minutes, then pour the batter into the dish and scatter with flaked almonds, if using.'),(33,6,6,'Cook in the oven for about 30 minutes, until golden-brown and set but still light and soft inside.'),(34,6,7,'Dust with icing sugar and serve immediately with cream.'),(35,7,1,'To make the biscuit base, finely crush the biscuits by putting into a sealed plastic bag and bashing with a rolling pin (alternatively, pulse to crumbs using a food processor). Transfer to a mixing bowl and add the sugar, cardamom and salt, stirring well to combine.'),(36,7,2,'Pour the melted butter over the biscuit crumbs and mix, until thoroughly combined. Put half the crumb mixture in a 23cm/9in metal pie tin, and press evenly with your fingers. Build up the sides of the tin, compressing the base as much as possible to prevent it crumbling. Repeat with the rest of the mixture in the second tin.'),(37,7,3,'Preheat the oven to 160C/325F/Gas 3. Put the pie bases in the freezer for 15 minutes. Remove and bake for 12 minutes, or until golden brown. Transfer to a wire rack to cool.'),(38,7,4,'To make the filling, pour 177ml/6fl oz of cold water into a large bowl. In a separate bowl, mix the gelatine with half the sugar and sprinkle over the water. Leave to stand for a couple of minutes.'),(39,7,5,'Meanwhile, whip the cream with the remaining sugar to form medium soft peaks. Set aside.'),(40,7,6,'Heat about a quarter of the mango pulp in a saucepan over a medium-low heat, until just warm. Make sure you do not boil it. Pour into the gelatine mixture and whisk, until well combined. The gelatine should dissolve completely. Gradually whisk in the remaining mango pulp.'),(41,7,7,'Beat the cream cheese in a bowl, until soft and smooth. Add to the mango mixture with the salt. Blend the mixture using a hand blender, until completely smooth. Gently tap the bowl on the kitchen counter once or twice to pop any air bubbles.'),(42,7,8,'Fold about a quarter of the mango mixture into the whipped cream using a spatula. Repeat with the rest of the cream, until no streaks remain.'),(43,7,9,'Divide the filling between the cooled bases, using a rubber spatula to smooth out the filling. Refrigerate overnight, or for at least 5 hours, until firm and chilled.'),(44,8,1,'Preheat the oven to 180C/200C Fan/Gas 4.'),(45,8,2,'To make the chilli sauce, heat the chopped tomatoes, rose harissa, sugar and lemon juice in a small saucepan over a medium heat. Bring to a gentle boil and cook for 10 minutes, stirring regularly, until reduced to a thick sauce-like consistency. Remove from the heat and set aside to cool. You can blend the sauce until it’s smooth using a hand-blender if you like, or just leave it chunky.'),(46,8,3,'For the onion, mix together the onion slices, vinegar and parsley and set aside.'),(47,8,4,'To make the yoghurt sauce, mix the yoghurt with the dried mint, season with salt and pepper and set aside.'),(48,8,5,'Put the pittas in the oven to warm for 5 minutes.'),(49,8,6,'To make the ‘doner’, heat a frying pan over a medium-high heat. Add the mushrooms and dry-fry for 2 minutes, stirring once or twice. Add the garlic oil, paprika, coriander, celery salt, garlic granules and black pepper and quickly coat the mushrooms. Add 2–3 tablespoons of water to the pan and stir-fry for 1 minute before removing from the heat.'),(50,8,7,'Split the warmed pitta breads. Spoon a little white cabbage into each pitta and add a little tomato and onion. Divide the mushrooms between the pittas, add a little more cabbage and tomato, then drizzle with the chilli and yoghurt sauces. Serve immediately, topped with the pickled chillies, if using.');
/*!40000 ALTER TABLE `recipe_steps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `summary` text DEFAULT NULL,
  `difficulty` enum('Easy','Medium','Hard') DEFAULT 'Easy',
  `prep_time` varchar(50) DEFAULT NULL,
  `cook_time` varchar(50) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `ft_recipes_title_summary` (`title`,`summary`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes`
--

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;
INSERT INTO `recipes` VALUES (1,'Spaghetti Bolognese','Once you\'ve got this grown-up spag bol going the hob will do the rest. Any leftovers will taste even better the next day.','Medium','Less than 30 mins','1 to 2 hours','/assets/images/spaghetti.jpg'),(2,'Vegan pancakes','Try this vegan fluffy American pancake recipe for a perfect start to the day. Serve these pancakes with fresh berries, maple syrup or chocolate sauce for a really luxurious start to the day.','Easy','Less than 30 mins','10 to 30 mins','/assets/images/vegan_pancakes.jpg'),(3,'Healthy pizza','No yeast required for this easy, healthy pizza, topped with colourful vegetables that\'s ready in 30 minutes. This is a great recipe if you want to feed the kids in a hurry!','Easy','Less than 30 mins','10 to 30 mins','/assets/images/healthy_pizza.jpg'),(4,'Easy lamb biryani','This lamb biryani is real centrepiece dish, but it\'s actually easy as anything to make. Serve garnished with pomegranate seeds to make it look really special.','Medium','Overnight','1 to 2 hours','/assets/images/lamb_biryani.jpg'),(5,'Couscous salad','A nutritious and satisfying vegan couscous salad packed with colour, flavour and texture, from dried cranberries, pistachios and pine nuts.','Easy','Less than 30 mins','Less than 10 mins','/assets/images/couscous_salad.jpg'),(6,'Plum clafoutis','Halved plums are covered in a light batter and then baked in the oven to make this traditional French dessert.','Easy','Less than 30 mins','30 mins to 1 hour','/assets/images/plum_clafoutis.jpg'),(7,'Mango pie','This mouthwatering mango dessert is an Indian take on a traditional Thanksgiving pie.','Medium','30 mins to 1 hour','30 mins to 1 hour','/assets/images/mango_pie.jpg'),(8,'Mushroom doner','A meat-free mushroom ‘doner’ kebab packed with two types of sauces, pickles and veg. A mighty delicious vegetarian dish.','Easy','Less than 30 mins','10 to 30 mins','/assets/images/mushroom_doner.jpg');
/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Demo User','demo@example.com','$2y$10$Kp7T8r7j4xQ0Q9d2Z2g8W.zvZ3C2l2Vq1o6a3xM1r6R9y2b1QmJk2','2025-10-04 17:13:27'),(2,'Mazen','mazen@test.com','$2y$10$PQdzRk8u8Ukzxp8EIa.dkeW0dY.ENOL63RUTFpQSdHWMV1VeR6Ija','2025-10-04 17:27:41'),(3,'Mazen','mazen2@test.com','$2y$10$vXt.Oa6CqPIQdZR.7TLSPuK4nRIg9upDh7VLAjLU1RFhOTfnKxkNa','2025-10-04 17:54:44');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'Recipe_web_app'
--

--
-- Dumping routines for database 'Recipe_web_app'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-04 21:07:27
