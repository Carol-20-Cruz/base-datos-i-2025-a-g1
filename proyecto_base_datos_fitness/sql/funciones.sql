-- Función para calcular IMC (índice de masa corporal)

DELIMITER //
CREATE FUNCTION calcular_IMC(peso DECIMAL(5,2), altura DECIMAL(4,2))
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    DECLARE imc DECIMAL(5,2);
    SET imc = peso / (altura * altura);
    RETURN imc;
END;
//
