import 'package:flutter/material.dart';

class ImageGeneratorScreen extends StatefulWidget {
  @override
  _ImageGeneratorScreenState createState() => _ImageGeneratorScreenState();
}

class _ImageGeneratorScreenState extends State<ImageGeneratorScreen> {
  final TextEditingController _controller = TextEditingController();
  String _imageUrl =
      'https://th.bing.com/th/id/R.840007f0011d5446c6189835024100e1?rik=jru973Pbcab9vg&riu=http%3a%2f%2fallhdwallpapers.com%2fwp-content%2fuploads%2f2016%2f06%2fSummer-5.jpg&ehk=awtqFYG5b6eePQPNpmHz%2fShMYfCOCCIni9pTh7sE71w%3d&risl=&pid=ImgRaw&r=0';

  void _generateImage() {
    setState(() {
      // Simulate generating an image URL based on the prompt
      _imageUrl =
          'https://th.bing.com/th/id/OIP.SuaOUqWZ23dwpnTZ5ldwuAHaEk?w=258&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(
        title: Text('AI Image Generator'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: 300, // Replace with your desired width
              height: 200, // Replace with your desired height
              child: _imageUrl == null
                  ? Text('No image generated')
                  : Image.network(
                      _imageUrl,
                      fit: BoxFit.cover, // Adjust the fit as per your requirement
                    ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        labelText: '     Enter a prompt',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
                        fillColor: Colors.blueGrey,
                        filled: true,
                  
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  ElevatedButton(
                    
                    onPressed: _generateImage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,

                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Padding
                      textStyle: TextStyle(
                        fontSize: 16, // Font size
                        decorationColor: Colors.amberAccent,
                      ),
                    ),
                    child: Icon(Icons.arrow_forward),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
