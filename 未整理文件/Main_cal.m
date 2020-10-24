
function Main_cal

CityNum = 30; % ������Ŀ
[dislist, Clist] = tsp(CityNum); % dislist Ϊ����֮���໥�ľ��룬Clist Ϊ�����е�����
 
inn = 30; % ��ʼ��Ⱥ��С
gnMax = 500;  % ������
crossProb = 0.8; % �������
muteProb = 0.8; % �������
 
% ���������ʼ��Ⱥ
population = zeros(inn, CityNum); % population Ϊ��ʼ��Ⱥ����������������
for i = 1 : inn
    population(i,:) = randperm(CityNum);
end
[~, cumulativeProbs] = calPopulationValue(population, dislist); % ������Ⱥÿ�������ߵ��ۼƸ���
 
generationNum = 1;
generationMeanValue = zeros(generationNum, 1); % ÿһ����ƽ������
generationMaxValue = zeros(generationNum, 1);  % ÿһ������̾���
bestRoute = zeros(inn, CityNum); % ���·��
newPopulation = zeros(inn, CityNum); % �µ���Ⱥ
while generationNum < gnMax + 1
   for j = 1 : 2 : inn
      selectedChromos = select(cumulativeProbs);  % ѡ�������ѡ��������Ҫ�������Ľ����ߣ�������ĸ��
      crossedChromos = cross(population, selectedChromos, crossProb);  % ������������ؽ����Ľ�����
      newPopulation(j, :) = mut(crossedChromos(1, :),muteProb);  % �Խ����Ľ����߽��б������
      newPopulation(j + 1, :) = mut(crossedChromos(2, :), muteProb); % �Խ����Ľ����߽��б������
   end
   population = newPopulation;  %�������µ���Ⱥ
   [populationValue, cumulativeProbs] = calPopulationValue(population, dislist);  % ��������Ⱥ����Ӧ��
   % ��¼��ǰ����ú�ƽ������Ӧ��
   [fmax, nmax] = max(populationValue); % ��Ϊ������Ӧ��ʱȡ����ĵ�����������ȡ���ĵ���������̵ľ���
   generationMeanValue(generationNum) = 1 / mean(populationValue); 
   generationMaxValue(generationNum) = 1 / fmax;   
   bestChromo = population(nmax, :);  % ǰ����ѽ����ߣ�����Ӧ��·��
   bestRoute(generationNum, :) = bestChromo; % ��¼ÿһ������ѽ�����
   drawTSP(Clist, bestChromo, generationMaxValue(generationNum), generationNum, 0);
   generationNum = generationNum + 1;
end
[bestValue,index] = min(generationMaxValue);
drawTSP(Clist, bestRoute(index, :), bestValue, index,1);
 
figure(2);
plot(generationMaxValue, 'r');  
hold on;
plot(generationMeanValue, 'b'); 
grid;
title('��������');
legend('���Ž�', 'ƽ����');
fprintf('�Ŵ��㷨�õ�����̾���: %.2f\n', bestValue);
fprintf('�Ŵ��㷨�õ������·��');
disp(bestRoute(index, :));
end
 
%------------------------------------------------
% �������н����ߵ���Ӧ��
function [chromoValues, cumulativeProbs] = calPopulationValue(s, dislist)
inn = size(s, 1);  % ��ȡ��Ⱥ��С
chromoValues = zeros(inn, 1);
for i = 1 : inn
    chromoValues(i) = CalDist(dislist, s(i, :));  % ����ÿ�������ߵ���Ӧ��
end
chromoValues = 1./chromoValues'; % ��Ϊ�þ���ԽС��ѡȡ�ĸ���Խ�ߣ�����ȡ���뵹��
% ���ݸ������Ӧ�ȼ����䱻ѡ��ĸ���
fsum = 0;
for i = 1 : inn
    % ����15�η���ԭ�����úõĸ��屻ѡȡ�ĸ��ʸ�����Ϊ��Ӧ��ȡ����ĵ����������˴η���������໥֮�����Ӧ�Ȳ�𲻴󣩣�����һ���ϴ����Ҳ��
    fsum = fsum + chromoValues(i)^15;   
end
% ���㵥������
probs = zeros(inn, 1);
for i = 1: inn
    probs(i) = chromoValues(i)^15 / fsum;
end
% �����ۻ�����
cumulativeProbs = zeros(inn,1);
cumulativeProbs(1) = probs(1);
for i = 2 : inn
    cumulativeProbs(i) = cumulativeProbs(i - 1) + probs(i);
end
cumulativeProbs = cumulativeProbs';
end
 
%--------------------------------------------------
%��ѡ�񡱲�����������ѡ�񽻼�������Ⱥ�ж�Ӧ��λ��
% cumulatedPro ���н����ߵ��ۼƸ���
function selectedChromoNums = select(cumulatedPro)
selectedChromoNums = zeros(2, 1);
% ����Ⱥ��ѡ���������壬��ò�Ҫ����ѡ��ͬһ������
for i = 1 : 2
   r = rand;  % ����һ�������
   prand = cumulatedPro - r;
   j = 1;
   while prand(j) < 0
       j = j + 1;
   end
   selectedChromoNums(i) = j; % ѡ�и�������
   if i == 2 && j == selectedChromoNums(i - 1)    % ����ͬ����ѡһ��
       r = rand;  % ����һ�������
       prand = cumulatedPro - r;
       j = 1;
       while prand(j) < 0
           j = j + 1;
       end
   end
end
end
 
%------------------------------------------------
% �����桱����
function crossedChromos = cross(population, selectedChromoNums, crossProb)
length = size(population, 2); % �����ߵĳ���
crossProbc = crossMuteOrNot(crossProb);  %���ݽ�����ʾ����Ƿ���н��������1���ǣ�0���
crossedChromos(1,:) = population(selectedChromoNums(1), :);
crossedChromos(2,:) = population(selectedChromoNums(2), :);
if crossProbc == 1
   c1 = round(rand * (length - 2)) + 1;  %��[1,bn - 1]��Χ���������һ������λ c1
   c2 = round(rand * (length - 2)) + 1;  %��[1,bn - 1]��Χ���������һ������λ c2
   chb1 = min(c1, c2);
   chb2 = max(c1,c2);
   middle = crossedChromos(1,chb1+1:chb2); % ���������� chb1 �� chb2 ֮�以��λ��
   crossedChromos(1,chb1 + 1 : chb2)= crossedChromos(2, chb1 + 1 : chb2);
   crossedChromos(2,chb1 + 1 : chb2)= middle;
   for i = 1 : chb1 % ������󣬽��������Ƿ�����ͬ����������·�����ظ������������У������У���ñ��벻���뽻��
       while find(crossedChromos(1,chb1 + 1: chb2) == crossedChromos(1, i))
           location = find(crossedChromos(1,chb1 + 1: chb2) == crossedChromos(1, i));
           y = crossedChromos(2,chb1 + location);
           crossedChromos(1, i) = y;
       end
       while find(crossedChromos(2,chb1 + 1 : chb2) == crossedChromos(2, i))
           location = find(crossedChromos(2, chb1 + 1 : chb2) == crossedChromos(2, i));
           y = crossedChromos(1, chb1 + location);
           crossedChromos(2, i) = y;
       end
   end
   for i = chb2 + 1 : length
       while find(crossedChromos(1, 1 : chb2) == crossedChromos(1, i))
           location = logical(crossedChromos(1, 1 : chb2) == crossedChromos(1, i));
           y = crossedChromos(2, location);
           crossedChromos(1, i) = y;
       end
       while find(crossedChromos(2, 1 : chb2) == crossedChromos(2, i))
           location = logical(crossedChromos(2, 1 : chb2) == crossedChromos(2, i));
           y = crossedChromos(1, location);
           crossedChromos(2, i) = y;
       end
   end
end
end
 
%--------------------------------------------------
%�����족����
% choromo Ϊһ��������
function snnew = mut(chromo,muteProb)
length = size(chromo, 2); % �����ߵĵĳ���
snnew = chromo;
muteProbm = crossMuteOrNot(muteProb);  % ���ݱ�����ʾ����Ƿ���б��������1���ǣ�0���
if muteProbm == 1
    c1 = round(rand*(length - 2)) + 1;  % �� [1, bn - 1]��Χ���������һ������λ
    c2 = round(rand*(length - 2)) + 1;  % �� [1, bn - 1]��Χ���������һ������λ
    chb1 = min(c1, c2);
    chb2 = max(c1, c2);
    x = chromo(chb1 + 1 : chb2);
    snnew(chb1 + 1 : chb2) = fliplr(x); % ���죬����������λ�õĽ����ߵ�ת
end
end
 
% ���ݱ���򽻲���ʣ�����һ�� 0 �� 1 ����
function crossProbc = crossMuteOrNot(crossMuteProb)
test(1: 100) = 0;
l = round(100 * crossMuteProb);
test(1 : l) = 1;
n = round(rand * 99) + 1;
crossProbc = test(n);
end
 
%------------------------------------------------
% ����һ�������ߵ���Ӧ��
% dislist Ϊ���г����໥֮��ľ������
% chromo Ϊһ�������ߣ���һ��·��
function chromoValue = CalDist(dislist, chromo)
DistanV = 0;
n = size(chromo, 2); % �����ߵĳ���
for i = 1 : (n - 1)
    DistanV = DistanV + dislist(chromo(i), chromo(i + 1));
end
DistanV = DistanV + dislist(chromo(n), chromo(1));
chromoValue = DistanV;
end
 
%------------------------------------------------
% ��ͼ
% Clist Ϊ��������
% route Ϊһ��·��
function drawTSP(Clist, route, generationValue, generationNum,isBestGeneration)
CityNum = size(Clist, 1);
for i = 1 : CityNum - 1
    plot([Clist(route(i), 1),Clist(route(i + 1), 1)], [Clist(route(i),2),Clist(route(i+1),2)],'ms-','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','g');
    text(Clist(route(i), 1),Clist(route(i), 2), ['  ', int2str(route(i))]);
    text(Clist(route(i+1), 1),Clist(route(i + 1), 2), ['  ', int2str(route(i+1))]);
    hold on;
end
plot([Clist(route(CityNum), 1), Clist(route(1), 1)], [Clist(route(CityNum), 2), Clist(route(1), 2)],'ms-','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','g');
title([num2str(CityNum),'����TSP']);
if isBestGeneration == 0 && CityNum ~= 10
    text(5, 5, ['�� ',int2str(generationNum),' ��','  ��̾���Ϊ ', num2str(generationValue)]);
else
    text(5, 5, ['���������������̾��� ',num2str(generationValue),'�� �ڵ� ',num2str(generationNum),' ���ﵽ']);
end
if CityNum == 10  % ��Ϊ������ʾλ�ò�һ�������Խ�������ĿΪ 10 ʱ������д
    if isBestGeneration == 0
        text(0, 0, ['�� ',int2str(generationNum),' ��','  ��̾���Ϊ ', num2str(generationValue)]);
    else
        text(0, 0, ['���������������̾��� ',num2str(generationValue),'�� �ڵ� ', num2str(generationNum),' ���ﵽ']);
    end
end
hold off;
pause(0.005);
end
 
%------------------------------------------------
%����λ������
function [DLn, cityn] = tsp(n)
DLn = zeros(n, n);
if n == 30
    city30 = csvread('data.csv',0,1);
    for i = 1 : 30
        for j = 1 : 30
            DLn(i,j) = ((city30(i,1)-city30(j,1))^2+(city30(i,2)-city30(j,2))^2)^0.5;
        end
    end
    cityn = city30;
end
end