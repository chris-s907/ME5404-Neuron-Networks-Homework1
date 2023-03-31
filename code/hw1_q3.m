clc
clear
set(0,'defaultfigurecolor','w')

%learning rate
eta1 = 1;

% %% AND
% x1 = [0,0,1,1];
% x2 = [0,1,0,1];
% 
% % d = 0
% ou_x0 = [0,0,1];
% ou_y0 = [0,1,0];
% 
% % d = 1
% ou_x1 = 1;
% ou_y1 = 1;
% 
% %initial value
% X = [1,x1(1,1),x2(1,1);
%      1,x1(1,2),x2(1,2);
%      1,x1(1,3),x2(1,3);
%      1,x1(1,4),x2(1,4)];
% d = [0,0,0,1];
% w = zeros(50,3);
% w(1,:) = [-0.5, 1,-1];
% e = zeros(50,4);
% e(1,:) =  d - [0,0,1,0];
% 
% %learning algorithm
% for n = 1:50
%     w(n+1,:) = w(n,:) + eta1 * e(n,:) * X;
%     y = w(n,:) * X';
%     for i = 1:4
%         if y(1,i) > 0
%            y(1,i) = 1;
%         else if y(1,i) < 0
%                 y(1,i) = 0;
%             end
%         end   
%     end
%     e(n+1,:)= d - y;
% end

%% OR
% x1 = [0,0,1,1];
% x2 = [0,1,0,1];
% 
% % d = 0
% ou_x0 = 0;
% ou_y0 = 0;
% 
% % d = 1
% ou_x1 = [0,1,1];
% ou_y1 = [1,0,1];
% 
% %initial value
% X = [1,x1(1,1),x2(1,1);
%      1,x1(1,2),x2(1,2);
%      1,x1(1,3),x2(1,3);
%      1,x1(1,4),x2(1,4)];
% d = [0,1,1,1];
% w = zeros(50,3);
% w(1,:) = [-0.5, 1,-1];
% e = zeros(50,4);
% e(1,:) =  d - [0,0,1,0];
% 
% %learning algorithm
% for n = 1:50
%     w(n+1,:) = w(n,:) + e(n,:) * X;
%     y = w(n,:) * X';
%     for i = 1:4
%         if y(1,i) > 0
%            y(1,i) = 1;
%         else if y(1,i) < 0
%                 y(1,i) = 0;
%             end
%         end   
%     end
%     e(n+1,:)= d - y;
% end


%% NAND
% x1 = [0,0,1,1];
% x2 = [0,1,0,1];
% 
% % d = 0
% ou_x0 = 1;
% ou_y0 = 1;
% 
% % d = 1
% ou_x1 = [0,0,1];
% ou_y1 = [0,1,0];
% 
% %initial value
% X = [1,x1(1,1),x2(1,1);
%      1,x1(1,2),x2(1,2);
%      1,x1(1,3),x2(1,3);
%      1,x1(1,4),x2(1,4)];
% d = [1,1,1,0];
% w = zeros(50,3);
% w(1,:) = [-0.5, 1,-1];
% e = zeros(50,4);
% e(1,:) =  d - [0,0,1,0];
% 
% %learning algorithm
% for n = 1:50
%     w(n+1,:) = w(n,:) + e(n,:) * X;
%     y = w(n,:) * X';
%     for i = 1:4
%         if y(1,i) > 0
%            y(1,i) = 1;
%         else if y(1,i) < 0
%                 y(1,i) = 0;
%             end
%         end   
%     end
%     e(n+1,:)= d - y;
% end

%% COMPLEMENT
% x1 = [0,1];
% 
% % d = 0
% ou_x0 = 1;
% 
% % d = 1
% ou_x1 = 0;
% 
% 
% %initial value
% X = [1,x1(1,1);
%      1,x1(1,2)];
% d = [1,0];
% w = zeros(50,2);
% w(1,:) = [-1.5,1];
% e = zeros(50,2);
% e(1,:) =  d - [0,0];
% 
% %learning algorithm
% for n = 1:50
%     w(n+1,:) = w(n,:) + e(n,:) * X;
%     y = w(n,:) * X';
%     for i = 1:2
%         if y(1,i) > 0
%            y(1,i) = 1;
%         else if y(1,i) < 0
%                 y(1,i) = 0;
%             end
%         end   
%     end
%     e(n+1,:)= d - y;
% end

%% XOR
x1 = [0,1,0,1];
x2 = [0,0,1,1];

% d = 0
ou_x0 = [0,1];
ou_y0 = [0,1];

% d = 1
ou_x1 = [1,0];
ou_y1 = [0,1];

%initial value
X = [1,x1(1,1),x2(1,1);
     1,x1(1,2),x2(1,2);
     1,x1(1,3),x2(1,3);
     1,x1(1,4),x2(1,4)];
d = [0,1,1,0];
w = zeros(50,3);
w(1,:) = [-0.5, 1,-1];
e = zeros(50,4);
e(1,:) =  d - [0,0,1,0];

%learning algorithm
for n = 1:50
    w(n+1,:) = w(n,:) + eta1 * e(n,:) * X;
    y = w(n,:) * X';
    for i = 1:4
        if y(1,i) > 0
           y(1,i) = 1;
        else if y(1,i) < 0
                y(1,i) = 0;
            end
        end   
    end
    e(n+1,:)= d - y;
end
%% plot classification result and weights
t = -0.5:0.1:1.5;

%learning result
ot_y1 = (-w(51,2)/w(51,3)).*t - w(51,1)/w(51,3);%AND OR NAND
% ot_x1 = -w(51,1)/w(51,2);%COMPLEMT

%off-line result
% ot_y2 = -t + 1.5; %AND
% ot_y2 = -t + 0.5; %OR
% ot_y2 = -t + 1.5; %NAND

subplot(1,2,1)
plot(ou_x0,ou_y0,'ro');%AND OR NAND
% plot(ou_x0,0,'ro');%COMPLEMENT
hold on
plot(ou_x1,ou_y1,'b^');%AND OR NAND
% plot(ou_x1,0,'b^');%COMPLEMENT
hold on

p1 = plot(t,ot_y1);%AND OR NAND
% p2 = plot(t,ot_y2);%AND OR NAND
% p1 = plot([ot_x1,ot_x1],[-3,3]);%COMPLEMENT
% p2 = plot([0.5,0.5],[-3,3]);%COMPLEMENT

% legend([p1 p2],{'learing result','off-line result'})
legend([p1],{'learing result'});%XOR

grid on
axis([-0.5,1.5,-0.5,1.5]);%AND OR NAND
% axis([-0.5,1.5,-0.5,1]);%COMPLEMENT

subplot(1,2,2)
t2 = 1:51;
plot(t2,w);
legend('w0','w1','w2');%AND OR NAND
% legend('w0','w1');%COMPLEMENT
axis([1,50,-10,10]);%AND NAND
% axis([1,20,-10,10]);%OR
% axis([1,40,-5,5]);%COMPLEMENT

%% plot error with different learning rate
% plot(e);
% axis([1,50,-2,2]);
% legend('error w0','error w1','error w2');%AND OR NAND