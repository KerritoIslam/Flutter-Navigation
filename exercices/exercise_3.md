# Exercise 3: Shopping App Tabs

## Part 1 - Module 3: Bottom Navigation Bar

### Goal
Build a shopping app with three tabs, preserving each tab's state when switching.

### Builds On
Uses the setState/StatefulWidget patterns established in the Dynamic UI course.

### Requirements
1. Create a StatefulWidget shell with a `BottomNavigationBar` containing Home, Favorites, and Profile items.
2. Track the selected tab index in state, updating it via onTap with setState().
3. Display the current page using `IndexedStack` instead of directly swapping widgets, so state (e.g. scroll position) isn't lost.
4. Confirm that scrolling down on Home, switching to Favorites, then switching back to Home preserves the scroll position.

### Hint
`IndexedStack(index: selectedIndex, children: [HomePage(), FavoritesPage(), ProfilePage()])` inside the Scaffold body.

### Concepts Covered
- BottomNavigationBar
- Managing the selected index
- Switching between pages
- Preserving page state with IndexedStack
- When to use Bottom Navigation
