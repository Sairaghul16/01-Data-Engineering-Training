#SET 4 Stored Procedurer

CREATE TABLE vehicles (
    vehicle_id INT PRIMARY KEY,
    vehicle_name VARCHAR(100),
    vehicle_type VARCHAR(50),
    daily_rate DECIMAL(10,2),
    available_status VARCHAR(20)
);
INSERT INTO vehicles VALUES
(1, 'Honda City', 'Car', 2500, 'Available'),
(2, 'Toyota Innova', 'Car', 3500, 'Available'),
(3, 'Royal Enfield', 'Bike', 1200, 'Rented'),
(4, 'Activa', 'Scooter', 700, 'Available'),
(5, 'Mahindra Thar', 'SUV', 4500, 'Rented'),
(6, 'Hyundai Creta', 'SUV', 3200, 'Available'),
(7, 'KTM Duke', 'Bike', 1500, 'Available');

# 1. GetAllVehicles

DELIMITER //

CREATE PROCEDURE GetAllVehicles()
BEGIN
    SELECT * FROM vehicles;
END //

DELIMITER ;

CALL GetAllVehicles();


#2. GetAvailableVehicles

DELIMITER //

CREATE PROCEDURE GetAvailableVehicles()
BEGIN
    SELECT *
    FROM vehicles
    WHERE available_status = 'Available';
END //

DELIMITER ;

CALL GetAvailableVehicles();

# 3. Procedure accepting vehicle type

DELIMITER //

CREATE PROCEDURE GetVehiclesByType(IN p_type VARCHAR(50))
BEGIN
    SELECT *
    FROM vehicles
    WHERE vehicle_type = p_type;
END //

DELIMITER ;

CALL GetVehiclesByType('SUV');

# 4. Maximum daily rate

DELIMITER //

CREATE PROCEDURE GetVehiclesByMaxRate(IN p_max_rate DECIMAL(10,2))
BEGIN
    SELECT *
    FROM vehicles
    WHERE daily_rate <= p_max_rate;
END //

DELIMITER ;

CALL GetVehiclesByMaxRate(3000);

# 5. Update daily rate

DELIMITER //

CREATE PROCEDURE UpdateVehicleRate(
    IN p_vehicle_id INT,
    IN p_new_rate DECIMAL(10,2)
)
BEGIN
    UPDATE vehicles
    SET daily_rate = p_new_rate
    WHERE vehicle_id = p_vehicle_id;
END //

DELIMITER ;

CALL UpdateVehicleRate(1, 2800);


# 6. Change vehicle status

DELIMITER //

CREATE PROCEDURE ChangeVehicleStatus(
    IN p_vehicle_id INT,
    IN p_status VARCHAR(20)
)
BEGIN
    UPDATE vehicles
    SET available_status = p_status
    WHERE vehicle_id = p_vehicle_id;
END //

DELIMITER ;

CALL ChangeVehicleStatus(3, 'Available');

# 7. Increase daily rate by percentage

DELIMITER //

CREATE PROCEDURE IncreaseDailyRate(IN p_percentage DECIMAL(5,2))
BEGIN
    UPDATE vehicles
    SET daily_rate = daily_rate * (1 + p_percentage / 100);
END //

DELIMITER ;

CALL IncreaseDailyRate(10);

# 8. Delete vehicle

DELIMITER //

CREATE PROCEDURE DeleteVehicle(IN p_vehicle_id INT)
BEGIN
    DELETE FROM vehicles
    WHERE vehicle_id = p_vehicle_id;
END //

DELIMITER ;

CALL DeleteVehicle(7);

# 9. Vehicles between two rates

DELIMITER //

CREATE PROCEDURE GetVehiclesBetweenRates(
    IN p_min_rate DECIMAL(10,2),
    IN p_max_rate DECIMAL(10,2)
)
BEGIN
    SELECT *
    FROM vehicles
    WHERE daily_rate BETWEEN p_min_rate AND p_max_rate;
END //

DELIMITER ;

CALL GetVehiclesBetweenRates(1000, 3500);

# 10. Count vehicles by type

DELIMITER //

CREATE PROCEDURE CountVehiclesByType(IN p_type VARCHAR(50))
BEGIN
    SELECT COUNT(*) AS vehicle_count
    FROM vehicles
    WHERE vehicle_type = p_type;
END //

DELIMITER ;

CALL CountVehiclesByType('Car');
