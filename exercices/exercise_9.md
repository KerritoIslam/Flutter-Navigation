# Exercise 9: Movie Explorer (Final Mini Project)

## Final Mini Project

### Goal
Build a complete application using GoRouter that combines every navigation concept covered across both parts of the course.

### Requirements
- Splash Screen
- Login Screen
- Home Screen
- Bottom Navigation with: Movies, Favorites, Profile
- Movie Details screen using a route parameter
- Settings screen using a named route
- Pass the selected movie using extra
- Use `context.go()` and `context.push()` appropriately
- Implement the Bottom Navigation using `ShellRoute` so it remains visible while navigating between tabs

### Flow
```
App Launch -> Splash -> (auto) -> Login -> (on login) -> Home (ShellRoute with Bottom Nav)
  Tab 1: Movies -> (tap movie) -> Movie Details (push, with extra)
  Tab 2: Favorites
  Tab 3: Profile -> (tap settings) -> Settings (push, named route)
```

### Checklist
- [ ] GoRouter configured with all routes
- [ ] Splash screen with auto-navigation
- [ ] Login screen with form
- [ ] ShellRoute with BottomNavigationBar
- [ ] Movies tab with list
- [ ] Movie Details with path parameter + extra
- [ ] Favorites tab
- [ ] Profile tab
- [ ] Settings screen (named route)
- [ ] context.go() for main flows
- [ ] context.push() for details/settings
- [ ] context.pop() works correctly
- [ ] Bottom nav stays visible across tabs
- [ ] Active tab highlighted correctly
