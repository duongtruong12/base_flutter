import 'package:flutter/material.dart';

// ignore: constant_identifier_names
enum IndicatorType { Top, Bottom }

class CustomLineIndicatorBottomNavbar extends StatelessWidget {
  final Color? backgroundColor;
  final List<CustomBottomBarItems> customBottomBarItems;
  final Color? selectedColor;
  final Color? unSelectedColor;
  final double unselectedFontSize;
  final Color? splashColor;
  final int currentIndex;
  final bool enableLineIndicator;
  final double lineIndicatorWidth;
  final IndicatorType indicatorType;
  final Function(int) onTap;
  final double selectedFontSize;
  final double selectedIconSize;
  final double unselectedIconSize;
  final LinearGradient? gradient;

  const CustomLineIndicatorBottomNavbar({
    Key? key,
    this.backgroundColor,
    this.selectedColor,
    required this.customBottomBarItems,
    this.unSelectedColor,
    this.unselectedFontSize = 11,
    this.selectedFontSize = 12,
    this.selectedIconSize = 20,
    this.unselectedIconSize = 15,
    this.splashColor,
    this.currentIndex = 0,
    required this.onTap,
    this.enableLineIndicator = true,
    this.lineIndicatorWidth = 3,
    this.indicatorType = IndicatorType.Top,
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBarThemeData bottomTheme =
        BottomNavigationBarTheme.of(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor ?? bottomTheme.backgroundColor,
        gradient: gradient,
      ),
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (int i = 0; i < customBottomBarItems.length; i++) ...[
              Expanded(
                child: CustomLineIndicatorBottomNavbarItems(
                  selectedColor: selectedColor,
                  unSelectedColor: unSelectedColor,
                  icon: customBottomBarItems[i].icon,
                  activeIcon: customBottomBarItems[i].activeIcon,
                  label: customBottomBarItems[i].label,
                  unSelectedFontSize: unselectedFontSize,
                  selectedFontSize: selectedFontSize,
                  unselectedIconSize: unselectedIconSize,
                  selectedIconSize: selectedIconSize,
                  splashColor: splashColor,
                  currentIndex: currentIndex,
                  enableLineIndicator: enableLineIndicator,
                  lineIndicatorWidth: lineIndicatorWidth,
                  indicatorType: indicatorType,
                  index: i,
                  onTap: onTap,
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}

class CustomBottomBarItems {
  final Widget icon;
  final Widget activeIcon;
  final String label;

  CustomBottomBarItems({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });
}

class CustomLineIndicatorBottomNavbarItems extends StatelessWidget {
  final Widget icon;
  final Widget activeIcon;
  final String? label;
  final Color? selectedColor;
  final Color? unSelectedColor;
  final double unSelectedFontSize;
  final double selectedIconSize;
  final double unselectedIconSize;

  final double selectedFontSize;
  final Color? splashColor;
  final int? currentIndex;
  final int index;
  final Function(int) onTap;
  final bool enableLineIndicator;
  final double lineIndicatorWidth;
  final IndicatorType indicatorType;

  const CustomLineIndicatorBottomNavbarItems({
    Key? key,
    required this.icon,
    required this.activeIcon,
    this.label,
    this.selectedColor,
    this.unSelectedColor,
    this.unSelectedFontSize = 12,
    this.selectedFontSize = 12,
    this.selectedIconSize = 20,
    this.unselectedIconSize = 20,
    this.splashColor,
    this.currentIndex,
    required this.onTap,
    required this.index,
    this.enableLineIndicator = true,
    this.lineIndicatorWidth = 3,
    this.indicatorType = IndicatorType.Top,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBarThemeData bottomTheme =
        BottomNavigationBarTheme.of(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(right: 7),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: splashColor ?? Theme.of(context).splashColor,
            onTap: () {
              onTap(index);
            },
            child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Container(
                      width: 30,
                      decoration: BoxDecoration(
                        border: enableLineIndicator
                            ? Border(
                                bottom: indicatorType == IndicatorType.Bottom
                                    ? BorderSide(
                                        color: currentIndex == index
                                            ? selectedColor ??
                                                bottomTheme.selectedItemColor!
                                            : Colors.transparent,
                                        width: lineIndicatorWidth,
                                      )
                                    : const BorderSide(
                                        color: Colors.transparent),
                                top: indicatorType == IndicatorType.Top
                                    ? BorderSide(
                                        color: currentIndex == index
                                            ? selectedColor ??
                                                bottomTheme.selectedItemColor!
                                            : Colors.transparent,
                                        width: lineIndicatorWidth,
                                      )
                                    : const BorderSide(
                                        color: Colors.transparent),
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: currentIndex == index ? activeIcon : icon,
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          '$label',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                            color: currentIndex == index
                                ? selectedColor ??
                                    bottomTheme.unselectedItemColor
                                : unSelectedColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
