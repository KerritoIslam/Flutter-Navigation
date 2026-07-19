# Exercise 2: Simple Login Flow

## Part 1 - Module 2: Navigator Basics

### Goal
Build a login flow using push, pushReplacement, and returning data with pop.

### Builds On
Reuses the two-screen push/pop pattern from Module 1.

### Requirements
1. Build a `LoginPage` with a 'Log In' button that navigates to `HomePage` using `Navigator.pushReplacement()` (so Login isn't reachable via back button).
2. On HomePage, add a button that navigates to `ProfilePage` using `Navigator.push()`.
3. On ProfilePage, let the user pick or type a username, then return it to HomePage via `Navigator.pop(username)`.
4. On HomePage, await the push() call and display the returned username once ProfilePage is popped.

### Hint
Use `final result = await Navigator.push(...)` on HomePage to capture the value returned from ProfilePage.

### Concepts Covered
- Navigator.push()
- Navigator.pop()
- Navigator.pushReplacement()
- Navigator.pushAndRemoveUntil()
- Passing data between screens
- Returning data using Navigator.pop(result)
