import 'package:flutter/material.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      itemBuilder: (context, index) {
        if (index == 0) {
          return _buildCarousel(context, index ~/ 2);
        } else {
          if (index == 1) {
            return Center(
              child: Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Карточки вертикальные")])
              ]),
            );
            //return const Text('Карточки вертикальные', style: TextStyle(lo: ));
          }
          return generateListTile(context, index);
        }
      },
    );
  }

  Widget _buildCarousel(BuildContext context, int carouselIndex) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const Text('Карточки горизонтальные'),
        SizedBox(
          height: 200.0,
          child: PageView.builder(
            controller: PageController(viewportFraction: 0.8),
            itemBuilder: (BuildContext context, int itemIndex) {
              return _buildCarouselItem(context, carouselIndex, itemIndex);
            },
          ),
        )
      ],
    );
  }

  Widget generateListTile(BuildContext context, int index) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 200.0,
              child: PageView.builder(
                controller: PageController(viewportFraction: 0.8),
                itemBuilder: (BuildContext context, int itemIndex) {
                  return _buildCarouselItem(context, index, itemIndex);
                },
                itemCount: 1,
              ),
              //child: _buildCarouselItem(context, index, index)
            )
          ],
        ));
  }

  Widget _buildCarouselItem(
      BuildContext context, int carouselIndex, int itemIndex) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
      ),
    );
  }
}
