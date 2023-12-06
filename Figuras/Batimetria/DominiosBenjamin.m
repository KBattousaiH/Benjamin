%% MAPA DOMINIOS
%
clear all
clc
start
%
addpath('/data3/matlab/Catalina/Catalina/Resultados')
%load batimetria_terao_geo.mat
grid='/data4/matlab/USIPA/BENJAMIN/CROCO_FILES/croco_grd.nc';
grid1='/data4/matlab/USIPA/BENJAMIN/CROCO_FILES/croco_grd.nc.1';
grid2='/data4/matlab/USIPA/BENJAMIN/CROCO_FILES/croco_grd.nc.2';
grid3='/data4/matlab/USIPA/BENJAMIN/CROCO_FILES/croco_grd.nc.3';
%
gnc=netcdf(grid,'nowrite'); 
lon=gnc{'lon_rho'}(:); 
lat=gnc{'lat_rho'}(:);
G=gnc{'h'}(:);
close(gnc)
%
gnc1=netcdf(grid1,'nowrite'); 
lon1=gnc1{'lon_rho'}(:); 
lat1=gnc1{'lat_rho'}(:);
G1=gnc1{'h'}(:);
close(gnc1)
%
gnc2=netcdf(grid2,'nowrite'); 
lon2=gnc2{'lon_rho'}(:); 
lat2=gnc2{'lat_rho'}(:);
G2=gnc2{'h'}(:);
close(gnc2)
%
gnc3=netcdf(grid3,'nowrite'); 
lon3=gnc3{'lon_rho'}(:); 
lat3=gnc3{'lat_rho'}(:);
G3=gnc3{'h'}(:);
mask3=gnc3{'mask_rho'}(:);
close(gnc3)
mask3(mask3==0)=NaN;
%
%%
S=min(min(lat)); N=max(max(lat)); O=min(min(lon)); E=max(max(lon));
S1=min(min(lat1)); N1=max(max(lat1)); O1=min(min(lon1)); E1=max(max(lon1));
S2=min(min(lat2)); N2=max(max(lat2)); O2=min(min(lon2)); E2=max(max(lon2));
S3=min(min(lat3)); N3=max(max(lat3)); O3=min(min(lon3)); E3=max(max(lon3));
%
pos1=[0.1 0.07 0.4 0.85];
pos2=[0.57 0.54 0.39 0.3412];
%pos2=[0.5703    0.5838    0.3347    0.3412];
pos3=[0.57 0.13 0.39 0.3412];
 f3= figure();
 set(gcf,'position',[10,10,1100,900]);
    sgtitle('Dominios Anidados Benjamin','FontSize',20,'FontWeight','bold')
	
    sp1=subplot('position',pos1);
    m_proj('equidistant','lon',[min(min(lon)) max(max(lon))],'lat',[min(min(lat)) max(max(lat))]);
    m_pcolor(lon,lat,G),shading interp;
    m_gshhs_f('patch',[.7 .7 .7],'EdgeColor','k')
    m_grid('linewi',2,'tickdir','out','fontsize',10); % Tamaño nº coordenadas
    hold on
    %m_contourf(lonp,latp,hp,[10 50 100 500 1000 1500 2000 3000 4000 4300 4500 5000],':','ShowText','on')
    m_plot([O1 E1],[S1 S1],'-r','Linewidth',1)
    m_plot([O1 E1],[N1 N1],'-r','Linewidth',1)
    m_plot([O1 O1],[S1 N1],'-r','Linewidth',1)
    m_plot([E1 E1],[S1 N1],'-r','Linewidth',1)
    %
    m_plot([O2 E2],[S2 S2],'-r','Linewidth',1)
    m_plot([O2 E2],[N2 N2],'-r','Linewidth',1)
    m_plot([O2 O2],[S2 N2],'-r','Linewidth',1)
    m_plot([E2 E2],[S2 N2],'-r','Linewidth',1)
    %
    m_plot([O3 E3],[S3 S3],'-r','Linewidth',1)
    m_plot([O3 E3],[N3 N3],'-r','Linewidth',1)
    m_plot([O3 O3],[S3 N3],'-r','Linewidth',1)
    m_plot([E3 E3],[S3 N3],'-r','Linewidth',1)
    %
    cb0=colorbar('direction','reverse');
    set(get(cb0,'title'),'string','[m]');
    caxis([min(min(G)) max(max(G))])
    m_text(-75.8,-44.5,'A1','Color','red','FontSize',18)
    cmocean('deep')
% 
sp2=subplot('position',pos2);
%sp2=subplot(2,2,2);
    m_proj('equidistant','lon',[min(min(lon1)) max(max(lon1))],'lat',[min(min(lat1)) max(max(lat1))]);
    m_pcolor(lon1,lat1,G1),shading interp;
    m_gshhs_f('patch',[.7 .7 .7],'EdgeColor','k')
    m_grid('linewi',2,'tickdir','out','fontsize',10); % Tamaño nº coordenadas
    hold on
    %m_contourf(lonp,latp,hp,[10 50 100 500 1000 1500 2000 3000 4000 4300 4500 5000],':','ShowText','on')
    m_plot([O2 E2],[S2 S2],'-r','Linewidth',2)
    m_plot([O2 E2],[N2 N2],'-r','Linewidth',2)
    m_plot([O2 O2],[S2 N2],'-r','Linewidth',2)
    m_plot([E2 E2],[S2 N2],'-r','Linewidth',2)
    %
    m_plot([O3 E3],[S3 S3],'-r','Linewidth',2)
    m_plot([O3 E3],[N3 N3],'-r','Linewidth',2)
    m_plot([O3 O3],[S3 N3],'-r','Linewidth',2)
    m_plot([E3 E3],[S3 N3],'-r','Linewidth',2)
    %
    cb1=colorbar('direction','reverse');
    set(get(cb1,'title'),'string','[m]');
    caxis([min(min(G1)) max(max(G1))])
    m_text(-74,-44.63,'A3','Color','red','FontSize',12)
    m_text(-74.3,-44.45,'A2','Color','red','FontSize',18)
    cmocean('deep')
%    
sp3=subplot('position',pos3);
%sp3=subplot(2,2,4);
    m_proj('equidistant','lon',[min(min(lon2)) max(max(lon2))],'lat',[min(min(lat2)) max(max(lat2))]);
    m_pcolor(lon2,lat2,G2),shading interp;
    m_gshhs_f('patch',[.7 .7 .7],'EdgeColor','k')
    m_grid('linewi',2,'tickdir','out','fontsize',10); % Tamaño nº coordenadas
    hold on
    %m_contourf(lonp,latp,hp,[10 50 100 500 1000 1500 2000 3000 4000 4300 4500 5000],':','ShowText','on')
    %
    m_plot([O3 E3],[S3 S3],'-r','Linewidth',2)
    m_plot([O3 E3],[N3 N3],'-r','Linewidth',2)
    m_plot([O3 O3],[S3 N3],'-r','Linewidth',2)
    m_plot([E3 E3],[S3 N3],'-r','Linewidth',2)
    %
    cb2=colorbar('direction','reverse');
    set(get(cb2,'title'),'string','[m]');
    caxis([min(min(G2)) max(max(G2))])
    m_text(-74,-44.62,'A3','Color','red','FontSize',18)
    cmocean('deep')
%    
    j = axes(f3,'visible','off');
    j.Title.Visible = 'on';
    j.XLabel.Visible = 'on';
    j.YLabel.Visible = 'on';
    yl=ylabel(j,'Latitud','FontWeight','bold','fontsize',15,'position',[-0.11    0.5000    0.0000]);
    xlabel(j,'Longitud','FontWeight','bold','fontsize',15); 
    %set(gcf,'position',[10,10,700,700])
    %c = colorbar(j,'Position',[0.91 0.14 0.03 0.755],'direction','reverse');
    %set(get(c,'title'),'string','[m]'); caxis(j,[min(min(G)) max(max(G))]);
    %cmocean('deep');
    saveas(f3,'Bati_Dominios_Benjamin','png');

    
    
    f= figure();
 set(gcf,'position',[10,10,700,300]);
    sgtitle('Dominio Anidado A3 Benjamin','FontSize',22,'FontWeight','bold')
	axes('pos',[.15 .05 .75 .9])
    m_proj('equidistant','lon',[min(min(lon3)) max(max(lon3))],'lat',[min(min(lat3)) max(max(lat3))]);
    pc=m_pcolor(lon3,lat3,G3.*mask3);shading interp;
    m_gshhs_f('patch',[.7 .7 .7],'EdgeColor','k')
    m_grid('linewi',2,'tickdir','out','fontsize',10); % Tamaño nº coordenadas
    hold on
    m_contourf(lon3,lat3,G3.*mask3,[10 12 14 15 16 18 20 22 23 24 25 26 27 28 29 30],':','ShowText','on')
    %
    cb3=colorbar('direction','reverse');
    set(get(cb3,'title'),'string','[m]');
    caxis([min(min(G3)) max(max(G3))])
    %m_text(-75.8,-43.3,'A1','Color','red','FontSize',18)
    cmocean('deep')
    
    j = axes(f,'visible','off');
    j.Title.Visible = 'on';
    j.XLabel.Visible = 'on';
    j.YLabel.Visible = 'on';
    yl=ylabel(j,'Latitud','FontWeight','bold','fontsize',15,'position',[-0.11    0.5000    0.0000]);
    xlabel(j,'Longitud','FontWeight','bold','fontsize',15); 
    %set(gcf,'position',[10,10,700,700])
    %c = colorbar(j,'Position',[0.91 0.14 0.03 0.755],'direction','reverse');
    %set(get(c,'title'),'string','[m]'); caxis(j,[min(min(G)) max(max(G))]);
    %cmocean('deep');
    saveas(f,'Bati_A3_Benjamin','png');
