close all;
clear all;
clc;

%% alpha

%--------------------#1--------------------------------------
% ri=[     0.4982     0.4984      0.4982  0.4984  0.4984  0.5954  0.5827  0.5522  0.540639499133546	0.524987422438370	0.523282464084074];
% fscore=[ 0.4963     0.5112      0.5075  0.5112  0.5112  0.7201  0.7052      0.6642  0.645522388059702	0.615671641791045	0.611940298507463];
% kappa=[ 0.0001      0.0289      0.0209  0.0151  0.0151  0.4386  0.4086     0.3274   0.290095917912112	0.230829246544806	0.223231703918399];
% nmi=[   0.0000      0.0057      0.0014  0.0301  0.0301  0.1903  0.1671    0.0827    0.0643414522728368	0.0391675256379539	0.0368301085299203];
% 
% [n m]=size(ri);
% t=1:m;
% plot(t,ri,'r-o',t,fscore,'g-*',t,kappa,'b->',t,nmi,'y-s','Linewidth',2);
% legend('RI','F-score','kappa','NMI');
% set(gca,'xticklabel',{'0.0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1.0'});
% xlabel('\alpha');
% title('Impact of \alpha on ShVEEGc with Dataset #1');

%--------------------#2--------------------------------------
% ri=[0.499949748743719	0.504723618090452	0.507336683417085	0.507336683417085	0.499296482412060	0.498291457286432	0.497537688442211	0.497939698492462	0.498291457286432	0.501557788944724	0.499296482412060];
% fscore=[0.535000000000000	0.440000000000000	0.430000000000000	0.430000000000000	0.470000000000000	0.520000000000000	0.505000000000000	0.485000000000000	0.480000000000000	0.455000000000000	0.470000000000000];
% kappa=[0.0700000000000000	0.120000000000000	0.140000000000000	0.140000000000000	0.0600000000000000	0.0400000000000000	0.0100000000000000	0.0300000000000000	0.0400000000000000	0.0900000000000000	0.0600000000000000];
% nmi=[0.00579669542102227	0.0193435430135499	0.0279603014794605	0.0279603014794605	0.00359642125151246	0.00127001033465153	7.29387660052937e-05	0.000656540055234615	0.00123520237952401	0.00615268175801862	0.00281750187555402];
% 
% [n m]=size(ri);
% t=1:m;
% plot(t,ri,'r-o',t,fscore,'g-*',t,kappa,'b->',t,nmi,'y-s','Linewidth',2);
% legend('RI','F-score','kappa','NMI');
% set(gca,'xticklabel',{'0.0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1.0'});
% xlabel('\alpha');
% title('Impact of \alpha on ShVEEGc with Dataset #2');

%--------------------#3--------------------------------------
% ri=[0.260464137337799	0.416909167444499	0.631270704075843	0.738062556049708	0.761324328776149	0.768571899192884	0.762330935778473	0.762678672742913	0.753912040849942	0.750983729570453	0.750983729570453];
% fscore=[0.284188034188034	0.335470085470085	0.463675213675214	0.532051282051282	0.598290598290598	0.615384615384615	0.606837606837607	0.602564102564103	0.555555555555556	0.544871794871795	0.544871794871795];
% kappa=[0.00646501962595244	0.0774118637796180	0.271611139014454	0.370558250936560	0.460204300745422	0.483288454343039	0.471967917783188	0.466228438628657	0.449091076300543	0.434779143549030	0.434779143549030];
% nmi=[0.0371050654808886	0.158534846358046	0.415387938019446	0.585808581761880	0.618498699339800	0.611864675864235	0.579377578553744	0.527525958247452	0.559945563761226	0.554926026327453	0.554926026327453];
% 
% [n m]=size(ri);
% t=1:m;
% plot(t,ri,'r-o',t,fscore,'g-*',t,kappa,'b->',t,nmi,'y-s','Linewidth',2);
% legend('RI','F-score','kappa','NMI');
% set(gca,'xticklabel',{'0.0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1.0'});
% xlabel('\alpha');
% title('Impact of \alpha on ShVEEGc with Dataset #3');

% --------------------#4--------------------------------------
% ri=[0.346307911692972	0.346307911692972	0.346302814122179	0.446964380148547	0.596209577907983	0.589646702167684	0.596066681487991	0.616618113675171	0.624241941891640	0.635200896909359	0.619095204205397];
% fscore=[0.413130733944954	0.413130733944954	0.321674311926606	0.363532110091743	0.486811926605505	0.378153669724771	0.367545871559633	0.585149082568807	0.597190366972477	0.617832568807340	0.569954128440367];
% kappa=[0.00118627679194943	0.00118627679194943	-0.000232768422277729	0.0728196297890659	0.256032273808798	0.211798287345385	0.209684836593292	0.384471589135186	0.403036563498870	0.434470384007598	0.365432980407986];
% nmi=[0.00481112028385149	0.00481112028385149	0.00565718680530295	0.0481245497815646	0.145948800810627	0.141695802368022	0.139634196315717	0.182315566223883	0.200508420213172	0.222020316269212	0.194794763136826];
% 
% [n m]=size(ri);
% t=1:m;
% plot(t,ri,'r-o',t,fscore,'g-*',t,kappa,'b->',t,nmi,'y-s','Linewidth',2);
% legend('RI','F-score','kappa','NMI');
% set(gca,'xticklabel',{'0.0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1.0'});
% xlabel('\alpha');
% title('Impact of \alpha on ShVEEGc with Dataset #4');

%--------------------#5--------------------------------------
% ri=[0.351385973576985	0.351385973576985	0.351385973576985	0.351385973576985	0.555361109230265	0.551303791653556	0.548122727218414	0.568298787717055	0.611674479923846	0.635891594209825	0.618600862711048];
% fscore=[0.325748847926267	0.325748847926267	0.325748847926267	0.325748847926267	0.523905529953917	0.526497695852535	0.364919354838710	0.391705069124424	0.370967741935484	0.573156682027650	0.361751152073733];
% kappa=[-0.0116619885380101	-0.0116619885380101	-0.0116619885380101	-0.0116619885380101	0.245118114378913	0.258853298874406	0.224654449934330	0.220592899348518	0.262433218025394	0.344285224937200	0.323983517355162];
% nmi=[0.0202062101506827	0.0202062101506827	0.0202062101506827	0.0202062101506827	0.0963652655748698	0.123622699938079	0.144136264301094	0.136504090029823	0.174935840779772	0.170892792169088	0.270060254284899];
% 
% [n m]=size(ri);
% t=1:m;
% plot(t,ri,'r-o',t,fscore,'g-*',t,kappa,'b->',t,nmi,'y-s','Linewidth',2);
% legend('RI','F-score','kappa','NMI');
% set(gca,'xticklabel',{'0.0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1.0'});
% xlabel('\alpha');
% title('Impact of \alpha on ShVEEGc with Dataset #5');

%--------------------#6--------------------------------------
ri=[0.341402203619823	0.341402203619823	0.341402203619823	0.355197352434466	0.440899897887026	0.537081992076689	0.543050754789617	0.550254975277193	0.566344594428563	0.637401504664706	0.627218192764176];
fscore=[0.327102803738318	0.327102803738318	0.327102803738318	0.328271028037383	0.338492990654206	0.404789719626168	0.421144859813084	0.422313084112150	0.377044392523364	0.614485981308411	0.568633177570094];
kappa=[-0.00143474416509568	-0.00143474416509568	-0.00143474416509568	-0.00244635318338480	0.0796501322174760	0.105004914826770	0.129433159075469	0.129816626922128	0.116756132614330	0.422070097119557	0.351995096059421];
nmi=[0.00457949922031139	0.00457949922031139	0.00457949922031139	0.00189995773729688	0.0191491303107548	0.0207234034583768	0.0209694150695771	0.0345481143347694	0.0368761021191695	0.161313308554592	0.158266881199849];

[n m]=size(ri);
t=1:m;
plot(t,ri,'r-o',t,fscore,'g-*',t,kappa,'b->',t,nmi,'y-s','Linewidth',2);
legend('RI','F-score','kappa','NMI');
set(gca,'xticklabel',{'0.0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1.0'});
xlabel('\alpha');
title('Impact of \alpha on ShVEEGc with Dataset #6');

%--------------------#7--------------------------------------
% ri=[0.636783778552071	0.648736933797909	0.649438637243515	0.652608401084011	0.650624274099884	0.648253000387147	0.647865853658537	0.647865853658537	0.644720286488579	0.643897599690283	0.642784552845529];
% fscore=[0.357638888888889	0.430555555555556	0.434027777777778	0.444444444444444	0.440972222222222	0.437500000000000	0.430555555555556	0.430555555555556	0.427083333333333	0.427083333333333	0.423611111111111];
% kappa=[0.143518518518519	0.240740740740741	0.245370370370370	0.259259259259259	0.254629629629630	0.250000000000000	0.240740740740741	0.240740740740741	0.236111111111111	0.236111111111111	0.231481481481481];
% nmi=[0.0380859810762659	0.0878997161036526	0.0899373808367657	0.100294098940646	0.0959628839604770	0.0930155432373910	0.0906215662123204	0.0906215662123204	0.0919893771734984	0.0909276234319676	0.0890414241765361];
% 
% [n m]=size(ri);
% t=1:m;
% plot(t,ri,'r-o',t,fscore,'g-*',t,kappa,'b->',t,nmi,'y-s','Linewidth',2);
% legend('RI','F-score','kappa','NMI');
% set(gca,'xticklabel',{'0.0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1.0'});
% xlabel('\alpha');
% title('Impact of \alpha on ShVEEGc with Dataset #7');

%--------------------#8--------------------------------------
% ri=[0.619410569105691	0.640558459156020	0.636057878435927	0.632694541231127	0.630589430894309	0.635428765001936	0.630347464188928	0.632234804490902	0.634364111498258	0.636009485094851	0.632428377855207];
% fscore=[0.329861111111111	0.406250000000000	0.388888888888889	0.381944444444445	0.368055555555556	0.381944444444445	0.364583333333333	0.375000000000000	0.385416666666667	0.392361111111111	0.371527777777778];
% kappa=[0.106481481481481	0.208333333333333	0.185185185185185	0.175925925925926	0.157407407407407	0.175925925925926	0.152777777777778	0.166666666666667	0.180555555555556	0.189814814814815	0.162037037037037];
% nmi=[0.0158574374950170	0.0529488388319015	0.0424465729324315	0.0378854062309340	0.0335291794700526	0.0440325992163619	0.0341933509966067	0.0401434092300360	0.0415747728203505	0.0436659372870997	0.0338752085979935];
% 
% [n m]=size(ri);
% t=1:m;
% plot(t,ri,'r-o',t,fscore,'g-*',t,kappa,'b->',t,nmi,'y-s','Linewidth',2);
% legend('RI','F-score','kappa','NMI');
% set(gca,'xticklabel',{'0.0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1.0'});
% xlabel('\alpha');
% title('Impact of \alpha on ShVEEGc with Dataset #8');

%--------------------#9--------------------------------------
% ri=[0.449090205187766	0.546820557491289	0.613748548199768	0.643413666279520	0.637775842044135	0.639009872241580	0.636348238482385	0.638816298877275	0.641284359272164	0.644768679829656	0.648906310491676];
% fscore=[0.343750000000000	0.357638888888889	0.364583333333333	0.423611111111111	0.451388888888889	0.454861111111111	0.434027777777778	0.447916666666667	0.437500000000000	0.465277777777778	0.458333333333333];
% kappa=[0.125000000000000	0.143518518518519	0.152777777777778	0.231481481481481	0.268518518518519	0.273148148148148	0.245370370370370	0.263888888888889	0.250000000000000	0.287037037037037	0.277777777777778];
% nmi=[0.0648843749380749	0.0467058096325502	0.0344591964639994	0.0657703349929077	0.0868322551214231	0.0878384494099936	0.0701658603662488	0.0790529767065634	0.0742786171543244	0.0941681594610662	0.0882981148832355];
% 
% [n m]=size(ri);
% t=1:m;
% plot(t,ri,'r-o',t,fscore,'g-*',t,kappa,'b->',t,nmi,'y-s','Linewidth',2);
% legend('RI','F-score','kappa','NMI');
% set(gca,'xticklabel',{'0.0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1.0'});
% xlabel('\alpha');
% title('Impact of \alpha on ShVEEGc with Dataset #9');

%--------------------#10---------------------------------------
% ri=[0.509803921568627	0.515966386554622	0.515966386554622	0.527310924369748	0.536274509803922	0.541176470588235	0.551820728291317	0.551820728291317	0.531652661064426	0.546358543417367	0.541176470588235];
% fscore=[0.583333333333333	0.600000000000000	0.600000000000000	0.625000000000000	0.641666666666667	0.650000000000000	0.666666666666667	0.666666666666667	0.633333333333333	0.658333333333333	0.650000000000000];
% kappa=[0.166666666666667	0.200000000000000	0.200000000000000	0.250000000000000	0.283333333333333	0.300000000000000	0.333333333333333	0.333333333333333	0.266666666666667	0.316666666666667	0.300000000000000];
% nmi=[0.0269048824532955	0.0371246623118734	0.0342682280729908	0.0513330223669689	0.0662480912252728	0.0715095481052243	0.0887344115948209	0.0867627237297451	0.0562501160922523	0.0789501006067830	0.0715095481052243];
% 
% [n m]=size(ri);
% t=1:m;
% plot(t,ri,'r-o',t,fscore,'g-*',t,kappa,'b->',t,nmi,'y-s','Linewidth',2);
% legend('RI','F-score','kappa','NMI');
% set(gca,'xticklabel',{'0.0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1.0'});
% xlabel('\alpha');
% title('Impact of \alpha on ShVEEGc with Dataset 10');

%--------------------#11---------------------------------------
% ri=[0.512745098039216	0.531652661064426	0.563585434173670	0.531652661064426	0.531652661064426	0.527310924369748	0.531652661064426	0.523249299719888	0.519467787114846	0.527310924369748	0.523249299719888];
% fscore=[0.591666666666667	0.633333333333333	0.683333333333333	0.633333333333333	0.633333333333333	0.625000000000000	0.633333333333333	0.616666666666667	0.608333333333333	0.625000000000000	0.616666666666667];
% kappa=[0.183333333333333	0.266666666666667	0.366666666666667	0.266666666666667	0.266666666666667	0.250000000000000	0.266666666666667	0.233333333333333	0.216666666666667	0.250000000000000	0.233333333333333];
% nmi=[0.0273999052434874	0.0550397349579869	0.100779715537930	0.0562501160922523	0.0562501160922523	0.0499461299620662	0.0550397349579869	0.0419892688126997	0.0358116955560017	0.0464597004011239	0.0402031579789543];
% 
% [n m]=size(ri);
% t=1:m;
% plot(t,ri,'r-o',t,fscore,'g-*',t,kappa,'b->',t,nmi,'y-s','Linewidth',2);
% legend('RI','F-score','kappa','NMI');
% set(gca,'xticklabel',{'0.0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1.0'});
% xlabel('\alpha');
% title('Impact of \alpha on ShVEEGc with Dataset 11');