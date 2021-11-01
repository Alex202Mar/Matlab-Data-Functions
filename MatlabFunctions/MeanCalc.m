function mean = MeanCalc(Arr, Len)
    meanStore = 0;
    meanCnt = 0;
    Cnt = 1;
    
    while Cnt ~= Len+1
         if Arr(Cnt) ~= 0
             meanStore = meanStore + Arr(Cnt);
             meanCnt = meanCnt + 1;
         end
         Cnt = Cnt + 1;
    end
    mean = meanStore/meanCnt;
end