
# workbench.action.terminal.clear

import numpy as np
import matplotlib.pyplot as plt
import math
import pickle

import sys, os
#sys.path.append(os.pardir)
#from dataset.mnist import load_mnist

from PIL import Image
    

def img_show(img):
    pil_img = Image.fromarray(np.uint8(img))
    pil_img.show()

def step_function(x):
    #y = x>0
    #return y.astype(np.int)
    return np.array(x>0, dtype=np.int)

def sigmoid(x):
    return 1 / (1 + np.exp(-x))

def relu(x):
    return np.maximum(0, x)

def identity_function(x):
    return x

def softmax(a):
    c = np.max(a)
    y = np.exp(a - c) / np.sum(np.exp(a - c))

    return y


def init_network():
    with open("sample_weight.pkl", 'rb') as f:  #
        network = pickle.load(f)

    return network


def get_test_data():
    (x_train, t_train), (x_test, t_test) = load_mnist(flatten=True, normalize=True, one_hot_label=True)
    return x_test, t_test

def get_train_data():
    (x_train, t_train), (x_test, t_test) = load_mnist(flatten=True, normalize=True, one_hot_label=False)
    return x_train, t_train    


def forward(x, network):
    W1, W2, W3 = network['W1'], network['W2'], network['W3']
    b1, b2, b3 = network['b1'], network['b2'], network['b3']

    a1 = np.dot(x, W1) + b1
    z1 = sigmoid(a1)

    a2 = np.dot(z1, W2) + b2
    z2 = sigmoid(a2)

    a3 = np.dot(z2, W3) + b3
    y = identity_function(a3)

    return y


def predict(network, x):
    W1, W2, W3 = network['W1'], network['W2'], network['W3']
    b1, b2, b3 = network['b1'], network['b2'], network['b3']

    a1 = np.dot(x, W1) + b1
    z1 = sigmoid(a1)

    a2 = np.dot(z1, W2) + b2
    z2 = sigmoid(a2)

    a3 = np.dot(z2, W3) + b3
    y = softmax(a3)

    return y


def mean_square_error(y, t):
    return 0.5 * np.sum((y-t)**2)


def cross_entropy_error(y, t):
    if y.ndim == 1:
        t = t.reshape(1, t.size)
        y = y.shape(1, t.size)

    
    batch_size = 10
    delta = 1e-7
    return np.sum(t * np.log(y + delta))


def numerical_diff(f, x):
    h = 1e-4

    return ( f(x+h) - f(x-h) ) / (2*h)


def function_2(x):
    return x[0]**2 + x[1]**2 



def numerical_gradient(f, x):
    h = 1e-4

    #grad = np.array([0]*(x.size))
    grad = np.zeros_like(x)

    for idx in range(x.size):
        tmp_val = x[idx]  
        #f(x+h)
        x[idx] = tmp_val + h
        fxh2 = f(x) 

        #f(x-h)
        x[idx] = tmp_val - h
        fxh1 = f(x)  

        grad[idx] = (fxh2 - fxh1) / (2*h)

        x[idx] = tmp_val

    return grad

# aFileName: "nuchaclub4ai.pickle"
def dumpObject(aFileName, aObject):
    f = open(aFileName, "wb")
    pickle.dump(aObject, f)
    f.close()

    return

def loadObject(aFileName):
    f = open(aFileName, "rb")
    obj = pickle.load(f)
    f.close()

    return obj

def flatten_array(aArray):
    return np.hstack(aArray) #aArray.flatten()

def array_to_list(aNumpyArray):
    return aNumpyArray.tolist()




if __name__ == "__main__":
    my_array = np.array([[2, 3], [4, 5], [0, 1]])
    fArray = flatten_array(my_array)

    print(fArray)
    print(array_to_list(fArray))



    # print(-numerical_gradient(function_2, np.array([3.0, 4.0]) ))
  
