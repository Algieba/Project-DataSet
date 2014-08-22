###############################################################################
# This function read various files and merge it in a unique data frame. It    #
# has a input parameter (data_type) with two posible values: "training" and   # 
# "test". The function return a data frame merging the information of:        #     
#                                                                             # 
#    - activity_labels.txt (Links the class labels with their activity name)  #
#    - y_train.txt | y_test.txt (data.type labels)                            #
#    - x_test.txt | x_test.txt (data.type set)                                #     
#    - subjects_train.txt | subjects_test.txt (Subjects who performed the     #
#                                               activity)                     #
#    - features.txt (List of all featured)                                    #
###############################################################################
# data.frame <- load_data (character)
###############################################################################

load.data <- function(data_type) {
     
     # Validate input parameter
     if (!is.element(data_type,c("train","test"))){
          
          # The data_type value is not a accepted value
          stop("invalid data_type")
     }
     
     # Complementary vector with the columns that we need from main data set.
     # We can not load the complete main data set because it exceed memory
     # limits
     data_columns <- c(1,2,3,4,5,6,41,42,43,44,45,46,81,82,83,84,85,86,121,122,
                       123,124,125,126,161,162,163,164,165,166,201,202,214,215,
                       227,228,240,241,253,254,266,267,268,269,270,271,345,346,
                       347,348,349,350,424,425,426,427,428,429,503,504,516,517,
                       529,530,542,543)
     
     # With data_columns_widths we read from main data set the columns that we
     # need and skip the others columns
     data_columns_widths <- rep(-16,561)
     data_columns_widths[data_columns] <- -data_columns_widths[data_columns]
     
     # Load the main data set (561)
     file.name <- paste("./UCI HAR Dataset/",
                        data_type,
                        "/X_",data_type,
                        ".txt",
                        sep="")
     
     data <- read.fwf(file.name,
                      header = FALSE,
                      widths= data_columns_widths,
                      n = -1)
     
     
     # Load the features list. This features are the column names of the main
     # data set.
     columns_names <- read.delim("./UCI HAR Dataset/features.txt",
                                 header = FALSE,
                                 sep = " ")
     colnames(data) <- columns_names[data_columns,2]
     
     # Load the subject who performed the activity
     file.name <- paste("./UCI HAR Dataset/",data_type,
                        "/subject_",data_type,
                        ".txt",
                        sep="")
     
     data[,"IdPerformer"] <- read.delim(file.name,
                                        header = FALSE,
                                        sep = " ")
     
     # Load data_type labels
     file.name <- paste("./UCI HAR Dataset/"
                        ,data_type,
                        "/y_",data_type,
                        ".txt",
                        sep="")
     
     data[,"IdActivityLabel"] <- read.delim(file.name,
                                            header = FALSE,
                                            sep = " ")
     
     # Load data_type lables description
     file.name <- paste("./UCI HAR Dataset/activity_labels.txt",sep="")
     
     data[,"ActivityLabel"] <- read.delim(file.name,
                                          header = FALSE,
                                          sep = " ")[data$IdActivityLabel,2]
     
     # Return the data frame
     data
     
}  
     