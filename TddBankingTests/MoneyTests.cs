﻿namespace TddBankingTests
{
    using System;

    using Microsoft.VisualStudio.TestTools.UnitTesting;

    using TddBankingApp;

    [TestClass]
    public class MoneyTests
    {
        [TestMethod]
        public void TestSimpleAddition()
        {
            var bank = new Bank(new StockExchange(), new MockUpCurrencyListing(), "USD");
            var runCommands = new MoneyHandler();
            var result = runCommands.Add(bank, bank.Dollar(5M), bank.Dollar(5M));
            Assert.AreEqual(result, bank.Dollar(10M));
        }

        [TestMethod]
        public void TestSimpleSubtraction()
        {
            var bank = new Bank(new StockExchange(), new MockUpCurrencyListing(), "USD");
            var runCommands = new MoneyHandler();
            var result      = runCommands.Add(bank, bank.Dollar(5M), bank.Dollar(-5M));
            Assert.AreEqual(result, bank.Dollar(0M));
        }
        
        [TestMethod]
        public void TestSimpleMultiplication()
        {
            var bank = new Bank(new StockExchange(), new MockUpCurrencyListing(), "USD");
            var runCommands = new MoneyHandler();
            var product     = runCommands.Multiply(bank, bank.Dollar(5M), bank.Dollar(5M));
            Assert.AreEqual(product, bank.Dollar(25M));
        }

        [TestMethod]
        public void TestMixedAddition()
        {
            var stockExchange = new StockExchange();
            stockExchange.AddExchangeRate(StockExchange.ExchangeRate(DateTime.Now, "CHF", "USD", 2.0M));
            var bank = new Bank(stockExchange, new MockUpCurrencyListing(), "USD");

            var runCommands = new MoneyHandler();
            var result = runCommands.Add(bank, bank.Dollar(5M), bank.Franc(5M));
            Assert.AreEqual(result, bank.Dollar(15M));

            result = runCommands.Add(bank, result, bank.Franc(10M));
            Assert.AreEqual(result, bank.Dollar(35M));

            result = runCommands.Undo(bank.Franc(10M));
            Assert.AreEqual(result, bank.Dollar(15M));

            result = runCommands.Redo(bank, bank.Franc(10M));
            Assert.AreEqual(result, bank.Dollar(35M));
        }

        [TestMethod]
        public void TestMixedSubtraction()
        {
            var stockExchange = new StockExchange();
            stockExchange.AddExchangeRate(StockExchange.ExchangeRate(DateTime.Now, "CHF", "USD", 2.0M));
            var bank = new Bank(stockExchange, new MockUpCurrencyListing(), "USD");

            var runCommands = new MoneyHandler();
            var result = runCommands.Add(bank, bank.Dollar(5M), bank.Franc(-5M));
            Assert.AreEqual(result, bank.Dollar(-5M));

            result = runCommands.Add(bank, result, bank.Franc(10M));
            Assert.AreEqual(result, bank.Dollar(15M));
        }

        [TestMethod]
        public void TestMixedMultiplication()
        {
            var stockExchange = new StockExchange();
            stockExchange.AddExchangeRate(StockExchange.ExchangeRate(DateTime.Now, "CHF", "USD", 2.0M));
            var bank = new Bank(stockExchange, new MockUpCurrencyListing(), "USD");

            var runCommands = new MoneyHandler();
            var product = runCommands.Multiply(bank, bank.Dollar(5M), bank.Franc(5M));
            Assert.AreEqual(product, bank.Dollar(50M));

            product = runCommands.Multiply(bank, product, bank.Franc(2M));
            Assert.AreEqual(product, bank.Dollar(200M));

            product = runCommands.Undo(bank.Franc(2M));
            Assert.AreEqual(product, bank.Dollar(50M));

            product = runCommands.Redo(bank, bank.Franc(2M));
            Assert.AreEqual(product, bank.Dollar(200M));
        }

        [TestMethod]
        public void TestMoneyEquality()
        {
            var stockExchange = new StockExchange();
            stockExchange.AddExchangeRate(StockExchange.ExchangeRate(DateTime.Now, "CHF", "USD", 2.0M));
            var bank = new Bank(stockExchange, new MockUpCurrencyListing(), "USD");

            Assert.IsTrue(bank.Dollar(5M).Equals(bank.Dollar(5M)));
            Assert.IsFalse(bank.Dollar(5M).Equals(bank.Franc(5M)));
            Assert.IsTrue(bank.Franc(10M).Equals(bank.Franc(10M)));
            Assert.IsFalse(bank.Dollar(5M).Equals(null));
        }
    }
}