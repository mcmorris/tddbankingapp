using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace TddBankingTests
{
    using TddBankingApp;

    [TestClass]
    public class DollarTests
    {
        [TestMethod]
        public void TestMultiplication()
        {
            var five = new Dollar(5);
            Assert.AreEqual(new Dollar(10), five.Times(2));
            Assert.AreEqual(new Dollar(15), five.Times(3));
        }

        [TestMethod]
        public void TestEquality()
        {
            Assert.IsTrue(new Dollar(5).Equals(new Dollar(5)));
            Assert.IsFalse(new Dollar(6).Equals(new Dollar(5)));
        }
    }
}
