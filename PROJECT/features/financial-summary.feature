Feature: Resumen Financiero
  Como usuario del sistema financiero
  Quiero poder obtener un resumen de mis transacciones
  Para tomar mejores decisiones financieras

  Scenario: Calcular balance con transacciones mixtas
    Given tengo las siguientes transacciones:
      | description | amount | type    |
      | Salary      | 5000   | income  |
      | Rent        | 1500   | expense |
      | Freelance   | 2000   | income  |
      | Groceries   | 300    | expense |
    When proceso el resumen financiero con umbral 1000
    Then el balance debe ser 5200
    And el total de transacciones debe ser 4
    And el promedio de ingresos debe ser 3500
    And el promedio de gastos debe ser 900
    And debo tener 3 transacciones grandes

  Scenario: Manejar array vacío
    Given no tengo transacciones
    When proceso el resumen financiero
    Then el balance debe ser 0
    And el total de transacciones debe ser 0
    And el promedio de ingresos debe ser 0
    And el promedio de gastos debe ser 0
    And no debo tener transacciones grandes

  Scenario: Error con entrada inválida
    Given tengo una entrada inválida
    When intento procesar el resumen financiero
    Then debe lanzar un error