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
            var runCommands = new CurrencyHandler();
            var result = runCommands.Add(bank, MoneyFactory.Dollar(5M), MoneyFactory.Dollar(5M));
            Assert.AreEqual(result, MoneyFactory.Dollar(10M));
        }

        [TestMethod]
        public void TestSimpleSubtraction()
        {
            var bank = new Bank("USD");
            var runCommands = new CurrencyHandler();
            var result      = runCommands.Add(bank, MoneyFactory.Dollar(5M), MoneyFactory.Dollar(-5M));
            Assert.AreEqual(result, MoneyFactory.Dollar(0M));
        }
        
        [TestMethod]
        public void TestSimpleMultiplication()
        {
            var bank = new Bank("USD");
            var runCommands = new CurrencyHandler();
            var product     = runCommands.Multiply(bank, MoneyFactory.Dollar(5M), MoneyFactory.Dollar(5M));
            Assert.AreEqual(product, MoneyFactory.Dollar(25M));
        }

        [TestMethod]
        public void TestMixedAddition()
        {
            var bank        = new Bank("USD");
            bank.AddExchangeRate(new ExchangeRate(DateTime.Now, "CHF", "USD", 2.0M));
            var runCommands = new CurrencyHandler();
            var result = runCommands.Add(bank, MoneyFactory.Dollar(5M), MoneyFactory.Franc(5M));
            Assert.AreEqual(result, MoneyFactory.Dollar(15M));

            result = runCommands.Add(bank, result, MoneyFactory.Franc(10M));
            Assert.AreEqual(result, MoneyFactory.Dollar(35M));

            result = runCommands.Undo(MoneyFactory.Franc(10M));
            Assert.AreEqual(result, MoneyFactory.Dollar(15M));

            result = runCommands.Redo(bank, MoneyFactory.Franc(10M));
            Assert.AreEqual(result, MoneyFactory.Dollar(35M));
        }


        [TestMethod]
        public void TestMixedSubtraction()
        {
            var bank = new Bank("USD");
            bank.AddExchangeRate(new ExchangeRate(DateTime.Now, "CHF", "USD", 2.0M));
            var runCommands = new CurrencyHandler();
            var result = runCommands.Add(bank, MoneyFactory.Dollar(5M), MoneyFactory.Franc(-5M));
            Assert.AreEqual(result, MoneyFactory.Dollar(-5M));

            result = runCommands.Add(bank, result, MoneyFactory.Franc(10M));
            Assert.AreEqual(result, MoneyFactory.Dollar(15M));
        }

        [TestMethod]
        public void TestMixedMultiplication()
        {
            var bank = new Bank("USD");
            bank.AddExchangeRate(new ExchangeRate(DateTime.Now, "CHF", "USD", 2.0M));
            var runCommands = new CurrencyHandler();
            var product = runCommands.Multiply(bank, MoneyFactory.Dollar(5M), MoneyFactory.Franc(5M));
            Assert.AreEqual(product, MoneyFactory.Dollar(50M));

            product = runCommands.Multiply(bank, product, MoneyFactory.Franc(2M));
            Assert.AreEqual(product, MoneyFactory.Dollar(200M));

            product = runCommands.Undo(MoneyFactory.Franc(2M));
            Assert.AreEqual(product, MoneyFactory.Dollar(50M));

            product = runCommands.Redo(bank, MoneyFactory.Franc(2M));
            Assert.AreEqual(product, MoneyFactory.Dollar(200M));
        }
    }
}