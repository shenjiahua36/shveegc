a=1;b=1.5;d=0:360;
x=a*cosd(d);
y=b*sind(d);
figure(1),cla
patch(x+0.6,y+0.2,'b','edgecolor','none','facealpha',0.15);%不透明度0.15
patch(x-0.6,y-0.2,'b','edgecolor','none','facealpha',0.15);%不透明度0.15
patch(x-0.2,y+0.9,'b','edgecolor','none','facealpha',0.15);%不透明度0.15
patch(x+0.2,y-0.9,'b','edgecolor','none','facealpha',0.15);%不透明度0.15
axis equal
axis off;
set(gcf,'color','w');