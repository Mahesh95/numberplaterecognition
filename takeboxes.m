function r=takeboxes(NR,container,chk)

takethisbox=[];
for i=1:size(NR,1)
    if NR(i,(2*chk))>=container(1) && NR(i,(2*chk))<=container(2)
        takethisbox=cat(1,takethisbox,NR(i,:));
    end
end
r=[];
for k=1:size(takethisbox,1)
    var=find(takethisbox(k,1)==reshape(NR(:,1),1,[]));
    if length(var)==1                                 
        r=[r var];                                     
    else                                              
        for v=1:length(var)                           
            M(v)=NR(var(v),(2*chk))>=container(1) && NR(var(v),(2*chk))<=container(2);
        end
        var=var(M);
        r=[r var];
    end
end
end
