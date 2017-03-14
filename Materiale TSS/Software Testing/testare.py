from verificare_vector import verificare_vector
from unittest import TestCase
import numpy as np

class Teste(TestCase):
    def testareClaseEchivalenta(self):
        v = [1, 2, 3, 4, 5]
        self.assertTrue(verificare_vector(5,v,4))
        self.assertFalse(verificare_vector(5,v,3))
        self.assertFalse(verificare_vector(5,v,-1))
        self.assertFalse(verificare_vector(5,v,5))
        v = [1, -1, 2, 3, 4]
        self.assertFalse(verificare_vector(5,v,1))
        self.assertFalse(verificare_vector(0,None,None))
        self.assertFalse(verificare_vector(51,None,None))

    def testareValFrontiera(self):
        self.assertFalse(verificare_vector(0,None,0))
        self.assertFalse(verificare_vector(0,None,49))
        self.assertTrue(verificare_vector(1,[1],0))
        self.assertFalse(verificare_vector(1,[1],49))
        v = np.ones(50) + 2
        self.assertTrue(verificare_vector(50,v,0))
        self.assertFalse(verificare_vector(50,v,49))
        v = np.ones(51) + 2
        self.assertFalse(verificare_vector(51,v,0))
        self.assertFalse(verificare_vector(51,v,49))
    def testareCategorii(self):
        self.assertFalse(verificare_vector(-1,[],0))
        self.assertFalse(verificare_vector(0,[],0))
        self.assertFalse(verificare_vector(1,[2],-1))
        self.assertTrue(verificare_vector(1,[2],0))
        self.assertFalse(verificare_vector(1,[2],2))
        self.assertFalse(verificare_vector(1,[-1],1))
        self.assertFalse(verificare_vector(2,[1,2],-1))
        self.assertTrue(verificare_vector(2,[2,2],0))
        self.assertFalse(verificare_vector(2,[2,2],3))
        self.assertFalse(verificare_vector(2,[-1,1],1))
        v = np.ones(50) + 1
        self.assertFalse(verificare_vector(50,v,-1))
        self.assertTrue(verificare_vector(50,v,0))
        self.assertFalse(verificare_vector(50,v,51))
        v = -v
        self.assertFalse(verificare_vector(50,v,0))
        self.assertFalse(verificare_vector(51,[],49))
    def statementCoverage(self):
        self.assertFalse(verificare_vector(0,[],0))
        self.assertFalse(verificare_vector(1,[-4],0))
        self.assertTrue(verificare_vector(1,[2],0))
    def branchCoverage(self):
        self.assertFalse(verificare_vector(0,[],0))
        self.assertFalse(verificare_vector(1,[],-1))
        self.assertFalse(verificare_vector(1,[1],-1))
        self.assertTrue(verificare_vector(1,[1],0))
        self.assertFalse(verificare_vector(1,[1],1))
        self.assertFalse(verificare_vector(2,[1],0))
    def conditionCoverage(self):
        self.assertFalse(verificare_vector(0,[],0))
        v = np.ones(51)
        self.assertFalse(verificare_vector(51,[],0))
        self.assertFalse(verificare_vector(1,[5],-1))
        self.assertFalse(verificare_vector(1,[5],1))
        self.assertFalse(verificare_vector(2,[5],0))
        self.assertFalse(verificare_vector(1,[-1],0))
        self.assertTrue(verificare_vector(1,[1],0))
    def caiTestare(self):
        self.assertFalse(verificare_vector(0,[],0))
        self.assertFalse(verificare_vector(1,[-1],0))
        self.assertTrue(verificare_vector(1,[2],0))
        
#test = Teste()
#test.testareClaseEchivalenta()
#test.testareValFrontiera()
#test.testareCategorii()
#test.statementCoverage()
#test.branchCoverage()
#test.conditionCoverage()
#test.caiTestare()

