import 'package:flutter/material.dart';

void main() {
  runApp(const MuseumApp());
}

class MuseumApp extends StatelessWidget {
  const MuseumApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Museum",
      theme: ThemeData(
        primaryColor: Colors.brown,
      ),
      home: const Artwork(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Artwork extends StatefulWidget {
  const Artwork({Key? key}) : super(key: key);

  @override
  State<Artwork> createState() => _ArtworkState();
}

class _ArtworkState extends State<Artwork> {
  bool _isFavorite = false;
  bool _showDescription = false;

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
    if (_isFavorite) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Ajouté aux favoris"),
          duration: Duration(seconds: 1),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _toggleDescription() {
    setState(() {
      _showDescription = !_showDescription;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text("Musée"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset(
                  "assets/images/Mona_Lisa.jpg",
                  fit: BoxFit.cover,
                ),
                if (_isFavorite)
                  const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 100,
                  ),
                if (_showDescription)
                  SizedBox(
                    height: 350,
                    width: 300,
                    child: SingleChildScrollView(
                      child: Container(
                        margin: const EdgeInsets.all(20),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.75),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          "La Joconde, ou Portrait de Mona Lisa, est un tableau de l'artiste Léonard de Vinci, réalisé entre 1503 et 1506 ou entre 1513 et 15161,2, et peut-être jusqu'à 1517 (l'artiste étant mort le 2 mai 1519), qui représente un portrait mi-corps, probablement celui de la Florentine Lisa Gherardini, épouse de Francesco del Giocondo. Acquise par François Ier, cette peinture à l'huile sur panneau de bois de peuplier de 77 × 53 cm est exposée au musée du Louvre à Paris. La Joconde est l'un des rares tableaux attribués de façon certaine à Léonard de Vinci. La Joconde est devenue un tableau éminemment célèbre car, depuis sa réalisation, nombre d'artistes l'ont pris comme référence. À l'époque romantique, les artistes ont été fascinés par ce tableau et ont contribué à développer le mythe qui l'entoure, en faisant de ce tableau l’une des œuvres d'art les plus célèbres du monde, si ce n'est la plus célèbre : elle est en tout cas considérée comme l'une des représentations d'un visage féminin les plus célèbres au monde. Au xxie siècle, elle est devenue l'objet d'art le plus visité au monde, devant le diamant Hope, avec 20 000 visiteurs qui viennent l'admirer et la photographier quotidiennement.",
                          style: TextStyle(
                              fontSize: 20, fontFamily: "Merriweather"),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Mona Lisa",
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: "Merriweather",
                  ),
                ),
                const Text(
                  "Léonard de Vinci",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Merriweather",
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: _toggleDescription,
                      icon: Icon(
                        Icons.article,
                        color:
                            Colors.brown.withOpacity(_isFavorite ? 1.0 : 0.75),
                        size: 50,
                      ),
                    ),
                    IconButton(
                      onPressed: _toggleFavorite,
                      icon: Icon(
                        Icons.favorite,
                        color:
                            Colors.brown.withOpacity(_isFavorite ? 1.0 : 0.75),
                        size: 50,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
