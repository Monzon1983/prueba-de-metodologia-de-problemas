function financialSummary(transactions, threshold = 1000) {
  // Validar entrada
  if (!Array.isArray(transactions)) {
    throw new Error("Las transacciones deben ser un array");
  }

  // Calcular totales
  const totalIncome = transactions
    .filter(t => t.type === "income")
    .reduce((sum, t) => sum + t.amount, 0);

  const totalExpense = transactions
    .filter(t => t.type === "expense")
    .reduce((sum, t) => sum + t.amount, 0);

  const balance = totalIncome - totalExpense;
  const totalTransactions = transactions.length;

  // Calcular promedios
  const incomeCount = transactions.filter(t => t.type === "income").length;
  const expenseCount = transactions.filter(t => t.type === "expense").length;
  const avgIncome = incomeCount > 0 ? totalIncome / incomeCount : 0;
  const avgExpense = expenseCount > 0 ? totalExpense / expenseCount : 0;

  // Filtrar transacciones grandes
  const largeTransactions = transactions.filter(t => t.amount >= threshold);

  return {
    balance,
    totalTransactions,
    avgIncome,
    avgExpense,
    largeTransactions
  };
}

module.exports = { financialSummary };

// Datos de ejemplo
const transactions = [
  { id: 1, description: "Salary", amount: 5000, type: "income" },
  { id: 2, description: "Rent", amount: 1500, type: "expense" },
  { id: 3, description: "Freelance", amount: 2000, type: "income" },
  { id: 4, description: "Groceries", amount: 300, type: "expense" }
];

console.log(financialSummary(transactions, 1000));