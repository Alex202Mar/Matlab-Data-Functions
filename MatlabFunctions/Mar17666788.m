clear;
%% CMP3749M
%% MAR17666788 - Alexander Marshall
%% Figures in Matlab aren't relative to the figures in the write up
%% Reading in the the table
cardata = fopen('car_data.csv');
i = 1;
readlines = ("");
line = fgetl(cardata);

headers = line;
while (ischar(line)&& i < 407)
    line = fgetl(cardata);
    readlines(i) = line;
    i = i+1;
end

% here I get the headers for each column so I can refernce them individually later
split_headers = split(headers, ",");
new_dataset = split(readlines, ",");
cardata = reshape(new_dataset, 406, 9);


%% MPG Section
MPG = str2double(cardata(:,1));

% here is where i replace the NaaN values with 0
LenMPG = length(MPG);

% Works out the MPG mean
MPG=MPG';
TFMPG= isnan(MPG);
MPG(TFMPG) = 0; 
meanMPG = MeanCalc(MPG, LenMPG);

% Turns all the 0 values which are the NA entries into the MPG mean
MPG = nullToMean(MPG, meanMPG, LenMPG);

% Sorts the data
MPGS = SortAlg(MPG, LenMPG);

% Gets the Min, Max and Median numbers in Mpg
[minMPG, maxMPG, medianMPG, standDevMPG] = variableCalc(MPGS, meanMPG);


%% Acceleration Section
ACC = str2double(cardata(:,6));

% here is where i replace the NaaN values with 0 and sort the data
LenACC = length(ACC);


% Works out the ACC mean
ACC=ACC';
TFACC= isnan(ACC);
ACC(TFACC) = 0; 
meanACC = MeanCalc(ACC, LenACC);

% Turns all the 0 values which are the NA entries into the MPG mean
ACC = nullToMean(ACC, meanACC, LenACC);

% Sorts the data
ACCS = SortAlg(ACC, LenACC);

% Gets the Min, Max and Median numbers in Mpg
[minACC, maxACC, medianACC, standDevACC] = variableCalc(ACCS, meanACC);


%% HorsePower Section
HP = str2double(cardata(:, 4));

% here is where i replace the NaaN values with 0 
LenHP = length(HP);

% Works out the HP mean
HP=HP';
TFHP= isnan(HP);
HP(TFHP) = 0; 
meanHP = MeanCalc(HP, LenHP);

% Turns all the 0 values which are the NA entries into the MPG mean
HP = nullToMean(HP, meanHP, LenHP);

% Sorts the data
HPS = SortAlg(HP, LenHP);

% Gets the Min, Max and Median numbers in Mpg
[minHP, maxHP, medianHP, standDevHP] = variableCalc(HPS, meanHP);


%% Weight Section
Weight = str2double(cardata(:, 5));

% here is where i replace the NaaN values with 0 
LenWeight = length(Weight);

% Works out the MPG mean
Weight=Weight';
TFWeight= isnan(Weight);
Weight(TFWeight) = 0; 
meanWeight = MeanCalc(Weight, LenWeight);

% Turns all the 0 values which are the NA entries into the MPG mean
Weight = nullToMean(Weight, meanWeight, LenWeight);

% Sorts the data
WeightS = SortAlg(Weight, LenWeight);

% Gets the Min, Max and Median numbers in Mpg
[minWeight, maxWeight, medianWeight, standDevWeight] = variableCalc(WeightS, meanWeight);

%% Box Plot task 4 a-d
figure(1) % box plot of mpg
boxchart(MPG);
title('Box Plot of MPG');
ylabel('MPG Values');

figure(2) % box plot of Acceleration
boxchart(ACC);
title('Box Plot of Acceleration');
ylabel('Acceleration Values');

figure(3) % box plot of Horsepower
boxchart(HP);
title('Box Plot of HP');
ylabel('HP Values');

figure(4) % box plot of Weight
boxchart(Weight);
title('Box Plot of Weight');
ylabel('Weight Values');

%% Scatter Plot task 4 e-g
figure(5) % Scatter plot of Acceleration vs MPG
scatter(ACC, MPG);
title('Acceleration vs MPG Scatter plot');
xlabel('Acceleration');
ylabel('MPG');

figure(6) % Scatter plot of Horsepower vs MPG
scatter(HP, MPG);
title('Horsepower vs MPG Scatter plot');
xlabel('Horsepower');
ylabel('MPG');

figure(7) % Scatter plot of Weight vs Horsepower
scatter(Weight, HP);
title('Weight vs Horsepower Scatter plot');
xlabel('Weight');
ylabel('Horse Power');

%% Density Plot task 4 h-k
figure(8) % density plot of MPG
ksdensity(MPG);
title('MPG Density Plot')
xlabel('MPG Values')
ylabel('Density')

figure(9) % density plot of Acceleration
ksdensity(ACC);
title('Acceleration Density Plot')
xlabel('Acceleration Values')
ylabel('Density')

figure(10) % density plot of Horsepower
ksdensity(HP);
title('Horsepower Density Plot')
xlabel('Horsepower Values')
ylabel('Density')

figure(11) % density plot of Weight
ksdensity(Weight);
title('Weight Density Plot')
xlabel('Weight Values')
ylabel('Density')

%% Corelation Coeficient & Matrix
% the corelation coeficient is worked out in this function
matrix = corMatrix(MPG, ACC, HP, Weight);
% on the matrix table 1=mpg 2=acceleration 3=horsepower 4=weight
% MATRIX CAN BE FOUND IN WORKSPACE

%% Shuffle and Split data sets
% For the Purpose of getting consistent results i've taken out the shuffle
% Just uncomment it if you want to test it
%MPG = randomise(MPG);
[MPG70, MPG30] = splitData(MPG);
%ACC = randomise(ACC);
[ACC70, ACC30] = splitData(ACC);
%HP = randomise(HP);
[HP70, HP30] = splitData(HP);
%Weight = randomise(Weight);
[Weight70, Weight30] = splitData(Weight);

%% Linear Regression & Least Square Error
[a, b] = linearReg(ACC70, MPG70); % this is where we create a and b for
% the linear regression equation, it gets continued in the avgLSE function
[MPGLeastSquareError70, MPG70estimated] = avgLSE(ACC70, MPG70, a, b);
[MPGLeastSquareError30, MPG30estimated] = avgLSE(ACC30, MPG30, a, b);
% Using the data we collected we create the graph below
figure(12)
scatter(ACC30 ,MPG30estimated);
title('MPG vs ACC Ground truth vs Predicted values');
hold on;
scatter(ACC30, MPG30);
hold off;

[a1, b1] = linearReg(HP70, MPG70);
[MPG2LeastSquareError70, MPG270estimated] = avgLSE(HP70, MPG70, a1, b1);
[MPG2LeastSquareError30, MPG230estimated] = avgLSE(HP30, MPG30, a1, b1);
figure(13)
scatter(HP30 ,MPG230estimated);
title('MPG vs HP Ground truth vs Predicted values');
hold on;
scatter(HP30, MPG30);
hold off;

[a2, b2] = linearReg(Weight70, HP70);
[HPLeastSquareError70, HP70estimated] = avgLSE(Weight70, HP70, a2, b2);
[HPLeastSquareError30, HP30estimated] = avgLSE(Weight30, HP30, a2, b2);
figure(14)
scatter(Weight30 ,HP30estimated);
title('HP vs Weight Ground truth vs Predicted values');
hold on;
scatter(Weight30, HP30);
hold off;
