import csv
from tabulate import tabulate
import numpy as np
file_names = [
    'dataset.csv']
x=[]
y=[]
for name in file_names:

    with open(name) as csvfile:
        reader = csv.reader(csvfile)
        headers = next(reader)
        for row in reader:
            dat1 = [float(row[0]),float(row[1]),float(row[2]),float(row[3]),float(row[4]),float(row[5]),float(row[6]),float(row[7]),float(row[8]),float(row[9])]
            dat2=[float(row[10])]
            x.append(dat1)
            y.append(dat2)
           
X=np.array(x)
Y=np.array(y)

#Y=np.transpose(Y) multiply
#print(tabulate(np.transpose(X)))          
Xt=np.transpose(X)


print("XtX\n")
XtX=np.dot(Xt,X)
print(XtX.shape,"\n")
#print(XtX)

#print(tabulate(XtX))
print("XtXinv\n")
XtXinv= np.linalg.pinv(XtX)
print(XtXinv.shape,"\n")

print("finalXexpn  (XtX)-1.Xt\n")
finalXexpn=np.dot(XtXinv,Xt)
print(finalXexpn.shape,"\n")

print("Y")
print(Y.shape,"\n")

print("Qcap\n")
Qcap=np.dot(finalXexpn,Y)
Qcap=np.transpose(Qcap)
print(Qcap.shape,"\n")


print("Ycap\n")
Ycap=np.dot(Qcap,Xt)
Ycap=np.transpose(Ycap)
print(Ycap.shape,"\n")

print("mse")
mse = np.square(np.subtract(Y, Ycap)).mean()

print(mse)



import seaborn as sns
import pandas as pd
import numpy as np

rs = np.random.RandomState(0)
df = pd.DataFrame(rs.rand(10, 10))
corr = df.corr()
corr.style.background_gradient(cmap='coolwarm')
corr.style.background_gradient(cmap='coolwarm').set_properties(**{'font-size': '0pt'})