CREATE TABLE inventory (
    product_id         BIGINT      PRIMARY KEY,
    available_quantity INTEGER     NOT NULL CHECK (available_quantity >= 0),
    updated_at         TIMESTAMPTZ NOT NULL DEFAULT now(),

    CONSTRAINT fk_inventory_product FOREIGN KEY (product_id) REFERENCES products (id)
);