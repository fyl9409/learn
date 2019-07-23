# -*- coding: UTF-8 -*-

################################################################################
#
# Copyright (c) 2019 Baidu.com, Inc. All Rights Reserved
#
################################################################################

"""
Authors :   sangjinchao(sangjinchao@baidu.com)
Date    :   2019/07/17 19:47:15
"""

#! usr/bin/env python
#-*- coding:utf-8 -*-
import matplotlib as mpl
mpl.use('Agg')
import matplotlib.pyplot as plt
import sys

def getydata(filename):
    """
    read  log file and get the required train error rate 
    Args:
        filename: input log file name

    Returns:
        train error rate list
    """
    train_error_list = []
    with open(filename, 'rt') as f:
        for line in f:
            if line.startswith('[dev'):
                data_substr = line.split(",")
                train_acc1 = data_substr[0].split(" ")
                train_error_list.append(float(train_acc1[-1]))
    return train_error_list


# get required xdata and ydata
file_name = 'python22.log'
ytrain = getydata(file_name)
xdata = list(range(0, len(ytrain)))
print(ytrain, xdata)
fig = plt.figure()
ax = fig.add_subplot(1, 1, 1)
ax.plot(xdata, ytrain)


ax.set_xlabel("epochs")
ax.set_ylabel("loss")
ax.grid()
ax.set_title('Senta')
plt.savefig("Senta-loss-python2.png")