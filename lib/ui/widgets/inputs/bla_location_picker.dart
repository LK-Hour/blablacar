import 'package:flutter/material.dart';
import '../../../model/ride/locations.dart';
import '../../../services/location_service.dart';
import '../../theme/theme.dart';

///
/// This full-screen modal is in charge of providing (if confirmed) a selected location.
///
class BlaLocationPicker extends StatefulWidget {
  final Location? initLocation;
  const BlaLocationPicker({super.key, this.initLocation});

  @override
  State<BlaLocationPicker> createState() => _BlaLocationPickerState();
}

class _BlaLocationPickerState extends State<BlaLocationPicker> {
  List<Location> filteredLocations = [];

  @override
  void initState() {
    super.initState();

    if (widget.initLocation != null) {
      filteredLocations = getLocationsFor(widget.initLocation!.name);
    }
  }

  void onBackClicked() {
    Navigator.of(context).pop();
  }

  void onLocationSelected(Location location) {
    Navigator.of(context).pop(location);
  }

  void onSearchChanged(String searchText) {
    List<Location> newSelection = [];

    if (searchText.length > 1) {
      //Show the available location after putting 2 charaters in the search bar
      newSelection = getLocationsFor(searchText);
    }

    setState(() {
      filteredLocations = newSelection;
    });
  }

  List<Location> getLocationsFor(String text) {
    return LocationsService.availableLocations
        .where(
          (location) =>
              location.name.toUpperCase().contains(text.toUpperCase()),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Select Location")),
      body: Padding(
        padding: const EdgeInsets.only(
          left: BlaSpacings.m,
          right: BlaSpacings.m,
          top: BlaSpacings.s,
        ),
        child: Column(
          children: [
            //Top Search Bar
            BlaSearchBar(
              onBackClicked: onBackClicked,
              onSearchChanged: onSearchChanged,
            ),

            //Locations search reult
            Expanded(
              child: ListView.builder(
                itemCount: filteredLocations.length,
                itemBuilder: (ctx, index) => LocationTile(
                  location: filteredLocations[index],
                  onSelected: onLocationSelected,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///
/// This tile represents a lcation iten in the search result
///

class LocationTile extends StatelessWidget {
  final Location location;
  final Function(Location location) onSelected;
  const LocationTile({
    super.key,
    required this.location,
    required this.onSelected,
  });

  String get title => location.name;
  String get subTitle => location.country.name;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onSelected(location),
      title: Text(
        title,
        style: BlaTextStyles.body.copyWith(color: BlaColors.textNormal),
      ),
      subtitle: Text(
        subTitle,
        style: BlaTextStyles.label.copyWith(color: BlaColors.textLight),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: BlaColors.iconLight,
        size: 16,
      ),
    );
  }
}

///
/// Location Picker Search Bar
///

class BlaSearchBar extends StatefulWidget {
  const BlaSearchBar({
    super.key,
    required this.onSearchChanged,
    required this.onBackClicked,
  });

  final Function(String text) onSearchChanged;
  final VoidCallback onBackClicked;

  @override
  State<BlaSearchBar> createState() => _BlaSearchBarState();
}

class _BlaSearchBarState extends State<BlaSearchBar> {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  bool get searchIsNotEmpty => _textController.text.isNotEmpty;

  void onTextChanged(String newText) {
    //Noptify Listener
    widget.onSearchChanged(newText);
    //update the cross icon for clear text
    setState(() {});
  }

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: BlaColors.backgroundAccent,
        borderRadius: BorderRadius.circular(BlaSpacings.radius),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: IconButton(
              onPressed: widget.onBackClicked,
              icon: Icon(
                Icons.arrow_back_ios,
                color: BlaColors.iconLight,
                size: 16,
              ),
            ),
          ),

          Expanded(
            child: TextField(
              focusNode: _focusNode,
              onChanged: onTextChanged,
              controller: _textController,
              style: TextStyle(color: BlaColors.textLight),
              decoration: InputDecoration(
                hintText: "Any city, street...",
                border: InputBorder.none,
                filled: false,
              ),
            ),
          ),

          searchIsNotEmpty
              ? IconButton(
                  icon: Icon(Icons.close, color: BlaColors.iconLight),
                  onPressed: () {
                    _textController.clear();
                    _focusNode.requestFocus();
                    onTextChanged("");
                  },
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
