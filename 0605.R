# --------------------- Load data by xlsx ---------------------
library(XLConnect)
list.files(".")
xlsx <- loadWorkbook("hospital.xlsx")
hospitalData <- readWorksheet(xlsx,1)
head(hospitalData)

hospitalData$Hospital_location_lat <- as.numeric(hospitalData$Hospital_location_lat)
hospitalData$Hospital_location_lng <- as.numeric(hospitalData$Hospital_location_lng)
hospitalData$Hospital_Parking <- as.factor(hospitalData$Hospital_Parking)
hospitalData$Hospital_Parking <- ifelse(hospitalData$Hospital_Parking=='是',T,F)

attach(hospitalData)

# --------------------- Data type ---------------------
typeof(Hospital_name)
typeof(Hospital_Parking)
typeof(Hospital_location_lat)


mode(Hospital_name)
mode(Hospital_Parking)
mode(Hospital_location_lat)

class(Hospital_name)
class(Hospital_Parking)
class(Hospital_location_lat)

# --------------------- Object type ---------------------
# Vector is homogeneous (only allow one type)
logiMixDubleVector <- c(Hospital_Parking, Hospital_location_lat)
print(logiMixDubleVector)
mode(logiMixDubleVector)
class(logiMixDubleVector)


# Matrix is homogeneous (only allow one type)
chrMixDoubleMatrix <- cbind(Hospital_name, Hospital_location_lat)
print(chrMixDoubleMatrix)
mode(chrMixDoubleMatrix)
class(chrMixDoubleMatrix)


# Array is homogeneous (only allow one type)
library(abind)
chrMixLogiMixDouble <- abind(rbind(Hospital_name, Hospital_location_lat),
                            rbind(Hospital_location_lat, Hospital_Parking),
                            along=3)
print(chrMixLogiMixDouble)
print(chrMixLogiMixDouble[1,2,1])
print(chrMixLogiMixDouble[1,2,])
mode(chrMixLogiMixDouble)
class(chrMixLogiMixDouble)


# List is Heterogeneous (allow more than one type)
chrMixDoubleMixLogiList <- list(Hospital_name, Hospital_location_lat, Hospital_Parking)
mode(chrMixDoubleMixLogiList)
class(chrMixDoubleMixLogiList)

mode(chrMixDoubleMixLogiList[[1]])
mode(chrMixDoubleMixLogiList[[2]])
mode(chrMixDoubleMixLogiList[[3]])


# Factor is a vector that is used to store categorical data
# UNORDERED
factorParking <- factor(Hospital_Parking)
factorParking
levels(factorParking)
levels(factorParking) <- c("F", "M")

gender <- ordered(c("Male", "Female", "Male", "Male", "Female"))
gender
levels(gender)

gender <- factor(c("Male", "Female", "Male", "Male", "Female"), levels=c("Male", "Female"))
gender
levels(gender)

gender <- factor(c("M", "F", "M", "M", "F"))
gender
levels(gender<-c("F", "M"))
gender

income <- factor(c("Lo", "Mid", "Hi", "Mid", "Lo", "Hi", "Lo"))
income
relevel(income, ref="Lo")
income

# ORDERED
income <- ordered(c("Mid", "Hi", "Lo", "Mid", "Lo", "Hi", "Lo"))
income

inc <- ordered(c("Mid", "Hi", "Lo", "Mid", "Lo", "Hi", "Lo"),
               levels = c("Lo", "Mid", "Hi"))
inc


### Data frame
subjectid<-c(1, 2, 3, 4)
age<-c(35, 55, 45, 25)
sex<-c("Male", "Male", "Female", "Female")
disease<-c("Yes", "No", "No", "Yes")
x.data <- data.frame(subjectid, age, sex, disease)

mode(x.data)
class(x.data)


### Function
TWDtoJPY <- function(TWD=x){
  JPY <- TWD*4.04
  return(JPY)
}

TWDtoJPY(6000)


# --------------------- Generic function ---------------------

# Different class different method
plot(Hospital_Parking)
plot(table(Hospital_Parking))
plot(factor(Hospital_Parking))

plot(Hospital_location_lat)
tmp <- hist(Hospital_location_lat)
class(tmp)
plot(tmp)



# Define myself generic function
h <- list(X="Print me" ,Y="Don't print")
class(h) <- "myclass"
print.myclass<-function(u){cat("X is:",u$X,"\n")}
print(h)

methods(class=class(h))

methods('+')
methods(print)

# --------------------- Coding skill ---------------------
# 列出當前目錄下的檔案
list.files(".")

# 瀏覽資料夾並選擇欲載入檔案
file.choose()

# 只保留向量中不等於1的值，以邏輯值為索引值(index)
c <- c(1, 1, 2, 2, 3, 4, 1)
c <- c[c!=1]

# 互動式取得Plot中的某一點作標
plot(0)
locator()

# 瀏覽某個指定的網頁
browseURL("http://www.yahoo.com")

# 下載網絡文件到本地
download.file("URL","存檔名稱", mode="wb")

# 執行某個檔案
shell.exec("C:/hospital.xlsx")

# 對話框(only for windows)
winDialog("yesno", "愛上R了嗎?")

# 讓User輸入資料
print("請問您幾歲")
age <- readLines(n=1)

# 設定輸出的小數點位數
options(digits = 10)
# 避免以科學符號呈現過長數值 (8.888888889e+84)
options(scipen = 84)
# 從剪貼簿載入資料
readLines("clipboard")
