-- Local seed data for manual testing (categories, products, inventory).
-- Repeatable migration: Flyway re-runs this file only when its contents change.
-- Safe to re-run: ON CONFLICT DO NOTHING skips rows that already exist.
-- No users or passwords are seeded.

INSERT INTO categories (name) VALUES
    ('Electronics'),
    ('Books'),
    ('Home & Kitchen')
ON CONFLICT (name) DO NOTHING;

INSERT INTO products (category_id, sku, name, description, price, active)
SELECT c.id, v.sku, v.name, v.description, v.price, TRUE
FROM (VALUES
    ('Electronics',    'ELEC-001', 'Wireless Mouse',     'Ergonomic 2.4 GHz wireless mouse',            799.00),
    ('Electronics',    'ELEC-002', 'USB-C Charger 65W',  'Fast charger with USB-C port',               1499.00),
    ('Books',          'BOOK-001', 'Clean Code',         'A handbook of agile software craftsmanship',  599.00),
    ('Books',          'BOOK-002', 'Effective Java',     'Best practices for the Java platform',        699.00),
    ('Home & Kitchen', 'HOME-001', 'Steel Water Bottle', '1 litre insulated bottle',                    449.00),
    ('Home & Kitchen', 'HOME-002', 'Non-stick Pan',      '24 cm non-stick frying pan',                  899.00)
) AS v(category_name, sku, name, description, price)
JOIN categories c ON c.name = v.category_name
ON CONFLICT (sku) DO NOTHING;

INSERT INTO inventory (product_id, available_quantity)
SELECT p.id, v.qty
FROM (VALUES
    ('ELEC-001', 50), ('ELEC-002', 30),
    ('BOOK-001', 100), ('BOOK-002', 80),
    ('HOME-001', 60), ('HOME-002', 40)
) AS v(sku, qty)
JOIN products p ON p.sku = v.sku
ON CONFLICT (product_id) DO NOTHING;