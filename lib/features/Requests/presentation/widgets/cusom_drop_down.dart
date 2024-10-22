import 'package:flutter/material.dart';
import 'package:task/core/theme/colors_manager.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> items;
  final String hintText;
  final Function(String?)? onItemSelected;

  const CustomDropdown({
    Key? key,
    required this.items,
    this.hintText = 'Select an item',
    this.onItemSelected,
  }) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _selectedItem;
  TextEditingController _searchController = TextEditingController();
  List<String> _filteredItems = [];
  ValueNotifier<bool> isBottomSheetOpen = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _filteredItems = widget.items;
  }

  void _filterItems(String query) {
    setState(() {
      _filteredItems = widget.items
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _showDropdownBottomSheet() {
    isBottomSheetOpen.value = true;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setStateModal) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Search',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (query) {
                          _filterItems(query);
                          setStateModal(() {});
                        },
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _filteredItems.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(_filteredItems[index]),
                            onTap: () {
                              setState(() {
                                _selectedItem = _filteredItems[index];
                              });
                              Navigator.pop(context);
                              isBottomSheetOpen.value = false;

                              if (widget.onItemSelected != null) {
                                widget.onItemSelected!(_selectedItem);
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    ).whenComplete(() {
      isBottomSheetOpen.value = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showDropdownBottomSheet,
      child: ValueListenableBuilder<bool>(
        valueListenable: isBottomSheetOpen,
        builder: (context, isOpen, _) {
          return InputDecorator(
            decoration: InputDecoration(
              fillColor: ColorsManager.darkGrey,
              filled: true,
              labelStyle: TextStyle(
                color: ColorsManager.grey,
              ),
              border: OutlineInputBorder(),
            ),
            child: Row(
              children: [
                Text(
                  _selectedItem ?? widget.hintText,
                  style: TextStyle(
                    color: _selectedItem == null
                        ? ColorsManager.grey
                        : ColorsManager.grey,
                  ),
                ),
                Spacer(),
                Icon(
                  isOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  color: ColorsManager.grey,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
