#install.packages('docopt')

"This script downloads the YouTube csv file from web.

Usage: load_data.R --data_url=<data_url>
" -> doc 

library(docopt)
library(glue)
library(here)
opt <- docopt(doc) 


main <- function(data_url) {
  dat <-  read.csv(url(data_url))
  tryCatch(
    {
      message("Attempting to download data and write to disk...")
      dat <-  read.csv(url(data_url))
      write.csv(dat, here::here("data", "youtube_data.csv"))
    },
    error = {function(cnd) print(glue("error object is {cnd}"))},
    finally = {message("Data has been downloaded successfully!")}
    
  )
  
}

main(opt$data_url)