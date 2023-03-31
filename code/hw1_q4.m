clc
clear
set(0,'defaultfigurecolor','w')

x = [1,0;
     1,0.8;
     1,1.6;
     1,3;
     1,4;
     1,5];
d = [0.5;
     1;
     4;
     5;
     6;
     9];
eta = 0.01;

%% LLS method
wl = (inv(x'*x))*x'*d;

%% LMS method
wm = zeros(500,2);
wm(1,:) = [1,0.5];
e = zeros(500,6);

for n = 1:500
    e(n,:) = d' - wm(n,:) * x';
    wm(n+1,:) = wm(n,:) + eta * e(n,:) * x;
end 


%% plot
subplot(1,2,1)
plot(x(:,2),d,'bo');
hold on

t = -1:0.1:6;
y1 = wl(1,1) + wl(2,1).*t;
y2 = wm(100,1) + wm(100,2).*t;
l1 = plot(t,y1);
l2 = plot(t,y2);
axis([-1,6,0,10]);
legend([l1 l2],{'LLS','LMS'});

subplot(1,2,2)
plot(wm)
axis([1,500,-1.5,2]);
legend('bias','w1')