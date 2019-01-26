import numpy as np
import csv
from random import *
import matplotlib.pyplot as plt
from numpy.linalg import inv
import math

train = np.genfromtxt('train.csv', delimiter=",",skip_header=1)
x=train[:,0]
y=train[:,1]

x=np.reshape(x, (x.size,1))
y=np.reshape(y, (y.size,1))

w=np.random.rand(2,1)
plt.plot(x,y)
plt.show()

x=np.insert(x,0,1,axis=1)
xdash=np.matmul(x,w)

plt.plot(x[:,1],xdash,'ro')
plt.plot(x[:,1],y)
plt.show()

m=np.matmul(np.transpose(x),x)
n=np.linalg.inv(m)
o=np.matmul(np.transpose(x),y)
w_direct=np.matmul(n,o)

plt.plot(x[:,1],y)
plt.show()

w_directa=np.matmul(x,w_direct)
plt.plot(x[:,1],w_directa)
plt.plot(x[:,1],y)
plt.show()

x[1,:]

eta=0.00000001
p = len(y)
for i in (1,7):
    for j in range (1,p):
        q=np.reshape(x[j,:],(2,1))
        r=np.matmul(np.reshape(w,(1,2)),q)
        s=np.subtract(r,y[j,:])
        t=np.multiply(s, q)
        u=(eta)*t
        w=np.subtract(w,u)
        if (j%1000)==0:
            h=np.matmul(x,w)
            plt.plot(x[:,1],y)
            plt.plot(x[:,1],h,'ro')
            plt.show()     

h1=np.matmul(x,w)
plt.plot(x[:,1],h1)
plt.show()

test = np.genfromtxt('test.csv', delimiter=",",skip_header=1)
x1=test[:,0]
y1=test[:,1]

x1=np.reshape(x1, (x1.size,1))
y1=np.reshape(y1, (y1.size,1))

x1=np.insert(x1,0,1,axis=1)

y_pred1=np.matmul(x1,w)
a1=np.subtract(y_pred1,y1)
a3=np.reshape(a1,(1,y1.size))
a2=np.matmul(a3,a1)
r1=(1/(y1.size))*a2
r2=np.sqrt(r1)

print('y_pred1 error:')
print(r2)

y_pred2=np.matmul(x1,w_direct)
b1=np.subtract(y_pred2,y1)
b3=np.reshape(b1,(1,y1.size))
b2=np.matmul(b3,b1)
rt1=(1/(y1.size))*b2
rt2=np.sqrt(rt1)

print('y_pred2 error:')
print(rt2)
