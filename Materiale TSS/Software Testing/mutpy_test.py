from test import test
from unittest import TestCase
class Teste(TestCase):
    def testare(self):
        self.assertTrue(test(5,4))
        self.assertFalse(test(3,4))

test1 = Teste()
test1.testare()
