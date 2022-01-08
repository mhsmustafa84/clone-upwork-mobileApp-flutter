import 'package:flutter/material.dart';
import 'package:upwork/View/components/Shared/CustomIcon.dart';
import '../../../constanse.dart';

class PortfolioItem extends StatefulWidget {
  final String imgUrl;
  final String itemName;
  PortfolioItem(this.imgUrl, this.itemName);
  @override
  _PortfolioItemState createState() => _PortfolioItemState();
}

class _PortfolioItemState extends State<PortfolioItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      child: Column(
        children: [
          Stack(
            children: [
              Positioned(
                child: Image.asset(
                  widget.imgUrl,
                ),
              ),
              Positioned(
                top: 40,
                left: 100,
                child: CustomIcon(Icons.mode_edit),
              ),
              Positioned(
                top: 40,
                right: 100,
                child: CustomIcon(Icons.delete),
              ),
            ],
          ),
          Text(
            widget.itemName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              color: upWorkText,
            ),
          ),
        ],
      ),
    );
  }
}
