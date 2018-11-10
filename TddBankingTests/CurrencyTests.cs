namespace TddBankingTests
{
    using System;

    using Microsoft.VisualStudio.TestTools.UnitTesting;

    using TddBankingApp;

    [TestClass]
    public class CurrencyTests
    {
        [TestMethod]
        public void TestSimpleAddition()
        {
            var bank = new Bank("USD");
            var sum = bank.Add(Currency.Dollar(5M), Currency.Dollar(5M));
            Assert.AreEqual(sum, Currency.Dollar(10M));
        }

        [TestMethod]
        public void TestSimpleMultiplication()
        {
            var bank = new Bank("USD");
            var sum = bank.Multiply(Currency.Dollar(5M), Currency.Dollar(5M));
            Assert.AreEqual(sum, Currency.Dollar(25M));
        }

        [TestMethod]
        public void TestMixedAddition()
        {
            var bank        = new Bank("USD");
            bank.AddExchangeRate(new ExchangeRate(DateTime.Now, "CHF", "USD", 2.0M));
            var sum = bank.Add(Currency.Dollar(5M), Currency.Franc(5M));
            Assert.AreEqual(sum, Currency.Dollar(15M));

            sum = bank.Add(sum, Currency.Franc(10M));
            Assert.AreEqual(sum, Currency.Dollar(35M));
        }

        [TestMethod]
        public void TestMixedMultiplication()
        {
            var bank = new Bank("USD");
            bank.AddExchangeRate(new ExchangeRate(DateTime.Now, "CHF", "USD", 2.0M));
            var sum = bank.Multiply(Currency.Dollar(5M), Currency.Franc(5M));
            Assert.AreEqual(sum, Currency.Dollar(50M));

            sum = bank.Multiply(sum, Currency.Franc(2M));
            Assert.AreEqual(sum, Currency.Dollar(200M));
        }
    }
}