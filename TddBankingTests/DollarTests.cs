using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace TddBankingTests
{
    using TddBankingApp;

    [TestClass]
    public class DollarTests
    {
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
    }
}
