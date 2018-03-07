t=0.1:0.1:6;
x=exp(t);
i=1:60;
plot(i,x,'r');
hold on

%%以上是要预测的曲线（或者说是要跟踪的曲线）：y=exp(x);

%系统方程：x(k+1)=fi*x(k)+gm*w(k)
%观测方程：z(k)=h*x(k)+v(k)
fi=1.1052;
h=1;
gm=1;

w=randn(1,60);
v=randn(1,60);

xy(1)=0;
p(1)=0;
z(1)=x(1)+w(1);

R=(std(v)).^2;
Q=(std(w)).^2;
k(1)=fi*p(1)*h'*inv(h*p(1)*h'+R);
pp(1)=fi*p(1)*fi'+gm*Q*gm';
for i=2:60
xy(i)=fi*xy(i-1)+k(i-1)*(z(i-1)-xy(i-1));
k(i)=pp(i-1)*h'*inv((h*pp(i-1)*h'+R));
pp(i)=fi*p(i-1)*fi'+gm*Q*gm';
p(i)=pp(i-1)-k(i)*h*p(i-1);
%p(i)=fi*p(i-1)*fi'-fi*p(i-1)*h'*inv((p(i-1)+R))*h*p(i-1)*fi+Q;%%%%
%k(i)=fi*p(i)*h'*inv(h*p(i)*h'+R);
z(i)=x(i)+w(i);
end
n=1:60;
plot(n,xy);