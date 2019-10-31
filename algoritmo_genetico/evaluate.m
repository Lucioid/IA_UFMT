function [ E, t ] = evaluate( Pop )

E = zeros(size(Pop, 1), 1);
for i=1:size(Pop, 1),
    
    s = 0;
    t = 0;
    for j=1:size(Pop, 2)-1,
        for l=j+1:size(Pop, 2),
          
            if Pop(i, j) == Pop(i, l) || Pop(i, j) == Pop(i, l) - (l-j) || Pop(i, j) == (l-j) + Pop(i, l), %linhas e diagonal
                s = s + 1;
            end
            t = t + 1;
        end
    end
    
    E(i) = t - s;
end

end

