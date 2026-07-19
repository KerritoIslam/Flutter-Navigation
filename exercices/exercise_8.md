# Exercise 8: ShellRoute Conversion

## Part 2 - Module 4: Nested Navigation with ShellRoute

### Goal
Convert a Bottom Navigation app into a ShellRoute implementation while keeping the navigation bar visible across screens.

### Builds On
Converts the Shopping App Tabs practice from Part 1, Module 3 into GoRouter's ShellRoute.

### Requirements
1. Wrap the Home, Favorites, and Profile GoRoutes inside a single `ShellRoute`.
2. Implement the shell's builder to return a Scaffold containing a `BottomNavigationBar` and the given child widget as its body.
3. Wire the BottomNavigationBar's onTap to navigate using `context.go()` to each tab's path.
4. Confirm the navigation bar remains visible and correctly highlights the active tab as you move between Home, Favorites, and Profile.

### Hint
The BottomNavigationBar's currentIndex should be derived from the current route path (e.g. by checking `state.uri` or `GoRouterState.of(context).matchedLocation`) rather than a manually tracked variable.

### Concepts Covered
- What is ShellRoute?
- Persistent Bottom Navigation
- Nested navigation
- When to use ShellRoute
