## Processes
- Read the data (test datasets and train datasets)
- Use rbind() to merge data
- Extract desired measuredments for each measurement
- Read data "features.txt"
- Read needed data and give names to variables
- Read needed data "activity_labels.txt" and give names and IDs
- Use gsub() to modify and correct data
- Generate a new tidy dataset (180 x 68)

## Variables
- x_test, y_test: test datasets
- x_train, y_train: train datasets
- data_x, data_y: datasets that merged test and train datasets for x and y
- data_all: the combined dataset of x, y, and subject datasets
- tidy: the second, independent tidy dataset
