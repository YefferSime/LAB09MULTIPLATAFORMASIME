// Ejercicio 01

//import 'package:flutter/material.dart';
//
//void main() {
//  runApp(MyApp());
//}
//
//class ListItem {
//  final String title;
//  final String imageUrl;
//  final String fontFamily;
//
//  ListItem({
//    required this.title,
//    required this.imageUrl,
//    required this.fontFamily,
//  });
//}
//
//class MyApp extends StatelessWidget {
//  final List<ListItem> items = [
//    ListItem(
//      title: 'Mig 29',
//      imageUrl: 'assets/images/mig29.png',
//      fontFamily: 'OpenSans',
//    ),
//    ListItem(
//      title: 'F22 Raptor',
//      imageUrl: 'assets/images/f22.png',
//      fontFamily: 'Lato',
//    ),
//    ListItem(
//      title: 'J20 Chino',
//      imageUrl: 'assets/images/j20.png',
//      fontFamily: 'Ubuntu',
//    ),
//  ];
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text('Lista con Imágenes y Fuentes'),
//        ),
//        body: ListView.builder(
//          itemCount: items.length,
//          itemBuilder: (context, index) {
//            return ListTile(
//              title: Text(
//                items[index].title,
//                style: TextStyle(fontFamily: items[index].fontFamily),
//              ),
//              leading: Image.asset(
//                items[index].imageUrl,
//                width: 50,
//                height: 50,
//                fit: BoxFit.cover,
//              ),
//            );
//          },
//        ),
//      ),
//    );
//  }
//}


//Ejercicio 02

//import 'package:flutter/material.dart';
//
//void main() {
//  runApp(MyApp());
//}
//
//class ProductDetailsPage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Detalles del Producto'),
//      ),
//      body: ProductDetails(),
//    );
//  }
//}
//
//class ProductDetails extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Center(
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        crossAxisAlignment: CrossAxisAlignment.center,
//        children: [
//          Container(
//            width: 300,
//            height: 300,
//            child: Image.asset(
//              'assets/images/mig29.png', // Ruta de tu imagen
//              fit: BoxFit.contain,
//            ),
//          ),
//          SizedBox(height: 20),
//          Text(
//            'Mig 29',
//            style: TextStyle(
//              fontFamily: 'Montserrat',
//              fontSize: 24,
//              fontWeight: FontWeight.bold,
//            ),
//          ),
//          SizedBox(height: 10),
//          Text(
//            'S/99999.99',
//            style: TextStyle(
//              fontFamily: 'Roboto',
//              fontSize: 20,
//              fontWeight: FontWeight.bold,
//              color: Colors.green,
//            ),
//          ),
//          SizedBox(height: 10),
//          Text(
//            'Este es un un caza de 5ta generación',
//            style: TextStyle(
//              fontFamily: 'Nunito',
//              fontSize: 16,
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//}
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Product Details Demo',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: ProductDetailsPage(),
//    );
//  }
//}

//EJERCICIO 03
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(GalleryApp());
}

class GalleryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GALERIA',
      home: ImageGallery(),
    );
  }
}

class ImageGallery extends StatelessWidget {
  final List<ImageItem> images = [
    ImageItem(
      imagePath: 'assets/images/f22.png',
      imageName: 'PNG',
      fontFamily: 'Arial',
    ),
    ImageItem(
      imagePath: 'assets/images/F22R.jpg',
      imageName: 'JPG',
      fontFamily: 'Times New Roman',
    ),
    ImageItem(
      imagePath: 'assets/images/F22-Jet.svg',
      imageName: 'SVG',
      fontFamily: 'Roboto',
      isSvg: true,
    ),
    // Add more images as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Galería de imágenes'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return ImageTile(imageItem: images[index]);
        },
      ),
    );
  }
}

class ImageItem {
  final String imagePath;
  final String imageName;
  final String fontFamily;
  final bool isSvg;

  ImageItem({
    required this.imagePath,
    required this.imageName,
    required this.fontFamily,
    this.isSvg = false,
  });
}

class ImageTile extends StatelessWidget {
  final ImageItem imageItem;

  const ImageTile({Key? key, required this.imageItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: imageItem.isSvg
                ? SvgPicture.asset(imageItem.imagePath)
                : Image.asset(imageItem.imagePath),
          ),
          Text(
            imageItem.imageName,
            style: TextStyle(
              fontFamily: imageItem.fontFamily,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
