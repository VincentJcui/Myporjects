#encoding:utf-8

import numpy as np

class Perceptron(object):
    """
    eta: 学习率
    n_iter: 权重向量的训练次数
    w_: 神经分叉权重向量
    errors_:用于记录神经元判断出错次数
    """

    def __init__(self, eta = 0.01, n_iter=10):
        self.eta = eta
        self.n_iter = n_iter

    def fit(self, X, Y):
        """
        输入训练数据,培训神经元,x输入样本向量,y对应样本分类
        
        X:shape[n_samples, n_features]
        X:[[1, 2, 3], [4, 5, 6]]
        n_samples: 2
        n_features: 3
        
        Y:[1, -1]
        """

        """
        初始化权重向量为0
        加一是因为前面算法提到的W0,也就是步调函数阈值
        """
        self.w_ = np.zero(1 + X.shape[1])
        self.errors_ = []

        for _ in range(self.n_iter):
            errors = 0
            """
            X: [[1, 2, 3], [4, 5, 6]]
            Y: [1, -1]
            zip(X,Y) = [[1, 2, 3, 1], [4, 5, 6, -1]]
            """
            for xi, target in zip(X, Y):
                """
                update = n * (y - y')
                """
                update = self.eta * (target - self.predict(xi))

                """
                xi 是一个向量
                update * xi 等价: [W(1) = X[1]*update , W(2) = X[2]*update ,W(3) = X[3]*update ]
                """
                self.w_[1:] += update * xi
                self._w[0] += update

                errors += int(update != 0.0)
                self.errors_.append(errors)

    def net_input(self, X):
        """
        z = W0*1 + W1*X1 + .... + Wn*Xn
        """
        return np.dot(X, self.w_[1:] + self.w_[0])
        pass

    def predict(self, X):

        return np.where(self.net_input(X) >= 0.0 ,1 ,-1)