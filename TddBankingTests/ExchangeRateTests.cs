namespace TddBankingTests
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
            var newRate = new ExchangeRate(fixedNow, "CHF", "USD", 2.0M);
            Assert.AreEqual(newRate, new ExchangeRate(fixedNow, "CHF", "USD", 2.0M));

            var offsetRate = new ExchangeRate(DateTime.Now, "CHF", "USD", 2.1M);
            Assert.AreNotEqual(newRate, offsetRate);
        }

        [TestMethod]
        public void TestGetExchangeRate()
        {
            var bank = new Bank("USD");
            bank.AddExchangeRate(new ExchangeRate(DateTime.Now, "CHF", "USD", 2.0M));
            bank.AddExchangeRate(new ExchangeRate(DateTime.Now.AddMilliseconds(1d), "CHF", "USD", 2.1M));
            var currentRate = bank.GetExchangeRate("CHF", "USD");
            Assert.AreEqual(currentRate.ConversionRate, 2.1M);
            Assert.AreEqual(bank.GetExchangeRate("CHF", "CAD"), null);
        }


        [TestMethod]
        public void TestGetExchangeRateOn()
        {
            var targetDate = new DateTime(2012, 10, 5, 8, 0, 0);
            var bank = new Bank("USD");
            bank.AddExchangeRate(new ExchangeRate(targetDate.AddDays(-2), "CHF", "USD", 2.0M));
            bank.AddExchangeRate(new ExchangeRate(new DateTime(2012, 12, 7, 7, 0, 0), "CHF", "USD", 2.1M));
            bank.AddExchangeRate(new ExchangeRate(new DateTime(2013, 2, 8, 8, 0, 0), "CHF", "USD", 2.2M));
            Assert.AreEqual(bank.GetExchangeRateOn("CHF", "USD", targetDate), new ExchangeRate(targetDate.AddDays(-2), "CHF", "USD", 2.0M));
            Assert.AreEqual(bank.GetExchangeRateOn("CHF", "CAD", targetDate), null);
        }

        [TestMethod]
        public void TestExchangeRatesEquality()
        {
            var newRateA = new ExchangeRate(DateTime.Now, "CHF", "USD", 2.0M);
            var newRateB = new ExchangeRate(DateTime.Now, "CHF", "USD", 2.0M);
            Assert.IsTrue(newRateA.Equals(newRateB));
            Assert.IsFalse(newRateA.Equals(null));
        }
    }
}
