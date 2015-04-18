function r=controlling(NR)

[Q,W]=hist(NR(:,4));
ind=find(Q==6);

for k=1:length(NR)
    C_5(k)=NR(k,2) * NR(k,4);
end
NR2=cat(2,NR,C_5');
[E,R]=hist(NR2(:,5),20);
Y=find(E==6);
if length(ind)==1
    MP=W(ind);
    binsize=W(2)-W(1);
    container=[MP-(binsize/2) MP+(binsize/2)];
    r=takeboxes(NR,container,2);
elseif length(Y)==1
    MP=R(Y);
    binsize=R(2)-R(1);
    container=[MP-(binsize/2) MP+(binsize/2)];
    r=takeboxes(NR2,container,2.5);
elseif isempty(ind) || length(ind)>1
    [A,B]=hist(NR(:,2),20);
    ind2=find(A==6);
    if length(ind2)==1
        MP=B(ind2);
        binsize=B(2)-B(1);
        container=[MP-(binsize/2) MP+(binsize/2)];
        r=takeboxes(NR,container,1);
    else
        container=guessthesix(A,B,(B(2)-B(1)));
        if ~isempty(container)
            r=takeboxes(NR,container,1);
        elseif isempty(container)
            container2=guessthesix(E,R,(R(2)-R(1)));
            if ~isempty(container2)
                r=takeboxes(NR2,container2,2.5);
            else
                r=[];
            end
        end
    end
end
end