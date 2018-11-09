namespace TddBankingTests
{
    using System;

    using Microsoft.VisualStudio.TestTools.UnitTesting;

    using TddBankingApp;

    [TestClass]
    public class CurrencyTests
    {
        [TestMethod]
        public void TestCurrencyDate()
        {
            var money1 = Currency.Dollar(5);
            var money2 = Currency.Dollar(5);

            // Then how to get money rates?
            var bank = new Bank("USD");
            var localMoney1 = bank.ConvertToLocal(money1);
            var localMoney2 = bank.ConvertToLocal(money2);

            var sum = localMoney1.Amount + localMoney2.Amount;
            Assert.AreEqual(sum, 10M);
        }
    }
}