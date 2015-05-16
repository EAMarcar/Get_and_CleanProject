## Script for processing Human Activity Dataset
##
##  Step 1 will be to merge the Test and Train files
##
##  Read in the two data files 
##  (using read.table becasue of a known issue with 
##   fread and spaces at the beginning of a dataset)
##
library(data.table)
library(plyr)
test_act <- read.table("X_test.txt")
train_act <- read.table ("X_train.txt")  

## Combine the files into one file
## Convert it to a data tble
## The new file will be called HAR_dat

HAR_tmp  <- rbind(test_act,train_act)
HAR_dat <- as.data.table(HAR_tmp)

## Extract the relevant columns

## Read the Features data set listing the variables

col_names <- fread("features.txt")

## creat a list of the variables to be kept in the tidy dataset

col_sub <- data.frame()  ## this will be a list of columns to be kept
mn_std <- grepl("mean|std", col_names$V2)  ##select these
mfreq <- grepl("meanFreq", col_names$V2)  ## drop these (from the"mean|std" subset)
cols <- dim(col_names)  ## get the total number of columns

      ## pass the variable names in the features dataset
      ## select the rows with variables to be kept: std or mean (and not "meanFreq")

      for (i in 1:cols[1]) {
      
            if ( mn_std[i] == TRUE && mfreq[i] == FALSE) {
            col_sub <- rbind(col_sub,col_names[i,])
            
                  }
            }  ## end for loop

## Use the list of variables to subset the data 
## and name the columns

col_vec <- col_sub$V1   ## create a vector to use to select columns

## The new tidy dataset

HAR_tidy <- HAR_dat[,.SD, .SDcols= c(col_vec)]  

## Name the columns according to the Features dataset

new_nam <- col_sub$V2 ## create a vector with the column names
old_nam <- colnames(HAR_tidy)
setnames(HAR_tidy, old=old_nam, new=new_nam)

## Read in the subject data

subj_te  <- read.table ("subject_test.txt",stringsAsFactors = FALSE )
subj_tr  <- read.table ("subject_train.txt",stringsAsFactors = FALSE)

## Read in activity labels

act_lbl_te <- fread("y_test.txt")
act_lbl_tr <- fread("y_train.txt")

## Combine the subject files and name the column

subj_all  <- rbind(subj_te, subj_tr)
setnames(subj_all, old="V1", new = "Subject")

## combine the activity files and assign meaningful names

act_lbl <- rbind(act_lbl_te, act_lbl_tr)
act_in <- c("walking","walking_upstairs","walking_downstairs","sitting","standing","lying")
act_lbl[,Activity:=act_in[V1]]  ## assign literals to activity
act_lbl <- act_lbl$Activity  ## retain only the meaningful names 

## add subject and activity coulumns to the tidy dataset

HAR_tidy <- cbind(subj_all,act_lbl, HAR_tidy)
setnames(HAR_tidy, old="act_lbl", new="Activity")

## Create a second dataset with averages by subject

ave_tidy <- ddply(HAR_tidy, .(Subject,Activity), colwise(mean))
