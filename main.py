import ctypes

so=ctypes.CDLL("./asd.so")

so.puthello()

str = raw_input("Enter your input: ");
print "Received input is : ", str
