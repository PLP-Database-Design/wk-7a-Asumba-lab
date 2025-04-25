-- Drop the table if it already exists
DROP TABLE IF EXISTS ProductDetail_1NF_v2;

-- Create the new normalized table
CREATE TABLE ProductDetail_1NF_v2 (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(50)
);

-- Insert atomic product values
INSERT INTO ProductDetail_1NF_v2 (OrderID, CustomerName, Product)
VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');




-- Step 1: Drop all referencing tables first
DROP TABLE IF EXISTS orderproducts;
DROP TABLE IF EXISTS OrderDetails_2NF;

-- Step 2: Now safely drop Orders
DROP TABLE IF EXISTS Orders;

-- Step 3: Recreate Orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Step 4: Recreate OrderDetails_2NF
CREATE TABLE OrderDetails_2NF (
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Step 5: Insert sample data
INSERT INTO Orders (OrderID, CustomerName)
VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

INSERT INTO OrderDetails_2NF (OrderID, Product, Quantity)
VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

