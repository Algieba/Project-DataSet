library(plyr)
library(stats)

# R file with the code of the function for load and reshaping data
source("./load_data.R")

# Load data from "test"
merge_data <- load.data("test")

# Load data from "train" and add to data from "test"
merge_data <- rbind.fill(merge_data,load.data("train"))

if (!file.exists("./dataset")){dir.create("./dataset")}

# Write the first data set
write.csv(merge_data[,c(1:66,69)],
          "./dataset/mean_std_dataset.csv",
          row.names = FALSE)

# The second data set is created and written to a file. The original data are
# grouped by "Activity" and "Performer"
activity_performer_data <- ddply(merge_data[,c(1:68)],
                                 .(IdActivityLabel,IdPerformer),
                                 colMeans)

# The name of the columns is changed for describing its contents
colnames(activity_performer_data)[1:66] <- paste("APMean-",
                                           colnames(activity_performer_data)[1:66],
                                           sep = "")

# We add  the activity label to the data set, after calculate the means for all
# variables grouped by "Activity" and "Performer" we lost that information.
activity_label <- unique(merge_data[,c("IdActivityLabel","ActivityLabel")])
rownames(activity_label) <- activity_label[,"IdActivityLabel"]

activity_performer_data[,"ActivityLabel"] <- 
     activity_label[as.character(activity_performer_data[,"IdActivityLabel"]),2]

write.table(activity_performer_data,
          "./dataset/activity_performer_dataset.txt",
          row.names = FALSE)

