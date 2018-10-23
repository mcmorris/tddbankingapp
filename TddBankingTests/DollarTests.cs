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
            var five = new Dollar(5);
            Assert.AreEqual(new Dollar(10), five.Times(2));
            Assert.AreEqual(new Dollar(15), five.Times(3));
        }

        [TestMethod]
        public void TestFrancMultiplication()
        {
            var five = new Franc(5);
            Assert.AreEqual(new Franc(10), five.Times(2));
            Assert.AreEqual(new Franc(15), five.Times(3));
        }

        [TestMethod]
        public void TestEquality()
        {
            Assert.IsTrue(new Dollar(5).Equals(new Dollar(5)));
            Assert.IsFalse(new Dollar(6).Equals(new Dollar(5)));
            Assert.IsTrue(new Franc(5).Equals(new Franc(5)));
            Assert.IsFalse(new Franc(6).Equals(new Franc(5)));
        }
    }
}
