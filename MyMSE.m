function result = MyMSE(I1, I2)
    result = mean2([I1 - I2].^2);