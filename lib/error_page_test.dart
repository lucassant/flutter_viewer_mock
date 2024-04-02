 if (tag == 'dailyBankerBody') {
      showSomaBottomSheet(
          context: context,
          builder: (context) {
            return XPuzzle(
              isInverse: false,
              payload: widget.advisorProfileModel.dailyBankerBody,
              delegate: XPuzzleDelegate()..clickDelegate = this,
            );
          });
    }
