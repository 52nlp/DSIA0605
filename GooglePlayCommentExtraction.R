library(XML)

#避免中文編碼問題
Sys.setlocale(category='LC_ALL', locale='C')
url <- "https://play.google.com/store/apps/details?id=com.facebook.katana&hl=zh-TW"

# 擷取網路資料方法1
library(RCurl)
#部分電腦會有SSL認證問題
#SSL certificate problem: unable to get local issuer certificate
data <- htmlParse(getURL(url, ssl.verifypeer = FALSE), encoding = "UTF-8")

# 擷取網路資料方法2
# data <- readLines(url,warn = F)
# data <- paste(data,collapse = "")
# data <- htmlParse(data,encoding="utf8")


temp <- xpathSApply(data,"//div[@class='review-body']")


#迴圈方法1
# x <- list()
# for(i in 1:length(temp)){
#   x <- c(x, xmlValue(temp[[i]]))
# }


#迴圈方法2
doc <- lapply(temp,function(u)xmlValue(u,trim=T))



doc <- gsub("完整評論","",doc)


