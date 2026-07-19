# Exercise 7: Product List & Details

## Part 2 - Module 3: Passing Data Between Routes

### Goal
Create a product list, open a details screen using a route parameter, and pass the full object using extra.

### Builds On
Extends the route configuration from Part 2, Module 2.

### Requirements
1. Create a `ProductListScreen` showing a list of sample products.
2. Add a GoRoute at '/product/:id' for `ProductDetailsScreen`, reading the id from `state.pathParameters`.
3. When tapping a product, navigate with `context.push('/product/${product.id}', extra: product)`.
4. In ProductDetailsScreen's builder, read the full product object from `state.extra` and display its full details (not just the id).

### Hint
The path parameter tells you which product, while extra avoids needing to look it up again from a list - both are commonly used together.

### Concepts Covered
- Path parameters
- Query parameters
- Passing objects with extra
- Accessing route data
