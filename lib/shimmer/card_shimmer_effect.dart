import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomCardShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2.0,
              blurRadius: 3.0,
            )
          ],
          color: Colors.white,
        ),
        child: Column(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.grey[300],
              ),
            ),
            SizedBox(height: 12.0),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Container(
                color: Colors.grey[300],
                height: 1.5,
              ),
            ),
            Center(
              child: Container(
                height: 20,
                width: 80,
                color: Colors.grey[300],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
