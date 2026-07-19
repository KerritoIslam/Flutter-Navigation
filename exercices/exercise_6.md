# Exercise 6: Splash, Login, Home Flow

## Part 2 - Module 2: Basic Navigation with GoRouter

### Goal
Build a three-screen app: Splash, Login, and Home.

### Builds On
Extends the GoRouter setup from Part 2, Module 1.

### Requirements
1. Configure three GoRoutes: '/splash', '/login', and '/home', with initialLocation set to '/splash'.
2. On SplashScreen, after a short delay, use `context.go('/login')` to move to the login screen (replacing splash so back doesn't return to it).
3. On LoginScreen, use `context.go('/home')` on successful 'login' to move to Home, replacing Login on the stack.
4. From HomeScreen, add a button that uses `context.push('/login')` just to demonstrate push retains a back stack, then pop it with `context.pop()`.

### Hint
Use `context.go()` for the splash->login->home flow (no back-stack desired) and `context.push()`/`pop()` only for the demonstration button.

### Concepts Covered
- GoRoute
- Initial location
- context.go()
- context.push()
- context.pop()
- Named routes
