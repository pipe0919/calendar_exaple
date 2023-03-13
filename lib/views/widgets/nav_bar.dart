import 'package:flutter/material.dart';

class AppBarCustom extends StatefulWidget {
  const AppBarCustom({super.key});

  @override
  State<AppBarCustom> createState() => _AppBarCustomState();
}

class _AppBarCustomState extends State<AppBarCustom> {
  @override
  Widget build(BuildContext context) {
    return FABBottomAppBar(
      notchedShape: const CircularNotchedRectangle(),
      backgroundColor: Colors.white,
      onTabSelected: (v) {},
      items: [
        FABBottomAppBarItem(
            iconData: const Icon(
              Icons.search,
              color: Colors.blue,
            ),
            text: 'Search'),
        FABBottomAppBarItem(
            iconData: const Icon(
              Icons.favorite,
              color: Colors.blue,
            ),
            text: 'Favorites'),
        FABBottomAppBarItem(
            iconData: const Icon(
              Icons.drive_eta,
              color: Colors.blue,
            ),
            text: 'Booking'),
        FABBottomAppBarItem(
            iconData: const Icon(
              Icons.person_outline_outlined,
              color: Colors.blue,
            ),
            text: 'Account'),
      ],
      centerItemText: '',
      color: Colors.grey,
      selectedColor: Colors.blue,
    );
  }
}

class FABBottomAppBarItem {
  FABBottomAppBarItem({this.iconData, this.text});
  Widget? iconData;
  String? text;
}

class FABBottomAppBar extends StatefulWidget {
  FABBottomAppBar({
    super.key,
    required this.items,
    required this.centerItemText,
    this.height = 60.0,
    this.iconSize = 24.0,
    required this.backgroundColor,
    required this.color,
    required this.selectedColor,
    this.notchedShape,
    required this.onTabSelected,
  }) {
    assert(items.length == 2 || items.length == 4);
  }
  final List<FABBottomAppBarItem> items;
  final String centerItemText;
  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Color color;
  final Color selectedColor;
  final NotchedShape? notchedShape;
  final ValueChanged<int> onTabSelected;

  @override
  State<StatefulWidget> createState() => FABBottomAppBarState();
}

class FABBottomAppBarState extends State<FABBottomAppBar> {
  int _selectedIndex = 0;

  _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });
    items.insert(items.length >> 1, _buildMiddleTabItem());

    return BottomAppBar(
      elevation: 50,
      shape: widget.notchedShape,
      color: widget.backgroundColor,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
    );
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: widget.iconSize),
            Text(
              widget.centerItemText,
              style: TextStyle(color: widget.color, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({
    FABBottomAppBarItem? item,
    int? index,
    ValueChanged<int>? onPressed,
  }) {
    Color color = _selectedIndex == index ? widget.selectedColor : widget.color;
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed!(index!),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                item!.iconData!,
                //   Icon(item!.iconData, color: color, size: widget.iconSize),
                Text(
                  item.text!,
                  style: TextStyle(color: color),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
