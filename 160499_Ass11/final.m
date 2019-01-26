train = csvread("train.csv");
x=train(:,1);
y=train(:,2);
x = [ones(rows(y), 1) x];


w=rand(2,1);


figure;
scatter(x(:,2),y);
hold on;

xdash= x*w;
plot(x(:,2),xdash);

m=(x')*x;
n=inv(m);
o=(x')*y;
w_direct=(n*o);
w_directa=(x*w_direct);
plot(x(:,2),w_directa);


eta=1e-8;
p=length(y);
for i = (1:2)
  for j = (1:p)
    q=x(j,:)';
    r=(transpose(w))*q;
    s=(r-(y(j,:)));
    t=s*q;
    u=(eta)*t;
    w=(w-u);
    if mod(j,1000)==0
      h=(x*w);
      plot(x(:,2),h);
      pause();
    end
  end
end
h=(x*w);
plot(x(:,2),h);

test = csvread("test.csv");
x1=test(:,1);
y1=test(:,2);

x1=[ones(rows(y1), 1),x1];


y_pred1=(x1*w);
a1=(y_pred1-y1);
a2=(a1'*a1);
r1=a2/rows(y1);
r2=sqrt(r1);

disp('RMS error between y_pred1 and y_test is %i',rt1);

y_pred2=(x1*w_direct);
b1=(y_pred2-y1);
b3=transpose(b1);
b2=(b3*b1);
rt1=b2/rows(y1);
rt2=sqrt(rt1);

#pause(20);
print -dpdf "a.pdf";
close;


disp('RMS error between y_pred2 and y_test is %i',rt2);
