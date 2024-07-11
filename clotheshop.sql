-- TODO: Add this column automatically!

ALTER TABLE users
    ADD bought_clothes JSON DEFAULT JSON_ARRAY();