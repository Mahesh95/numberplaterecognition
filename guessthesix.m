function container=guessthesix(Q,W,bsize)

for l=5:-1:2
    val=find(Q==l);
    var=length(val);
    if isempty(var) || var == 1
        if val == 1
            index=val+1;
        else
            index=val;
        end
        if length(Q)==val
            index=[];
        end
        if Q(index)+Q(index+1) == 6
            container=[W(index)-(bsize/2) W(index+1)+(bsize/2)];
            break;
        elseif Q(index)+Q(index-1) == 6
            container=[W(index-1)-(bsize/2) W(index)+(bsize/2)];
            break;
        end
    else
        for k=1:1:var
            if val(k)==1
                index=val(k)+1;
            else
                index=val(k);
            end
            if length(Q)==val(k)
                index=[];
            end
            if Q(index)+Q(index+1) == 6
                container=[W(index)-(bsize/2) W(index+1)+(bsize/2)];
                break;
            elseif Q(index)+Q(index-1) == 6
                container=[W(index-1)-(bsize/2) W(index)+(bsize/2)];
                break;
            end
        end
        if k~=var
            break;
        end
    end
end
if l==2
    container=[];
end
end