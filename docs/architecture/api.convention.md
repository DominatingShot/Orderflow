# API Conventions

## 1. URL Structure
- All endpoints start with /api/v1.
- Use resource-based names such as /products and /orders.
- Use plural nouns for collections.

## 2. Request and Response
- Use JSON for request and response bodies.
- Use Content-Type: application/json for JSON requests.
- Do not expose JPA entities directly.
- Use request and response DTOs.

## 3. Pagination
- Page numbering starts at 0.
- Default page size is 20.
- Maximum page size is 100.
- Use page, size and sort query parameters.
- Only explicitly supported sort fields are allowed.

Example:
GET /api/v1/products?page=0&size=20&sort=name,asc

## 4. Timestamps
- Use UTC.
- Use ISO 8601 format, for example:
  2026-10-25T12:30:00Z

## 5. HTTP Status Codes
- 200: Request succeeded.
- 201: Resource created.
- 204: Request succeeded with no response body.
- 400: Invalid request.
- 401: Authentication required or invalid.
- 403: Insufficient permissions.
- 404: Resource not found.
- 409: Business conflict.
- 500: Unexpected server error.

## 6. Error Responses
- Use Spring's ProblemDetail format.
- Include a clear title, status and safe detail.
- Include a stable application error code when useful.
- Never expose stack traces, SQL errors or secrets.

## 7. Security
- Product and category reads are public.
- Product/category/inventory changes require ADMIN.
- Cart, orders and payments require authentication.
- Customers can access only their own carts and orders.

## 8. Business Rules
- The backend calculates prices and order totals.
- Inventory must never become negative.
- Checkout must be idempotent.
- Invalid order state transitions are rejected.