part of 'widget.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product');
      },
      child: Container(
        margin: EdgeInsets.only(
            left: defaultMargin, right: defaultMargin, bottom: defaultMargin),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  'assets/images_Product.png',
                  width: 120,
                  height: 120,
                )),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Categories',
                    style: secondaryTextStyle.copyWith(fontSize: 12),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'New Product',
                    style: primaryTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Rp. 500.000',
                    style: priceTextStyle.copyWith(fontWeight: medium),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
