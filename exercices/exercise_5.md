# Exercise 5: Home & About with GoRouter

## Part 2 - Module 1: Introduction to GoRouter

### Goal
Configure GoRouter and navigate between Home and About screens.

### Requirements
1. Add the `go_router` package to the project.
2. Create a GoRouter instance with two GoRoutes: '/' for HomeScreen and '/about' for AboutScreen.
3. Replace MaterialApp with `MaterialApp.router`, passing the GoRouter instance as `routerConfig`.
4. Add a button on HomeScreen that navigates to '/about', and a button on AboutScreen that navigates back to '/'.

### Hint
You'll use `context.go()` for these navigations, covered in detail in the next module.

### Concepts Covered
- Why use GoRouter?
- Declarative navigation
- Setting up GoRouter
- Creating the router configuration
- MaterialApp.router
