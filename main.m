%Author:Batuhan Toker #25981
%Written for CS512 HW #3
clc; clear
mu_1=2;
mu_2=4;
mu_3=6;
mu_4=8;
mu_list=[mu_1;mu_2;mu_3;mu_4]
sigma=0.25;
data_length=60;
r_list=[]
for i=1:4
r = normrnd(mu_list(i),sigma,[data_length,1]) 
r_list =[r_list;r]
end
scatter(r_list,[1:size(r_list)])
title('Dataset visualization')
pts=length(r_list);
%compute the similarity matrix W
W=zeros(pts,pts);
for i=1:pts
    for j=1:pts
        W(i,j) = exp(-norm(r_list(i)-r_list(j))^2/(2*1^2));
    end
end
K=5
method='unnormalized'
[clusters, evals, evects ] = spectral(W, K, method)
figure
hold
for i=1:K
    scatter(r_list(find(clusters==i)),[find(clusters==i)])
end
figure; hold;
subplot(1,K+1,1)
title('Eigenvalues')
hold
for i=1:K
    scatter(i,evals(i,i))
end
for i=1:K
    subplot(1,K+1,i+1) 
    plot(evects(:,i))
    
    title(['Eigenvector ',num2str(i),''])
end


