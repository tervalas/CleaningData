# Cleaning Data Assignment #

## Script File: run_analysis.R ##
## Tidy Data Set: analysisData.txt ##

> ## Data Analysis Process ##
>
> 1. Load UCI HAR Dataset into tables for activities, features, and both test and training datasets.
> 2. Create a dataframe for test data and one for training data, populating from X_test/X_train tables (`rbind`).
> 3. Convert activity table (y_test/y_train) for each set to activity names using activity_labels table.
> 4. Convert column names for each set to feature table list (`setNames`).
> 5. Merge Subject table for each set with associate activity and data sets (`cbind`), then tidy column names due to duplicates (`make.names` with unique).
> 6. Merge the test and training datasets into one table (`rbind`).
> 7. Extract columns with mean and std recordings from the data set (`select` function from dplyr).
> 8. `Melt` the data set to tidy data set (subject, activity, feature, data). Arranged data by Subject number.
> 9. Grouping by Subject, Activity and Feature (`group_by`), take the mean of each feature for each Subject/Activity pair (`summarize`).
> 10. Covert grouped data back to data frame (`as.data.frame`).
> 11. Write the table to analysisData.txt.

> Resulting Data Set Format: Subject Number, Activity Type, Feature, mean of all results for the subject/activity pair for that feature.

## UCI Dataset Files Referenced ##
> - activity_labels.txt
> - features.txt
> - /test/subject_test.txt
> - /test/X_test.txt
> - /test/y_test.txt
> - /test/subject_train.txt
> - /test/X_train.txt
> - /test/y_train.txt