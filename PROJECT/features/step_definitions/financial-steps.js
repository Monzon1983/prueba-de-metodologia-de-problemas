const { Given, When, Then } = require('@cucumber/cucumber');
const { expect } = require('chai');
const { financialSummary } = require('../../src/financialSummary');

let transactions = [];
let result;
let error;

Given('tengo las siguientes transacciones:', function (dataTable) {
  transactions = dataTable.hashes().map(row => ({
    description: row.description,
    amount: parseFloat(row.amount),
    type: row.type
  }));
}); 

Given('no tengo transacciones', function () {
  transactions = [];
});

Given('tengo una entrada inválida', function () {
  transactions = "invalid"; // No es un array
});

When('proceso el resumen financiero con umbral {int}', function (threshold) {
  try {
    result = financialSummary(transactions, threshold);
    error = null;
  } catch (e) {
    error = e;
  }
});

When('proceso el resumen financiero', function () {
  try {
    result = financialSummary(transactions);
    error = null;
  } catch (e) {
    error = e;
  }
});

When('intento procesar el resumen financiero', function () {
  try {
    result = financialSummary(transactions);
    error = null;
  } catch (e) {
    error = e;
  }
});

Then('el balance debe ser {int}', function (expectedBalance) {
  expect(result.balance).to.equal(expectedBalance);
});

Then('el total de transacciones debe ser {int}', function (expectedCount) {
  expect(result.totalTransactions).to.equal(expectedCount);
});

Then('el promedio de ingresos debe ser {int}', function (expectedAvg) {
  expect(result.avgIncome).to.equal(expectedAvg);
});

Then('el promedio de gastos debe ser {int}', function (expectedAvg) {
  expect(result.avgExpense).to.equal(expectedAvg);
});

Then('debo tener {int} transacciones grandes', function (expectedCount) {
  expect(result.largeTransactions.length).to.equal(expectedCount);
});

Then('no debo tener transacciones grandes', function () {
  expect(result.largeTransactions.length).to.equal(0);
});

Then('debe lanzar un error', function () {
  expect(error).to.be.an('Error');
  expect(error.message).to.include('array');
});