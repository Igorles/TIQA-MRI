# TIQA-MRI: Toolbox for Perceptual Image Quality Assessment of Magnetic Resonance Images

TIQA-MRI is a MATLAB toolbox designed for assessing the quality of Magnetic Resonance (MR) images, providing essential tools for objective image quality assessment (IQA). It is modular, flexible, and supports diverse research workflows in MR imaging. The toolbox offers both a curated dataset of 70 MR images with subjective quality scores and several objective IQA methods, making it a valuable platform for testing, comparing, and validating MR-IQA techniques. TIQA-MRI allows users to evaluate the quality of their images and benchmark IQA methods through a standardized, no-reference framework, accessible via a graphical interface or MATLAB functions.

## Features

- Perform image qualty assessment from selected database
- Customize single method testing and training [1]
- Compare the performance of the image database trained on selected IQA methods
- Manage the list of new and existing training methods

## Installation
1. Prerequisites:

MATLAB (tested with R2024a) with Matlab toolbox: Image Processing, Statistics and Machine Learning, Deep Learning, curve fitting, Computer Vision, Parallel Computing, Signal Processing, Deep Learning Toolbox Model: GoogLeNet, Inception-v3.

2. Install

To install TIQA-MRI, download or clone this repository and add it to your MATLAB path. You can do this by running the following commands in MATLAB:

```matlab
% Download the repository
websave('TIQA-MRI-main.zip', 'https://github.com/Igorles/TIQA-MRI/archive/refs/heads/main.zip');
% Unzip the repository
unzip('TIQA-MRI-main.zip');
% Add the repository to the MATLAB path
addpath(genpath('TIQA-MRI-main'));
```

Alternatively, you can manually download the repository from [here](https://github.com/Igorles/TIQA-MRI/archive/refs/heads/main.zip)) and unzip it to a folder of your choice. Then, add the folder and its subfolders to your MATLAB path.

## Usage

To use TIQA-MRI, you can either launch the graphical interface.

```matlab
main
```

#### Image Assessment
In this tab, you can load an image from the DB1 database ( Open button), select an assessment method (Select model), and compute objective quality scores. The selected image is displayed in the center of the screen, and if a training-based method is chosen, you can also select a previously trained model (Previous Image/ Next Image buttons). To begin the evaluation, simply click the Evaluate button, and the results are automatically saved to the base workspace. You also have the option to export the scores to a file.

#### Method evaluation
In the Method Evaluation tab, you can customize and perform quality model training and testing on image data from the selected database. This tab provides a range of options to tailor single-method testing to specific requirements.

You can select a CSV or XLS file with images for training or testing, and specify a directory path for database images (Open buttons). This allows adding paths for images outside the main folder, ensuring a clear overview of image paths for experiments. Selected file paths are optional, and once loaded, a list of images and their subjective scores will appear at the top of the window.

Additional settings can be accessed under the Options button, where you can define the percentage split between training and testing data (Size of the training/ testing data subsets (in percent)), the number of images per type (Consecutive number of images of the same object), or a random seed for dataset splitting. If a number is entered in the Size of the training subset field, the corresponding test subset size is filled in automatically. The database split is finalized by clicking the Random split button, with results shown in the main window. The Options tab remains open for further adjustments and can be closed manually by pressing the x in the corner.

At the bottom of the window, split results display training images on the left and test images on the right. If testing alone is required—either because the method doesn’t need training or a pre-trained model is available—the user can select the method and model. For model training, specify the model name in the Name the selected model field and press Train to start training.

To test a trained method, select the method and model, then press Test. The SRCC, KRCC, and PLCC values will appear at the bottom of the page, along with the file name where evaluation results are saved. The objective scores will also display in the Testing set table.

#### Method comparision
In this tab you can compare the performance of different Image Quality Assessment methods trained on a selected image database. Begin by choosing the method type (Select the methids to compare button) and database (Select the database button), keeping in mind that models cannot be selected for non-training methods (indicated as None in the Train file column).

To proceed, select a CSV or XLSX file containing image names and MOS values (Open button, on the left side), and specify the directory path for the images(Open button, on the right side). This file path selection is required to enable processing. At this point, you can also set parameters like the sizes of training and testing subsets (in percent), the number of random seed, the number of splits, and the count of consecutive images of the same type. Selecting the Random split button then loads the directory into the split tabs. Once configured, you can save the settings for future sessions (Save button) or load previously saved configurations (Load button).

After confirming settings with the OK button, the main Method Comparison tab displays the selected methods, the image database split into training and testing sets, and a preview of subjective scores.

To start the evaluation, click the Train and test all button, which initiates the assessment process and displays real-time progress information, depending on whether methods are being trained or tested. If any setup steps are missing, an error message will prompt completion.

Once the assessment is complete, results can be viewed and saved through the Open results/Open and save results button, with saved files available in the Results directory.

#### Settings

In the Settings tab, you can manage both new and existing training methods by adding (Open button) or removing them from a list (Delete button). All available methods are displayed in a list format, allowing for easy viewing and organization. Once the list of test methods is set, users can select a specific training method from a drop-down menu within the main table, streamlining method selection for testing purposes. All the above setting can be saved by selecting Save button.

