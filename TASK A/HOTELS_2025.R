#import data
data_path <- "C:/Users/Gencoders/Videos/ABI/ABI-CIS6008-SEP-2025-Dataset/ABI-CIS6008-SEP-2025-Dataset/Question-(a)/HOTELS_2025.csv"
hotel_data <- read.csv(data_path, stringsAsFactors = FALSE)

str(hotel_data)
summary(hotel_data)
cat("Total missing values:", sum(is.na(hotel_data)), "\n")

#cleaning & Missing Value
hotel_data_clean <- na.omit(hotel_data)

hotel_data_clean$QualityRating <- factor(hotel_data_clean$HotelQualityRank,
                                         levels = c("Low", "Medium", "High"),
                                         ordered = TRUE)

#correlation method
shapiro.test(hotel_data_clean$Revenue)
shapiro.test(hotel_data_clean$RoomsAvailable)
shapiro.test(hotel_data_clean$OccupancyRate)
shapiro.test(hotel_data_clean$ADR)

#correlation matrix
numerical_vars <- c("RoomsAvailable", "OccupancyRate", "ADR", "MarketingSpend",
                    "StaffCount", "GuestSatisfactionScore", "LoyaltyMembers", "Revenue")

cor_matrix_full <- cor(hotel_data_clean[, numerical_vars], use = "pairwise.complete.obs")
print("Full Correlation Matrix:")
print(round(cor_matrix_full, 3))

revenue_correlations <- cor(hotel_data_clean[, numerical_vars[-8]], # Excluding Revenue itself
                            hotel_data_clean$Revenue,
                            use = "complete.obs")

print("Correlation with Total Revenue:")
print(round(revenue_correlations, 3))

cor.test(hotel_data_clean$Revenue, hotel_data_clean$RoomsAvailable, method = "pearson")


model_simple <- lm(Revenue ~ RoomsAvailable, data = hotel_data_clean)
summary(model_simple)

# Multiple Linear Model: Predicting Revenue
model_multi <- lm(Revenue ~ RoomsAvailable + OccupancyRate + ADR + MarketingSpend +
                    StaffCount + GuestSatisfactionScore + LoyaltyMembers + QualityRating,
                  data = hotel_data_clean)
summary(model_multi)

# Plot graphs

par(mfrow = c(2, 2))

# Plot 1
plot(hotel_data_clean$RoomsAvailable, hotel_data_clean$Revenue,
     xlab = "Rooms Available", ylab = "Total Revenue",
     main = "Revenue vs Rooms Available", col = "gray50", pch = 19)
abline(model_simple, col = "darkred", lwd = 3)

# Plot 2
model_occ <- lm(Revenue ~ OccupancyRate, data = hotel_data_clean)
plot(hotel_data_clean$OccupancyRate, hotel_data_clean$Revenue,
     xlab = "Occupancy Rate (%)", ylab = "Total Revenue",
     main = "Revenue vs Occupancy Rate", col = "gray50", pch = 19)
abline(model_occ, col = "darkblue", lwd = 3)

# Plot 3
model_adr <- lm(Revenue ~ ADR, data = hotel_data_clean)
plot(hotel_data_clean$ADR, hotel_data_clean$Revenue,
     xlab = "Average Daily Rate (ADR)", ylab = "Total Revenue",
     main = "Revenue vs ADR", col = "gray50", pch = 19)
abline(model_adr, col = "darkgreen", lwd = 3)

# Plot 4
model_staff <- lm(Revenue ~ StaffCount, data = hotel_data_clean)
plot(hotel_data_clean$StaffCount, hotel_data_clean$Revenue,
     xlab = "Staff Count", ylab = "Total Revenue",
     main = "Revenue vs Staff Count", col = "gray50", pch = 19)
abline(model_staff, col = "darkmagenta", lwd = 3)

# Reset 
par(mfrow = c(1, 1))

par(mfrow = c(2, 2))
plot(model_multi, col = "darkcyan")
par(mfrow = c(1, 1))

