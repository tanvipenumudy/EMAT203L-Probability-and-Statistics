wordss<-scan("C://Users//TANVI//Desktop//words.txt",what=" ") 
y<-TRUE
words<-c()
e<-1
for(value in wordss){
  words[e]<-gsub(".","",value,fixed=TRUE) 
  e<-e+1
}
sum<-c()
t<-1
for(i in 1:length(words)){
  if(words[i]=="I"){
    sum[t]<-i
    t<-t+1
  }
}
while(y==TRUE){
  print("1.predict my sentence")
  print("2.generate a sentence")
  print("3.exit")
  ans<-readline(prompt="enter your choice >")
  while(ans==1 | ans==2){
    if(ans==1){
      enter<-readline(prompt="Enter your sentence/word : ")
      w<-c(scan(text=enter,what=" "))
      enter<-w[length(w)]
      prediction<-c()
      x<-1
      k<-0
      visited=0
      frequency<-c()
      for(i in 1:length(words)){
        if(tolower(words[i])==tolower(enter) & ((i+1)!=sum[1]) & ((i+1)!=sum[2]) & ((i+1)!=sum[3]) & ((i+1)!=sum[4]) & ((i+1)!=sum[5]) & ((i+1)!=sum[6]) & ((i+1)!=sum[7]) & ((i+1)!=sum[8]) & ((i+1)!=sum[9]) & ((i+1)!=sum[10]) & ((i+1)!=sum[11]) & ((i+1)!=sum[12]) & ((i+1)!=sum[13]) & ((i+1)!=sum[14]) & ((i+1)!=sum[15]) & ((i+1)!=sum[16]) & ((i+1)!=sum[17]) & ((i+1)!=sum[18]) & ((i+1)!=sum[19]) & ((i+1)!=sum[20]) ){
          prediction[x]<-words[i+1]
          k<-k+1
          x<-x+1
        }
      }
      if(k==0){
        print("cant predict the next word")
        cat("\n")
      }
      if(k>0){
        for(i in 1:length(prediction)){
          count<-1
          for(j in i+1:length(prediction)){
            if(identical(prediction[i],prediction[j])){
              count<-count+1
              frequency[j]<-0
            }
          }
          if(!(identical(frequency[i],visited))){
            frequency[i]=count
          }
        }
        for(i in 1:length(frequency)){
          for(j in 1:length(frequency)){
            if(frequency[i]>frequency[j]){
              ptemp<-prediction[j]
              ftemp<-frequency[j]
              prediction[j]<-prediction[i]
              frequency[j]<-frequency[i]
              prediction[i]<-ptemp
              frequency[i]<-ftemp
            }
          }
        }
        for(i in 1:length(frequency)){
          if(frequency[i]!=0){
            print(prediction[i])
          }
        }
      }
      cat("\n")
      print("1.predict my sentence")
      print("2.generate a sentence")
      print("3.exit")
      ans<-readline(prompt="enter your choice : ")
    }
    if(ans==2){
      enter<-readline(prompt="Enter your sentence/word : ")
      w<-c(scan(text=enter,what=" "))
      h<-4-length(w)
      r<-c(sample(1:length(words),h,replace=T))
      ran<-c()
      a<-1
      for(i in 1:h){
        if(words[r[i]]!="I"){
          ran[a]<-tolower(words[r[i]])
          a<-a+1
        }
        else{
          ran[a]<-words[r[i]]
          a<-a+1
        }
      }
      for(i in 1:h){
        cat(ran[i]," ")
      }
      cat("\n\n")
      print("1.predict my sentence")
      print("2.generate a sentence")
      print("3.exit")
      ans<-readline(prompt="enter your  choice >")
    }
  }
  if(ans==3){
    print("program terminated")
    y<-FALSE
  }
}

