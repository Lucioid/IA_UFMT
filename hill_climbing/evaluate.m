function [ Attack ] = evaluate( E )

Attack = zeros(size(E, 1), 1);
for i=1:size(E, 1),
    
    s = 0;
    
    for j=1:size(E, 2)-1,
        for l=j+1:size(E, 2),
          
            if E(i, j) == E(i, l) || E(i, j) == E(i, l) - (l-j) || E(i, j) == (l-j) + E(i, l), %linhas e diagonal
                s = s + 1;
            end
            
        end
    end
    
    Attack(i) = s;
end

end

