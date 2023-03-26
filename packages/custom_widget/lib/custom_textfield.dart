part of custom_widget;


class CustomTextField extends StatelessWidget {
  final String prefixImage;
  final String suffixImage;
  final String hintText;
  final Color iconColor;
  final double width;
  final TextEditingController? controller;
  bool? obscureText=false;
  Function()? onTapSuffix=(){};

  CustomTextField({
    required this.prefixImage,
    required this.suffixImage,
    required this.hintText,
    required this.iconColor,
    required this.width,
    this.controller,
    this.obscureText,
    this.onTapSuffix,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            offset:const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: Image.asset(
              prefixImage,
              height: width * 0.06,
              width: width * 0.06,
              color: iconColor,
            ),
          ),
          SizedBox(
            height: width * 0.07,
            child: VerticalDivider(
              color: iconColor,
              thickness: width  * 0.003,
            ),
          ),
          Expanded(
            child: TextField(
              obscureText:obscureText ?? false,
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
              ),
            ),
          ),
          InkWell(
            onTap:onTapSuffix,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal:width * 0.04),
              child: Image.asset(
                suffixImage,
                height: width * 0.04,
                width: width * 0.04,
                color: iconColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
