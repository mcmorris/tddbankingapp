﻿namespace TddBankingTests
{
    using System;

    using Microsoft.VisualStudio.TestTools.UnitTesting;

    using TddBankingApp;

    [TestClass]
    public class ExchangeRateTests
    {
        [TestMethod]
        public void TestAddExchangeRates()
        {
            var fixedNow = DateTime.Now;
            var newRate = StockExchange.ExchangeRate(fixedNow, "CHF", "USD", 2.0M);
            Assert.AreEqual(newRate, StockExchange.ExchangeRate(fixedNow, "CHF", "USD", 2.0M));

            var offsetRate = StockExchange.ExchangeRate(DateTime.Now, "CHF", "USD", 2.1M);
            Assert.AreNotEqual(newRate, offsetRate);
        }

        [TestMethod]
        public void TestGetExchangeRate()
        {
            var stockExchange = new StockExchange();
            stockExchange.AddExchangeRate(StockExchange.ExchangeRate(DateTime.Now, "CHF", "USD", 2.0M));
            stockExchange.AddExchangeRate(StockExchange.ExchangeRate(DateTime.Now.AddMilliseconds(1d), "CHF", "USD", 2.1M));
            var bank = new Bank(stockExchange, new MockUpCurrencyListing(), "USD");

            var currentRate = stockExchange.GetExchangeRate("CHF", "USD");
            Assert.AreEqual(currentRate.ConversionRate, 2.1M);
            Assert.AreEqual(bank.GetInternalExchangeRate("CHF"), currentRate);
            Assert.AreEqual(stockExchange.GetExchangeRate("CHF", "CAD"), null);
        }

        [TestMethod]
        public void TestGetExchangeRateOn()
        {
            var targetDate = new DateTime(2012, 10, 5, 8, 0, 0);
            var stockExchange = new StockExchange();
            stockExchange.AddExchangeRate(StockExchange.ExchangeRate(targetDate.AddDays(-2), "CHF", "USD", 2.0M));
            stockExchange.AddExchangeRate(StockExchange.ExchangeRate(new DateTime(2012, 12, 7, 7, 0, 0), "CHF", "USD", 2.1M));
            stockExchange.AddExchangeRate(StockExchange.ExchangeRate(new DateTime(2013, 2, 8, 8, 0, 0), "CHF", "USD", 2.2M));
            Assert.AreEqual(stockExchange.GetExchangeRateOn("CHF", "USD", targetDate), StockExchange.ExchangeRate(targetDate.AddDays(-2), "CHF", "USD", 2.0M));
            Assert.AreEqual(stockExchange.GetExchangeRateOn("CHF", "CAD", targetDate), null);
        }

        [TestMethod]
        public void TestExchangeRatesEquality()
        {
            var newRateA = StockExchange.ExchangeRate(DateTime.Now, "CHF", "USD", 2.0M);
            var newRateB = StockExchange.ExchangeRate(DateTime.Now, "CHF", "USD", 2.0M);
            Assert.IsTrue(newRateA.Equals(newRateB));
            Assert.IsFalse(newRateA.Equals(null));
        }
    }
}
