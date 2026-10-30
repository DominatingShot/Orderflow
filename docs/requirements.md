# OrderFlow Requirements

## Users
- CUSTOMER: register, log in, browse products, manage their cart,
  checkout, make simulated payments, view/cancel their own orders,
  and receive order notifications.
- ADMIN: manage categories, create/update/deactivate products, and set stock.

## MVP features
1. Product/category catalogue and paginated product search.
2. Customer registration, login and role-based authorization.
3. One active cart per customer.
4. Checkout, order history and cancellation.
5. Inventory reservation that prevents overselling.
6. Simulated payments only.
7. Reliable asynchronous order notifications.

## Business rules
- A customer can only access their own cart and orders.
- The backend calculates every price and order total.
- If the expected cart total is stale, checkout returns a price-changed conflict;
  the server never trusts that submitted total as the actual amount.
- Inventory cannot become negative.
- Retrying checkout with the same Idempotency-Key cannot create another order.
- Order status transitions must be valid.
- Stock is released exactly once on eligible payment failure/cancellation.

## Out of scope
- Frontend/website, real payment processing, card data, shipping,
  taxes, coupons, discounts and multiple warehouses.
- Microservices in the initial release.

## Technology
- Java 21, Spring Boot, Maven and PostgreSQL.
- REST/JSON API tested with Postman.
- Modular monolith first; optional notification microservice only after the
  monolith and its reliability tests are complete.