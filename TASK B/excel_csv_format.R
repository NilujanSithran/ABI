# load library file
library(readxl)

# import file path
tourist_data <- read_excel("C:/Users/Gencoders/Videos/ABI/ABI-CIS6008-SEP-2025-Dataset/ABI-CIS6008-SEP-2025-Dataset/
                           Question-(b)/All_Countries_Jan_August_2025.xlsx",skip = 2)

colnames(tourist_data)
# Processing data
processed_data <- tourist_data[, c("Country", "Total")]

# save csv file
write.csv(processed_data, "C:/Users/Gencoders/Downloads/SL_Tourists-2025.csv", row.names = FALSE)

