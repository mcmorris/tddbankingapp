namespace TddBankingTests
{
    using System;

    using Microsoft.VisualStudio.TestTools.UnitTesting;

    using TddBankingApp;

    [TestClass]
    public class ExchangeRateTests
    {
        /*
        [TestMethod]
        public void TestDollarMultiplication()
        {
            var five = Money.Dollar(5);
            Assert.AreEqual(Money.Dollar(10), five.Times(2));
            Assert.AreEqual(Money.Dollar(15), five.Times(3));
        }

        [TestMethod]
        public void TestFrancMultiplication()
        {
            var five = Money.Franc(5);
            Assert.AreEqual(Money.Franc(10), five.Times(2));
            Assert.AreEqual(Money.Franc(15), five.Times(3));
        }

        [TestMethod]
        public void TestEquality()
        {
            Assert.IsTrue(Money.Dollar(5).Equals(Money.Dollar(5)));
            Assert.IsFalse(Money.Dollar(6).Equals(Money.Dollar(5)));
            Assert.IsTrue(Money.Franc(5).Equals(Money.Franc(5)));
            Assert.IsFalse(Money.Franc(6).Equals(Money.Franc(5)));
            Assert.IsFalse(Money.Dollar(5).Equals(Money.Franc(5)));
        }

        [TestMethod]
        public void TestCurrency()
        {
            Assert.AreEqual("USD", Money.Dollar(1).Currency);
            Assert.AreEqual("CHF", Money.Franc(1).Currency);
        }

        [TestMethod]
        public void TestSimpleAddition()
        {
            var five    = Money.Dollar(5);
            var sum     = five.Plus(five);
            var bank    = new Bank();
            var reduced = bank.Reduce(sum, "USD");
            Assert.IsTrue(Money.Dollar(10).Equals(reduced));
        }

        [TestMethod]
        public void TestMixedAddition()
        {
            Expression fiveBucks = Money.Dollar(5);
            Expression tenFrancs = Money.Franc(10);
            var bank = new Bank();
            bank.AddRate("CHF", "USD", 2);
            Money result = bank.Reduce(fiveBucks.Plus(tenFrancs), "USD");
            Assert.IsTrue(Money.Dollar(10).Equals(result));
        }

        [TestMethod]
        public void TestSumPlusMoney()
        {
            Expression fiveBucks = Money.Dollar(5M);
            Expression tenFrancs = Money.Franc(10M);
            var bank = new Bank();
            bank.AddRate("CHF", "USD", 2M);
            Expression sum = new Sum(fiveBucks, tenFrancs).Plus(fiveBucks);
            Money result = bank.Reduce(sum, "USD");
            Console.WriteLine(result.Amount + ", " + result.Currency);
            Assert.IsTrue(Money.Dollar(15M).Equals(result));
        }
        

        [TestMethod]
        public void TestPlusReturnsSum()
        {
            var five    = Money.Dollar(5);
            var sum     = new Sum(five, five);
            Assert.AreEqual(five, sum.Augend);
            Assert.AreEqual(five, sum.Addend);
        }

        [TestMethod]
        public void TestReduceSum()
        {
            var sum = new Sum(Money.Dollar(3), Money.Dollar(4));
            var bank = new Bank();
            var result = bank.Reduce(sum, "USD");
            Assert.AreEqual(Money.Dollar(7), result);
        }
        
        [TestMethod]
        public void TestIdentityRate()
        {
            Assert.AreEqual(1, new Bank().Rate("USD", "USD"));
        }

        [TestMethod]
        public void TestSumTimes()
        {
            Expression fiveBucks = Money.Dollar(5);
            Expression tenFrancs = Money.Franc(10);
            var bank = new Bank();
            bank.AddRate("CHF", "USD", 2);
            Expression sum = new Sum(fiveBucks, tenFrancs).Times(2);
            Money result = bank.Reduce(sum, "USD");
            Assert.AreEqual(Money.Dollar(20), result);
       }
        

        [TestMethod]
        public void TestPlusSameCurrencyReturnsMoney()
        {
            Expression sum = Money.Dollar(1).Plus(Money.Dollar(1));
            Assert.IsTrue(sum is Money);
        }
        */

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
