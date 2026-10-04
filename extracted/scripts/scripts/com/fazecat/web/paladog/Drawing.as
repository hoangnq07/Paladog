package com.fazecat.web.paladog
{
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.geom.*;
   import flash.media.*;
   import flash.net.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   import mx.core.UIComponent;
   
   public class Drawing extends UIComponent
   {
      
      public static const GAME_VERSION:int = 100;
      
      public static const GAME_RELEASE:Boolean = true;
      
      public static const STAGE_ALLOPEN:Boolean = false;
      
      public static const GAME_CHEAT:Boolean = false;
      
      public static const GAME_SLOWTEST:Boolean = false;
      
      public static const TEST_EVENT:Boolean = false;
      
      public static const RES_COMPRESS:Boolean = true;
      
      public static const RES_UPDATE:Boolean = false;
      
      public static const FPS:int = 60;
      
      public static const CLEAR_TIME:int = 320;
      
      public static const LEVEL_EASY:int = 0;
      
      public static const LEVEL_NORMAL:int = 1;
      
      public static const LEVEL_HARD:int = 2;
      
      public static const LEVEL_HELL:int = 3;
      
      public static const LOADING_CHANUM:int = 10;
      
      public static const LOADINGSTATE_IMG:int = 0;
      
      public static const LOADINGSTATE_STAGE:int = 1;
      
      public static const LOADINGSTATE_PAUSE:int = 2;
      
      public static const LOADINGSTATE_CLEAR:int = 3;
      
      public static const DB_OPTION:int = 0;
      
      public static const DB_SLOT:int = 1;
      
      public static const DB_GAME:int = 2;
      
      public static const SAVEDATA_OPTIONLEN:int = 3;
      
      public static const SAVEDATA_GAMELEN:int = 1000;
      
      public static const CLIENT_VERSION:int = 100;
      
      public static const INITDATA:int = -10000;
      
      public static const BGINITX:int = 10000;
      
      public static const MODE_NORMAL:int = 0;
      
      public static const MODE_DESTINY:int = 1;
      
      public static const MODE_WAGON:int = 2;
      
      public static const MODE_WARROAD:int = 3;
      
      public static const MODE_BOSS:int = 4;
      
      public static const MODE_SURVIVAL:int = 5;
      
      public static const MOVE_LEFT:int = 0;
      
      public static const MOVE_RIGHT:int = 1;
      
      public static const MAIN_LOGO:int = 0;
      
      public static const MAIN_USEAGE:int = 1;
      
      public static const MAIN_TITLEANI:int = 2;
      
      public static const MAIN_TITLE:int = 3;
      
      public static const MAIN_MENU:int = 4;
      
      public static const MAIN_INTRO:int = 5;
      
      public static const MAIN_STAGESELECT:int = 6;
      
      public static const MAIN_TUTORIAL:int = 7;
      
      public static const MAIN_GAME:int = 8;
      
      public static const MAIN_OPTION:int = 9;
      
      public static const MAIN_HELP:int = 10;
      
      public static const MAIN_SURVIVAL:int = 11;
      
      public static const MAIN_AD:int = 12;
      
      public static const GAME_START:int = 0;
      
      public static const GAME_PLAY:int = 1;
      
      public static const GAME_MENU:int = 2;
      
      public static const GAME_CLEAR:int = 3;
      
      public static const GAME_OVER:int = 4;
      
      public static const GAME_CINEMA:int = 5;
      
      public static const GAME_LEVELUP:int = 16;
      
      public static const TOPUI_DRAW:int = 0;
      
      public static const TOPUI_CARD:int = 1;
      
      public static const TOPUI_EMBLEM:int = 2;
      
      public static const TOPUI_ACHIEVE:int = 3;
      
      public static const TOPUI_RANKING:int = 4;
      
      public static const TOPUI_ADDGEM:int = 5;
      
      public static const TOPUI_OPTION:int = 6;
      
      public static const TOP:int = 1;
      
      public static const BOTTOM:int = 2;
      
      public static const VCENTER:int = 3;
      
      public static const LEFT:int = 16;
      
      public static const RIGHT:int = 32;
      
      public static const HCENTER:int = 48;
      
      public static const ATTACK_VERTICAL:int = 0;
      
      public static const ATTACK_HORIZON:int = 1;
      
      public static const ATTACK_HEAL:int = 2;
      
      public static const MACE_GODPUNCH:int = 0;
      
      public static const MACE_HEAL:int = 1;
      
      public static const MACE_TURNUNDEAD:int = 2;
      
      public static const MACE_ICE:int = 3;
      
      public static const MACE_LIGHT:int = 4;
      
      public static const MACE_FIRE:int = 5;
      
      public static const MACE_METEO:int = 6;
      
      public static const MACE_WIND:int = 7;
      
      public static const MACE_FOOD:int = 8;
      
      public static const MACE_POISON:int = 9;
      
      public static const MACE_GOLD:int = 10;
      
      public static const RING_EXP:int = 11;
      
      public static const RING_RICH:int = 12;
      
      public static const RING_TREASURE:int = 13;
      
      public static const RING_HP:int = 14;
      
      public static const RING_REGEN:int = 15;
      
      public static const RING_SPEED:int = 16;
      
      public static const RING_MANA:int = 17;
      
      public static const RING_WISH:int = 18;
      
      public static const RING_FARMER:int = 19;
      
      public static const RING_GRANARY:int = 20;
      
      public static const TURNUNDEAD_ATTACKPOINT:int = 18;
      
      public static const LIGHT_ATTACKPOINT:int = 8;
      
      public static const FIRE_ATTACKPOINT:int = 8;
      
      public static const METEO_ATTACKPOINT:int = 18;
      
      public static const WIND_ATTACKPOINT:int = 18;
      
      public static const UNIT_MOUSE:int = 0;
      
      public static const UNIT_RABBIT:int = 1;
      
      public static const UNIT_BEAR:int = 2;
      
      public static const UNIT_KANGAROO:int = 3;
      
      public static const UNIT_TURTLE:int = 4;
      
      public static const UNIT_MONKEY:int = 5;
      
      public static const UNIT_RHINO:int = 6;
      
      public static const UNIT_PENGUIN:int = 7;
      
      public static const UNIT_DRAGON:int = 8;
      
      public static const UNIT_WAGON:int = 9;
      
      public static const ENEMY_ZOMBIE:int = 0;
      
      public static const ENEMY_WOMANSKELETON:int = 1;
      
      public static const ENEMY_WITCH:int = 2;
      
      public static const ENEMY_DEVIL:int = 3;
      
      public static const ENEMY_RINGGHOST:int = 4;
      
      public static const ENEMY_MANSKELETON:int = 5;
      
      public static const ENEMY_MUMMY:int = 6;
      
      public static const ENEMY_FRANKEN:int = 7;
      
      public static const ENEMY_GHOST:int = 8;
      
      public static const ENEMY_DARKZOMBIE:int = 9;
      
      public static const ENEMY_KNIGHTSKELETON:int = 10;
      
      public static const ENEMY_STONE:int = 11;
      
      public static const ENEMY_MINERZOMBIE:int = 12;
      
      public static const ENEMY_PUMPKIN:int = 13;
      
      public static const ENEMY_ONEEYEDPERSON:int = 14;
      
      public static const ENEMY_ARMORAXE:int = 15;
      
      public static const ENEMY_BOMB:int = 16;
      
      public static const ENEMY_ONEEYEDMONSTER:int = 17;
      
      public static const ENEMY_LANCEZOMBIE:int = 18;
      
      public static const ENEMY_ARMORSHIELD:int = 19;
      
      public static const ENEMY_DARKZOMBIE2:int = 48;
      
      public static const ENEMY_PUMPKIN2:int = 49;
      
      public static const ENEMY_BOSSZOMBIE:int = 20;
      
      public static const ENEMY_BOSSWITCH:int = 21;
      
      public static const ENEMY_BOSSSOCCER:int = 22;
      
      public static const ENEMY_BOSSMUMMY:int = 23;
      
      public static const ENEMY_BOSSGHOST:int = 24;
      
      public static const ENEMY_BOSSBIGMOUTH:int = 25;
      
      public static const ENEMY_BOSSPALADOG:int = 26;
      
      public static const ENEMY_BOSSDRAGON:int = 27;
      
      public static const ENEMY_BOSSWOMANDEVIL:int = 28;
      
      public static const ENEMY_BOSSMANDEVIL:int = 29;
      
      public static const MAX_UNITLEVEL:int = 20;
      
      public static const MAX_UNITSTEP:int = 12;
      
      public static const MAX_UNITATK:int = 20;
      
      public static const MAX_UNITDIE:int = 20;
      
      public static const MAX_UNITKIND:int = 9;
      
      public static const RINGEQUIPLOCK_POS:int = 2;
      
      public static const MAX_BTNFRAME:int = 2;
      
      public static const TUTORIAL_NORMAL:int = 0;
      
      public static const TUTORIAL_DESTINY:int = 1;
      
      public static const TUTORIAL_WAGON:int = 2;
      
      public static const TUTORIAL_WARROAD:int = 3;
      
      public static const TUTORIAL_UNIT:int = 4;
      
      public static const TUTORIAL_STORE:int = 5;
      
      public static const TUTORIAL_HERO:int = 6;
      
      public static const OPENING_MOVE:int = 0;
      
      public static const OPENING_LIGHT:int = 1;
      
      public static const OPENING_TOUCH:int = 2;
      
      public static const OPENING_DARK:int = 3;
      
      public static const TITLE_MAIN:int = 0;
      
      public static const TITLE_MENU:int = 1;
      
      public static const TITLE_OPENING:int = 2;
      
      public static const SORT_LEVEL:int = 0;
      
      public static const SORT_KIND:int = 1;
      
      public static const LOCK:int = 0;
      
      public static const UNLOCK:int = 1;
      
      public static const NUM_MONEY:int = 0;
      
      public static const NUM_MANA:int = 1;
      
      public static const NUM_CLEAR:int = 2;
      
      public static const NUM_START:int = 3;
      
      public static const NUM_UNITUPGRADE:int = 4;
      
      public static const NUM_ITEMPRICE:int = 5;
      
      public static const NUM_ITEMLEVEL:int = 6;
      
      public static const NUM_LEVELUPPOINT:int = 7;
      
      public static const NUM_LEVELUPMAX:int = 8;
      
      public static const NUM_UNITDATA:int = 9;
      
      public static const NUM_SLOT:int = 10;
      
      public static const NUM_LOADINGSTAGE:int = 11;
      
      public static const imgLogo:int = 0;
      
      public static const imgPaladog:int = 0;
      
      public static const imgPig:int = 400;
      
      public static const imgLarva:int = 416;
      
      public static const imgMace01:int = 499;
      
      public static const imgMace02:int = 500;
      
      public static const imgMace03:int = 501;
      
      public static const imgMace04:int = 502;
      
      public static const imgMace05:int = 503;
      
      public static const imgMace06:int = 504;
      
      public static const imgMace07:int = 505;
      
      public static const imgMace08:int = 506;
      
      public static const imgMace09:int = 507;
      
      public static const imgMace10:int = 508;
      
      public static const imgMace11:int = 509;
      
      public static const imgMace01_Effa:int = 510;
      
      public static const imgMace01_Effb:int = 524;
      
      public static const imgMace02_Effa:int = 529;
      
      public static const imgMace02_Effb:int = 548;
      
      public static const imgMace02_Effc:int = 567;
      
      public static const imgMace03_Effa:int = 587;
      
      public static const imgMace03_Effb:int = 607;
      
      public static const imgMace03_Effc:int = 626;
      
      public static const imgMace04_Effa:int = 666;
      
      public static const imgMace04_Effb:int = 676;
      
      public static const imgMace05_Effa:int = 677;
      
      public static const imgMace05_Effb:int = 697;
      
      public static const imgMace06_Effa:int = 717;
      
      public static const imgMace07_Effa:int = 731;
      
      public static const imgMace08_Effa:int = 751;
      
      public static const imgMace09_Effa:int = 781;
      
      public static const imgMace10_Effa:int = 821;
      
      public static const imgMace10_Effb:int = 828;
      
      public static const imgMace10_Effc:int = 842;
      
      public static const imgMace11_Effa:int = 871;
      
      public static const imgUnit01Atk1:int = 1066;
      
      public static const imgUnit01Atk2:int = 1076;
      
      public static const imgUnit01Dead:int = 1092;
      
      public static const imgUnit01Walk:int = 1108;
      
      public static const imgUnit02Arms:int = 1120;
      
      public static const imgUnit02Atk1:int = 1122;
      
      public static const imgUnit02Dead:int = 1142;
      
      public static const imgUnit02Walk:int = 1158;
      
      public static const imgUnit03Atk1:int = 1170;
      
      public static const imgUnit03Atk2:int = 1180;
      
      public static const imgUnit03Dead:int = 1196;
      
      public static const imgUnit03Walk:int = 1212;
      
      public static const imgUnit04Arms:int = 1224;
      
      public static const imgUnit04Atk1:int = 1229;
      
      public static const imgUnit04Atk2:int = 1239;
      
      public static const imgUnit04Dead:int = 1255;
      
      public static const imgUnit04Walk:int = 1271;
      
      public static const imgUnit05Atk1:int = 1283;
      
      public static const imgUnit05Dead:int = 1303;
      
      public static const imgUnit05Walk:int = 1319;
      
      public static const imgUnit06Arms:int = 1331;
      
      public static const imgUnit06Atk1:int = 1361;
      
      public static const imgUnit06Dead:int = 1381;
      
      public static const imgUnit06Walk:int = 1397;
      
      public static const imgUnit07Atk1:int = 1409;
      
      public static const imgUnit07Atk2:int = 1419;
      
      public static const imgUnit07Dead:int = 1435;
      
      public static const imgUnit07Walk:int = 1451;
      
      public static const imgUnit08Arms:int = 1463;
      
      public static const imgUnit08Atk1:int = 1464;
      
      public static const imgUnit08Dead:int = 1484;
      
      public static const imgUnit08Walk:int = 1500;
      
      public static const imgUnit09Atk1:int = 1512;
      
      public static const imgUnit09Dead:int = 1522;
      
      public static const imgUnit09Walk:int = 1538;
      
      public static const imgWagonDead:int = 1550;
      
      public static const imgWagonWalk:int = 1570;
      
      public static const imgEnemyE01Att:int = 1582;
      
      public static const imgEnemyE01Down:int = 1592;
      
      public static const imgEnemyE01Walk:int = 1608;
      
      public static const imgEnemyE02Att:int = 1620;
      
      public static const imgEnemyE02Arms:int = 1636;
      
      public static const imgEnemyE02Down:int = 1640;
      
      public static const imgEnemyE02Walk:int = 1656;
      
      public static const imgEnemyE03Att:int = 1668;
      
      public static const imgEnemyE03Down:int = 1678;
      
      public static const imgEnemyE03Walk:int = 1694;
      
      public static const imgEnemyE04Att:int = 1706;
      
      public static const imgEnemyE04Down:int = 1716;
      
      public static const imgEnemyE04Walk:int = 1732;
      
      public static const imgEnemyE05Att:int = 1744;
      
      public static const imgEnemyE05Down:int = 1759;
      
      public static const imgEnemyE05Walk:int = 1775;
      
      public static const imgEnemyE06Arms:int = 1787;
      
      public static const imgEnemyE06Att:int = 1788;
      
      public static const imgEnemyE06Down:int = 1808;
      
      public static const imgEnemyE06Walk:int = 1824;
      
      public static const imgEnemyE07Att:int = 1836;
      
      public static const imgEnemyE07Down:int = 1851;
      
      public static const imgEnemyE07Walk:int = 1867;
      
      public static const imgEnemyE08Att:int = 1879;
      
      public static const imgEnemyE08Down:int = 1894;
      
      public static const imgEnemyE08Walk:int = 1910;
      
      public static const imgEnemyE09Att:int = 1922;
      
      public static const imgEnemyE09Down:int = 1937;
      
      public static const imgEnemyE09Walk:int = 1953;
      
      public static const imgEnemyE10Att:int = 1965;
      
      public static const imgEnemyE10Down:int = 1980;
      
      public static const imgEnemyE10Eff:int = 1996;
      
      public static const imgEnemyE10Arms:int = 2011;
      
      public static const imgEnemyE10Walk:int = 2026;
      
      public static const imgEnemyE11Att:int = 2038;
      
      public static const imgEnemyE11Down:int = 2048;
      
      public static const imgEnemyE11Walk:int = 2064;
      
      public static const imgEnemyE12Att:int = 2076;
      
      public static const imgEnemyE12Down:int = 2077;
      
      public static const imgEnemyE12Walk:int = 2093;
      
      public static const imgEnemyE13Att:int = 2105;
      
      public static const imgEnemyE13Down:int = 2120;
      
      public static const imgEnemyE13Walk:int = 2136;
      
      public static const imgEnemyE14Att:int = 2148;
      
      public static const imgEnemyE14Down:int = 2168;
      
      public static const imgEnemyE14Arms:int = 2184;
      
      public static const imgEnemyE14Walk:int = 2199;
      
      public static const imgEnemyE15Att:int = 2211;
      
      public static const imgEnemyE15Down:int = 2221;
      
      public static const imgEnemyE15Walk:int = 2237;
      
      public static const imgEnemyE16Att:int = 2249;
      
      public static const imgEnemyE16Down:int = 2259;
      
      public static const imgEnemyE16Walk:int = 2275;
      
      public static const imgEnemyE17Att:int = 2287;
      
      public static const imgEnemyE17Down:int = 2362;
      
      public static const imgEnemyE17Walk:int = 2378;
      
      public static const imgEnemyE18Att:int = 2390;
      
      public static const imgEnemyE18Down:int = 2410;
      
      public static const imgEnemyE18Arms:int = 2426;
      
      public static const imgEnemyE18Walk:int = 2427;
      
      public static const imgEnemyE19Att:int = 2439;
      
      public static const imgEnemyE19Down:int = 2454;
      
      public static const imgEnemyE19Walk:int = 2470;
      
      public static const imgEnemyE20Att:int = 2482;
      
      public static const imgEnemyE20Down:int = 2483;
      
      public static const imgEnemyE20Walk:int = 2499;
      
      public static const imgEnemyE21Att:int = 2511;
      
      public static const imgEnemyE21Down:int = 2521;
      
      public static const imgEnemyE21Walk:int = 2537;
      
      public static const imgEnemyE22Att:int = 2549;
      
      public static const imgEnemyE22Arms:int = 2565;
      
      public static const imgEnemyE22Down:int = 2569;
      
      public static const imgEnemyE22Walk:int = 2585;
      
      public static const imgEnemyE23Att:int = 2597;
      
      public static const imgEnemyE23Down:int = 2607;
      
      public static const imgEnemyE23Walk:int = 2623;
      
      public static const imgEnemyE24Att:int = 2635;
      
      public static const imgEnemyE24Down:int = 2645;
      
      public static const imgEnemyE24Walk:int = 2661;
      
      public static const imgEnemyE25Att:int = 2673;
      
      public static const imgEnemyE25Down:int = 2688;
      
      public static const imgEnemyE25Walk:int = 2704;
      
      public static const imgEnemyE26Arms:int = 2716;
      
      public static const imgEnemyE26Att:int = 2717;
      
      public static const imgEnemyE26Down:int = 2737;
      
      public static const imgEnemyE26Walk:int = 2753;
      
      public static const imgEnemyE27Att:int = 2765;
      
      public static const imgEnemyE27Down:int = 2780;
      
      public static const imgEnemyE27Walk:int = 2796;
      
      public static const imgEnemyE28Att:int = 2808;
      
      public static const imgEnemyE28Down:int = 2823;
      
      public static const imgEnemyE28Walk:int = 2839;
      
      public static const imgEnemyE29Att:int = 2851;
      
      public static const imgEnemyE29Down:int = 2866;
      
      public static const imgEnemyE29Walk:int = 2882;
      
      public static const imgEnemyE30Att:int = 2894;
      
      public static const imgEnemyE30Down:int = 2909;
      
      public static const imgEnemyE30Eff:int = 2925;
      
      public static const imgEnemyE30Arms:int = 2940;
      
      public static const imgEnemyE30Walk:int = 2955;
      
      public static const imgEnemyE31Att:int = 2967;
      
      public static const imgEnemyE31Down:int = 2977;
      
      public static const imgEnemyE31Walk:int = 2993;
      
      public static const imgEnemyE32Att:int = 3005;
      
      public static const imgEnemyE32Down:int = 3006;
      
      public static const imgEnemyE32Walk:int = 3022;
      
      public static const imgEnemyE33Att:int = 3034;
      
      public static const imgEnemyE33Down:int = 3049;
      
      public static const imgEnemyE33Walk:int = 3065;
      
      public static const imgEnemyE34Att:int = 3077;
      
      public static const imgEnemyE34Down:int = 3097;
      
      public static const imgEnemyE34Arms:int = 3113;
      
      public static const imgEnemyE34Walk:int = 3128;
      
      public static const imgEnemyE35Att:int = 3140;
      
      public static const imgEnemyE35Down:int = 3150;
      
      public static const imgEnemyE35Walk:int = 3166;
      
      public static const imgEnemyE36Att:int = 3178;
      
      public static const imgEnemyE36Down:int = 3188;
      
      public static const imgEnemyE36Walk:int = 3204;
      
      public static const imgEnemyE37Att:int = 3216;
      
      public static const imgEnemyE37Down:int = 3291;
      
      public static const imgEnemyE37Walk:int = 3307;
      
      public static const imgEnemyE38Att:int = 3319;
      
      public static const imgEnemyE38Down:int = 3339;
      
      public static const imgEnemyE38Arms:int = 3355;
      
      public static const imgEnemyE38Walk:int = 3356;
      
      public static const imgEnemyE39Att:int = 3368;
      
      public static const imgEnemyE39Down:int = 3383;
      
      public static const imgEnemyE39Walk:int = 3399;
      
      public static const imgEnemyE40Att:int = 3411;
      
      public static const imgEnemyE40Down:int = 3412;
      
      public static const imgEnemyE40Walk:int = 3428;
      
      public static const imgEnemyBoss01:int = 3440;
      
      public static const imgEnemyBoss01Eff:int = 3449;
      
      public static const imgEnemyBoss02:int = 3464;
      
      public static const imgEnemyBoss02FrogDown:int = 3484;
      
      public static const imgEnemyBoss02FrogWait:int = 3500;
      
      public static const imgEnemyBoss02Magic:int = 3512;
      
      public static const imgEnemyBoss03:int = 3527;
      
      public static const imgEnemyBoss04:int = 3538;
      
      public static const imgEnemyBoss04Eff:int = 3547;
      
      public static const imgEnemyBoss05:int = 3562;
      
      public static const imgEnemyBoss06:int = 3591;
      
      public static const imgEnemyBoss07:int = 3601;
      
      public static const imgEnemyBoss07Effa:int = 3616;
      
      public static const imgEnemyBoss07Effb:int = 3630;
      
      public static const imgEnemyBoss08:int = 3635;
      
      public static const imgEnemyBoss08Fire:int = 3643;
      
      public static const imgEnemyBoss09:int = 3649;
      
      public static const imgEnemyBoss09Arms:int = 3661;
      
      public static const imgEnemyBoss09Eff:int = 3681;
      
      public static const imgEnemyBoss10:int = 3710;
      
      public static const imgEnemyBoss10Eff:int = 3725;
      
      public static const imgEnemyBoss10Magic:int = 3734;
      
      public static const imgDiaWindow:int = 3764;
      
      public static const imgMace:int = 5326;
      
      public static const imgBg:int = 6921;
      
      public static const imgEnemyStation:int = 6951;
      
      public static const imgStageSelect:int = 6957;
      
      public static const imgStun:int = 6996;
      
      public static const imgAura:int = 7012;
      
      public static const imgExplosion_a:int = 7018;
      
      public static const imgExplosion_b:int = 7033;
      
      public static const imgExplosion_s:int = 7048;
      
      public static const imgBurn:int = 7063;
      
      public static const imgIce:int = 7073;
      
      public static const imgEnemyStationCrash:int = 7083;
      
      public static const imgEnemyStationHit:int = 7103;
      
      public static const imgLevelUp:int = 7113;
      
      public static const imgSkillInfor:int = 7117;
      
      public static const imgUnitDie:int = 7152;
      
      public static const imgEnemyDie:int = 7186;
      
      public static const imgFail:int = 7220;
      
      public static const imgBadEnergy:int = 7224;
      
      public static const imgDestiny:int = 7242;
      
      public static const imgWagon:int = 7266;
      
      public static const imgWarRoad:int = 7269;
      
      public static const imgWarRoadUnitGoal:int = 7284;
      
      public static const imgWarRoadEnemyGoal:int = 7302;
      
      public static const imgShadow:int = 7320;
      
      public static const imgHeroPos:int = 7321;
      
      public static const imgCancel:int = 7342;
      
      public static const imgOk:int = 7344;
      
      public static const imgUnitGage:int = 7346;
      
      public static const imgDragonFire:int = 7406;
      
      public static const imgAttackedEff:int = 7418;
      
      public static const imgCard:int = 7438;
      
      public static const imgCardUi:int = 7538;
      
      public static const imgQuestIcon:int = 7541;
      
      public static const imgQuestUi:int = 7601;
      
      public static const imgUi:int = 7607;
      
      public static const imgStageClear:int = 7698;
      
      public static const imgPause:int = 7706;
      
      public static const imgStart:int = 7711;
      
      public static const imgNum:int = 7728;
      
      public static const imgMaceIcon:int = 7740;
      
      public static const imgRingIcon:int = 7751;
      
      public static const imgEtcItem:int = 7761;
      
      public static const imgItemInfor:int = 7766;
      
      public static const imgLoading:int = 7790;
      
      public static const imgLoadingBg:int = 7810;
      
      public static const imgUnitIcon:int = 7820;
      
      public static const imgUnitInfor:int = 7848;
      
      public static const imgStore:int = 7866;
      
      public static const imgTitleLogo:int = 7943;
      
      public static const imgTitle:int = 7952;
      
      public static const imgMenu:int = 8001;
      
      public static const imgOption:int = 8029;
      
      public static const imgOpening:int = 8054;
      
      public static const imgCinemaBtn:int = 8062;
      
      public static const imgTutorial:int = 8072;
      
      public static const imgAd:int = 8193;
      
      public static const imgTowerKey:int = 8199;
      
      public static const imgCinemaUi:int = 8200;
      
      public static const imgCinema01:int = 8203;
      
      public static const imgCinema02:int = 8218;
      
      public static const imgCinema03:int = 8235;
      
      public static const imgCinema04:int = 8237;
      
      public static const imgCinema05:int = 8240;
      
      public static const imgChapterClear:int = 8900;
      
      public static const imgEnding:int = 8909;
      
      public static const imgEndingBg:int = 8935;
      
      public static const imgEventBtn:int = 8945;
      
      public static const imgLinkBtn:int = 8949;
      
      public static const imgLevelUpEff:int = 8957;
      
      public static const imgTitleBtn:int = 8992;
      
      public static const imgPaladogDummy:int = 8997;
      
      public static const ENEMYIMG_TYPE:int = 3;
      
      public static const ENEMYIMG_WALK:int = 0;
      
      public static const ENEMYIMG_ATK:int = 1;
      
      public static const ENEMYIMG_DEAD:int = 2;
      
      public static const UNITIMG_TYPE:int = 4;
      
      public static const UNITIMG_WALK:int = 0;
      
      public static const UNITIMG_ATK1:int = 1;
      
      public static const UNITIMG_ATK2:int = 2;
      
      public static const UNITIMG_DEAD:int = 3;
      
      public static const MAX_ENEMYNUM:int = 150;
      
      public static const MAX_UNITNUM:int = 150;
      
      public static const OBJNUM:int = MAX_UNITNUM + MAX_ENEMYNUM + 1;
      
      public static const HEROPOS:int = MAX_UNITNUM + MAX_ENEMYNUM;
      
      public static const MAX_DESTINYICONNUM:int = 9;
      
      public static const ENEMYSTATION_POS:int = 1000;
      
      public static const ENEMYSTATIONPOS:int = 10000;
      
      public static const BOSSPPS_EVENT:int = 100;
      
      public static const BOSSDIALOGPOS_EVENT:int = 760 - 620;
      
      public static const MAX_3DMAXANINUM:int = 200;
      
      public static const Ani_Mace:int = 0;
      
      public static const Ani_Paladog:int = 1;
      
      public static const Ani_StoreCha:int = 2;
      
      public static const Ani_Boss01:int = 3;
      
      public static const Ani_Boss02:int = 4;
      
      public static const Ani_Boss03:int = 5;
      
      public static const Ani_Boss04:int = 6;
      
      public static const Ani_Boss05:int = 7;
      
      public static const Ani_Boss06:int = 8;
      
      public static const Ani_Boss07:int = 9;
      
      public static const Ani_Boss08:int = 10;
      
      public static const Ani_Boss09:int = 11;
      
      public static const Ani_Boss10:int = 12;
      
      public static const Ani_TitleBg_01:int = 13;
      
      public static const Ani_TitleBg_02:int = 14;
      
      public static const Ani_TitlePaladog_01:int = 15;
      
      public static const Ani_TitlePaladog_02:int = 16;
      
      public static const Ani_TitlePaladog_Loop:int = 17;
      
      public static const Ani_TitleMace_01:int = 18;
      
      public static const Ani_TitleMace_02:int = 19;
      
      public static const Ani_TitleMace_Loop:int = 20;
      
      public static const Ani_TitleLogo_01:int = 21;
      
      public static const Ani_TitleLogo_Loop:int = 22;
      
      public static const Ani_TitleBg01_Loop:int = 23;
      
      public static const Ani_TitleBg02_Loop:int = 24;
      
      public static const Ani_TitleBg03_Loop:int = 25;
      
      public static const Ani_TitleBg04_Loop:int = 26;
      
      public static const Ani_TitleBg05_Loop:int = 27;
      
      public static const Ani_TitleBg06_Loop:int = 28;
      
      public static const Ani_TitleBg07_Loop:int = 29;
      
      public static const Ani_TitleBg08_Loop:int = 30;
      
      public static const Ani_Opening_01:int = 31;
      
      public static const Ani_ChapterClear_01:int = 42;
      
      public static const Ani_Ending01:int = 46;
      
      public static const Ani_Ending02:int = 50;
      
      public static const Ani_Ending03:int = 51;
      
      public static const Ani_EndingBg:int = 55;
      
      public static const Ani_EndingCha:int = 67;
      
      public static const Ani_EndingTxt:int = 79;
      
      public static const Ani_Event01_Bg:int = 81;
      
      public static const Ani_Event02_Bg:int = 82;
      
      public static const Ani_Event03_Bg:int = 83;
      
      public static const Ani_Event04_Bg_0:int = 84;
      
      public static const Ani_Event05_Bg:int = 85;
      
      public static const Ani_Event01_ui:int = 86;
      
      public static const Ani_Event02_ui:int = 87;
      
      public static const Ani_Event03_ui:int = 88;
      
      public static const Ani_Event04_ui:int = 89;
      
      public static const Ani_Event05_ui:int = 90;
      
      public static const Ani_Event01_shadow:int = 91;
      
      public static const Ani_Event02_shadow:int = 92;
      
      public static const Ani_Event03_shadow:int = 93;
      
      public static const Ani_Event04_shadow:int = 94;
      
      public static const Ani_Event05_shadow:int = 95;
      
      public static const Ani_Event01_eff:int = 96;
      
      public static const Ani_Event01_enemy:int = 97;
      
      public static const Ani_Event01_mace:int = 98;
      
      public static const Ani_Event01_maceeff:int = 99;
      
      public static const Ani_Event01_npc:int = 100;
      
      public static const Ani_Event01_paladog:int = 101;
      
      public static const Ani_Event02_beaver01:int = 102;
      
      public static const Ani_Event02_beaver02:int = 103;
      
      public static const Ani_Event02_boss:int = 104;
      
      public static const Ani_Event02_paladog:int = 105;
      
      public static const Ani_Event02_mace:int = 106;
      
      public static const Ani_Event02_maceeff:int = 107;
      
      public static const Ani_Event03_key:int = 108;
      
      public static const Ani_Event03_u03:int = 109;
      
      public static const Ani_Event03_u04:int = 110;
      
      public static const Ani_Event03_mace:int = 111;
      
      public static const Ani_Event03_paladog:int = 112;
      
      public static const Ani_Event03_b05:int = 113;
      
      public static const Ani_Event03_b06:int = 114;
      
      public static const Ani_Event03_b04:int = 115;
      
      public static const Ani_Event03_u01:int = 116;
      
      public static const Ani_Event03_u02:int = 117;
      
      public static const Ani_Event04_b06:int = 118;
      
      public static const Ani_Event04_b07:int = 119;
      
      public static const Ani_Event04_bomb:int = 120;
      
      public static const Ani_Event04_eff:int = 121;
      
      public static const Ani_Event04_key:int = 122;
      
      public static const Ani_Event04_mace:int = 123;
      
      public static const Ani_Event04_mirror:int = 124;
      
      public static const Ani_Event04_paladog:int = 125;
      
      public static const Ani_Event04_u01:int = 126;
      
      public static const Ani_Event04_u03:int = 127;
      
      public static const Ani_Event04_u04:int = 128;
      
      public static const Ani_Event04_u05:int = 129;
      
      public static const Ani_Event04_u06:int = 130;
      
      public static const Ani_Event05_mace:int = 131;
      
      public static const Ani_Event05_paladog:int = 132;
      
      public static const Ani_Event05_door:int = 133;
      
      public static const Ani_Event05_u01_01:int = 134;
      
      public static const Ani_Event05_u01_02:int = 135;
      
      public static const Ani_Event05_u02_01:int = 136;
      
      public static const Ani_Event05_u02_02:int = 137;
      
      public static const Ani_Event05_u03_01:int = 138;
      
      public static const Ani_Event05_u03_02:int = 139;
      
      public static const Ani_Event05_u04_01:int = 140;
      
      public static const Ani_Event05_u04_02:int = 141;
      
      public static const Ani_Event05_u05_01:int = 142;
      
      public static const Ani_Event05_u05_02:int = 143;
      
      public static const Ani_Event05_u06_01:int = 144;
      
      public static const Ani_Event05_u06_02:int = 145;
      
      public static const Ani_Event05_u07:int = 146;
      
      public static const Ani_Event05_u08:int = 147;
      
      public static const Ani_Event05_u09:int = 148;
      
      public static const Ani_LevelUp:int = 149;
      
      public static const Ani_Event04_Bg_1:int = 150;
      
      public static const aniEnemyBoss01Att:int = 0;
      
      public static const aniEnemyBoss01Dead:int = 1;
      
      public static const aniEnemyBoss01Wait:int = 2;
      
      public static const aniEnemyBoss01Walk:int = 3;
      
      public static const aniEnemyBoss02Att:int = 4;
      
      public static const aniEnemyBoss02Dead:int = 5;
      
      public static const aniEnemyBoss02Wait:int = 6;
      
      public static const aniEnemyBoss02Walk:int = 7;
      
      public static const aniEnemyBoss03Att:int = 8;
      
      public static const aniEnemyBoss03Dead:int = 9;
      
      public static const aniEnemyBoss03Wait:int = 10;
      
      public static const aniEnemyBoss03Walk:int = 11;
      
      public static const aniEnemyBoss04Att:int = 12;
      
      public static const aniEnemyBoss04Dead:int = 13;
      
      public static const aniEnemyBoss04Wait:int = 14;
      
      public static const aniEnemyBoss04Walk:int = 15;
      
      public static const aniEnemyBoss05Att:int = 16;
      
      public static const aniEnemyBoss05Dead:int = 17;
      
      public static const aniEnemyBoss05Wait:int = 18;
      
      public static const aniEnemyBoss05Walk:int = 19;
      
      public static const aniEnemyBoss06Att:int = 20;
      
      public static const aniEnemyBoss06Dead:int = 21;
      
      public static const aniEnemyBoss06Wait:int = 22;
      
      public static const aniEnemyBoss06Walk:int = 23;
      
      public static const aniEnemyBoss07Att:int = 24;
      
      public static const aniEnemyBoss07Dead:int = 25;
      
      public static const aniEnemyBoss07Wait:int = 26;
      
      public static const aniEnemyBoss07Walk:int = 27;
      
      public static const aniEnemyBoss08Att:int = 28;
      
      public static const aniEnemyBoss08Dead:int = 29;
      
      public static const aniEnemyBoss08Wait:int = 30;
      
      public static const aniEnemyBoss08Walk:int = 31;
      
      public static const aniEnemyBoss09Att:int = 32;
      
      public static const aniEnemyBoss09Dead:int = 33;
      
      public static const aniEnemyBoss09Wait:int = 34;
      
      public static const aniEnemyBoss09Walk:int = 35;
      
      public static const aniEnemyBoss10Att:int = 36;
      
      public static const aniEnemyBoss10Dead:int = 37;
      
      public static const aniEnemyBoss10Wait:int = 38;
      
      public static const aniEnemyBoss10Walk:int = 39;
      
      public static const aniMace01Att:int = 40;
      
      public static const aniMace01Dead:int = 41;
      
      public static const aniMace01Wait:int = 42;
      
      public static const aniMace01Walk:int = 43;
      
      public static const aniMace02Att:int = 44;
      
      public static const aniMace02Dead:int = 45;
      
      public static const aniMace02Wait:int = 46;
      
      public static const aniMace02Walk:int = 47;
      
      public static const aniMace03Att:int = 48;
      
      public static const aniMace03Dead:int = 49;
      
      public static const aniMace03Wait:int = 50;
      
      public static const aniMace03Walk:int = 51;
      
      public static const aniMace04Att:int = 52;
      
      public static const aniMace04Dead:int = 53;
      
      public static const aniMace04Wait:int = 54;
      
      public static const aniMace04Walk:int = 55;
      
      public static const aniMace05Att:int = 56;
      
      public static const aniMace05Dead:int = 57;
      
      public static const aniMace05Wait:int = 58;
      
      public static const aniMace05Walk:int = 59;
      
      public static const aniMace06Att:int = 60;
      
      public static const aniMace06Dead:int = 61;
      
      public static const aniMace06Wait:int = 62;
      
      public static const aniMace06Walk:int = 63;
      
      public static const aniMace07Att:int = 64;
      
      public static const aniMace07Dead:int = 65;
      
      public static const aniMace07Wait:int = 66;
      
      public static const aniMace07Walk:int = 67;
      
      public static const aniMace08Att:int = 68;
      
      public static const aniMace08Dead:int = 69;
      
      public static const aniMace08Wait:int = 70;
      
      public static const aniMace08Walk:int = 71;
      
      public static const aniMace09Att:int = 72;
      
      public static const aniMace09Dead:int = 73;
      
      public static const aniMace09Wait:int = 74;
      
      public static const aniMace09Walk:int = 75;
      
      public static const aniMace10Att:int = 76;
      
      public static const aniMace10Dead:int = 77;
      
      public static const aniMace10Wait:int = 78;
      
      public static const aniMace10Walk:int = 79;
      
      public static const aniMace11Att:int = 80;
      
      public static const aniMace11Dead:int = 81;
      
      public static const aniMace11Wait:int = 82;
      
      public static const aniMace11Walk:int = 83;
      
      public static const aniPaladogHeadAtt:int = 84;
      
      public static const aniPaladogHeadDead:int = 85;
      
      public static const aniPaladogHeadWait:int = 86;
      
      public static const aniPaladogHeadWalk:int = 87;
      
      public static const aniPaladogBodyAtt:int = 88;
      
      public static const aniPaladogBodyDead:int = 89;
      
      public static const aniPaladogBodyWait:int = 90;
      
      public static const aniPaladogBodyWalk:int = 91;
      
      public static const aniPaladogHorseAtt:int = 92;
      
      public static const aniPaladogHorseDead:int = 93;
      
      public static const aniPaladogHorseWait:int = 94;
      
      public static const aniPaladogHorseWalk:int = 95;
      
      public static const aniPaladogAtt:int = 197;
      
      public static const aniPaladogDead:int = 198;
      
      public static const aniPaladogWait:int = 199;
      
      public static const aniPaladogWalk:int = 200;
      
      public var bPasswordLock:Boolean = false;
      
      public var PASSWORD:Array = new Array(8);
      
      public var nPasswordPos:int;
      
      public var RES_VERSION:String = "";
      
      public var bGameSave:Boolean = true;
      
      public var bFirstTitle:Boolean = true;
      
      public var lib:Library;
      
      public var ope:Operation;
      
      public var player:Player;
      
      public var touch:TouchAction;
      
      public var key:KeyAction;
      
      public var backBuffer:Bitmap = null;
      
      public var backBuffer2:Bitmap = null;
      
      public var backBuffer3:Bitmap = null;
      
      public var nBlurFrame:int;
      
      public var textField:TextField = null;
      
      private var timer:Timer;
      
      public var nLoadingState:int = -10000;
      
      public var SLEEP:Number = 16.666666666666668;
      
      public var nSetTime:int = 0;
      
      public var nNowTime:int = 0;
      
      public var nLeakTime:int = 0;
      
      public var nLeakFrame:int = 0;
      
      public var nBeforeAtkFrame:int;
      
      public var nHelpPos:int;
      
      public var bOtherWindow:Boolean;
      
      public var nFps:int = 0;
      
      public var _nFps:int = 0;
      
      public var nFpsSetTime:int = 0;
      
      public var nFpsNowTime:int = 0;
      
      public var bActive:Boolean;
      
      public var bResume:Boolean;
      
      public var nTouchX:int;
      
      public var nTouchY:int;
      
      public var nTouchMoveX:int;
      
      public var nTouchMoveY:int;
      
      public var nKeyValue:int;
      
      public var nLoadChaImg:int;
      
      public var nLoadFrame:int;
      
      public var nTitleLightIndex:int;
      
      public var nTitleLightFrame:int;
      
      public var nTitleWindIndex:int;
      
      public var nTitleWindFrame:int;
      
      public var nCloudX1:int;
      
      public var nCloudY1:int;
      
      public var nCloudX2:int;
      
      public var nCloudY2:int;
      
      public var nMountX1:Number;
      
      public var nMountY1:Number;
      
      public var nMountX2:Number;
      
      public var nMountY2:Number;
      
      public var nPaladogX:Number;
      
      public var nPaladogY:Number;
      
      public var bStageClearSnd:Boolean = false;
      
      public var nLcdW:int = 760;
      
      public var nLcdH:int = 570;
      
      public var nLcdWC:int;
      
      public var nLcdHC:int;
      
      public var nMainState:int = 0;
      
      public var nMainScene:int;
      
      public var _nMainScene:int;
      
      public var nMainFrame:int;
      
      public var nBeforeMainState:int;
      
      public var nBeforeMainScene:int;
      
      public var nAniBossDieFrame:int;
      
      public var nTopUiState:int = 0;
      
      public var nTopUiScene:int;
      
      public var _nTopUiScene:int;
      
      public var nTopUiFrame:int;
      
      public var bEventSkipBtn:Boolean;
      
      public var bEventNextBtn:Boolean;
      
      public var nBeforeTopUiState:int;
      
      public var nBeforeTopUiScene:int;
      
      public var bChapterClearSnd:Boolean;
      
      public var bEndingSnd1:Boolean;
      
      public var bEndingSnd2:Boolean;
      
      public var bEndingSnd3:Boolean;
      
      public var nGameState:int;
      
      public var _nGameState:int;
      
      public var nGameScene:int;
      
      public var nGameFrame:int;
      
      public var nBeforeGameState:int;
      
      public var nBeforeGameScene:int;
      
      public var nMenuPos:int;
      
      public var nSubMenuPos:int;
      
      public var nSubSubMenuPos:int;
      
      public var nGameAge:int;
      
      public var nGameLevel:int;
      
      public var nGameSlot:int;
      
      public var nTotalStarNum:int;
      
      public var bUnitUpgradeAct:Boolean;
      
      public var bMaceEquipAct:Boolean;
      
      public var nUnitUpgradeActFrame:int;
      
      public var nMaceEquipActFrame:int;
      
      public var bOpenUnitTab:Boolean;
      
      public var nBeforeClearStar:int;
      
      public var bStartBg:Boolean;
      
      public var bEnding:Boolean;
      
      public var nBagPos:int;
      
      public var nItemInBag:int;
      
      public var bOkBtn:Boolean;
      
      public var bSurvivalOkBtn:Boolean;
      
      public var bNoBtn:Boolean;
      
      public var bChangeChapter:Boolean;
      
      public var bNextChapterBtn:Boolean;
      
      public var bNextChapterBtnOver:Boolean;
      
      public var bBeforeChapterBtn:Boolean;
      
      public var bBeforeChapterBtnOver:Boolean;
      
      public var bMusicVolumeUpBtn:Boolean;
      
      public var bMusicVolumeDownBtn:Boolean;
      
      public var bEffectVolumeUpBtn:Boolean;
      
      public var bEffectVolumeDownBtn:Boolean;
      
      public var bDrawOptionAni:Boolean;
      
      public var bBuySellBtn:Boolean;
      
      public var bPauseBtn:Boolean;
      
      public var bUpgradeBtn:Boolean;
      
      public var bUnitBtn:Boolean;
      
      public var bUnitTabOver:Boolean;
      
      public var bEquipBtn:Boolean;
      
      public var bStoreBtn:Boolean;
      
      public var bSortingBtn:Boolean;
      
      public var bDrawSortingList:Boolean;
      
      public var bMaceSortingBtn:Boolean;
      
      public var bRingSortingBtn:Boolean;
      
      public var bEquipTabOver:Boolean;
      
      public var bStageSelectBtn:Boolean;
      
      public var bStageSelectTabOver:Boolean;
      
      public var bResumeBtn:Boolean;
      
      public var bReplayBtn:Boolean;
      
      public var bGiveUpBtn:Boolean;
      
      public var STAGESELECTNUMBEROVER:Array = new Array(Player.MAX_STAGE);
      
      public var nStageBackgroundMoveX:int;
      
      public var bCardBtn:Boolean;
      
      public var bEmblemBtn:Boolean;
      
      public var bAchieveBtn:Boolean;
      
      public var bRankingBtn:Boolean;
      
      public var bAddGemBtn:Boolean;
      
      public var bOptionBtn:Boolean;
      
      public var bCardOver:Boolean;
      
      public var bEmblemOver:Boolean;
      
      public var bAchieveOver:Boolean;
      
      public var bRankingOver:Boolean;
      
      public var nBtnFrame:int;
      
      public var bTutorial:Boolean;
      
      public var nTutorial:Array = new Array(INITDATA,INITDATA,INITDATA,INITDATA,INITDATA,INITDATA,INITDATA);
      
      public var nRinkType:int;
      
      public var strRink:Array = new Array("Android","iPhone","Twitter","Me2day","Facebook","Youtube");
      
      public var nOpeningPosX:int;
      
      public var nOpeningFrame:int;
      
      public var bGameMenu:Boolean;
      
      public var nAniX:int;
      
      public var nAniY:int;
      
      public var nSubAniX:int;
      
      public var nSubAniY:int;
      
      public var nSubAniX2:int;
      
      public var nSubAniX3:int;
      
      public var nEndingScene:int;
      
      public var nEndingFrame:int;
      
      public var nEventScene:int;
      
      public var nEventFrame:int;
      
      public var nEventSoundCount:int;
      
      public var nMoneyDrawPosX:int;
      
      public var bAppStoreBtn:Boolean;
      
      public var bGooglePlayBtn:Boolean;
      
      public var nStoreSelectItem:int;
      
      public var nInvenSelectItem:int;
      
      public var nEquipSelectItem:int;
      
      public var nDragItemPosX:int;
      
      public var nDragItemPosY:int;
      
      public var nPigTipIndex:int;
      
      public var nPigDialogStep:int;
      
      public var nPigDialogFrame:int;
      
      public var bPigThanksBuy:Boolean;
      
      public var bPigThanksSell:Boolean;
      
      public var nLarvaTipIndex:int;
      
      public var nLarvaDialogStep:int;
      
      public var nLarvaDialogFrame:int;
      
      public var bEquipTabMouseDown:Boolean;
      
      public var bEquipTabMouseMove:Boolean;
      
      public var bScreenDrag:Boolean;
      
      public var bMoveLeftDrag:Boolean;
      
      public var bMoveRightDrag:Boolean;
      
      public var nBagSortType:int;
      
      public var nUnitUpgradeFrame:int;
      
      public var bStoreItemSelect:Boolean;
      
      public var bInvenItemSelect:Boolean;
      
      public var bEquipItemSelect:Boolean;
      
      public var bItemUnEquipBtn:Boolean;
      
      public var bBagSelect:Boolean;
      
      public var bItemEquipBtn:Boolean;
      
      public var bItemEquipBtnSelect:Boolean;
      
      public var bKeyMove:Boolean;
      
      public var nRingEquipLock:int;
      
      public var nStoreItemSelectPos:int;
      
      public var nInvenItemSelectPos:int;
      
      public var nEquipItemSelectPos:int;
      
      public var nItemPrice:int;
      
      public var ENEMYIMG:Array = new Array(imgEnemyE01Walk,imgEnemyE01Att,imgEnemyE01Down,imgEnemyE02Walk,imgEnemyE02Att,imgEnemyE02Down,imgEnemyE03Walk,imgEnemyE03Att,imgEnemyE03Down,imgEnemyE04Walk,imgEnemyE04Att,imgEnemyE04Down,imgEnemyE05Walk,imgEnemyE05Att,imgEnemyE05Down,imgEnemyE06Walk,imgEnemyE06Att,imgEnemyE06Down,imgEnemyE07Walk,imgEnemyE07Att,imgEnemyE07Down,imgEnemyE08Walk,imgEnemyE08Att,imgEnemyE08Down,imgEnemyE09Walk,imgEnemyE09Att,imgEnemyE09Down,imgEnemyE10Walk,imgEnemyE10Att,imgEnemyE10Down,imgEnemyE11Walk,imgEnemyE11Att,imgEnemyE11Down,imgEnemyE12Walk,imgEnemyE12Att,imgEnemyE12Down,imgEnemyE13Walk,imgEnemyE13Att,imgEnemyE13Down,imgEnemyE14Walk,imgEnemyE14Att,imgEnemyE14Down,imgEnemyE15Walk,imgEnemyE15Att,imgEnemyE15Down,imgEnemyE16Walk,imgEnemyE16Att,imgEnemyE16Down,imgEnemyE17Walk,imgEnemyE17Att,imgEnemyE17Down,imgEnemyE18Walk,imgEnemyE18Att,imgEnemyE18Down,imgEnemyE19Walk,imgEnemyE19Att,imgEnemyE19Down,imgEnemyE20Walk,imgEnemyE20Att,imgEnemyE20Down,imgEnemyE21Walk,imgEnemyE21Att
      ,imgEnemyE21Down,imgEnemyE22Walk,imgEnemyE22Att,imgEnemyE22Down,imgEnemyE23Walk,imgEnemyE23Att,imgEnemyE23Down,imgEnemyE24Walk,imgEnemyE24Att,imgEnemyE24Down,imgEnemyE25Walk,imgEnemyE25Att,imgEnemyE25Down,imgEnemyE26Walk,imgEnemyE26Att,imgEnemyE26Down,imgEnemyE27Walk,imgEnemyE27Att,imgEnemyE27Down,imgEnemyE28Walk,imgEnemyE28Att,imgEnemyE28Down,imgEnemyE29Walk,imgEnemyE29Att,imgEnemyE29Down,imgEnemyE30Walk,imgEnemyE30Att,imgEnemyE30Down,imgEnemyE31Walk,imgEnemyE31Att,imgEnemyE31Down,imgEnemyE32Walk,imgEnemyE32Att,imgEnemyE32Down,imgEnemyE33Walk,imgEnemyE33Att,imgEnemyE33Down,imgEnemyE34Walk,imgEnemyE34Att,imgEnemyE34Down,imgEnemyE35Walk,imgEnemyE35Att,imgEnemyE35Down,imgEnemyE36Walk,imgEnemyE36Att,imgEnemyE36Down,imgEnemyE37Walk,imgEnemyE37Att,imgEnemyE37Down,imgEnemyE38Walk,imgEnemyE38Att,imgEnemyE38Down,imgEnemyE39Walk,imgEnemyE39Att,imgEnemyE39Down,imgEnemyE40Walk,imgEnemyE40Att,imgEnemyE40Down);
      
      public var UNITIMG:Array = new Array(imgUnit01Walk,imgUnit01Atk1,imgUnit01Atk2,imgUnit01Dead,imgUnit02Walk,imgUnit02Atk1,imgUnit02Atk1,imgUnit02Dead,imgUnit03Walk,imgUnit03Atk1,imgUnit03Atk2,imgUnit03Dead,imgUnit04Walk,imgUnit04Atk1,imgUnit04Atk2,imgUnit04Dead,imgUnit05Walk,imgUnit05Atk1,imgUnit05Atk1,imgUnit05Dead,imgUnit06Walk,imgUnit06Atk1,imgUnit06Atk1,imgUnit06Dead,imgUnit07Walk,imgUnit07Atk1,imgUnit07Atk2,imgUnit07Dead,imgUnit08Walk,imgUnit08Atk1,imgUnit08Atk1,imgUnit08Dead,imgUnit09Walk,imgUnit09Atk1,imgUnit09Atk1,imgUnit09Dead,imgWagonWalk,imgWagonDead,imgWagonDead,imgWagonDead);
      
      public var BOSSIMG:Array = new Array(imgEnemyBoss01,imgEnemyBoss02,imgEnemyBoss03,imgEnemyBoss04,imgEnemyBoss05,imgEnemyBoss06,imgEnemyBoss07,imgEnemyBoss08,imgEnemyBoss09,imgEnemyBoss10);
      
      public var UI_MACEICONIMG:Array = new Array(9,14,34,10,15,35,11,16,36);
      
      public var nTotalDrawObjNum:int;
      
      public var nDrawEnemyNum:int;
      
      public var nDrawUnitNum:int;
      
      public var STAGEDB:Array = new Array();
      
      public var DESTINYDB:Array = new Array();
      
      public var UNITDB:Array = new Array();
      
      public var HERODB:Array = new Array();
      
      public var ENEMYDB:Array = new Array();
      
      public var QUESTICONDB:Array = new Array();
      
      public var QUESTTYPEDB:Array = new Array();
      
      public var QUESTDB:Array = new Array();
      
      public var CARDBOOKDB:Array = new Array();
      
      public var UNITINFORDB:Array = new Array();
      
      public var STOREINFORDB:Array = new Array();
      
      public var BOSSDIALOGDB:Array = new Array();
      
      public var nBossEventTime:int;
      
      public var nUiPassTime:Array = new Array(MAX_UNITKIND);
      
      public var bBossDiaEvent:Boolean;
      
      public var bBossDialog:Boolean;
      
      public var nKeyPressTime:int;
      
      public var bKeyPressed:Boolean;
      
      public var bKeyAni:Boolean;
      
      public var nKeyAniFrame:int;
      
      public var ENEMY:Array = new Array(MAX_ENEMYNUM);
      
      public var UNIT:Array = new Array(MAX_UNITNUM);
      
      public var nObjDrawPos:Array = new Array(OBJNUM);
      
      public var DESTINYICON:Array = new Array(MAX_DESTINYICONNUM);
      
      public var nDialogStep:int;
      
      public var n3DSMaxAniLoadIndex:int = 0;
      
      public var n3DSMaxAniSetImgIndex:int = 0;
      
      public var n3DSMaxAniCreateImgIndex:int = 0;
      
      public var n3DSMaxAniFrame:int = 0;
      
      public var n3DSMaxAniStartTime:int;
      
      public var n3DSMaxAniNowTime:int;
      
      public var n3DSMaxAniLeakTime:int;
      
      public var MAXANI:Array = new Array(MAX_3DMAXANINUM);
      
      public var nASEANILoadIndex:int;
      
      public var nASEANISetImgIndex:int;
      
      public var ASEANI:Array = new Array();
      
      public var bCreateKeyboardEvent:Boolean = false;
      
      public function Drawing()
      {
         super();
      }
      
      public function initApp() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < 8)
         {
            this.PASSWORD[_loc1_] = false;
            _loc1_++;
         }
         this.nPasswordPos = 0;
         this.lib = new Library(this);
         if(GAME_RELEASE)
         {
            this.bPasswordLock = false;
         }
         if(RES_UPDATE)
         {
            this.RES_VERSION += "?resVersion=1";
         }
         this.ope = new Operation(this);
         this.touch = new TouchAction(this);
         this.key = new KeyAction(this);
         this.player = new Player(this);
         _loc1_ = 0;
         while(_loc1_ < MAX_ENEMYNUM)
         {
            this.ENEMY[_loc1_] = new Enemy(this);
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < MAX_UNITNUM)
         {
            this.UNIT[_loc1_] = new Unit(this);
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < MAX_DESTINYICONNUM)
         {
            this.DESTINYICON[_loc1_] = new DestinyIcon(this);
            _loc1_++;
         }
         this.addEventListener(MouseEvent.MOUSE_DOWN,this.touchDownAction);
         this.addEventListener(MouseEvent.MOUSE_UP,this.touchUpAction);
         this.addEventListener(MouseEvent.MOUSE_MOVE,this.touchMoveAction);
         this.addEventListener(MouseEvent.MOUSE_OUT,this.touchOutAction);
         this.addEventListener(MouseEvent.MOUSE_OVER,this.touchOverAction);
         this.addEventListener(Event.MOUSE_LEAVE,this.mouseOutAction);
         this.bCreateKeyboardEvent = true;
         this.nBlurFrame = 0;
         this.backBuffer = new Bitmap(new BitmapData(this.nLcdW,this.nLcdH,true,0),PixelSnapping.AUTO,true);
         this.backBuffer.x = 0;
         this.backBuffer.y = 0;
         addChild(this.backBuffer);
         _loc1_ = 0;
         while(_loc1_ < Library.MAXSIZE_EMBEDIMG)
         {
            this.lib.EMBEDIMG[_loc1_] = null;
            _loc1_++;
         }
         this.lib.nLoadImgCount = 0;
         this.lib.bLoading = false;
         this.lib.loadEmbedImg();
         this.lib.loadGameData();
         this.lib.loadGameAni();
         this.lib.loadGameDB();
         this.lib.loadGameSnd();
         this.lib.resetClip();
         this.bFirstTitle = true;
         this.bEnding = false;
         this.bActive = true;
         this.bResume = false;
         this.bOkBtn = false;
         this.bSurvivalOkBtn = false;
         this.bNoBtn = false;
         this.bChangeChapter = false;
         this.bNextChapterBtn = false;
         this.bBeforeChapterBtn = false;
         this.bResumeBtn = false;
         this.bReplayBtn = false;
         this.bGiveUpBtn = false;
         this.bCardBtn = false;
         this.bEmblemBtn = false;
         this.bAchieveBtn = false;
         this.bRankingBtn = false;
         this.bAddGemBtn = false;
         this.bOptionBtn = false;
         this.bOtherWindow = false;
         this.bScreenDrag = false;
         this.bMoveLeftDrag = false;
         this.bMoveRightDrag = false;
         this.bCardOver = false;
         this.bEmblemOver = false;
         this.bAchieveOver = false;
         this.bRankingOver = false;
         this.bAppStoreBtn = false;
         this.bGooglePlayBtn = false;
         this.bKeyMove = false;
         this.nBtnFrame = 0;
         this.nTouchX = INITDATA;
         this.nTouchY = INITDATA;
         this.nTouchMoveX = INITDATA;
         this.nTouchMoveY = INITDATA;
         this.nKeyValue = INITDATA;
         this.nLcdWC = this.nLcdW >> 1;
         this.nLcdHC = this.nLcdH >> 1;
         if(!this.lib.loadFile(DB_OPTION,"paladog_option",INITDATA))
         {
            this.lib.nMusicVolume = 3;
            this.lib.nEffectVolume = 3;
            this.lib.nSaveMusicVolume = this.lib.nMusicVolume;
            this.lib.nSaveEffectVolume = this.lib.nEffectVolume;
         }
         this.nSetTime = getTimer();
         this.nFps = 0;
         this._nFps = 0;
         this.nFpsSetTime = getTimer();
         this.nLeakTime = 0;
         this.nLeakFrame = 0;
         this.timer = null;
         this.timer = new Timer(this.sleep(),1);
         this.timer.addEventListener(TimerEvent.TIMER,this.run);
         this.timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.timerStop);
         this.timer.start();
      }
      
      private function sleep() : Number
      {
         var _loc1_:Number = 0;
         var _loc2_:int = 0;
         this.nLeakFrame = 0;
         this.nNowTime = getTimer();
         _loc2_ = this.nNowTime - this.nSetTime;
         if(_loc2_ <= this.SLEEP)
         {
            _loc1_ = this.SLEEP - _loc2_;
         }
         else
         {
            this.nLeakTime += _loc2_ - this.SLEEP;
            if(this.nLeakTime >= this.SLEEP)
            {
               while(this.nLeakTime >= this.SLEEP)
               {
                  this.nLeakTime -= this.SLEEP;
                  this.nLeakFrame += 1;
               }
            }
         }
         this.nSetTime = getTimer();
         return _loc1_;
      }
      
      private function timerStop(param1:TimerEvent) : void
      {
         this.timer = null;
         this.timer = new Timer(this.sleep(),1);
         this.timer.addEventListener(TimerEvent.TIMER,this.run);
         this.timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.timerStop);
         this.timer.start();
      }
      
      private function run(param1:TimerEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         this.paint();
         if(GAME_SLOWTEST)
         {
            _loc2_ = 0;
            while(_loc2_ < 900000)
            {
               _loc3_ = _loc2_;
               _loc3_ += _loc2_ * 1000 / 2000 * 100;
               _loc2_++;
            }
         }
         if(this.bCreateKeyboardEvent)
         {
            this.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.keyPress);
            this.stage.addEventListener(KeyboardEvent.KEY_UP,this.keyRelease);
            this.bCreateKeyboardEvent = false;
         }
         param1.updateAfterEvent();
      }
      
      public function keyPress(param1:KeyboardEvent) : void
      {
         switch(param1.type)
         {
            case KeyboardEvent.KEY_DOWN:
               this.key.keyPress(param1.keyCode);
         }
      }
      
      public function keyRelease(param1:KeyboardEvent) : void
      {
         switch(param1.type)
         {
            case KeyboardEvent.KEY_UP:
               this.key.keyRelease(param1.keyCode);
         }
      }
      
      public function touchDownAction(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_DOWN:
               this.nTouchX = param1.localX;
               this.nTouchY = param1.localY;
               this.touch.bUpEvent = false;
               this.touch.bDownEvent = true;
         }
      }
      
      public function touchUpAction(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_UP:
               this.nTouchX = param1.localX;
               this.nTouchY = param1.localY;
               this.touch.bDownEvent = false;
               this.touch.bUpEvent = true;
         }
      }
      
      public function touchMoveAction(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_MOVE:
               this.nTouchMoveX = param1.localX;
               this.nTouchMoveY = param1.localY;
               this.touch.bMoveEvent = true;
         }
      }
      
      public function touchOverAction(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
         }
      }
      
      public function touchOutAction(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OUT:
               this.nTouchX = param1.localX;
               this.nTouchY = param1.localY;
               this.touch.bDownEvent = false;
               this.touch.bUpEvent = true;
               switch(this.nMainState)
               {
                  case MAIN_GAME:
                     switch(this.nGameState)
                     {
                        case GAME_PLAY:
                           switch(this.player.nGameMode)
                           {
                              case MODE_NORMAL:
                              case MODE_WAGON:
                              case MODE_BOSS:
                              case MODE_SURVIVAL:
                                 if(!this.bActive)
                                 {
                                    switch(this.nGameScene)
                                    {
                                       case 1:
                                          if(!this.bKeyMove)
                                          {
                                             this.player.bMoveLeft = false;
                                             this.player.bBgLeft = false;
                                             this.player.bMoveRight = false;
                                             this.player.bBgRight = false;
                                             this.player.nMoveDirection = INITDATA;
                                          }
                                          this.player.nMoveBgPosX = INITDATA;
                                    }
                                    this.bActive = true;
                                 }
                           }
                     }
               }
         }
      }
      
      public function mouseOutAction(param1:Event) : void
      {
         switch(param1.type)
         {
            case Event.MOUSE_LEAVE:
         }
      }
      
      private function paint() : void
      {
         if(this.nTouchX > INITDATA && this.nTouchY > INITDATA || this.nTouchMoveX > INITDATA && this.nTouchMoveY > INITDATA)
         {
            this.touch.touchResult();
         }
         if(this.nMainState != this.nBeforeMainState)
         {
            this.nBeforeMainState = this.nMainState;
            this.nMainScene = 0;
            this.nBeforeMainScene = 0;
            this.nMainFrame = 0;
         }
         else if(this.nMainScene != this.nBeforeMainScene)
         {
            this.nBeforeMainScene = this.nMainScene;
            this.nMainFrame = 0;
         }
         switch(this.nMainState)
         {
            case MAIN_LOGO:
               this.drawLogo();
               break;
            case MAIN_USEAGE:
               this.drawUseAge();
               break;
            case MAIN_TITLEANI:
               this.drawTitleAni();
               break;
            case MAIN_TITLE:
               this.drawTitle();
               break;
            case MAIN_MENU:
               this.drawMenu();
               break;
            case MAIN_INTRO:
               this.drawIntro();
               break;
            case MAIN_STAGESELECT:
               this.drawStageSelect();
               break;
            case MAIN_TUTORIAL:
               this.drawTutorial();
               break;
            case MAIN_GAME:
               this.drawGame();
               break;
            case MAIN_OPTION:
               this.drawOption();
               break;
            case MAIN_HELP:
               this.drawHelp();
               break;
            case MAIN_SURVIVAL:
               this.drawSurvival();
               break;
            case MAIN_AD:
               this.drawAd();
         }
         this.nMainFrame += 1 + this.nLeakFrame;
         this.nFpsNowTime = getTimer();
         if(this.nFpsNowTime - this.nFpsSetTime >= 1000)
         {
            ++this._nFps;
            this.nFps = this._nFps;
            this._nFps = 0;
            this.nFpsSetTime = getTimer();
         }
         else
         {
            ++this._nFps;
         }
      }
      
      public function drawLogo() : void
      {
         switch(this.nMainScene)
         {
            case 0:
               this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,16777215,TOP | LEFT);
               this.lib.drawEmbedImg(imgLogo,this.nLcdWC,this.nLcdHC,VCENTER | HCENTER);
               if(this.nMainFrame >= FPS * 3)
               {
                  this.nMainState = MAIN_USEAGE;
               }
         }
      }
      
      public function drawUseAge() : void
      {
         var _loc1_:int = 0;
         this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,16777215,TOP | LEFT);
         this.lib.drawEmbedImg(imgLogo + 1,this.nLcdWC,this.nLcdHC,VCENTER | HCENTER);
         this.lib.fillRect(370,529,350 / 173 * this.nMainScene,26,16749141,TOP | LEFT);
         this.lib.drawEmbedImg(imgLogo + 2,this.nLcdWC,this.nLcdHC,VCENTER | HCENTER);
         switch(this.nMainScene)
         {
            case Library.LOADLOGOIMG_LEN + Library.LOADLOGOANI_LEN:
               _loc1_ = 0;
               while(_loc1_ < Library.MAXSIZE_SNDEFFECT)
               {
                  this.lib.loadEffect(this.lib.SNDEFFECTNAME[_loc1_],_loc1_);
                  _loc1_++;
               }
               ++this.nMainScene;
               break;
            case Library.LOADLOGOIMG_LEN + Library.LOADLOGOANI_LEN + 1:
               _loc1_ = 0;
               while(_loc1_ < Library.MAXSIZE_MUSIC)
               {
                  this.lib.loadMusic(this.lib.MUSICNAME[_loc1_],_loc1_);
                  _loc1_++;
               }
               ++this.nMainScene;
               break;
            case Library.LOADLOGOIMG_LEN + Library.LOADLOGOANI_LEN + 2:
               this.lib.loadStageDB(Library.stageDB);
               break;
            case Library.LOADLOGOIMG_LEN + Library.LOADLOGOANI_LEN + 3:
               this.lib.loadUnitDB(Library.unitDB);
               break;
            case Library.LOADLOGOIMG_LEN + Library.LOADLOGOANI_LEN + 4:
               this.lib.loadEnemyDB(Library.enemyDB);
               break;
            case Library.LOADLOGOIMG_LEN + Library.LOADLOGOANI_LEN + 5:
               this.lib.loadDestinyDB(Library.destinyDB);
               break;
            case Library.LOADLOGOIMG_LEN + Library.LOADLOGOANI_LEN + 6:
               this.lib.loadBossDialogDB(Library.bossDialog);
               break;
            case Library.LOADLOGOIMG_LEN + Library.LOADLOGOANI_LEN + 7:
               this.lib.loadUnitInforDB(Library.unitinfor);
               break;
            case Library.LOADLOGOIMG_LEN + Library.LOADLOGOANI_LEN + 8:
               this.lib.loadStoreInforDB(Library.storeinfor);
               break;
            case Library.LOADLOGOIMG_LEN + Library.LOADLOGOANI_LEN + 9:
               this.nMainState = MAIN_TITLEANI;
               break;
            default:
               if(this.nMainScene >= 0 && this.nMainScene < Library.LOADLOGOIMG_LEN)
               {
                  this.lib.loadImgFlashDat(this.lib.LOADLOGOIMG[this.nMainScene],this.lib.LOADLOGOIMGINDEX[this.nMainScene]);
               }
               else
               {
                  this.lib.loadASEAni(this.lib.LOADLOGOANI[this.nMainScene - Library.LOADLOGOIMG_LEN],this.lib.LOADLOGOANIINDEX[this.nMainScene - Library.LOADLOGOIMG_LEN],this.lib.LOADLOGOANIIMGINDEX[this.nMainScene - Library.LOADLOGOIMG_LEN]);
               }
         }
      }
      
      public function drawAd() : void
      {
         var _loc1_:URLRequest = null;
         var _loc2_:URLRequest = null;
         switch(this.nMainScene)
         {
            case 0:
               this.lib.drawImg(imgAd,0,0,TOP | LEFT);
               this.lib.drawImg(imgAd + 1,int(this.nMainFrame / 12) % 2 * 10,0,TOP | LEFT);
               this.lib.drawImg(imgAd + 3,0,0,TOP | LEFT);
               this.lib.drawImg(imgAd + 2,0,0,TOP | LEFT);
               if(this.bAppStoreBtn)
               {
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bAppStoreBtn = false;
                     _loc1_ = new URLRequest("http://itunes.apple.com/us/app/paladog!/id415458476?mt=8");
                     navigateToURL(_loc1_);
                     this.sendServerLog(GAME_VERSION,1,1);
                  }
               }
               if(this.bGooglePlayBtn)
               {
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bGooglePlayBtn = false;
                     _loc2_ = new URLRequest("https://market.android.com/details?id=com.Paladog.KorGG&feature=search_result");
                     navigateToURL(_loc2_);
                     this.sendServerLog(GAME_VERSION,2,1);
                  }
               }
               if(this.bOkBtn)
               {
                  this.lib.drawImg(imgOption + 4,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bOkBtn = false;
                     if(this.bEnding)
                     {
                        this.bEnding = false;
                        this.nMainState = MAIN_TITLEANI;
                     }
                     else
                     {
                        this.nMainState = MAIN_STAGESELECT;
                     }
                  }
               }
               else
               {
                  this.lib.drawImg(imgAd + 5,0,0,TOP | LEFT);
               }
               this.bActive = false;
         }
      }
      
      public function drawTitleAni() : void
      {
         var _loc1_:int = 0;
         switch(this.nMainScene)
         {
            case 0:
               if(this.nMainFrame == 0)
               {
                  this.lib.playEffect(25);
               }
               else if(this.nMainFrame >= 299)
               {
                  this.nMainFrame = 299;
                  ++this.nMainScene;
               }
               this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,0,TOP | LEFT);
               this.lib.drawASEAni(Ani_TitleBg_01,0,imgTitle,this.nMainFrame,this.nLcdWC,this.nLcdHC,100,100,false);
               this.lib.drawASEAni(Ani_TitleMace_01,0,imgMace01,this.nMainFrame,this.nLcdWC,this.nLcdHC,100,100,false);
               this.lib.drawASEAni(Ani_TitlePaladog_01,0,imgPaladog,this.nMainFrame,this.nLcdWC,this.nLcdHC,100,100,false);
               this.bActive = false;
               break;
            case 1:
               if(this.nMainFrame == 0)
               {
                  this.lib.playEffect(60);
               }
               else if(this.nMainFrame >= 59)
               {
                  this.nMainFrame = 59;
                  this.nMainState = MAIN_TITLE;
               }
               this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,0,TOP | LEFT);
               this.lib.drawASEAni(Ani_TitleBg_02,0,imgTitle,this.nMainFrame,this.nLcdWC,this.nLcdHC,100,100,false);
               this.lib.drawASEAni(Ani_TitleMace_02,0,imgMace01,this.nMainFrame,this.nLcdWC,this.nLcdHC,100,100,false);
               this.lib.drawASEAni(Ani_TitlePaladog_02,0,imgPaladog,this.nMainFrame,this.nLcdWC,this.nLcdHC,100,100,false);
               this.bActive = false;
         }
      }
      
      public function sendServerLog(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:URLRequest = new URLRequest("http://1.234.6.240/paladogweblog.php");
         _loc4_.method = URLRequestMethod.POST;
         var _loc5_:URLVariables = new URLVariables();
         _loc5_.version = "" + param1;
         _loc5_.type = "" + param2;
         _loc5_.count = "" + param3;
         _loc4_.data = _loc5_;
         var _loc6_:URLLoader = new URLLoader();
         _loc6_.addEventListener(Event.COMPLETE,this.phpLoaderComplete);
         _loc6_.load(_loc4_);
      }
      
      public function phpLoaderComplete(param1:Event) : void
      {
      }
      
      public function drawTitleBg() : void
      {
         this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,0,TOP | LEFT);
         this.lib.drawASEAni(Ani_TitleBg08_Loop,0,imgTitle,this.nMainFrame % 2,this.nLcdWC,this.nLcdHC,100,100,false);
         this.lib.drawASEAni(Ani_TitleBg07_Loop,0,imgTitle,this.nMainFrame % 120,this.nLcdWC,this.nLcdHC,100,100,false);
         this.lib.drawASEAni(Ani_TitleBg06_Loop,0,imgTitle,this.nMainFrame % 60,this.nLcdWC,this.nLcdHC,100,100,false);
         this.lib.drawASEAni(Ani_TitleBg05_Loop,0,imgTitle,this.nMainFrame % 600,this.nLcdWC,this.nLcdHC,100,100,false);
         this.lib.drawASEAni(Ani_TitleBg04_Loop,0,imgTitle,this.nMainFrame % 300,this.nLcdWC,this.nLcdHC,100,100,false);
         this.lib.drawASEAni(Ani_TitleBg03_Loop,0,imgTitle,this.nMainFrame % 180,this.nLcdWC,this.nLcdHC,100,100,false);
         this.lib.drawASEAni(Ani_TitleBg02_Loop,0,imgTitle,this.nMainFrame % 2,this.nLcdWC,this.nLcdHC,100,100,false);
         this.lib.drawASEAni(Ani_TitleBg01_Loop,0,imgTitle,this.nMainFrame % 300,this.nLcdWC,this.nLcdHC,100,100,false);
         this.lib.drawASEAni(Ani_TitleMace_Loop,0,imgMace01,this.nMainFrame % 60,this.nLcdWC,this.nLcdHC,100,100,false);
         this.lib.drawASEAni(Ani_TitlePaladog_Loop,0,imgPaladog,this.nMainFrame % 60,this.nLcdWC,this.nLcdHC,100,100,false);
         if(this.bFirstTitle)
         {
            if(this.nMainFrame >= 179)
            {
               this.nMainFrame = 179;
               this.bFirstTitle = false;
            }
            this.lib.drawASEAni(Ani_TitleLogo_01,0,imgTitleLogo,this.nMainFrame,this.nLcdWC,this.nLcdHC,100,100,false);
         }
         else
         {
            this.lib.drawASEAni(Ani_TitleLogo_Loop,0,imgTitleLogo,this.nMainFrame % 180,this.nLcdWC,this.nLcdHC,100,100,false);
         }
      }
      
      public function drawTitle() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:URLRequest = null;
         var _loc4_:URLRequest = null;
         var _loc5_:URLRequest = null;
         var _loc6_:URLRequest = null;
         switch(this.nMainScene)
         {
            case 0:
               this.drawTitleBg();
               if(this.nMainFrame == 0)
               {
                  this.lib.playMusic(Library.MUSIC_TITLE,true);
               }
               if(!this.bPasswordLock)
               {
                  this.lib.drawImgAlpha(imgLinkBtn + 6,0,0,80,TOP | LEFT);
                  this.lib.drawImg(imgLinkBtn + 4,0,0,TOP | LEFT);
                  this.lib.drawImg(imgLinkBtn + 1,0,0,TOP | LEFT);
                  this.lib.drawImg(imgLinkBtn + 2,0,0,TOP | LEFT);
                  this.lib.drawImg(imgLinkBtn + 5,0,0,TOP | LEFT);
                  if(this.bFirstTitle)
                  {
                     if(this.nMainFrame < FPS)
                     {
                        this.lib.drawImgAlpha(imgTitleBtn,0,0,100 * this.nMainFrame / FPS,TOP | LEFT);
                     }
                     else
                     {
                        this.lib.drawImg(imgTitleBtn,0,0,TOP | LEFT);
                     }
                  }
                  else
                  {
                     this.lib.drawImg(imgTitleBtn,0,0,TOP | LEFT);
                  }
                  if(this.bOkBtn)
                  {
                     if(this.nRinkType == 0)
                     {
                        this.lib.drawImg(imgTitleBtn + 3,0,0,TOP | LEFT);
                     }
                     else
                     {
                        switch(this.nRinkType)
                        {
                           case 1:
                              this.lib.drawImg(imgLinkBtn + 4,0,0,TOP | LEFT);
                              break;
                           case 2:
                              this.lib.drawImg(imgLinkBtn + 1,0,0,TOP | LEFT);
                              break;
                           case 3:
                              this.lib.drawImg(imgLinkBtn + 2,0,0,TOP | LEFT);
                              break;
                           case 4:
                              this.lib.drawImg(imgLinkBtn + 5,0,0,TOP | LEFT);
                        }
                        this.lib.drawImg(imgTitleBtn + 4,0,0,TOP | LEFT);
                     }
                     this.nBtnFrame += 1 + this.nLeakFrame;
                     if(this.nBtnFrame > MAX_BTNFRAME)
                     {
                        this.nBtnFrame = 0;
                        this.bOkBtn = false;
                        this.bFirstTitle = false;
                        if(this.nRinkType != 0)
                        {
                           if(this.lib.nMusicVolume > Library.SND_OFF)
                           {
                              this.lib.nSaveMusicVolume = this.lib.nMusicVolume;
                              this.lib.nMusicVolume = Library.SND_OFF;
                              this.lib.setMusicVolume();
                           }
                           this.lib.sndEffectAllStop();
                           this.bOtherWindow = true;
                        }
                        switch(this.nRinkType)
                        {
                           case 0:
                              this.nMainScene = 1;
                              break;
                           case 1:
                              _loc3_ = new URLRequest("http://itunes.apple.com/us/app/paladog!/id415458476?mt=8");
                              navigateToURL(_loc3_);
                              break;
                           case 2:
                              _loc4_ = new URLRequest("https://market.android.com/details?id=com.Paladog.KorGG&feature=search_result");
                              navigateToURL(_loc4_);
                              break;
                           case 3:
                              _loc5_ = new URLRequest("http://www.facebook.com/fazecatpaladog");
                              navigateToURL(_loc5_);
                              break;
                           case 4:
                              _loc6_ = new URLRequest("http://youtu.be/hg6dU4UuUWo");
                              navigateToURL(_loc6_);
                        }
                        this.sendServerLog(GAME_VERSION,this.nRinkType,1);
                     }
                  }
                  else if(this.bFirstTitle)
                  {
                     if(this.nMainFrame < FPS)
                     {
                        this.lib.drawImgAlpha(imgTitleBtn + 4,0,0,100 * this.nMainFrame / FPS,TOP | LEFT);
                     }
                     else
                     {
                        this.lib.drawImg(imgTitleBtn + 4,0,0,TOP | LEFT);
                     }
                  }
                  else
                  {
                     this.lib.drawImg(imgTitleBtn + 4,0,0,TOP | LEFT);
                  }
                  if(this.bOptionBtn)
                  {
                     this.lib.drawImg(imgTitleBtn + 1,0,0,TOP | LEFT);
                     this.nBtnFrame += 1 + this.nLeakFrame;
                     if(this.nBtnFrame > MAX_BTNFRAME)
                     {
                        this.nBtnFrame = 0;
                        this.bOptionBtn = false;
                        this.bFirstTitle = false;
                        this.nMainScene = 2;
                     }
                  }
                  else if(this.bFirstTitle)
                  {
                     if(this.nMainFrame < FPS)
                     {
                        this.lib.drawImgAlpha(imgTitleBtn + 2,0,0,100 * this.nMainFrame / FPS,TOP | LEFT);
                     }
                     else
                     {
                        this.lib.drawImg(imgTitleBtn + 2,0,0,TOP | LEFT);
                     }
                  }
                  else
                  {
                     this.lib.drawImg(imgTitleBtn + 2,0,0,TOP | LEFT);
                  }
               }
               else
               {
                  this.lib.drawBorderString("XIN NHẬP MẬT MÃ !!  ",this.nLcdWC + 30,this.nLcdHC,16777215,16711680,100,TOP | HCENTER);
                  this.lib.fillRect(this.nLcdWC - 80,this.nLcdHC - 10 + 40,160,20,16777215,TOP | LEFT);
                  _loc1_ = 0;
                  while(_loc1_ < 8)
                  {
                     this.lib.fillRect(this.nLcdWC - 80 + 2 + _loc1_ * 20,this.nLcdHC - 10 + 2 + 40,16,16,16711680,TOP | LEFT);
                     _loc1_++;
                  }
                  _loc1_ = 0;
                  while(_loc1_ < this.nPasswordPos)
                  {
                     this.lib.fillRect(this.nLcdWC - 80 + 2 + _loc1_ * 20,this.nLcdHC - 10 + 2 + 40,16,16,0,TOP | LEFT);
                     _loc1_++;
                  }
               }
               this.bActive = false;
               break;
            case 1:
               this.drawTitleBg();
               this.nAniX = 540;
               this.nSubAniX = 0;
               this.nSubAniX2 = 0;
               this.nSubAniX3 = 0;
               _loc1_ = 0;
               while(_loc1_ < 3)
               {
                  if(!this.lib.loadFile(DB_SLOT,"paladog_slot",_loc1_))
                  {
                     _loc2_ = 0;
                     while(_loc2_ < 6)
                     {
                        this.player.GAME_SLOT[_loc1_ * 6 + _loc2_] = Drawing.INITDATA;
                        _loc2_++;
                     }
                  }
                  else
                  {
                     this.player.GAME_SLOT[_loc1_ * 6] = 0;
                  }
                  _loc1_++;
               }
               this.nMainState = MAIN_MENU;
               break;
            case 2:
               this.drawTitleBg();
               this.nAniX = 340;
               this.nSubAniX = 0;
               this.nSubAniX2 = 0;
               this.nSubAniX3 = 0;
               this.bDrawOptionAni = true;
               this.nMainState = MAIN_OPTION;
         }
      }
      
      public function drawMainTitle(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Array = new Array(245,156,310,143,340,159);
         _loc2_ = 0;
         while(_loc2_ < 60)
         {
            this.lib.drawImg(imgTitle + 7,0 + _loc2_ * 8,0,TOP | LEFT);
            _loc2_++;
         }
         this.lib.drawImgZoom(imgTitle + 25,this.nLcdWC,0,200,200,TOP | HCENTER);
         if(this.nTitleWindFrame < 12)
         {
            this.lib.drawImg(imgTitle + 42 + (this.nTitleWindFrame >> 1) + this.nTitleWindIndex * 6,0,0,TOP | LEFT);
         }
         ++this.nTitleWindFrame;
         if(this.nTitleWindFrame >= 90)
         {
            this.nTitleWindFrame = 0;
            ++this.nTitleWindIndex;
            if(this.nTitleWindIndex >= 3)
            {
               this.nTitleWindIndex = 0;
            }
         }
         this.lib.drawImg(imgTitle + 12,this.nLcdW,this.nLcdH,BOTTOM | RIGHT);
         this.lib.drawImg(imgTitle + 13 + this.nMainFrame / 10 % 6,this.nLcdW,this.nLcdH - 152,BOTTOM | RIGHT);
         this.lib.drawImg(imgTitle + 19 + this.nMainFrame / 10 % 6,this.nLcdW - 124,this.nLcdH - 46,BOTTOM | RIGHT);
         this.lib.drawImg(imgTitle + 2,345,219,TOP | LEFT);
         this.lib.drawImg(imgTitle + 1,298,320,BOTTOM | RIGHT);
         this.lib.drawImg(imgTitle + 26,152,119,BOTTOM | RIGHT);
         if(param1 != TITLE_OPENING)
         {
            this.lib.drawImg(imgTitle,this.nLcdW - 10,10,TOP | RIGHT);
         }
         if(this.nTitleLightFrame < 8)
         {
            this.lib.drawImgDodge(imgTitle + 10 + (this.nTitleLightFrame >> 1) % 2,_loc3_[this.nTitleLightIndex * 2],_loc3_[this.nTitleLightIndex * 2 + 1],BlendMode.ADD,TOP | LEFT);
         }
         ++this.nTitleLightFrame;
         if(this.nTitleLightFrame >= 90)
         {
            this.nTitleLightFrame = 0;
            ++this.nTitleLightIndex;
            if(this.nTitleLightIndex >= 3)
            {
               this.nTitleLightIndex = 0;
            }
         }
         if(param1 == TITLE_MAIN)
         {
            this.lib.drawImg(imgTitle + 3,10,this.nLcdH - 5,BOTTOM | LEFT);
            this.lib.drawImg(imgTitle + 5,this.nLcdW - 10,this.nLcdH - 5,BOTTOM | RIGHT);
            this.lib.drawImg(imgTitle + 8,this.nLcdWC,this.nLcdH - 3,BOTTOM | HCENTER);
         }
      }
      
      public function drawOption() : void
      {
         var _loc1_:int = 0;
         switch(this.nMainScene)
         {
            case 0:
               if(this.bDrawOptionAni)
               {
                  this.drawTitleBg();
                  this.drawOptionBoard(this.nAniX,this.nSubAniX,this.nSubAniX2,this.nSubAniX3);
                  _loc1_ = (25 - this.nMainFrame) * (1 + this.nLeakFrame);
                  if(_loc1_ <= 0)
                  {
                     _loc1_ = 2;
                  }
                  this.nAniX -= _loc1_;
                  if(this.nAniX <= 0)
                  {
                     this.nAniX = 0;
                     this.nMenuPos = 0;
                     this.nSubMenuPos = 0;
                     this.nSubSubMenuPos = 1;
                     this.bDrawOptionAni = false;
                     ++this.nMainScene;
                  }
               }
               else
               {
                  this.drawTitleBg();
                  this.drawOptionBoard(this.nAniX,this.nSubAniX,this.nSubAniX2,this.nSubAniX3);
                  ++this.nMainScene;
               }
               break;
            case 1:
               this.drawTitleBg();
               this.drawOptionBoard(this.nAniX,this.nSubAniX,this.nSubAniX2,this.nSubAniX3);
               this.bActive = false;
               break;
            case 2:
               this.drawTitleBg();
               this.drawOptionBoard(this.nAniX,this.nSubAniX,this.nSubAniX2,this.nSubAniX3);
               _loc1_ = (25 - this.nMainFrame) * (1 + this.nLeakFrame);
               if(_loc1_ <= 0)
               {
                  _loc1_ = 2;
               }
               this.nAniX += _loc1_;
               if(this.nAniX >= 340)
               {
                  this.nAniX = 340;
                  this.nMainState = MAIN_TITLE;
               }
         }
      }
      
      public function drawOptionBoard(param1:int, param2:int, param3:int, param4:int) : void
      {
         var _loc5_:int = 0;
         this.lib.drawImg(imgOption + 7,param1,0,TOP | LEFT);
         this.lib.drawImg(imgCancel,param1 + 124,Player.BG_BASEPOSY - 133,TOP | LEFT);
         if(this.bOkBtn)
         {
            this.lib.drawImg(imgOption,param1,0,TOP | LEFT);
            this.nBtnFrame += 1 + this.nLeakFrame;
            if(this.nBtnFrame > MAX_BTNFRAME)
            {
               this.nBtnFrame = 0;
               this.bOkBtn = false;
               this.lib.saveFile(DB_OPTION,"paladog_option");
               this.nHelpPos = 0;
               this.nMainState = MAIN_HELP;
            }
         }
         else
         {
            this.lib.drawImg(imgOption + 1,param1,0,TOP | LEFT);
         }
         if(this.bMusicVolumeDownBtn)
         {
            this.lib.drawImg(imgOption + 2,param1,0,TOP | LEFT);
            this.nBtnFrame += 1 + this.nLeakFrame;
            if(this.nBtnFrame > MAX_BTNFRAME)
            {
               this.nBtnFrame = 0;
               this.bMusicVolumeDownBtn = false;
               if(this.lib.nMusicVolume == Library.SND_OFF)
               {
                  this.lib.nMusicVolume = this.lib.nSaveMusicVolume;
               }
               --this.lib.nMusicVolume;
               if(this.lib.nMusicVolume <= Library.SND_OFF)
               {
                  this.lib.nMusicVolume = Library.SND_OFF;
               }
               this.lib.nSaveMusicVolume = this.lib.nMusicVolume;
               this.lib.setMusicVolume();
               this.lib.saveFile(DB_OPTION,"paladog_option");
            }
         }
         else
         {
            this.lib.drawImg(imgOption + 3,param1,0,TOP | LEFT);
         }
         if(this.bMusicVolumeUpBtn)
         {
            this.lib.drawImg(imgOption + 4,param1,0,TOP | LEFT);
            this.nBtnFrame += 1 + this.nLeakFrame;
            if(this.nBtnFrame > MAX_BTNFRAME)
            {
               this.nBtnFrame = 0;
               this.bMusicVolumeUpBtn = false;
               if(this.lib.nMusicVolume == Library.SND_OFF)
               {
                  this.lib.nMusicVolume = this.lib.nSaveMusicVolume;
               }
               ++this.lib.nMusicVolume;
               if(this.lib.nMusicVolume >= 6)
               {
                  this.lib.nMusicVolume = 6;
               }
               this.lib.nSaveMusicVolume = this.lib.nMusicVolume;
               this.lib.setMusicVolume();
               this.lib.saveFile(DB_OPTION,"paladog_option");
            }
         }
         else
         {
            this.lib.drawImg(imgOption + 5,param1,0,TOP | LEFT);
         }
         if(this.bEffectVolumeDownBtn)
         {
            this.lib.drawImg(imgOption + 2,param1,105,TOP | LEFT);
            this.nBtnFrame += 1 + this.nLeakFrame;
            if(this.nBtnFrame > MAX_BTNFRAME)
            {
               this.nBtnFrame = 0;
               this.bEffectVolumeDownBtn = false;
               if(this.lib.nEffectVolume == Library.SND_OFF)
               {
                  this.lib.nEffectVolume = this.lib.nSaveEffectVolume;
               }
               --this.lib.nEffectVolume;
               if(this.lib.nEffectVolume <= Library.SND_OFF)
               {
                  this.lib.nEffectVolume = Library.SND_OFF;
               }
               this.lib.nSaveEffectVolume = this.lib.nEffectVolume;
               this.lib.saveFile(DB_OPTION,"paladog_option");
            }
         }
         else
         {
            this.lib.drawImg(imgOption + 3,param1,105,TOP | LEFT);
         }
         if(this.bEffectVolumeUpBtn)
         {
            this.lib.drawImg(imgOption + 4,param1,105,TOP | LEFT);
            this.nBtnFrame += 1 + this.nLeakFrame;
            if(this.nBtnFrame > MAX_BTNFRAME)
            {
               this.nBtnFrame = 0;
               this.bEffectVolumeUpBtn = false;
               if(this.lib.nEffectVolume == Library.SND_OFF)
               {
                  this.lib.nEffectVolume = this.lib.nSaveEffectVolume;
               }
               ++this.lib.nEffectVolume;
               if(this.lib.nEffectVolume >= 6)
               {
                  this.lib.nEffectVolume = 6;
               }
               this.lib.nSaveEffectVolume = this.lib.nEffectVolume;
               this.lib.saveFile(DB_OPTION,"paladog_option");
            }
         }
         else
         {
            this.lib.drawImg(imgOption + 5,param1,105,TOP | LEFT);
         }
         if(this.lib.nMusicVolume > Library.SND_OFF)
         {
            _loc5_ = 0;
            while(_loc5_ < this.lib.nMusicVolume)
            {
               this.lib.drawImg(imgOption + 19 + _loc5_,param1,0,TOP | LEFT);
               _loc5_++;
            }
         }
         else
         {
            this.lib.drawImg(imgOption + 6,param1,0,TOP | LEFT);
         }
         if(this.lib.nEffectVolume > Library.SND_OFF)
         {
            _loc5_ = 0;
            while(_loc5_ < this.lib.nEffectVolume)
            {
               this.lib.drawImg(imgOption + 19 + _loc5_,param1,105,TOP | LEFT);
               _loc5_++;
            }
         }
         else
         {
            this.lib.drawImg(imgOption + 6,param1,105,TOP | LEFT);
         }
      }
      
      public function drawHelp() : void
      {
         var _loc1_:int = 0;
         switch(this.nMainScene)
         {
            case 0:
               this.drawTitleBg();
               this.lib.drawImg(imgOption + 7,0,0,TOP | LEFT);
               this.lib.drawImg(imgOption + 8,0,0,TOP | LEFT);
               _loc1_ = 0;
               while(_loc1_ < 5)
               {
                  this.lib.drawImg(imgOption + 10 + _loc1_ * 2,0,0,TOP | LEFT);
                  _loc1_++;
               }
               if(this.bOkBtn)
               {
                  this.lib.drawImg(imgOption + 9 + this.nHelpPos * 2,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bOkBtn = false;
                     this.nMainScene = this.nHelpPos * 100 + 100;
                  }
               }
               if(this.bNoBtn)
               {
                  this.lib.drawImg(imgCancel + 1,124,Player.BG_BASEPOSY - 133,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bNoBtn = false;
                     this.nMainState = MAIN_OPTION;
                  }
               }
               else
               {
                  this.lib.drawImg(imgCancel,124,Player.BG_BASEPOSY - 133,TOP | LEFT);
               }
               this.bActive = false;
               break;
            case 100:
               this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,0,TOP | LEFT);
               this.lib.drawImg(imgTutorial,0,0,TOP | LEFT);
               this.lib.drawImg(imgTutorial + 1,0,0,TOP | LEFT);
               if(this.bOkBtn)
               {
                  this.lib.drawImg(imgTutorial + 24,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bOkBtn = false;
                     ++this.nMainScene;
                  }
               }
               else
               {
                  this.lib.drawImg(imgTutorial + 25,0,0,TOP | LEFT);
               }
               this.bActive = false;
               break;
            case 101:
               this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,0,TOP | LEFT);
               this.lib.drawImg(imgTutorial,0,0,TOP | LEFT);
               this.lib.drawImg(imgTutorial + 2,0,0,TOP | LEFT);
               if(this.bOkBtn)
               {
                  this.lib.drawImg(imgTutorial + 24,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bOkBtn = false;
                     ++this.nMainScene;
                  }
               }
               else
               {
                  this.lib.drawImg(imgTutorial + 25,0,0,TOP | LEFT);
               }
               this.bActive = false;
               break;
            case 102:
               this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,0,TOP | LEFT);
               this.lib.drawImg(imgTutorial,0,0,TOP | LEFT);
               this.lib.drawImg(imgTutorial + 3,0,0,TOP | LEFT);
               if(this.bOkBtn)
               {
                  this.lib.drawImg(imgTutorial + 24,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bOkBtn = false;
                     ++this.nMainScene;
                  }
               }
               else
               {
                  this.lib.drawImg(imgTutorial + 25,0,0,TOP | LEFT);
               }
               this.bActive = false;
               break;
            case 103:
               this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,0,TOP | LEFT);
               this.lib.drawImg(imgTutorial,0,0,TOP | LEFT);
               this.lib.drawImg(imgTutorial + 4,0,0,TOP | LEFT);
               if(this.bOkBtn)
               {
                  this.lib.drawImg(imgTutorial + 7,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bOkBtn = false;
                     ++this.nMainScene;
                  }
               }
               else
               {
                  this.lib.drawImg(imgTutorial + 8,0,0,TOP | LEFT);
               }
               this.bActive = false;
               break;
            case 104:
               this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,0,TOP | LEFT);
               this.lib.drawImg(imgTutorial,0,0,TOP | LEFT);
               this.lib.drawImg(imgTutorial + 5,0,0,TOP | LEFT);
               if(this.bOkBtn)
               {
                  this.lib.drawImg(imgTutorial + 7,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bOkBtn = false;
                     ++this.nMainScene;
                  }
               }
               else
               {
                  this.lib.drawImg(imgTutorial + 8,0,0,TOP | LEFT);
               }
               this.bActive = false;
               break;
            case 105:
               this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,0,TOP | LEFT);
               this.lib.drawImg(imgTutorial,0,0,TOP | LEFT);
               this.lib.drawImg(imgTutorial + 28,0,0,TOP | LEFT);
               if(this.bOkBtn)
               {
                  this.lib.drawImg(imgTutorial + 7,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bOkBtn = false;
                     this.nMainScene = 0;
                  }
               }
               else
               {
                  this.lib.drawImg(imgTutorial + 8,0,0,TOP | LEFT);
               }
               this.bActive = false;
               break;
            case 200:
               this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,0,TOP | LEFT);
               this.lib.drawImg(imgTutorial + 11,0,0,TOP | LEFT);
               this.lib.drawImg(imgTutorial + 9,0,0,TOP | LEFT);
               if(this.bOkBtn)
               {
                  this.lib.drawImg(imgTutorial + 24,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bOkBtn = false;
                     ++this.nMainScene;
                  }
               }
               else
               {
                  this.lib.drawImg(imgTutorial + 25,0,0,TOP | LEFT);
               }
               this.bActive = false;
               break;
            case 201:
               this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,0,TOP | LEFT);
               this.lib.drawImg(imgTutorial + 11,0,0,TOP | LEFT);
               this.lib.drawImg(imgTutorial + 10,0,0,TOP | LEFT);
               if(this.bOkBtn)
               {
                  this.lib.drawImg(imgTutorial + 24,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bOkBtn = false;
                     ++this.nMainScene;
                  }
               }
               else
               {
                  this.lib.drawImg(imgTutorial + 25,0,0,TOP | LEFT);
               }
               this.bActive = false;
               break;
            case 202:
               this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,0,TOP | LEFT);
               this.lib.drawImg(imgTutorial + 11,0,0,TOP | LEFT);
               this.lib.drawImg(imgTutorial + 12,0,0,TOP | LEFT);
               if(this.bOkBtn)
               {
                  this.lib.drawImg(imgTutorial + 24,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bOkBtn = false;
                     ++this.nMainScene;
                  }
               }
               else
               {
                  this.lib.drawImg(imgTutorial + 25,0,0,TOP | LEFT);
               }
               this.bActive = false;
               break;
            case 203:
               this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,0,TOP | LEFT);
               this.lib.drawImg(imgTutorial + 11,0,0,TOP | LEFT);
               this.lib.drawImg(imgTutorial + 28,0,0,TOP | LEFT);
               if(this.bOkBtn)
               {
                  this.lib.drawImg(imgTutorial + 24,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bOkBtn = false;
                     this.nMainScene = 0;
                  }
               }
               else
               {
                  this.lib.drawImg(imgTutorial + 25,0,0,TOP | LEFT);
               }
               this.bActive = false;
               break;
            case 300:
               this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,0,TOP | LEFT);
               this.lib.drawImg(imgTutorial,0,0,TOP | LEFT);
               this.lib.drawImg(imgTutorial + 14,0,0,TOP | LEFT);
               if(this.bOkBtn)
               {
                  this.lib.drawImg(imgTutorial + 24,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bOkBtn = false;
                     ++this.nMainScene;
                  }
               }
               else
               {
                  this.lib.drawImg(imgTutorial + 25,0,0,TOP | LEFT);
               }
               this.bActive = false;
               break;
            case 301:
               this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,0,TOP | LEFT);
               this.lib.drawImg(imgTutorial,0,0,TOP | LEFT);
               this.lib.drawImg(imgTutorial + 28,0,0,TOP | LEFT);
               if(this.bOkBtn)
               {
                  this.lib.drawImg(imgTutorial + 24,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bOkBtn = false;
                     this.nMainScene = 0;
                  }
               }
               else
               {
                  this.lib.drawImg(imgTutorial + 25,0,0,TOP | LEFT);
               }
               this.bActive = false;
               break;
            case 400:
               this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,0,TOP | LEFT);
               this.lib.drawImg(imgTutorial + 15,0,0,TOP | LEFT);
               this.lib.drawImg(imgTutorial + 16,0,0,TOP | LEFT);
               if(this.bOkBtn)
               {
                  this.lib.drawImg(imgTutorial + 24,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bOkBtn = false;
                     ++this.nMainScene;
                  }
               }
               else
               {
                  this.lib.drawImg(imgTutorial + 25,0,0,TOP | LEFT);
               }
               this.bActive = false;
               break;
            case 401:
               this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,0,TOP | LEFT);
               this.lib.drawImg(imgTutorial + 15,0,0,TOP | LEFT);
               this.lib.drawImg(imgTutorial + 17,0,0,TOP | LEFT);
               if(this.bOkBtn)
               {
                  this.lib.drawImg(imgTutorial + 24,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bOkBtn = false;
                     ++this.nMainScene;
                  }
               }
               else
               {
                  this.lib.drawImg(imgTutorial + 25,0,0,TOP | LEFT);
               }
               this.bActive = false;
               break;
            case 402:
               this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,0,TOP | LEFT);
               this.lib.drawImg(imgTutorial + 15,0,0,TOP | LEFT);
               this.lib.drawImg(imgTutorial + 31,0,0,TOP | LEFT);
               if(this.bOkBtn)
               {
                  this.lib.drawImg(imgTutorial + 24,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bOkBtn = false;
                     ++this.nMainScene;
                  }
               }
               else
               {
                  this.lib.drawImg(imgTutorial + 25,0,0,TOP | LEFT);
               }
               this.bActive = false;
               break;
            case 403:
               this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,0,TOP | LEFT);
               this.lib.drawImg(imgTutorial + 15,0,0,TOP | LEFT);
               this.lib.drawImg(imgTutorial + 19,0,0,TOP | LEFT);
               if(this.bOkBtn)
               {
                  this.lib.drawImg(imgTutorial + 24,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bOkBtn = false;
                     ++this.nMainScene;
                  }
               }
               else
               {
                  this.lib.drawImg(imgTutorial + 25,0,0,TOP | LEFT);
               }
               this.bActive = false;
               break;
            case 404:
               this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,0,TOP | LEFT);
               this.lib.drawImg(imgTutorial + 15,0,0,TOP | LEFT);
               this.lib.drawImg(imgTutorial + 20,0,0,TOP | LEFT);
               if(this.bOkBtn)
               {
                  this.lib.drawImg(imgTutorial + 24,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bOkBtn = false;
                     ++this.nMainScene;
                  }
               }
               else
               {
                  this.lib.drawImg(imgTutorial + 25,0,0,TOP | LEFT);
               }
               this.bActive = false;
               break;
            case 405:
               this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,0,TOP | LEFT);
               this.lib.drawImg(imgTutorial + 15,0,0,TOP | LEFT);
               this.lib.drawImg(imgTutorial + 28,0,0,TOP | LEFT);
               if(this.bOkBtn)
               {
                  this.lib.drawImg(imgTutorial + 24,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bOkBtn = false;
                     this.nMainScene = 0;
                  }
               }
               else
               {
                  this.lib.drawImg(imgTutorial + 25,0,0,TOP | LEFT);
               }
               this.bActive = false;
               break;
            case 500:
               this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,0,TOP | LEFT);
               this.lib.drawImg(imgTutorial + 21,0,0,TOP | LEFT);
               if(this.bOkBtn)
               {
                  this.lib.drawImg(imgTutorial + 7,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bOkBtn = false;
                     ++this.nMainScene;
                  }
               }
               else
               {
                  this.lib.drawImg(imgTutorial + 8,0,0,TOP | LEFT);
               }
               this.bActive = false;
               break;
            case 501:
               this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,0,TOP | LEFT);
               this.lib.drawImg(imgTutorial + 22,0,0,TOP | LEFT);
               if(this.bOkBtn)
               {
                  this.lib.drawImg(imgTutorial + 7,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bOkBtn = false;
                     ++this.nMainScene;
                  }
               }
               else
               {
                  this.lib.drawImg(imgTutorial + 8,0,0,TOP | LEFT);
               }
               this.bActive = false;
               break;
            case 502:
               this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,0,TOP | LEFT);
               this.lib.drawImg(imgTutorial + 23,0,0,TOP | LEFT);
               if(this.bOkBtn)
               {
                  this.lib.drawImg(imgTutorial + 7,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bOkBtn = false;
                     this.nMainScene = 0;
                  }
               }
               else
               {
                  this.lib.drawImg(imgTutorial + 8,0,0,TOP | LEFT);
               }
               this.bActive = false;
         }
      }
      
      public function drawMenu() : void
      {
         var _loc1_:int = 0;
         switch(this.nMainScene)
         {
            case 0:
               this.drawTitleBg();
               this.drawMenuBoard(this.nAniX,this.nSubAniX,this.nSubAniX2,this.nSubAniX3);
               this.nAniX -= (33 - this.nMainFrame) * (1 + this.nLeakFrame);
               if(this.nAniX <= 0)
               {
                  this.nAniX = 0;
                  this.nMenuPos = 0;
                  this.nSubMenuPos = 0;
                  this.nSubSubMenuPos = 1;
                  ++this.nMainScene;
               }
               break;
            case 1:
               this.drawTitleBg();
               this.drawMenuBoard(this.nAniX,this.nSubAniX,this.nSubAniX2,this.nSubAniX3);
               this.bActive = false;
               break;
            case 2:
               this.drawTitleBg();
               this.drawMenuBoard(this.nAniX,this.nSubAniX,this.nSubAniX2,this.nSubAniX3);
               this.nAniX += (33 - this.nMainFrame) * (1 + this.nLeakFrame);
               if(this.nAniX >= 540)
               {
                  this.nAniX = 540;
                  this.nMainState = MAIN_TITLE;
               }
               break;
            case 10:
               this.drawTitleBg();
               this.drawMenuBoard(this.nAniX,this.nSubAniX,this.nSubAniX2,this.nSubAniX3);
               if(this.nSubAniX2 < 0)
               {
                  this.nSubAniX2 += 10 * (1 + this.nLeakFrame);
               }
               if(this.nSubAniX3 < 0)
               {
                  this.nSubAniX3 += 10 * (1 + this.nLeakFrame);
               }
               this.nSubAniX -= 10 * (1 + this.nLeakFrame);
               if(this.nSubAniX <= -140)
               {
                  this.nSubAniX = -140;
                  ++this.nMainScene;
               }
               break;
            case 11:
               this.drawTitleBg();
               this.drawMenuBoard(this.nAniX,this.nSubAniX,this.nSubAniX2,this.nSubAniX3);
               if(this.bOkBtn)
               {
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bOkBtn = false;
                     this._nMainScene = this.nMainScene;
                     if(this.player.GAME_SLOT[this.nMenuPos * 6] <= INITDATA)
                     {
                        this.nMainScene = 50;
                     }
                     else
                     {
                        this.ope.initGame();
                        this.nGameSlot = this.nMenuPos;
                        this.player.nLevel = this.player.GAME_SLOT[this.nMenuPos * 6 + 1];
                        this.nGameLevel = this.player.GAME_SLOT[this.nMenuPos * 6 + 2];
                        this.nTotalStarNum = this.player.GAME_SLOT[this.nMenuPos * 6 + 3];
                        this.player.nMoney = this.player.GAME_SLOT[this.nMenuPos * 6 + 4];
                        this.player.nGamePlayTime = this.player.GAME_SLOT[this.nMenuPos * 6 + 5];
                        if(!this.lib.loadFile(DB_GAME,"paladog_game",this.nGameSlot))
                        {
                           this.lib.saveFile(DB_SLOT,"paladog_slot" + this.nGameSlot);
                           this.lib.saveFile(DB_GAME,"paladog_game" + this.nGameSlot);
                        }
                        this.bOpenUnitTab = false;
                        this.nMainState = MAIN_STAGESELECT;
                     }
                  }
               }
               if(this.bNoBtn)
               {
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bNoBtn = false;
                     this._nMainScene = this.nMainScene;
                     this.nMainScene = 60;
                  }
               }
               this.bActive = false;
               break;
            case 20:
               this.drawTitleBg();
               this.drawMenuBoard(this.nAniX,this.nSubAniX,this.nSubAniX2,this.nSubAniX3);
               if(this.nSubAniX < 0)
               {
                  this.nSubAniX += 10 * (1 + this.nLeakFrame);
               }
               if(this.nSubAniX3 < 0)
               {
                  this.nSubAniX3 += 10 * (1 + this.nLeakFrame);
               }
               this.nSubAniX2 -= 10 * (1 + this.nLeakFrame);
               if(this.nSubAniX2 <= -140)
               {
                  this.nSubAniX2 = -140;
                  ++this.nMainScene;
               }
               break;
            case 21:
               this.drawTitleBg();
               this.drawMenuBoard(this.nAniX,this.nSubAniX,this.nSubAniX2,this.nSubAniX3);
               if(this.bOkBtn)
               {
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bOkBtn = false;
                     this._nMainScene = this.nMainScene;
                     if(this.player.GAME_SLOT[this.nMenuPos * 6] <= INITDATA)
                     {
                        this.nMainScene = 50;
                     }
                     else
                     {
                        this.ope.initGame();
                        this.nGameSlot = this.nMenuPos;
                        this.player.nLevel = this.player.GAME_SLOT[this.nMenuPos * 6 + 1];
                        this.nGameLevel = this.player.GAME_SLOT[this.nMenuPos * 6 + 2];
                        this.nTotalStarNum = this.player.GAME_SLOT[this.nMenuPos * 6 + 3];
                        this.player.nMoney = this.player.GAME_SLOT[this.nMenuPos * 6 + 4];
                        this.player.nGamePlayTime = this.player.GAME_SLOT[this.nMenuPos * 6 + 5];
                        if(!this.lib.loadFile(DB_GAME,"paladog_game",this.nGameSlot))
                        {
                           this.lib.saveFile(DB_SLOT,"paladog_slot" + this.nGameSlot);
                           this.lib.saveFile(DB_GAME,"paladog_game" + this.nGameSlot);
                        }
                        this.bOpenUnitTab = false;
                        this.nMainState = MAIN_STAGESELECT;
                     }
                  }
               }
               if(this.bNoBtn)
               {
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bNoBtn = false;
                     this._nMainScene = this.nMainScene;
                     this.nMainScene = 60;
                  }
               }
               this.bActive = false;
               break;
            case 30:
               this.drawTitleBg();
               this.drawMenuBoard(this.nAniX,this.nSubAniX,this.nSubAniX2,this.nSubAniX3);
               if(this.nSubAniX < 0)
               {
                  this.nSubAniX += 10 * (1 + this.nLeakFrame);
               }
               if(this.nSubAniX2 < 0)
               {
                  this.nSubAniX2 += 10 * (1 + this.nLeakFrame);
               }
               this.nSubAniX3 -= 10 * (1 + this.nLeakFrame);
               if(this.nSubAniX3 <= -140)
               {
                  this.nSubAniX3 = -140;
                  ++this.nMainScene;
               }
               break;
            case 31:
               this.drawTitleBg();
               this.drawMenuBoard(this.nAniX,this.nSubAniX,this.nSubAniX2,this.nSubAniX3);
               if(this.bOkBtn)
               {
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bOkBtn = false;
                     this._nMainScene = this.nMainScene;
                     if(this.player.GAME_SLOT[this.nMenuPos * 6] <= INITDATA)
                     {
                        this.nMainScene = 50;
                     }
                     else
                     {
                        this.ope.initGame();
                        this.nGameSlot = this.nMenuPos;
                        this.player.nLevel = this.player.GAME_SLOT[this.nMenuPos * 6 + 1];
                        this.nGameLevel = this.player.GAME_SLOT[this.nMenuPos * 6 + 2];
                        this.nTotalStarNum = this.player.GAME_SLOT[this.nMenuPos * 6 + 3];
                        this.player.nMoney = this.player.GAME_SLOT[this.nMenuPos * 6 + 4];
                        this.player.nGamePlayTime = this.player.GAME_SLOT[this.nMenuPos * 6 + 5];
                        if(!this.lib.loadFile(DB_GAME,"paladog_game",this.nGameSlot))
                        {
                           this.lib.saveFile(DB_SLOT,"paladog_slot" + this.nGameSlot);
                           this.lib.saveFile(DB_GAME,"paladog_game" + this.nGameSlot);
                        }
                        this.bOpenUnitTab = false;
                        this.nMainState = MAIN_STAGESELECT;
                     }
                  }
               }
               if(this.bNoBtn)
               {
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bNoBtn = false;
                     this._nMainScene = this.nMainScene;
                     this.nMainScene = 60;
                  }
               }
               this.bActive = false;
               break;
            case 50:
               this.drawTitleBg();
               this.drawMenuBoard(this.nAniX,this.nSubAniX,this.nSubAniX2,this.nSubAniX3);
               this.lib.fillRectAlpha(0,0,this.nLcdW,this.nLcdH,0,50,TOP | LEFT);
               this.lib.drawImg(imgMenu + 3,0,0,TOP | LEFT);
               this.lib.drawString30("Độ Khó Trò Chơi",this.nLcdWC,this.nLcdHC - 106,16777215,100,VCENTER | HCENTER);
               _loc1_ = 0;
               while(_loc1_ < 4)
               {
                  if(_loc1_ == this.nSubSubMenuPos)
                  {
                     this.lib.drawImg(imgMenu + 8 + _loc1_,0,0,TOP | LEFT);
                  }
                  else
                  {
                     this.lib.drawImg(imgMenu + 4 + _loc1_,0,0,TOP | LEFT);
                  }
                  _loc1_++;
               }
               if(this.bOkBtn)
               {
                  this.lib.drawImg(imgOk + 1,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bOkBtn = false;
                     this.ope.initGame();
                     this.nGameSlot = this.nMenuPos;
                     this.nGameLevel = this.nSubSubMenuPos;
                     this.lib.saveFile(DB_SLOT,"paladog_slot" + this.nGameSlot);
                     this.lib.saveFile(DB_GAME,"paladog_game" + this.nGameSlot);
                     this.nMainState = MAIN_INTRO;
                     this.lib.stopMusic();
                  }
               }
               else
               {
                  this.lib.drawImg(imgOk,0,0,TOP | LEFT);
               }
               if(this.bNoBtn)
               {
                  this.lib.drawImg(imgCancel + 1,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bNoBtn = false;
                     this.nSubSubMenuPos = 1;
                     this.nMainScene = this.nMenuPos * 10 + 11;
                  }
               }
               else
               {
                  this.lib.drawImg(imgCancel,0,0,TOP | LEFT);
               }
               this.bActive = false;
               break;
            case 60:
               this.drawTitleBg();
               this.drawMenuBoard(this.nAniX,this.nSubAniX,this.nSubAniX2,this.nSubAniX3);
               this.lib.fillRectAlpha(0,0,this.nLcdW,this.nLcdH,0,50,TOP | LEFT);
               this.lib.drawImg(imgMenu + 3,0,0,TOP | LEFT);
               this.lib.drawString24("Dữ liệu ở ô đã chọn sẽ bị xóa.",170,this.nLcdHC - 90,16777215,100,VCENTER | LEFT);
               this.lib.drawString24("Bạn có chắc muốn tiếp tục không?",170,this.nLcdHC - 40,16777215,100,VCENTER | LEFT);
               if(this.bOkBtn)
               {
                  this.lib.drawImg(imgMenu + 21,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bOkBtn = false;
                     this.lib.sharedFile = SharedObject.getLocal("paladog_slot" + this.nMenuPos);
                     if(this.lib.sharedFile.size > 0)
                     {
                        this.lib.sharedFile.clear();
                     }
                     this.lib.sharedFile = SharedObject.getLocal("paladog_game" + this.nMenuPos);
                     if(this.lib.sharedFile.size > 0)
                     {
                        this.lib.sharedFile.clear();
                     }
                     _loc1_ = 0;
                     while(_loc1_ < 6)
                     {
                        this.player.GAME_SLOT[this.nMenuPos * 6 + _loc1_] = Drawing.INITDATA;
                        _loc1_++;
                     }
                     this.nMainScene = this._nMainScene;
                  }
               }
               else
               {
                  this.lib.drawImg(imgMenu + 20,0,0,TOP | LEFT);
               }
               if(this.bNoBtn)
               {
                  this.lib.drawImg(imgMenu + 23,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bNoBtn = false;
                     this.nMainScene = this._nMainScene;
                  }
               }
               else
               {
                  this.lib.drawImg(imgMenu + 22,0,0,TOP | LEFT);
               }
               this.bActive = false;
         }
      }
      
      public function drawMenuBoard(param1:int, param2:int, param3:int, param4:int) : void
      {
         var _loc5_:int = 0;
         this.lib.drawImg(imgMenu + 1,param1,Player.BG_BASEPOSY,TOP | LEFT);
         this.lib.drawImg(imgCancel,param1 + 124,Player.BG_BASEPOSY - 133,TOP | LEFT);
         if(this.nMainScene < 10)
         {
            _loc5_ = 0;
            while(_loc5_ < 3)
            {
               this.drawSlot(_loc5_,param1,Player.BG_BASEPOSY + _loc5_ * 151);
               _loc5_++;
            }
         }
         else if(this.nMainScene < 20)
         {
            if(this.nMainScene == 11)
            {
               if(this.bOkBtn)
               {
                  this.lib.drawImg(imgMenu + 13,param1 + param2 + 110,Player.BG_BASEPOSY + this.nMenuPos * 151,TOP | LEFT);
               }
               else
               {
                  this.lib.drawImg(imgMenu + 2,param1 + param2 + 110,Player.BG_BASEPOSY + this.nMenuPos * 151,TOP | LEFT);
               }
               if(this.player.GAME_SLOT[this.nMenuPos * 6] > INITDATA)
               {
                  if(this.bNoBtn)
                  {
                     this.lib.drawImg(imgMenu + 15,param1 + param2 + 110,Player.BG_BASEPOSY + this.nMenuPos * 151,TOP | LEFT);
                  }
                  else
                  {
                     this.lib.drawImg(imgMenu + 14,param1 + param2 + 110,Player.BG_BASEPOSY + this.nMenuPos * 151,TOP | LEFT);
                  }
               }
            }
            this.drawSlot(0,param1 + param2,Player.BG_BASEPOSY);
            this.drawSlot(1,param1 + param3,Player.BG_BASEPOSY + 151);
            this.drawSlot(2,param1 + param4,Player.BG_BASEPOSY + 302);
         }
         else if(this.nMainScene < 30)
         {
            if(this.nMainScene == 21)
            {
               if(this.bOkBtn)
               {
                  this.lib.drawImg(imgMenu + 13,param1 + param3 + 110,Player.BG_BASEPOSY + this.nMenuPos * 151,TOP | LEFT);
               }
               else
               {
                  this.lib.drawImg(imgMenu + 2,param1 + param3 + 110,Player.BG_BASEPOSY + this.nMenuPos * 151,TOP | LEFT);
               }
               if(this.player.GAME_SLOT[this.nMenuPos * 6] > INITDATA)
               {
                  if(this.bNoBtn)
                  {
                     this.lib.drawImg(imgMenu + 15,param1 + param3 + 110,Player.BG_BASEPOSY + this.nMenuPos * 151,TOP | LEFT);
                  }
                  else
                  {
                     this.lib.drawImg(imgMenu + 14,param1 + param3 + 110,Player.BG_BASEPOSY + this.nMenuPos * 151,TOP | LEFT);
                  }
               }
            }
            this.drawSlot(0,param1 + param2,Player.BG_BASEPOSY);
            this.drawSlot(1,param1 + param3,Player.BG_BASEPOSY + 151);
            this.drawSlot(2,param1 + param4,Player.BG_BASEPOSY + 302);
         }
         else if(this.nMainScene < 40)
         {
            if(this.nMainScene == 31)
            {
               if(this.bOkBtn)
               {
                  this.lib.drawImg(imgMenu + 13,param1 + param4 + 110,Player.BG_BASEPOSY + this.nMenuPos * 151,TOP | LEFT);
               }
               else
               {
                  this.lib.drawImg(imgMenu + 2,param1 + param4 + 110,Player.BG_BASEPOSY + this.nMenuPos * 151,TOP | LEFT);
               }
               if(this.player.GAME_SLOT[this.nMenuPos * 6] > INITDATA)
               {
                  if(this.bNoBtn)
                  {
                     this.lib.drawImg(imgMenu + 15,param1 + param4 + 110,Player.BG_BASEPOSY + this.nMenuPos * 151,TOP | LEFT);
                  }
                  else
                  {
                     this.lib.drawImg(imgMenu + 14,param1 + param4 + 110,Player.BG_BASEPOSY + this.nMenuPos * 151,TOP | LEFT);
                  }
               }
            }
            this.drawSlot(0,param1 + param2,Player.BG_BASEPOSY);
            this.drawSlot(1,param1 + param3,Player.BG_BASEPOSY + 151);
            this.drawSlot(2,param1 + param4,Player.BG_BASEPOSY + 302);
         }
         else
         {
            if(this.nMenuPos == 0)
            {
               this.lib.drawImg(imgMenu + 2,param1 + param2 + 110,Player.BG_BASEPOSY + this.nMenuPos * 151,TOP | LEFT);
               if(this.player.GAME_SLOT[this.nMenuPos * 6] > INITDATA)
               {
                  this.lib.drawImg(imgMenu + 14,param1 + param2 + 110,Player.BG_BASEPOSY + this.nMenuPos * 151,TOP | LEFT);
               }
            }
            else if(this.nMenuPos == 1)
            {
               this.lib.drawImg(imgMenu + 2,param1 + param3 + 110,Player.BG_BASEPOSY + this.nMenuPos * 151,TOP | LEFT);
               if(this.player.GAME_SLOT[this.nMenuPos * 6] > INITDATA)
               {
                  this.lib.drawImg(imgMenu + 14,param1 + param3 + 110,Player.BG_BASEPOSY + this.nMenuPos * 151,TOP | LEFT);
               }
            }
            else if(this.nMenuPos == 2)
            {
               this.lib.drawImg(imgMenu + 2,param1 + param4 + 110,Player.BG_BASEPOSY + this.nMenuPos * 151,TOP | LEFT);
               if(this.player.GAME_SLOT[this.nMenuPos * 6] > INITDATA)
               {
                  this.lib.drawImg(imgMenu + 14,param1 + param4 + 110,Player.BG_BASEPOSY + this.nMenuPos * 151,TOP | LEFT);
               }
            }
            this.drawSlot(0,param1 + param2,Player.BG_BASEPOSY);
            this.drawSlot(1,param1 + param3,Player.BG_BASEPOSY + 151);
            this.drawSlot(2,param1 + param4,Player.BG_BASEPOSY + 302);
         }
      }
      
      public function drawSlot(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(this.player.GAME_SLOT[param1 * 6] <= INITDATA)
         {
            this.lib.drawImg(imgMenu,param2,param3,TOP | LEFT);
         }
         else
         {
            this.lib.drawImg(imgMenu + 12,param2,param3,TOP | LEFT);
            this.lib.drawNumImg("" + this.player.GAME_SLOT[param1 * 6 + 1],param2 + 338,param3 + 110,NUM_SLOT,TOP | LEFT);
            this.lib.drawImg(imgMenu + 16 + this.player.GAME_SLOT[param1 * 6 + 2],param2,param3,TOP | LEFT);
            this.lib.drawNumImg("" + this.player.GAME_SLOT[param1 * 6 + 3],param2 + 621,param3 + 115,NUM_SLOT,TOP | LEFT);
            this.lib.drawNumImg("" + this.lib.setStrMoney(this.player.GAME_SLOT[param1 * 6 + 4]),param2 + 506,param3 + 160,NUM_MONEY,TOP | LEFT);
            _loc4_ = int(this.player.GAME_SLOT[param1 * 6 + 5]);
            _loc5_ = int(_loc4_ / 60);
            _loc5_ = int(_loc5_ / 60);
            _loc4_ -= _loc5_ * 60 * 60;
            _loc6_ = int(_loc4_ / 60);
            _loc4_ -= _loc6_ * 60;
            this.lib.drawNumImg("" + _loc5_,param2 + 519,param3 + 191,NUM_SLOT,TOP | RIGHT);
            this.lib.drawNumImg("" + _loc6_,param2 + 596,param3 + 191,NUM_SLOT,TOP | RIGHT);
            this.lib.drawNumImg("" + _loc4_,param2 + 677,param3 + 191,NUM_SLOT,TOP | RIGHT);
         }
      }
      
      public function drawLoadImg() : void
      {
         var _loc1_:int = 0;
         this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,0,TOP | LEFT);
         this.lib.drawImg(imgLoading + 5 + this.nLoadChaImg,0,0,TOP | LEFT);
         this.lib.drawImg(imgLoading,0,0,TOP | LEFT);
         _loc1_ = 0;
         while(_loc1_ < 4)
         {
            if(_loc1_ <= (this.nLoadFrame >> 2) % 4)
            {
               this.lib.drawImg(imgLoading + 1 + _loc1_,0,0,TOP | LEFT);
            }
            _loc1_++;
         }
         ++this.nLoadFrame;
      }
      
      public function drawIntroAni(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:int = 0;
         switch(param1)
         {
            case OPENING_MOVE:
               this.lib.drawImg(imgOpening + (param2 - 1),this.nOpeningPosX,0,TOP | LEFT);
               this.lib.drawImg(imgOpening + param2,this.nOpeningPosX + this.nLcdW,0,TOP | LEFT);
               this.lib.fillRectAlpha(0,0,this.nLcdW,this.nLcdH,0,60,TOP | LEFT);
               if(param2 == 1)
               {
                  if(this.nOpeningPosX >= -380)
                  {
                     this.lib.drawImg(imgOpening + param3,0,0,TOP | LEFT);
                  }
                  else
                  {
                     this.lib.drawImgAlpha(imgOpening + param3,0,0,100 - this.nOpeningFrame * 4,TOP | LEFT);
                     ++this.nOpeningFrame;
                  }
               }
               this.nOpeningPosX -= 3;
               if(this.nOpeningPosX <= -this.nLcdW)
               {
                  this.nOpeningPosX = 0;
                  ++this.nMainScene;
               }
               this.bActive = false;
               break;
            case OPENING_LIGHT:
               this.lib.drawImg(imgOpening + param2,this.nOpeningPosX,0,TOP | LEFT);
               _loc4_ = 0;
               while(_loc4_ < 3)
               {
                  this.lib.drawImgAlpha(imgOpening + 14,0 - _loc4_ * 30,0,this.nMainFrame >> 1,TOP | LEFT);
                  _loc4_++;
               }
               this.lib.drawImgDodge(imgOpening + 16,0,0,BlendMode.ADD,TOP | LEFT);
               _loc4_ = 0;
               while(_loc4_ < 3)
               {
                  this.lib.drawImgAlpha(imgOpening + 15,0 + _loc4_ * 30,0,this.nMainFrame >> 1,TOP | LEFT);
                  _loc4_++;
               }
               this.lib.fillRectAlpha(0,0,this.nLcdW,this.nLcdH,0,60 - this.nMainFrame,TOP | LEFT);
               this.lib.drawImgAlpha(imgOpening + param3,0,0,this.nMainFrame,TOP | LEFT);
               if(this.nMainFrame >= 60)
               {
                  ++this.nMainScene;
               }
               this.bActive = false;
               break;
            case OPENING_TOUCH:
               this.lib.drawImg(imgOpening + param2,this.nOpeningPosX,0,TOP | LEFT);
               _loc4_ = 0;
               while(_loc4_ < 3)
               {
                  this.lib.drawImgAlpha(imgOpening + 14,0 - _loc4_ * 30,0,30,TOP | LEFT);
                  _loc4_++;
               }
               this.lib.drawImgDodge(imgOpening + 16,0,0,BlendMode.ADD,TOP | LEFT);
               _loc4_ = 0;
               while(_loc4_ < 3)
               {
                  this.lib.drawImgAlpha(imgOpening + 15,0 + _loc4_ * 30,0,30,TOP | LEFT);
                  _loc4_++;
               }
               this.lib.drawImg(imgOpening + param3,0,0,TOP | LEFT);
               if(this.bOkBtn)
               {
                  this.lib.drawImg(imgOpening + 18,this.nLcdW - 10,10,TOP | RIGHT);
                  this.bOkBtn = false;
                  ++this.nMainScene;
               }
               else
               {
                  this.lib.drawImg(imgOpening + 17,this.nLcdW - 10,10,TOP | RIGHT);
               }
               this.bActive = false;
               break;
            case OPENING_DARK:
               this.lib.drawImg(imgOpening + param2,this.nOpeningPosX,0,TOP | LEFT);
               _loc4_ = 0;
               while(_loc4_ < 3)
               {
                  this.lib.drawImgAlpha(imgOpening + 14,0 - _loc4_ * 30,0,30 - (this.nMainFrame >> 1),TOP | LEFT);
                  _loc4_++;
               }
               _loc4_ = 0;
               while(_loc4_ < 3)
               {
                  this.lib.drawImgAlpha(imgOpening + 15,0 + _loc4_ * 30,0,30 - (this.nMainFrame >> 1),TOP | LEFT);
                  _loc4_++;
               }
               this.lib.fillRectAlpha(0,0,this.nLcdW,this.nLcdH,0,this.nMainFrame,TOP | LEFT);
               this.lib.drawImgAlpha(imgOpening + param3,0,0,60 - this.nMainFrame,TOP | LEFT);
               if(this.nMainFrame >= 60)
               {
                  ++this.nMainScene;
               }
               this.bActive = false;
         }
      }
      
      public function drawIntro() : void
      {
         var _loc1_:int = 0;
         switch(this.nMainScene)
         {
            case 0:
               this.ope.setLoading(true,LOADINGSTATE_IMG);
               this.drawLoadImg();
               this.nOpeningPosX = 0;
               this.nOpeningFrame = 0;
               ++this.nMainScene;
               this.bActive = true;
               break;
            case 1:
               this.drawLoadImg();
               this.lib.loadImgFlashDat(this.lib.LOADOPENINGIMG[this.nMainScene - 1],this.lib.LOADOPENINGIMGINDEX[this.nMainScene - 1]);
               break;
            case 2:
               this.drawLoadImg();
               this.lib.loadASEAni(Library.opening1,Ani_Opening_01,imgOpening);
               break;
            case 3:
               this.drawLoadImg();
               this.lib.loadASEAni(Library.opening2,Ani_Opening_01 + 1,imgOpening);
               break;
            case 4:
               this.drawLoadImg();
               this.lib.loadASEAni(Library.opening3,Ani_Opening_01 + 2,imgOpening);
               break;
            case 5:
               this.drawLoadImg();
               this.lib.loadASEAni(Library.opening4,Ani_Opening_01 + 3,imgOpening);
               break;
            case 6:
               this.drawLoadImg();
               this.lib.loadASEAni(Library.opening5,Ani_Opening_01 + 4,imgOpening);
               break;
            case 7:
               this.drawLoadImg();
               this.lib.loadASEAni(Library.opening6,Ani_Opening_01 + 5,imgOpening);
               break;
            case 8:
               this.drawLoadImg();
               this.lib.loadASEAni(Library.opening7,Ani_Opening_01 + 6,imgOpening);
               break;
            case 9:
               this.drawLoadImg();
               this.lib.loadASEAni(Library.opening8,Ani_Opening_01 + 7,imgOpening);
               break;
            case 10:
               this.drawLoadImg();
               this.lib.loadASEAni(Library.opening9,Ani_Opening_01 + 8,imgOpening);
               break;
            case 11:
               this.drawLoadImg();
               this.lib.loadASEAni(Library.opening10,Ani_Opening_01 + 9,imgOpening);
               break;
            case 12:
               this.drawLoadImg();
               this.lib.loadASEAni(Library.opening11,Ani_Opening_01 + 10,imgOpening);
               break;
            case 13:
               this.drawLoadImg();
               this.lib.loadImgFlashDat(Library.cinemabtn,imgCinemaBtn);
               break;
            case 14:
               if(this.nMainFrame == 0)
               {
                  this.lib.playMusic(Library.MUSIC_TITLE,true);
               }
               this.lib.drawASEAni(Ani_Opening_01,0,imgOpening,this.nMainFrame,this.nLcdWC,this.nLcdHC,100,100,false);
               if(this.nMainFrame < 60)
               {
                  this.lib.drawIntroString("Vào một tương lai xa xôi...",this.nLcdWC,this.nLcdHC,0,16777215,100 / 60 * this.nMainFrame,VCENTER | HCENTER);
               }
               else if(this.nMainFrame < 240)
               {
                  this.lib.drawIntroString("Vào một tương lai xa xôi...",this.nLcdWC,this.nLcdHC,0,16777215,100,VCENTER | HCENTER);
               }
               else if(this.nMainFrame < 300)
               {
                  this.lib.drawIntroString("Vào một tương lai xa xôi...",this.nLcdWC,this.nLcdHC,0,16777215,100 - 100 / 60 * (this.nMainFrame - 240),VCENTER | HCENTER);
               }
               if(this.nMainFrame >= 419)
               {
                  ++this.nMainScene;
               }
               if(this.bOkBtn)
               {
                  this.bOkBtn = false;
                  this.lib.playEffect(70);
                  ++this.nMainScene;
               }
               this.bActive = false;
               break;
            case 15:
               this.lib.drawASEAni(Ani_Opening_01 + 1,0,imgOpening,this.nMainFrame,this.nLcdWC,this.nLcdHC,100,100,false);
               this.lib.drawIntroString("Loài người tham lam đã tàn phá thiên nhiên,",this.nLcdWC + 15,this.nLcdHC + 160,0,16777215,100,VCENTER | HCENTER);
               this.lib.drawIntroString("khiến các vị thần trừng phạt",this.nLcdWC + 15,this.nLcdHC + 190,0,16777215,100,VCENTER | HCENTER);
               this.lib.drawIntroString("và xóa sổ loài người.",this.nLcdWC + 15,this.nLcdHC + 220,0,16777215,100,VCENTER | HCENTER);
               if(this.bOkBtn)
               {
                  this.lib.drawImg(imgCinemaBtn,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bOkBtn = false;
                     this.lib.playEffect(70);
                     ++this.nMainScene;
                  }
               }
               else
               {
                  this.lib.drawImg(imgCinemaBtn + 1,0,0,TOP | LEFT);
               }
               this.bActive = false;
               break;
            case 16:
               this.lib.drawASEAni(Ani_Opening_01 + 2,0,imgOpening,this.nMainFrame,this.nLcdWC,this.nLcdHC,100,100,false);
               if(this.nMainFrame >= 239)
               {
                  ++this.nMainScene;
               }
               if(this.bOkBtn)
               {
                  this.bOkBtn = false;
                  this.lib.playEffect(70);
                  ++this.nMainScene;
               }
               this.bActive = false;
               break;
            case 17:
               this.lib.drawASEAni(Ani_Opening_01 + 3,0,imgOpening,this.nMainFrame,this.nLcdWC,this.nLcdHC,100,100,false);
               this.lib.drawIntroString("Thay thế con người, muôn thú được ban trí tuệ",this.nLcdWC + 15,this.nLcdHC + 160,0,16777215,100,VCENTER | HCENTER);
               this.lib.drawIntroString("và cùng nhau xây dựng thế giới mới,",this.nLcdWC + 15,this.nLcdHC + 190,0,16777215,100,VCENTER | HCENTER);
               this.lib.drawIntroString("sống yên bình suốt cả ngàn năm.",this.nLcdWC + 15,this.nLcdHC + 220,0,16777215,100,VCENTER | HCENTER);
               if(this.bOkBtn)
               {
                  this.lib.drawImg(imgCinemaBtn,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bOkBtn = false;
                     this.lib.playEffect(70);
                     ++this.nMainScene;
                  }
               }
               else
               {
                  this.lib.drawImg(imgCinemaBtn + 1,0,0,TOP | LEFT);
               }
               this.bActive = false;
               break;
            case 18:
               this.lib.drawASEAni(Ani_Opening_01 + 4,0,imgOpening,this.nMainFrame,this.nLcdWC,this.nLcdHC,100,100,false);
               if(this.nMainFrame >= 239)
               {
                  ++this.nMainScene;
               }
               if(this.bOkBtn)
               {
                  this.bOkBtn = false;
                  this.lib.playEffect(70);
                  ++this.nMainScene;
               }
               this.bActive = false;
               break;
            case 19:
               this.lib.drawASEAni(Ani_Opening_01 + 5,0,imgOpening,this.nMainFrame,this.nLcdWC,this.nLcdHC,100,100,false);
               this.lib.drawIntroString("Muôn thú rất hiền lành và yêu hòa bình.",this.nLcdWC + 10,this.nLcdHC + 130,0,16777215,100,VCENTER | HCENTER);
               this.lib.drawIntroString("Trong khi đó, lũ quỷ dữ đang chật vật",this.nLcdWC + 15,this.nLcdHC + 160,0,16777215,100,VCENTER | HCENTER);
               this.lib.drawIntroString("tìm kiếm năng lượng xấu xa của con người.",this.nLcdWC + 17,this.nLcdHC + 190,0,16777215,100,VCENTER | HCENTER);
               this.lib.drawIntroString("Cuối cùng, lũ quỷ quyết định gây chiến,",this.nLcdWC + 32,this.nLcdHC + 220,0,16777215,100,VCENTER | HCENTER);
               this.lib.drawIntroString("tấn công Vùng Đất Muôn Thú Critterland.",this.nLcdWC + 15,this.nLcdHC + 250,0,16777215,100,VCENTER | HCENTER);
               if(this.bOkBtn)
               {
                  this.lib.drawImg(imgCinemaBtn,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bOkBtn = false;
                     this.lib.playEffect(70);
                     ++this.nMainScene;
                  }
               }
               else
               {
                  this.lib.drawImg(imgCinemaBtn + 1,0,0,TOP | LEFT);
               }
               this.bActive = false;
               break;
            case 20:
               this.lib.drawASEAni(Ani_Opening_01 + 6,0,imgOpening,this.nMainFrame,this.nLcdWC,this.nLcdHC,100,100,false);
               if(this.nMainFrame >= 239)
               {
                  ++this.nMainScene;
               }
               if(this.bOkBtn)
               {
                  this.bOkBtn = false;
                  this.lib.playEffect(70);
                  ++this.nMainScene;
               }
               this.bActive = false;
               break;
            case 21:
               this.lib.drawASEAni(Ani_Opening_01 + 7,0,imgOpening,this.nMainFrame,this.nLcdWC,this.nLcdHC,100,100,false);
               this.lib.drawIntroString("Chưa từng biết chiến tranh, muôn thú không kịp phòng bị",this.nLcdWC + 5,this.nLcdHC + 145,0,16777215,100,VCENTER | HCENTER);
               this.lib.drawIntroString("và bị lũ quỷ dồn vào bước đường cùng.",this.nLcdWC + 15,this.nLcdHC + 175,0,16777215,100,VCENTER | HCENTER);
               this.lib.drawIntroString("Thế giới tràn ngập quái vật, số phận muôn loài",this.nLcdWC + 5,this.nLcdHC + 205,0,16777215,100,VCENTER | HCENTER);
               this.lib.drawIntroString("trở nên vô cùng nguy ngập.",this.nLcdWC,this.nLcdHC + 235,0,16777215,100,VCENTER | HCENTER);
               if(this.bOkBtn)
               {
                  this.lib.drawImg(imgCinemaBtn,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bOkBtn = false;
                     this.lib.playEffect(70);
                     ++this.nMainScene;
                  }
               }
               else
               {
                  this.lib.drawImg(imgCinemaBtn + 1,0,0,TOP | LEFT);
               }
               this.bActive = false;
               break;
            case 22:
               this.lib.drawASEAni(Ani_Opening_01 + 8,0,imgOpening,this.nMainFrame,this.nLcdWC,this.nLcdHC,100,100,false);
               if(this.nMainFrame >= 239)
               {
                  ++this.nMainScene;
               }
               if(this.bOkBtn)
               {
                  this.bOkBtn = false;
                  this.lib.playEffect(70);
                  ++this.nMainScene;
               }
               this.bActive = false;
               break;
            case 23:
               this.lib.drawASEAni(Ani_Opening_01 + 9,0,imgOpening,this.nMainFrame,this.nLcdWC,this.nLcdHC,100,100,false);
               this.lib.drawIntroString("Ngay lúc tuyệt vọng nhất,",this.nLcdWC + 5,this.nLcdHC + 160,0,16777215,100,VCENTER | HCENTER);
               this.lib.drawIntroString("một hiệp sĩ đã đứng lên chiến đấu",this.nLcdWC + 5,this.nLcdHC + 190,0,16777215,100,VCENTER | HCENTER);
               this.lib.drawIntroString("bảo vệ vùng đất muôn thú...",this.nLcdWC + 15,this.nLcdHC + 220,0,16777215,100,VCENTER | HCENTER);
               if(this.bOkBtn)
               {
                  this.lib.drawImg(imgCinemaBtn,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bOkBtn = false;
                     this.lib.playEffect(70);
                     ++this.nMainScene;
                  }
               }
               else
               {
                  this.lib.drawImg(imgCinemaBtn + 1,0,0,TOP | LEFT);
               }
               this.bActive = false;
               break;
            case 24:
               if(this.nMainFrame == 0)
               {
                  this.lib.playEffect(25);
               }
               else if(this.nMainFrame >= 299)
               {
                  this.nMainFrame = 299;
                  ++this.nMainScene;
               }
               this.lib.drawASEAni(Ani_TitleBg_01,0,imgTitle,this.nMainFrame,this.nLcdWC,this.nLcdHC,100,100,false);
               this.lib.drawASEAni(Ani_TitleMace_01,0,imgMace01,this.nMainFrame,this.nLcdWC,this.nLcdHC,100,100,false);
               this.lib.drawASEAni(Ani_TitlePaladog_01,0,imgPaladog,this.nMainFrame,this.nLcdWC,this.nLcdHC,100,100,false);
               if(this.nMainFrame < 60)
               {
                  this.lib.drawASEAni(Ani_Opening_01 + 10,0,imgOpening,this.nMainFrame,this.nLcdWC,this.nLcdHC,100,100,false);
               }
               if(this.nMainFrame >= 60 && this.nMainFrame < 120)
               {
                  this.lib.drawIntroString("Đó chính là... Hiệp sĩ Paladog.",this.nLcdWC + 15,this.nLcdHC + 190,0,16777215,100 / 60 * (this.nMainFrame - 60),VCENTER | HCENTER);
               }
               else if(this.nMainFrame >= 120)
               {
                  this.lib.drawIntroString("Đó chính là... Hiệp sĩ Paladog.",this.nLcdWC + 15,this.nLcdHC + 190,0,16777215,100,VCENTER | HCENTER);
               }
               if(this.bOkBtn)
               {
                  this.bOkBtn = false;
                  this.lib.playEffect(70);
                  this.nMainScene = 26;
               }
               this.bActive = false;
               break;
            case 25:
               if(this.nMainFrame == 0)
               {
                  this.lib.playEffect(60);
               }
               else if(this.nMainFrame >= 59)
               {
                  this.nMainFrame = 59;
                  ++this.nMainScene;
               }
               this.lib.drawASEAni(Ani_TitleBg_02,0,imgTitle,this.nMainFrame,this.nLcdWC,this.nLcdHC,100,100,false);
               this.lib.drawASEAni(Ani_TitleMace_02,0,imgMace01,this.nMainFrame,this.nLcdWC,this.nLcdHC,100,100,false);
               this.lib.drawASEAni(Ani_TitlePaladog_02,0,imgPaladog,this.nMainFrame,this.nLcdWC,this.nLcdHC,100,100,false);
               if(this.nMainFrame < 60)
               {
                  this.lib.drawIntroString("Đó chính là... Hiệp sĩ Paladog.",this.nLcdWC + 15,this.nLcdHC + 190,0,16777215,100 - 100 / 60 * this.nMainFrame,VCENTER | HCENTER);
               }
               if(this.bOkBtn)
               {
                  this.bOkBtn = false;
                  this.lib.playEffect(70);
                  this.nMainScene = 26;
               }
               this.bActive = false;
               break;
            case 26:
               this.lib.drawASEAni(Ani_TitleBg08_Loop,0,imgTitle,this.nMainFrame % 2,this.nLcdWC,this.nLcdHC,100,100,false);
               this.lib.drawASEAni(Ani_TitleBg07_Loop,0,imgTitle,this.nMainFrame % 120,this.nLcdWC,this.nLcdHC,100,100,false);
               this.lib.drawASEAni(Ani_TitleBg06_Loop,0,imgTitle,this.nMainFrame % 60,this.nLcdWC,this.nLcdHC,100,100,false);
               this.lib.drawASEAni(Ani_TitleBg05_Loop,0,imgTitle,this.nMainFrame % 600,this.nLcdWC,this.nLcdHC,100,100,false);
               this.lib.drawASEAni(Ani_TitleBg04_Loop,0,imgTitle,this.nMainFrame % 300,this.nLcdWC,this.nLcdHC,100,100,false);
               this.lib.drawASEAni(Ani_TitleBg03_Loop,0,imgTitle,this.nMainFrame % 180,this.nLcdWC,this.nLcdHC,100,100,false);
               this.lib.drawASEAni(Ani_TitleBg02_Loop,0,imgTitle,this.nMainFrame % 2,this.nLcdWC,this.nLcdHC,100,100,false);
               this.lib.drawASEAni(Ani_TitleBg01_Loop,0,imgTitle,this.nMainFrame % 300,this.nLcdWC,this.nLcdHC,100,100,false);
               this.lib.drawASEAni(Ani_TitleMace_Loop,0,imgMace01,this.nMainFrame % 60,this.nLcdWC,this.nLcdHC,100,100,false);
               this.lib.drawASEAni(Ani_TitlePaladog_Loop,0,imgPaladog,this.nMainFrame % 60,this.nLcdWC,this.nLcdHC,100,100,false);
               if(this.nMainFrame >= FPS << 1)
               {
                  if(this.nMainFrame < 240)
                  {
                     this.lib.fillRectAlpha(0,0,this.nLcdW,this.nLcdH,0,100 * (this.nMainFrame - 120) / 120,TOP | LEFT);
                  }
                  else
                  {
                     this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,0,TOP | LEFT);
                  }
                  if(this.nMainFrame < 180)
                  {
                     this.lib.drawIntroString("Vùng đất muôn thú trông cậy vào bạn.",this.nLcdWC + 15,this.nLcdHC - 15,0,16777215,100 / 60 * (this.nMainFrame - 120),VCENTER | HCENTER);
                     this.lib.drawIntroString("Chúc bạn may mắn!",this.nLcdWC + 15,this.nLcdHC + 15,0,16777215,100 / 60 * (this.nMainFrame - 120),VCENTER | HCENTER);
                  }
                  else if(this.nMainFrame < 360)
                  {
                     this.lib.drawIntroString("Vùng đất muôn thú trông cậy vào bạn.",this.nLcdWC + 15,this.nLcdHC - 15,0,16777215,100,VCENTER | HCENTER);
                     this.lib.drawIntroString("Chúc bạn may mắn!",this.nLcdWC + 15,this.nLcdHC + 15,0,16777215,100,VCENTER | HCENTER);
                  }
                  else
                  {
                     this.lib.drawIntroString("Vùng đất muôn thú trông cậy vào bạn.",this.nLcdWC + 15,this.nLcdHC - 15,0,16777215,100 - 100 / 60 * (this.nMainFrame - 360),VCENTER | HCENTER);
                     this.lib.drawIntroString("Chúc bạn may mắn!",this.nLcdWC + 15,this.nLcdHC + 15,0,16777215,100 - 100 / 60 * (this.nMainFrame - 360),VCENTER | HCENTER);
                  }
                  if(this.nMainFrame >= 419)
                  {
                     ++this.nMainScene;
                  }
               }
               if(this.bOkBtn)
               {
                  this.bOkBtn = false;
                  this.lib.playEffect(70);
                  ++this.nMainScene;
               }
               this.bActive = false;
               break;
            case 27:
               this.bOpenUnitTab = false;
               this.nMainState = MAIN_STAGESELECT;
         }
      }
      
      public function drawSurvival() : void
      {
         switch(this.nMainScene)
         {
            case 0:
               this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,0,TOP | LEFT);
               this.lib.drawBorderString("BẢNG XẾP HẠNG",this.nLcdWC,Player.BG_BASEPOSY + 10,6041349,16776960,100,TOP | HCENTER);
               this.lib.fillRect(this.nLcdW - 80,Player.BG_BASEPOSY + 10,50,50,16777215,TOP | LEFT);
               this.lib.fillRect(60,this.nLcdH - 150,200,100,16777215,TOP | LEFT);
               this.lib.drawBorderString("CHƠI NGOẠI TUYẾN",160,this.nLcdH - 120,6041349,16776960,100,TOP | HCENTER);
               this.lib.fillRect(280,this.nLcdH - 150,200,100,16777215,TOP | LEFT);
               this.lib.drawBorderString("ĐĂNG KÝ",380,this.nLcdH - 120,6041349,16776960,100,TOP | HCENTER);
               this.lib.fillRect(500,this.nLcdH - 150,200,100,16777215,TOP | LEFT);
               this.lib.drawBorderString("BẮT ĐẦU",600,this.nLcdH - 120,6041349,16776960,100,TOP | HCENTER);
         }
      }
      
      public function drawStageSelect() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         switch(this.nMainScene)
         {
            case 0:
               this.ope.setLoading(true,LOADINGSTATE_IMG);
               this.drawLoadImg();
               ++this.nMainScene;
               this.bActive = true;
               break;
            case 1 + Library.LOADUNITIMG_LEN + Library.LOADSTAGESELECTIMG_LEN + Library.LOADSTOREIMG_LEN + Library.LOADMACEEFFIMG_LEN + Library.LOADMACEIMG_LEN + Library.MACEANI_LEN + Library.LOADSTORECHAIMG_LEN + Library.STORECHAANI_LEN + Library.LOADPALADOGIMG_LEN + Library.PALADOGANI_LEN:
               this.drawLoadImg();
               this.ope.initStageSelect();
               if(this.player.nGameMode == MODE_SURVIVAL)
               {
                  this.nMainScene = 400;
               }
               else if(this.bOpenUnitTab)
               {
                  if(this.nTutorial[4] == INITDATA)
                  {
                     this.nMainScene = 1000;
                  }
                  else
                  {
                     this.nUnitUpgradeFrame = 0;
                     this.nMainScene = 200;
                  }
               }
               else
               {
                  this.nMainScene = 100;
               }
               break;
            case 100:
               this.ope.setLoading(false,INITDATA);
               this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,3483937,TOP | LEFT);
               this.lib.drawImg(imgStageSelect + 32,0,0,TOP | LEFT);
               this.lib.drawImg(imgStageSelect + this.player.nChapter,0,0,TOP | LEFT);
               this.lib.drawImg(imgStageSelect + 24,0,0,TOP | LEFT);
               this.lib.drawImg(imgStageSelect + 27 + this.player.nChapter,0,0,TOP | LEFT);
               if(this.player.nChapter == 0)
               {
                  this.lib.drawImg(imgStageSelect + 10,0,0,TOP | LEFT);
               }
               else if(this.player.nChapter == 4)
               {
                  this.lib.drawImg(imgStageSelect + 8,0,0,TOP | LEFT);
               }
               else
               {
                  this.lib.drawImg(imgStageSelect + 8,0,0,TOP | LEFT);
                  this.lib.drawImg(imgStageSelect + 10,0,0,TOP | LEFT);
               }
               if(this.bOkBtn)
               {
                  this.lib.drawImg(imgStageSelect + 26,(this.player.nTouchStage - 1) % 6 * 103,int((this.player.nTouchStage - 1) / 6) * 83,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bOkBtn = false;
                     this.nMainState = MAIN_TUTORIAL;
                     this.lib.stopMusic();
                  }
               }
               if(this.bUpgradeBtn)
               {
                  this.lib.drawImg(imgStageSelect + 22,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bUpgradeBtn = false;
                     if(this.nTutorial[4] == INITDATA)
                     {
                        this.nMainScene = 1000;
                     }
                     else
                     {
                        this.nUnitUpgradeFrame = 0;
                        this.nMainScene = 200;
                     }
                  }
               }
               else
               {
                  this.lib.drawImg(imgStageSelect + 23,0,0,TOP | LEFT);
               }
               if(this.bNoBtn)
               {
                  this.lib.drawImg(imgStageSelect + 5,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bNoBtn = false;
                     this.nMainState = MAIN_TITLE;
                  }
               }
               else
               {
                  this.lib.drawImg(imgStageSelect + 6,0,0,TOP | LEFT);
               }
               this.lib.drawImg(imgStageSelect + 15,0,0,TOP | LEFT);
               _loc1_ = 0;
               while(_loc1_ < 4)
               {
                  _loc2_ = 0;
                  while(_loc2_ < 6)
                  {
                     if(this.player.nClearChapter >= this.player.nChapter && this.player.nClearStage >= _loc1_ * 6 + _loc2_ + this.player.nChapter * Player.MAX_STAGE)
                     {
                        if(this.player.STAGECLEARRESULTSTAR[_loc1_ * 6 + _loc2_ + this.player.nChapter * Player.MAX_STAGE] > 0)
                        {
                           this.lib.drawImg(imgStageSelect + 11 + (this.player.STAGECLEARRESULTSTAR[_loc1_ * 6 + _loc2_ + this.player.nChapter * Player.MAX_STAGE] - 1),_loc2_ * 103,_loc1_ * 83,TOP | LEFT);
                        }
                     }
                     else
                     {
                        this.lib.drawImg(imgStageSelect + 14,_loc2_ * 103,_loc1_ * 83,TOP | LEFT);
                     }
                     _loc2_++;
                  }
                  _loc1_++;
               }
               this.lib.drawImg(imgStageSelect + 25,this.player.nChapter * 29,0,TOP | LEFT);
               this.bActive = false;
               break;
            case 101:
               this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,3483937,TOP | LEFT);
               if(this.bNextChapterBtn)
               {
                  if(this.nMainFrame <= 22)
                  {
                     this.lib.drawImg(imgStageSelect + 32,0,0,TOP | LEFT);
                     this.lib.drawImg(imgStageSelect + this.player.nChapter + 1,0,0,TOP | LEFT);
                     this.lib.drawImg(imgStageSelect + 21 - int(this.nMainFrame >> 2),0,0,TOP | LEFT);
                     if(this.nMainFrame <= 7)
                     {
                        this.lib.drawImg(imgStageSelect + this.player.nChapter,0,0,TOP | LEFT);
                     }
                  }
                  else
                  {
                     this.lib.drawImg(imgStageSelect + 32,0,0,TOP | LEFT);
                     this.lib.drawImg(imgStageSelect + this.player.nChapter,0,0,TOP | LEFT);
                  }
               }
               else if(this.bBeforeChapterBtn)
               {
                  if(this.nMainFrame <= 22)
                  {
                     this.lib.drawImg(imgStageSelect + 32,0,0,TOP | LEFT);
                     this.lib.drawImg(imgStageSelect + this.player.nChapter,0,0,TOP | LEFT);
                     this.lib.drawImg(imgStageSelect + 16 + int(this.nMainFrame >> 2),0,0,TOP | LEFT);
                     if(this.nMainFrame >= 15)
                     {
                        this.lib.drawImg(imgStageSelect + this.player.nChapter - 1,0,0,TOP | LEFT);
                     }
                  }
                  else
                  {
                     this.lib.drawImg(imgStageSelect + 32,0,0,TOP | LEFT);
                     this.lib.drawImg(imgStageSelect + this.player.nChapter,0,0,TOP | LEFT);
                  }
               }
               this.lib.drawImg(imgStageSelect + 24,0,0,TOP | LEFT);
               if(this.bNextChapterBtn)
               {
                  if(this.nMainFrame <= 22)
                  {
                     this.lib.drawImg(imgStageSelect + 27 + this.player.nChapter,0,0,TOP | LEFT);
                     this.lib.drawImg(imgStageSelect + 27 + this.player.nChapter + 1,0,-192 + this.nMainFrame * 8,TOP | LEFT);
                  }
                  else
                  {
                     this.lib.drawImg(imgStageSelect + 27 + this.player.nChapter,0,0,TOP | LEFT);
                  }
                  if(this.nMainFrame >= 22)
                  {
                     if(!this.bChangeChapter)
                     {
                        ++this.player.nChapter;
                        this.bChangeChapter = true;
                     }
                  }
               }
               else if(this.bBeforeChapterBtn)
               {
                  if(this.nMainFrame <= 22)
                  {
                     this.lib.drawImg(imgStageSelect + 27 + this.player.nChapter - 1,0,0,TOP | LEFT);
                     this.lib.drawImg(imgStageSelect + 27 + this.player.nChapter,0,0 - this.nMainFrame * 8,TOP | LEFT);
                  }
                  else
                  {
                     this.lib.drawImg(imgStageSelect + 27 + this.player.nChapter,0,0,TOP | LEFT);
                  }
                  if(this.nMainFrame >= 22)
                  {
                     if(!this.bChangeChapter)
                     {
                        --this.player.nChapter;
                        this.bChangeChapter = true;
                     }
                  }
               }
               if(this.player.nChapter == 0)
               {
                  this.lib.drawImg(imgStageSelect + 10,0,0,TOP | LEFT);
               }
               else if(this.player.nChapter == 4)
               {
                  this.lib.drawImg(imgStageSelect + 8,0,0,TOP | LEFT);
               }
               else
               {
                  this.lib.drawImg(imgStageSelect + 10,0,0,TOP | LEFT);
                  this.lib.drawImg(imgStageSelect + 8,0,0,TOP | LEFT);
               }
               if(this.nMainFrame <= MAX_BTNFRAME)
               {
                  if(this.player.nChapter == 0)
                  {
                     this.lib.drawImg(imgStageSelect + 9,0,0,TOP | LEFT);
                  }
                  else if(this.player.nChapter == 4)
                  {
                     this.lib.drawImg(imgStageSelect + 7,0,0,TOP | LEFT);
                  }
                  else if(this.bNextChapterBtn)
                  {
                     this.lib.drawImg(imgStageSelect + 9,0,0,TOP | LEFT);
                  }
                  else if(this.bBeforeChapterBtn)
                  {
                     this.lib.drawImg(imgStageSelect + 7,0,0,TOP | LEFT);
                  }
               }
               this.lib.drawImg(imgStageSelect + 23,0,0,TOP | LEFT);
               this.lib.drawImg(imgStageSelect + 6,0,0,TOP | LEFT);
               if(this.nMainFrame > 22)
               {
                  this.lib.drawImgAlpha(imgStageSelect + 15,0,0,(this.nMainFrame - 22) * 10,TOP | LEFT);
                  _loc1_ = 0;
                  while(_loc1_ < 4)
                  {
                     _loc2_ = 0;
                     while(_loc2_ < 6)
                     {
                        if(this.player.nClearChapter >= this.player.nChapter && this.player.nClearStage >= _loc1_ * 6 + _loc2_ + this.player.nChapter * Player.MAX_STAGE)
                        {
                           if(this.player.STAGECLEARRESULTSTAR[_loc1_ * 6 + _loc2_ + this.player.nChapter * Player.MAX_STAGE] > 0)
                           {
                              this.lib.drawImgAlpha(imgStageSelect + 11 + (this.player.STAGECLEARRESULTSTAR[_loc1_ * 6 + _loc2_ + this.player.nChapter * Player.MAX_STAGE] - 1),_loc2_ * 103,_loc1_ * 83,(this.nMainFrame - 22) * 10,TOP | LEFT);
                           }
                        }
                        else
                        {
                           this.lib.drawImgAlpha(imgStageSelect + 14,_loc2_ * 103,_loc1_ * 83,(this.nMainFrame - 22) * 10,TOP | LEFT);
                        }
                        _loc2_++;
                     }
                     _loc1_++;
                  }
               }
               this.lib.drawImg(imgStageSelect + 25,this.player.nChapter * 29,0,TOP | LEFT);
               if(this.nMainFrame >= 31)
               {
                  this.bChangeChapter = false;
                  this.bNextChapterBtn = false;
                  this.bBeforeChapterBtn = false;
                  this.nMainScene = 100;
               }
               break;
            case 200:
               this.ope.setLoading(false,INITDATA);
               _loc5_ = this.player.UNITUPGRADE[this.nMenuPos] - 1;
               this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,0,TOP | LEFT);
               this.lib.drawImg(imgStore + 76,0,0,TOP | LEFT);
               _loc1_ = 0;
               while(_loc1_ < this.UNITINFORDB[this.nMenuPos].STRUNITINFOR.length)
               {
                  if(_loc1_ < this.UNITINFORDB[this.nMenuPos].STRUNITINFOR.length - 2)
                  {
                     if(this.UNITINFORDB[this.nMenuPos].STRUNITINFOR[_loc1_] != null)
                     {
                        this.lib.drawString(this.UNITINFORDB[this.nMenuPos].STRUNITINFOR[_loc1_],305,392 + _loc1_ * 20,13145700,100,TOP | LEFT);
                     }
                  }
                  else if(this.UNITINFORDB[this.nMenuPos].STRUNITINFOR[_loc1_] != null)
                  {
                     this.lib.drawString(this.UNITINFORDB[this.nMenuPos].STRUNITINFOR[_loc1_],305,392 + _loc1_ * 20,38655,100,TOP | LEFT);
                  }
                  _loc1_++;
               }
               _loc1_ = 0;
               while(_loc1_ < 3)
               {
                  _loc2_ = 0;
                  while(_loc2_ < 3)
                  {
                     if(this.player.UNITEQUIP[_loc1_ + _loc2_ * 3])
                     {
                        this.lib.drawImg(imgUi + 37 + _loc1_ * 3 + _loc2_ * 9 + 2,-6 + _loc1_ * 8 - _loc2_ * 243,_loc2_ * 114 - 272,TOP | LEFT);
                     }
                     else if(this.player.UNITOPEN[_loc1_ + _loc2_ * 3])
                     {
                        this.lib.drawImgAlpha(imgUi + 37 + _loc1_ * 3 + _loc2_ * 9 + 2,-6 + _loc1_ * 8 - _loc2_ * 243,_loc2_ * 114 - 272,50,TOP | LEFT);
                     }
                     else
                     {
                        this.lib.drawImg(imgUi + 37 + _loc1_ * 3 + _loc2_ * 9,-6 + _loc1_ * 8 - _loc2_ * 243,_loc2_ * 114 - 272,TOP | LEFT);
                     }
                     if(this.player.UNITOPEN[_loc1_ + _loc2_ * 3])
                     {
                        if(this.player.UNITUPGRADE[_loc1_ + _loc2_ * 3] < 10)
                        {
                           this.lib.drawNumImg("0" + this.player.UNITUPGRADE[_loc1_ + _loc2_ * 3],48 + _loc1_ * 89,214 + _loc2_ * 115,NUM_UNITUPGRADE,TOP | RIGHT);
                        }
                        else
                        {
                           this.lib.drawNumImg("" + this.player.UNITUPGRADE[_loc1_ + _loc2_ * 3],48 + _loc1_ * 89,214 + _loc2_ * 115,NUM_UNITUPGRADE,TOP | RIGHT);
                        }
                     }
                     else
                     {
                        this.lib.drawImg(imgStore + 30,_loc1_ * 89,_loc2_ * 115,TOP | LEFT);
                     }
                     _loc2_++;
                  }
                  _loc1_++;
               }
               this.lib.drawImg(imgStore + 73,this.nMenuPos % 3 * 89,int(this.nMenuPos / 3) * 115,TOP | LEFT);
               if(_loc5_ < MAX_UNITLEVEL - 1)
               {
                  this.lib.drawNumImg("" + this.lib.setStrMoney(this.player.UNITUPGRADEMONEY[this.nMenuPos * 20 + (_loc5_ + 1)]),721,303,NUM_MONEY,TOP | RIGHT);
               }
               else
               {
                  this.lib.drawNumImg("" + this.lib.setStrMoney(0),721,303,NUM_MONEY,TOP | RIGHT);
               }
               _loc6_ = 410;
               _loc7_ = 270;
               switch(this.nMenuPos)
               {
                  case 2:
                     _loc6_ -= 7;
                     break;
                  case 3:
                     _loc7_ += 20;
                     break;
                  case 4:
                     _loc6_ += 15;
                     _loc7_ += 20;
                     break;
                  case 1:
                  case 5:
                     _loc6_ += 10;
                     break;
                  case 6:
                     _loc6_ -= 20;
                     _loc7_ += 25;
                     break;
                  case 8:
                     _loc6_ += 35;
                     _loc7_ += 34;
               }
               this.lib.drawImgZoomAlpha(imgShadow,_loc6_,_loc7_ - 10 - ((Player.CHAIMG_HEIGHT >> 1) - Player.SHADOWIMG_POS - 10),this.player.UNITSHADOWWIDTH[this.nMenuPos],this.player.UNITSHADOWWIDTH[this.nMenuPos],60,VCENTER | HCENTER);
               if(!this.bUnitUpgradeAct)
               {
                  this.lib.drawImg(this.UNITIMG[this.nMenuPos * UNITIMG_TYPE] + int(this.nMainFrame >> 1) % MAX_UNITSTEP,_loc6_,_loc7_,BOTTOM | HCENTER);
               }
               else
               {
                  if(this.nUnitUpgradeActFrame < this.player.UNITATKTOTALFRAME[this.nMenuPos])
                  {
                     this.lib.drawImg(this.UNITIMG[this.nMenuPos * UNITIMG_TYPE + UNITIMG_ATK1] + int(this.nUnitUpgradeActFrame >> 1),_loc6_,_loc7_,BOTTOM | HCENTER);
                     this.nUnitUpgradeActFrame += 1;
                     if(this.nUnitUpgradeActFrame >= this.player.UNITATKTOTALFRAME[this.nMenuPos])
                     {
                        this.nUnitUpgradeActFrame = 0;
                     }
                  }
                  else
                  {
                     this.lib.drawImg(this.UNITIMG[this.nMenuPos * UNITIMG_TYPE] + int(this.nMainFrame >> 1) % MAX_UNITSTEP,_loc6_,_loc7_,BOTTOM | HCENTER);
                  }
                  if(this.nUnitUpgradeFrame < 60)
                  {
                     this.lib.drawASEAni(Ani_LevelUp,3,imgLevelUpEff,this.nUnitUpgradeFrame,405,280,80,80,false);
                     this.lib.drawASEAniEffect(Ani_LevelUp,4,imgLevelUpEff,this.nUnitUpgradeFrame,405,280,80,90,false);
                  }
                  else
                  {
                     this.lib.drawASEAni(Ani_LevelUp,0,imgLevelUpEff,this.nUnitUpgradeFrame - FPS,405,280,80,80,false);
                     this.lib.drawASEAniEffect(Ani_LevelUp,1,imgLevelUpEff,this.nUnitUpgradeFrame - FPS,405,280,80,90,false);
                  }
                  if(this.nUnitUpgradeFrame == 0)
                  {
                     this.lib.playEffect(83);
                  }
                  this.nUnitUpgradeFrame += 1;
                  if(this.nUnitUpgradeFrame >= 120)
                  {
                     this.bUnitUpgradeAct = false;
                     this.nUnitUpgradeActFrame = 0;
                     this.nUnitUpgradeFrame = 0;
                  }
               }
               if(this.player.UNITOPEN[this.nMenuPos])
               {
                  if(this.player.UNITUPGRADE[this.nMenuPos] < MAX_UNITLEVEL)
                  {
                     if(this.player.nMoney >= this.player.UNITUPGRADEMONEY[this.nMenuPos * MAX_UNITLEVEL + (_loc5_ + 1)])
                     {
                        if(!this.bUpgradeBtn)
                        {
                           this.lib.drawImg(imgStore + 25,0,0,TOP | LEFT);
                        }
                        else
                        {
                           this.lib.drawImg(imgStore + 24,0,0,TOP | LEFT);
                           this.nBtnFrame += 1 + this.nLeakFrame;
                           if(this.nBtnFrame > MAX_BTNFRAME)
                           {
                              this.player.nMoney -= this.player.UNITUPGRADEMONEY[this.nMenuPos * MAX_UNITLEVEL + (_loc5_ + 1)];
                              ++this.player.UNITUPGRADE[this.nMenuPos];
                              if(!this.player.UNITEQUIP[this.nMenuPos])
                              {
                                 this.player.UNITEQUIP[this.nMenuPos] = true;
                                 if(this.nMenuPos < 8)
                                 {
                                    this.player.UNITOPEN[this.nMenuPos + 1] = true;
                                 }
                              }
                              this.nBtnFrame = 0;
                              this.bUpgradeBtn = false;
                              this.lib.saveFile(DB_SLOT,"paladog_slot" + this.nGameSlot);
                              this.lib.saveFile(DB_GAME,"paladog_game" + this.nGameSlot);
                           }
                        }
                     }
                     else
                     {
                        this.lib.drawImg(imgStore + 23,0,0,TOP | LEFT);
                     }
                  }
                  else
                  {
                     this.lib.drawImg(imgStore + 29,0,0,TOP | LEFT);
                  }
               }
               else
               {
                  this.lib.drawImg(imgStore + 23,0,0,TOP | LEFT);
               }
               this.lib.drawImg(imgStore + 64 + this.nMenuPos,0,0,TOP | LEFT);
               if(this.player.UNITEQUIP[this.nMenuPos])
               {
                  if(this.player.UNITUPGRADE[this.nMenuPos] < MAX_UNITLEVEL)
                  {
                     this.lib.drawNumImg("/" + (this.player.UNITUPGRADEHP[this.nMenuPos * MAX_UNITLEVEL + (_loc5_ + 1)] - this.player.UNITUPGRADEHP[this.nMenuPos * MAX_UNITLEVEL + _loc5_]),722,121,NUM_UNITDATA,TOP | RIGHT);
                     this.lib.drawNumImg("/" + (this.player.UNITUPGRADEATTACK[this.nMenuPos * MAX_UNITLEVEL + (_loc5_ + 1)] - this.player.UNITUPGRADEATTACK[this.nMenuPos * MAX_UNITLEVEL + _loc5_]) * 10,722,164,NUM_UNITDATA,TOP | RIGHT);
                  }
                  else
                  {
                     this.lib.drawNumImg("0",722,121,NUM_UNITDATA,TOP | RIGHT);
                     this.lib.drawNumImg("0",722,164,NUM_UNITDATA,TOP | RIGHT);
                  }
               }
               else
               {
                  this.lib.drawNumImg("/" + this.player.UNITUPGRADEHP[this.nMenuPos * MAX_UNITLEVEL + (_loc5_ + 1)],722,121,NUM_UNITDATA,TOP | RIGHT);
                  this.lib.drawNumImg("/" + this.player.UNITUPGRADEATTACK[this.nMenuPos * MAX_UNITLEVEL + (_loc5_ + 1)] * 10,722,164,NUM_UNITDATA,TOP | RIGHT);
               }
               if(this.player.UNITEQUIP[this.nMenuPos])
               {
                  if(this.player.UNITUPGRADE[this.nMenuPos] < MAX_UNITLEVEL)
                  {
                     this.lib.fillRect(550,143,168 * this.player.UNITUPGRADEHP[this.nMenuPos * MAX_UNITLEVEL + _loc5_ + 1] / this.player.MAXUNITDATA[0],10,16767744,TOP | LEFT);
                     this.lib.fillRect(550,186,168 * this.player.UNITUPGRADEATTACK[this.nMenuPos * MAX_UNITLEVEL + _loc5_ + 1] / this.player.MAXUNITDATA[1],10,16767744,TOP | LEFT);
                  }
                  this.lib.fillRect(550,143,168 * this.player.UNITUPGRADEHP[this.nMenuPos * MAX_UNITLEVEL + _loc5_] / this.player.MAXUNITDATA[0],10,16741888,TOP | LEFT);
                  this.lib.fillRect(550,186,168 * this.player.UNITUPGRADEATTACK[this.nMenuPos * MAX_UNITLEVEL + _loc5_] / this.player.MAXUNITDATA[1],10,16741888,TOP | LEFT);
                  this.lib.fillRect(550,229,168 * this.UNITDB[this.nMenuPos].nMove_pps / this.player.MAXUNITDATA[2],10,16741888,TOP | LEFT);
                  this.lib.fillRect(550,271,168 * this.UNITDB[this.nMenuPos].nAttackDelay / this.player.MAXUNITDATA[3],10,16741888,TOP | LEFT);
               }
               else
               {
                  this.lib.fillRect(550,143,168 * this.player.UNITUPGRADEHP[this.nMenuPos * MAX_UNITLEVEL + _loc5_ + 1] / this.player.MAXUNITDATA[0],10,16767744,TOP | LEFT);
                  this.lib.fillRect(550,186,168 * this.player.UNITUPGRADEATTACK[this.nMenuPos * MAX_UNITLEVEL + _loc5_ + 1] / this.player.MAXUNITDATA[1],10,16767744,TOP | LEFT);
                  this.lib.fillRect(550,229,168 * this.UNITDB[this.nMenuPos].nMove_pps / this.player.MAXUNITDATA[2],10,16741888,TOP | LEFT);
                  this.lib.fillRect(550,271,168 * this.UNITDB[this.nMenuPos].nAttackDelay / this.player.MAXUNITDATA[3],10,16741888,TOP | LEFT);
               }
               this.lib.drawNumImg("" + this.lib.setStrMoney(this.player.nMoney),250,493,NUM_MONEY,TOP | RIGHT);
               if(this.bStoreBtn)
               {
                  this.lib.drawImg(imgStore + 8,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bStoreBtn = false;
                     this.nPigDialogStep = 0;
                     this.nPigDialogFrame = 0;
                     this.bPigThanksBuy = false;
                     this.bPigThanksSell = false;
                     this.bUnitUpgradeAct = false;
                     this.nUnitUpgradeActFrame = 0;
                     this.nUnitUpgradeFrame = 0;
                     if(this.nTutorial[5] == INITDATA)
                     {
                        this.nMainScene = 1001;
                     }
                     else
                     {
                        this.nMainScene = 300;
                     }
                  }
               }
               else
               {
                  this.lib.drawImg(imgStore + 9,0,0,TOP | LEFT);
               }
               this.bActive = false;
               break;
            case 300:
               this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,0,TOP | LEFT);
               this.lib.drawImg(imgStore + 48,0,0,TOP | LEFT);
               this.lib.drawImg(imgStore + 50,0,0,TOP | LEFT);
               switch(this.nPigDialogStep)
               {
                  case 0:
                     this.lib.drawASEAni(Ani_StoreCha,Player.STOREANI_WAIT,imgPig,this.nPigDialogFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                     if(this.nPigDialogFrame == 80 || this.nPigDialogFrame == 100 || this.nPigDialogFrame == 200 || this.nPigDialogFrame == 220)
                     {
                        this.lib.playEffect(120);
                     }
                     ++this.nPigDialogFrame;
                     if(this.nPigDialogFrame >= 240)
                     {
                        this.nPigTipIndex = this.lib.getRand(15);
                        this.nPigDialogFrame = 0;
                        ++this.nPigDialogStep;
                     }
                     if(this.bStoreItemSelect)
                     {
                        if(this.nPigDialogFrame > 2)
                        {
                           this.nPigDialogFrame = 0;
                           ++this.nPigDialogStep;
                        }
                     }
                     break;
                  case 1:
                     this.lib.drawASEAni(Ani_StoreCha,Player.STOREANI_TALK,imgPig,this.nPigDialogFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                     if(this.nPigDialogFrame == 2 || this.nPigDialogFrame == 60 || this.nPigDialogFrame == 120 || this.nPigDialogFrame == 160 || this.nPigDialogFrame == 180 || this.nPigDialogFrame == 230 || this.nPigDialogFrame == 250)
                     {
                        this.lib.playEffect(120);
                     }
                     else if(this.nPigDialogFrame == 20 || this.nPigDialogFrame == 140 || this.nPigDialogFrame == 200)
                     {
                        this.lib.playEffect(121);
                     }
                     else if(this.nPigDialogFrame == 90 || this.nPigDialogFrame == 270)
                     {
                        this.lib.playEffect(122);
                     }
                     ++this.nPigDialogFrame;
                     if(this.nPigDialogFrame >= 300)
                     {
                        this.nPigDialogFrame = 0;
                        ++this.nPigDialogStep;
                     }
                     break;
                  case 2:
                     this.lib.drawASEAni(Ani_StoreCha,Player.STOREANI_WAIT,imgPig,this.nPigDialogFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                     if(this.nPigDialogFrame == 80 || this.nPigDialogFrame == 100 || this.nPigDialogFrame == 200 || this.nPigDialogFrame == 220)
                     {
                        this.lib.playEffect(120);
                     }
                     ++this.nPigDialogFrame;
                     if(this.nPigDialogFrame >= 360)
                     {
                        this.nPigDialogFrame = 0;
                        if(!this.bStoreItemSelect && !this.bInvenItemSelect)
                        {
                           this.nPigDialogStep = 0;
                           if(this.bPigThanksBuy)
                           {
                              this.bPigThanksBuy = false;
                           }
                           if(this.bPigThanksSell)
                           {
                              this.bPigThanksSell = false;
                           }
                        }
                        else
                        {
                           ++this.nPigDialogStep;
                        }
                     }
                     break;
                  case 3:
                     this.lib.drawASEAni(Ani_StoreCha,Player.STOREANI_WAIT,imgPig,this.nPigDialogFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                     if(this.nPigDialogFrame == 80 || this.nPigDialogFrame == 100 || this.nPigDialogFrame == 200 || this.nPigDialogFrame == 220)
                     {
                        this.lib.playEffect(120);
                     }
                     ++this.nPigDialogFrame;
                     if(!this.bStoreItemSelect && !this.bInvenItemSelect)
                     {
                        this.nPigDialogFrame = 0;
                        this.nPigDialogStep = 0;
                     }
               }
               this.lib.drawImg(imgStore + 49,0,0,TOP | LEFT);
               _loc1_ = 0;
               while(_loc1_ < Player.STOREDATA_LEVELPOS)
               {
                  if(this.player.STOREDATA[_loc1_] > INITDATA)
                  {
                     _loc4_ = this.ope.getItemPrice(this.player.STOREDATA[_loc1_],this.player.STOREDATA[_loc1_ + Player.STOREDATA_LEVELPOS]);
                     this.lib.drawImg(imgMaceIcon + this.player.STOREDATA[_loc1_],46 + _loc1_ * 74,365,BOTTOM | HCENTER);
                     if(this.player.STOREDATA[_loc1_ + Player.STOREDATA_LEVELPOS] > 0)
                     {
                        this.lib.drawNumImg("/" + this.player.STOREDATA[_loc1_ + Player.STOREDATA_LEVELPOS],41 + _loc1_ * 74,325,NUM_ITEMLEVEL,BOTTOM | LEFT);
                     }
                     this.lib.drawNumImg("" + this.lib.setStrMoney(_loc4_),46 + _loc1_ * 74,375,NUM_ITEMPRICE,BOTTOM | HCENTER);
                     if(this.bStoreItemSelect && this.nStoreItemSelectPos == _loc1_)
                     {
                        this.lib.drawImg(imgStore + 51,-36 + _loc1_ * 74,-10,TOP | LEFT);
                     }
                  }
                  _loc1_++;
               }
               if(this.bStoreItemSelect)
               {
                  if(this.player.STOREDATA[this.nStoreItemSelectPos] > INITDATA)
                  {
                     this.nItemPrice = this.ope.getItemPrice(this.player.STOREDATA[this.nStoreItemSelectPos],this.player.STOREDATA[this.nStoreItemSelectPos + Player.STOREDATA_LEVELPOS]);
                     this.lib.drawImgAlpha(imgStore + 63,0,0,60,TOP | LEFT);
                     if(this.nPigDialogStep > 0)
                     {
                        _loc1_ = 0;
                        while(_loc1_ < this.STOREINFORDB[StoreInforDB.ITEMINFOR_INDEX + this.player.STOREDATA[this.nStoreItemSelectPos]].STRSTOREINFOR.length)
                        {
                           if(_loc1_ < 1)
                           {
                              if(this.STOREINFORDB[StoreInforDB.ITEMINFOR_INDEX + this.player.STOREDATA[this.nStoreItemSelectPos]].STRSTOREINFOR[_loc1_] != null)
                              {
                                 this.lib.drawString(this.STOREINFORDB[StoreInforDB.ITEMINFOR_INDEX + this.player.STOREDATA[this.nStoreItemSelectPos]].STRSTOREINFOR[_loc1_],370,130,16776960,100,TOP | LEFT);
                                 this.lib.drawString(this.nItemPrice + " Vàng",760,130,16744448,100,TOP | RIGHT);
                              }
                           }
                           else if(this.STOREINFORDB[StoreInforDB.ITEMINFOR_INDEX + this.player.STOREDATA[this.nStoreItemSelectPos]].STRSTOREINFOR[_loc1_] != null)
                           {
                              this.lib.drawString(this.STOREINFORDB[StoreInforDB.ITEMINFOR_INDEX + this.player.STOREDATA[this.nStoreItemSelectPos]].STRSTOREINFOR[_loc1_],370,140 + _loc1_ * 20,16777215,100,TOP | LEFT);
                           }
                           _loc1_++;
                        }
                     }
                     if(this.player.nMoney >= this.nItemPrice)
                     {
                        if(this.bBuySellBtn)
                        {
                           this.lib.drawImg(imgStore,0,0,TOP | LEFT);
                           this.nBtnFrame += 1 + this.nLeakFrame;
                           if(this.nBtnFrame > MAX_BTNFRAME)
                           {
                              this.nBtnFrame = 0;
                              this.bBuySellBtn = false;
                              if(!this.ope.bFullBag())
                              {
                                 if(this.ope.addItem(this.player.STOREDATA[this.nStoreItemSelectPos],this.player.STOREDATA[this.nStoreItemSelectPos + Player.STOREDATA_LEVELPOS]))
                                 {
                                    this.player.nMoney -= this.nItemPrice;
                                 }
                                 this.lib.saveFile(DB_SLOT,"paladog_slot" + this.nGameSlot);
                                 this.lib.saveFile(DB_GAME,"paladog_game" + this.nGameSlot);
                                 this.nPigDialogFrame = 0;
                                 this.nPigDialogStep = 1;
                                 this.nPigTipIndex = this.lib.getRand(3);
                                 this.bPigThanksBuy = true;
                              }
                           }
                        }
                        else
                        {
                           this.lib.drawImg(imgStore + 1,0,0,TOP | LEFT);
                        }
                     }
                     else
                     {
                        this.lib.drawImg(imgStore + 35,0,0,TOP | LEFT);
                     }
                  }
                  else
                  {
                     this.bStoreItemSelect = false;
                  }
               }
               this.lib.drawImg(imgStore + 33,0,0,TOP | LEFT);
               _loc1_ = 0;
               while(_loc1_ < Player.INVENDATA_LEVELPOS)
               {
                  this.lib.drawImg(imgStore + 32,this.player.nInvenPosX + _loc1_ * 74,0,TOP | LEFT);
                  _loc1_++;
               }
               _loc1_ = 0;
               while(_loc1_ < Player.INVENDATA_LEVELPOS)
               {
                  if(this.player.INVENDATA[_loc1_] > INITDATA)
                  {
                     this.lib.drawImg(imgMaceIcon + this.player.INVENDATA[_loc1_],this.player.nInvenPosX + 83 + _loc1_ * 74,523,VCENTER | HCENTER);
                     if(this.player.INVENDATA[_loc1_ + Player.INVENDATA_LEVELPOS] > 0)
                     {
                        this.lib.drawNumImg("/" + this.player.INVENDATA[_loc1_ + Player.INVENDATA_LEVELPOS],this.player.nInvenPosX + 78 + _loc1_ * 74,511,NUM_ITEMLEVEL,BOTTOM | LEFT);
                     }
                     if(this.bInvenItemSelect && this.nInvenItemSelectPos == _loc1_)
                     {
                        this.lib.drawImg(imgStore + 34,this.player.nInvenPosX + _loc1_ * 74,0,TOP | LEFT);
                     }
                  }
                  _loc1_++;
               }
               this.lib.drawImg(imgStore + 31,0,0,TOP | LEFT);
               if(this.bInvenItemSelect)
               {
                  if(this.player.INVENDATA[this.nInvenItemSelectPos] > INITDATA)
                  {
                     this.nItemPrice = this.ope.getItemPrice(this.player.INVENDATA[this.nInvenItemSelectPos],this.player.INVENDATA[this.nInvenItemSelectPos + Player.INVENDATA_LEVELPOS]);
                     this.nItemPrice = int(this.nItemPrice >> 1);
                     this.lib.drawImgAlpha(imgStore + 63,0,0,60,TOP | LEFT);
                     if(this.nPigDialogStep > 0)
                     {
                        _loc1_ = 0;
                        while(_loc1_ < this.STOREINFORDB[StoreInforDB.ITEMINFOR_INDEX + this.player.INVENDATA[this.nInvenItemSelectPos]].STRSTOREINFOR.length)
                        {
                           if(_loc1_ < 1)
                           {
                              if(this.STOREINFORDB[StoreInforDB.ITEMINFOR_INDEX + this.player.INVENDATA[this.nInvenItemSelectPos]].STRSTOREINFOR[_loc1_] != null)
                              {
                                 this.lib.drawString(this.STOREINFORDB[StoreInforDB.ITEMINFOR_INDEX + this.player.INVENDATA[this.nInvenItemSelectPos]].STRSTOREINFOR[_loc1_],370,130,16776960,100,TOP | LEFT);
                                 this.lib.drawString(this.nItemPrice + " Vàng",760,130,16744448,100,TOP | RIGHT);
                              }
                           }
                           else if(this.STOREINFORDB[StoreInforDB.ITEMINFOR_INDEX + this.player.INVENDATA[this.nInvenItemSelectPos]].STRSTOREINFOR[_loc1_] != null)
                           {
                              this.lib.drawString(this.STOREINFORDB[StoreInforDB.ITEMINFOR_INDEX + this.player.INVENDATA[this.nInvenItemSelectPos]].STRSTOREINFOR[_loc1_],370,140 + _loc1_ * 20,16777215,100,TOP | LEFT);
                           }
                           _loc1_++;
                        }
                     }
                     if(this.bBuySellBtn)
                     {
                        this.lib.drawImg(imgStore + 6,0,0,TOP | LEFT);
                        this.nBtnFrame += 1 + this.nLeakFrame;
                        if(this.nBtnFrame > MAX_BTNFRAME)
                        {
                           this.nBtnFrame = 0;
                           this.bBuySellBtn = false;
                           this.bInvenItemSelect = false;
                           this.ope.deleteItem(this.nInvenItemSelectPos);
                           this.player.nMoney += this.nItemPrice;
                           this.lib.saveFile(DB_SLOT,"paladog_slot" + this.nGameSlot);
                           this.lib.saveFile(DB_GAME,"paladog_game" + this.nGameSlot);
                           this.nPigDialogFrame = 0;
                           this.nPigDialogStep = 1;
                           this.nPigTipIndex = this.lib.getRand(3);
                           this.bPigThanksSell = true;
                        }
                     }
                     else
                     {
                        this.lib.drawImg(imgStore + 7,0,0,TOP | LEFT);
                     }
                  }
                  else
                  {
                     this.bInvenItemSelect = false;
                  }
               }
               if(!this.bStoreItemSelect && !this.bInvenItemSelect)
               {
                  if(this.nPigDialogStep > 0)
                  {
                     this.lib.drawImgAlpha(imgStore + 63,0,0,60,TOP | LEFT);
                     if(this.bPigThanksBuy)
                     {
                        _loc1_ = 0;
                        while(_loc1_ < this.STOREINFORDB[StoreInforDB.BUYDIA_INDEX + this.nPigTipIndex].STRSTOREINFOR.length)
                        {
                           if(this.STOREINFORDB[StoreInforDB.BUYDIA_INDEX + this.nPigTipIndex].STRSTOREINFOR[_loc1_] != null)
                           {
                              this.lib.drawString(this.STOREINFORDB[StoreInforDB.BUYDIA_INDEX + this.nPigTipIndex].STRSTOREINFOR[_loc1_],370,140 + _loc1_ * 20,16777215,100,TOP | LEFT);
                           }
                           _loc1_++;
                        }
                     }
                     else if(this.bPigThanksSell)
                     {
                        _loc1_ = 0;
                        while(_loc1_ < this.STOREINFORDB[StoreInforDB.SELLDIA_INDEX + this.nPigTipIndex].STRSTOREINFOR.length)
                        {
                           if(this.STOREINFORDB[StoreInforDB.SELLDIA_INDEX + this.nPigTipIndex].STRSTOREINFOR[_loc1_] != null)
                           {
                              this.lib.drawString(this.STOREINFORDB[StoreInforDB.SELLDIA_INDEX + this.nPigTipIndex].STRSTOREINFOR[_loc1_],370,140 + _loc1_ * 20,16777215,100,TOP | LEFT);
                           }
                           _loc1_++;
                        }
                     }
                     else
                     {
                        _loc1_ = 0;
                        while(_loc1_ < this.STOREINFORDB[StoreInforDB.TIP_INDEX + this.nPigTipIndex].STRSTOREINFOR.length)
                        {
                           if(this.STOREINFORDB[StoreInforDB.TIP_INDEX + this.nPigTipIndex].STRSTOREINFOR[_loc1_] != null)
                           {
                              this.lib.drawString(this.STOREINFORDB[StoreInforDB.TIP_INDEX + this.nPigTipIndex].STRSTOREINFOR[_loc1_],370,140 + _loc1_ * 20,16777215,100,TOP | LEFT);
                           }
                           _loc1_++;
                        }
                     }
                  }
               }
               if(this.player.bInvenLeftArrowBtn)
               {
                  this.lib.drawImg(imgStore + 36,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.player.bInvenLeftArrowBtn = false;
                     this.player.nInvenPosX += 74 * 9;
                     if(this.player.nInvenPosX >= Player.INVEN_STARTPOS)
                     {
                        this.player.nInvenPosX = Player.INVEN_STARTPOS;
                     }
                  }
               }
               else
               {
                  this.lib.drawImg(imgStore + 37,0,0,TOP | LEFT);
               }
               if(this.player.bInvenRightArrowBtn)
               {
                  this.lib.drawImg(imgStore + 38,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.player.bInvenRightArrowBtn = false;
                     this.player.nInvenPosX -= 74 * 9;
                     if(this.player.nInvenPosX <= -Player.INVEN_ENDPOS)
                     {
                        this.player.nInvenPosX = -Player.INVEN_ENDPOS;
                     }
                  }
               }
               else
               {
                  this.lib.drawImg(imgStore + 39,0,0,TOP | LEFT);
               }
               this.lib.drawNumImg("" + this.lib.setStrMoney(this.player.nMoney),685,436,NUM_MONEY,TOP | RIGHT);
               if(this.bSortingBtn)
               {
                  this.lib.drawImg(imgStore + 15,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bSortingBtn = false;
                     if(!this.bDrawSortingList)
                     {
                        this.bDrawSortingList = true;
                     }
                     else
                     {
                        this.bDrawSortingList = false;
                     }
                  }
               }
               else
               {
                  this.lib.drawImg(imgStore + 16,0,0,TOP | LEFT);
               }
               if(this.bDrawSortingList)
               {
                  this.lib.drawImgAlpha(imgStore + 14,0,0,70,TOP | LEFT);
                  if(this.bMaceSortingBtn)
                  {
                     this.lib.drawImg(imgStore + 17,0,0,TOP | LEFT);
                     this.nBtnFrame += 1 + this.nLeakFrame;
                     if(this.nBtnFrame > MAX_BTNFRAME)
                     {
                        this.nBtnFrame = 0;
                        this.bMaceSortingBtn = false;
                        this.bDrawSortingList = false;
                        this.ope.sortInven(Player.SORTING_MACE);
                     }
                  }
                  else
                  {
                     this.lib.drawImg(imgStore + 18,0,0,TOP | LEFT);
                  }
                  if(this.bRingSortingBtn)
                  {
                     this.lib.drawImg(imgStore + 12,0,0,TOP | LEFT);
                     this.nBtnFrame += 1 + this.nLeakFrame;
                     if(this.nBtnFrame > MAX_BTNFRAME)
                     {
                        this.nBtnFrame = 0;
                        this.bRingSortingBtn = false;
                        this.bDrawSortingList = false;
                        this.ope.sortInven(Player.SORTING_RING);
                     }
                  }
                  else
                  {
                     this.lib.drawImg(imgStore + 13,0,0,TOP | LEFT);
                  }
               }
               if(this.bUnitBtn)
               {
                  this.lib.drawImg(imgStore + 21,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bUnitBtn = false;
                     this.nUnitUpgradeFrame = 0;
                     this.nMainScene = 200;
                  }
               }
               else
               {
                  this.lib.drawImg(imgStore + 22,0,0,TOP | LEFT);
               }
               if(this.bEquipBtn)
               {
                  this.lib.drawImg(imgStore + 2,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bEquipBtn = false;
                     if(this.nTutorial[6] == INITDATA)
                     {
                        this.nMainScene = 1002;
                     }
                     else
                     {
                        this.nMainScene = 400;
                     }
                  }
               }
               else
               {
                  this.lib.drawImg(imgStore + 3,0,0,TOP | LEFT);
               }
               this.bActive = false;
               break;
            case 400:
               this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,0,TOP | LEFT);
               this.lib.drawImg(imgStore + 26,0,0,TOP | LEFT);
               if(!this.bMaceEquipAct)
               {
                  if(this.player.nNowArms > INITDATA)
                  {
                     this.lib.drawASEAni(Ani_Mace,Player.ANI_WAIT,imgMace01 + this.player.nNowArms,this.nMainFrame,210,290,100,100,false);
                  }
                  this.lib.drawImgZoomAlpha(imgShadow,210,290,32,40,60,VCENTER | HCENTER);
                  this.lib.drawASEAni(Ani_Paladog,Player.ANI_WAIT,imgPaladog,this.nMainFrame,210,290,100,100,false);
               }
               else
               {
                  if(this.player.nNowArms > INITDATA)
                  {
                     this.lib.drawASEAni(Ani_Mace,Player.ANI_ATT,imgMace01 + this.player.nNowArms,this.nMainFrame,210,290,100,100,false);
                  }
                  this.lib.drawImgZoomAlpha(imgShadow,210,290,32,40,60,VCENTER | HCENTER);
                  this.lib.drawASEAni(Ani_Paladog,Player.ANI_ATT,imgPaladog,this.nMainFrame,210,290,100,100,false);
                  this.nMaceEquipActFrame += 1;
                  if(this.nMaceEquipActFrame >= Player.MAX_ARMSFRAME)
                  {
                     this.bMaceEquipAct = false;
                     this.nMaceEquipActFrame = 0;
                  }
               }
               this.lib.drawImgAlpha(imgStore + 27,0,0,60,TOP | LEFT);
               if(this.bEquipItemSelect)
               {
                  this.lib.drawImgAlpha(imgStore + 62,0,0,60,TOP | LEFT);
                  if(this.nLarvaDialogStep > 0)
                  {
                     _loc1_ = 0;
                     while(_loc1_ < this.STOREINFORDB[StoreInforDB.HEROITEMSELECT_INDEX + this.player.EQUIPINVEN[this.nEquipItemSelectPos]].STRSTOREINFOR.length)
                     {
                        if(_loc1_ < 1)
                        {
                           if(this.STOREINFORDB[StoreInforDB.HEROITEMSELECT_INDEX + this.player.EQUIPINVEN[this.nEquipItemSelectPos]].STRSTOREINFOR[_loc1_] != null)
                           {
                              this.lib.drawString(this.STOREINFORDB[StoreInforDB.HEROITEMSELECT_INDEX + this.player.EQUIPINVEN[this.nEquipItemSelectPos]].STRSTOREINFOR[_loc1_],445,130,16776960,100,TOP | LEFT);
                           }
                        }
                        else if(this.STOREINFORDB[StoreInforDB.HEROITEMSELECT_INDEX + this.player.EQUIPINVEN[this.nEquipItemSelectPos]].STRSTOREINFOR[_loc1_] != null)
                        {
                           this.lib.drawString(this.STOREINFORDB[StoreInforDB.HEROITEMSELECT_INDEX + this.player.EQUIPINVEN[this.nEquipItemSelectPos]].STRSTOREINFOR[_loc1_],445,140 + _loc1_ * 20,16777215,100,TOP | LEFT);
                        }
                        _loc1_++;
                     }
                  }
                  if(this.bItemUnEquipBtn)
                  {
                     this.lib.drawImg(imgStore + 19,0,0,TOP | LEFT);
                     this.nBtnFrame += 1 + this.nLeakFrame;
                     if(this.nBtnFrame > MAX_BTNFRAME)
                     {
                        this.nBtnFrame = 0;
                        this.bItemUnEquipBtn = false;
                        this.bEquipItemSelect = false;
                        if(this.ope.unEquipItem(this.nEquipItemSelectPos))
                        {
                           if(this.nEquipItemSelectPos < Player.EQUIPINVEN_RINGPOS)
                           {
                              this.ope.setArms(true,Drawing.INITDATA);
                           }
                        }
                        this.lib.saveFile(DB_SLOT,"paladog_slot" + this.nGameSlot);
                        this.lib.saveFile(DB_GAME,"paladog_game" + this.nGameSlot);
                        this.nLarvaDialogFrame = 0;
                        this.nLarvaDialogStep = 0;
                     }
                  }
                  else
                  {
                     this.lib.drawImg(imgStore + 20,0,0,TOP | LEFT);
                  }
               }
               this.lib.drawImg(imgStore + 33,0,0,TOP | LEFT);
               _loc1_ = 0;
               while(_loc1_ < Player.INVENDATA_LEVELPOS)
               {
                  this.lib.drawImg(imgStore + 32,0 + _loc1_ * 74,0,TOP | LEFT);
                  _loc1_++;
               }
               this.lib.drawImg(imgStore + 31,0,0,TOP | LEFT);
               this.lib.drawImg(imgStore + 33,0,0,TOP | LEFT);
               _loc1_ = 0;
               while(_loc1_ < Player.INVENDATA_LEVELPOS)
               {
                  this.lib.drawImg(imgStore + 32,this.player.nInvenPosX + _loc1_ * 74,0,TOP | LEFT);
                  _loc1_++;
               }
               _loc1_ = 0;
               while(_loc1_ < Player.INVENDATA_LEVELPOS)
               {
                  if(this.player.INVENDATA[_loc1_] > INITDATA)
                  {
                     this.lib.drawImg(imgMaceIcon + this.player.INVENDATA[_loc1_],this.player.nInvenPosX + 83 + _loc1_ * 74,523,VCENTER | HCENTER);
                     if(this.player.INVENDATA[_loc1_ + Player.INVENDATA_LEVELPOS] > 0)
                     {
                        this.lib.drawNumImg("/" + this.player.INVENDATA[_loc1_ + Player.INVENDATA_LEVELPOS],this.player.nInvenPosX + 78 + _loc1_ * 74,511,NUM_ITEMLEVEL,BOTTOM | LEFT);
                     }
                     if(this.bInvenItemSelect && this.nInvenItemSelectPos == _loc1_)
                     {
                        this.lib.drawImg(imgStore + 34,this.player.nInvenPosX + _loc1_ * 74,0,TOP | LEFT);
                     }
                  }
                  _loc1_++;
               }
               this.lib.drawImg(imgStore + 31,0,0,TOP | LEFT);
               if(this.bInvenItemSelect)
               {
                  if(this.player.INVENDATA[this.nInvenItemSelectPos] > INITDATA)
                  {
                     this.lib.drawImgAlpha(imgStore + 62,0,0,60,TOP | LEFT);
                     if(this.nLarvaDialogStep > 0)
                     {
                        _loc1_ = 0;
                        while(_loc1_ < this.STOREINFORDB[StoreInforDB.HEROITEMSELECT_INDEX + this.player.INVENDATA[this.nInvenItemSelectPos]].STRSTOREINFOR.length)
                        {
                           if(_loc1_ < 1)
                           {
                              if(this.STOREINFORDB[StoreInforDB.HEROITEMSELECT_INDEX + this.player.INVENDATA[this.nInvenItemSelectPos]].STRSTOREINFOR[_loc1_] != null)
                              {
                                 this.lib.drawString(this.STOREINFORDB[StoreInforDB.HEROITEMSELECT_INDEX + this.player.INVENDATA[this.nInvenItemSelectPos]].STRSTOREINFOR[_loc1_],445,130,16776960,100,TOP | LEFT);
                              }
                           }
                           else if(this.STOREINFORDB[StoreInforDB.HEROITEMSELECT_INDEX + this.player.INVENDATA[this.nInvenItemSelectPos]].STRSTOREINFOR[_loc1_] != null)
                           {
                              this.lib.drawString(this.STOREINFORDB[StoreInforDB.HEROITEMSELECT_INDEX + this.player.INVENDATA[this.nInvenItemSelectPos]].STRSTOREINFOR[_loc1_],445,140 + _loc1_ * 20,16777215,100,TOP | LEFT);
                           }
                           _loc1_++;
                        }
                     }
                     if(this.player.INVENDATA[this.nInvenItemSelectPos] < RING_EXP)
                     {
                        _loc1_ = 0;
                        while(_loc1_ < 3)
                        {
                           if(this.nMainFrame % 20 >= 10)
                           {
                              this.lib.drawImgAlpha(imgStore + 28,0,_loc1_ * 74,80,TOP | LEFT);
                           }
                           _loc1_++;
                        }
                     }
                     else
                     {
                        _loc1_ = 0;
                        while(_loc1_ < 2)
                        {
                           if(this.nMainFrame % 20 >= 10)
                           {
                              this.lib.drawImgAlpha(imgStore + 28,290,_loc1_ * 74,80,TOP | LEFT);
                           }
                           _loc1_++;
                        }
                     }
                  }
               }
               _loc1_ = 0;
               while(_loc1_ < 2)
               {
                  _loc2_ = 0;
                  while(_loc2_ < 3)
                  {
                     if(this.player.EQUIPINVEN[_loc2_ + _loc1_ * 3] > INITDATA)
                     {
                        this.lib.drawImg(imgMaceIcon + this.player.EQUIPINVEN[_loc2_ + _loc1_ * 3],77 + _loc1_ * 290,188 + _loc2_ * 74,VCENTER | HCENTER);
                        if(this.player.EQUIPINVEN[_loc2_ + _loc1_ * 3 + Player.EQUIPINVEN_LEVELPOS] > 0)
                        {
                           this.lib.drawNumImg("/" + this.player.EQUIPINVEN[_loc2_ + _loc1_ * 3 + Player.EQUIPINVEN_LEVELPOS],72 + _loc1_ * 290,176 + _loc2_ * 74,NUM_ITEMLEVEL,BOTTOM | LEFT);
                        }
                        if(this.bEquipItemSelect && this.nEquipItemSelectPos == _loc2_ + _loc1_ * 3)
                        {
                           this.lib.drawImg(imgStore + 51,-5 + _loc1_ * 294,-161 + _loc2_ * 74,TOP | LEFT);
                        }
                     }
                     _loc2_++;
                  }
                  _loc1_++;
               }
               if(!this.bEquipItemSelect && !this.bInvenItemSelect)
               {
                  if(this.nLarvaDialogStep > 0)
                  {
                     this.lib.drawImgAlpha(imgStore + 62,0,0,60,TOP | LEFT);
                     _loc1_ = 0;
                     while(_loc1_ < this.STOREINFORDB[StoreInforDB.HEROTIP_INDEX + this.nLarvaTipIndex].STRSTOREINFOR.length)
                     {
                        if(this.STOREINFORDB[StoreInforDB.HEROTIP_INDEX + this.nLarvaTipIndex].STRSTOREINFOR[_loc1_] != null)
                        {
                           this.lib.drawString(this.STOREINFORDB[StoreInforDB.HEROTIP_INDEX + this.nLarvaTipIndex].STRSTOREINFOR[_loc1_],445,140 + _loc1_ * 20,16777215,100,TOP | LEFT);
                        }
                        _loc1_++;
                     }
                  }
               }
               switch(this.nLarvaDialogStep)
               {
                  case 0:
                     this.lib.drawASEAni(Ani_StoreCha + 1,Player.STOREANI_WAIT,imgLarva,this.nLarvaDialogFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                     if(this.nLarvaDialogFrame == 60)
                     {
                        this.lib.playEffect(119);
                     }
                     ++this.nLarvaDialogFrame;
                     if(this.nLarvaDialogFrame >= 240)
                     {
                        this.nLarvaTipIndex = this.lib.getRand(18);
                        this.nLarvaDialogFrame = 0;
                        ++this.nLarvaDialogStep;
                     }
                     if(this.bEquipItemSelect || this.bInvenItemSelect)
                     {
                        if(this.nLarvaDialogFrame > 2)
                        {
                           this.nLarvaDialogFrame = 0;
                           ++this.nLarvaDialogStep;
                        }
                     }
                     break;
                  case 1:
                     this.lib.drawASEAni(Ani_StoreCha + 1,Player.STOREANI_TALK,imgLarva,this.nLarvaDialogFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                     if(this.nLarvaDialogFrame == 2 || this.nLarvaDialogFrame == 10 || this.nLarvaDialogFrame == 60 || this.nLarvaDialogFrame == 70 || this.nLarvaDialogFrame == 120 || this.nLarvaDialogFrame == 130 || this.nLarvaDialogFrame == 160 || this.nLarvaDialogFrame == 170 || this.nLarvaDialogFrame == 180 || this.nLarvaDialogFrame == 230 || this.nLarvaDialogFrame == 240 || this.nLarvaDialogFrame == 250 || this.nLarvaDialogFrame == 260)
                     {
                        this.lib.playEffect(117);
                     }
                     else if(this.nLarvaDialogFrame == 20 || this.nLarvaDialogFrame == 30 || this.nLarvaDialogFrame == 40 || this.nLarvaDialogFrame == 50 || this.nLarvaDialogFrame == 140 || this.nLarvaDialogFrame == 200 || this.nLarvaDialogFrame == 210)
                     {
                        this.lib.playEffect(118);
                     }
                     else if(this.nLarvaDialogFrame == 90 || this.nLarvaDialogFrame == 270)
                     {
                        this.lib.playEffect(119);
                     }
                     ++this.nLarvaDialogFrame;
                     if(this.nLarvaDialogFrame >= 300)
                     {
                        this.nLarvaDialogFrame = 0;
                        ++this.nLarvaDialogStep;
                     }
                     break;
                  case 2:
                     this.lib.drawASEAni(Ani_StoreCha + 1,Player.STOREANI_WAIT,imgLarva,this.nLarvaDialogFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                     if(this.nLarvaDialogFrame == 60)
                     {
                        this.lib.playEffect(119);
                     }
                     ++this.nLarvaDialogFrame;
                     if(this.nLarvaDialogFrame >= 360)
                     {
                        this.nLarvaDialogFrame = 0;
                        if(!this.bEquipItemSelect && !this.bInvenItemSelect)
                        {
                           this.nLarvaDialogStep = 0;
                        }
                        else
                        {
                           ++this.nLarvaDialogStep;
                        }
                     }
                     break;
                  case 3:
                     this.lib.drawASEAni(Ani_StoreCha + 1,Player.STOREANI_WAIT,imgLarva,this.nLarvaDialogFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                     if(this.nLarvaDialogFrame == 60)
                     {
                        this.lib.playEffect(119);
                     }
                     ++this.nLarvaDialogFrame;
                     if(!this.bEquipItemSelect && !this.bInvenItemSelect)
                     {
                        this.nLarvaDialogFrame = 0;
                        this.nLarvaDialogStep = 0;
                     }
               }
               if(this.player.bInvenLeftArrowBtn)
               {
                  this.lib.drawImg(imgStore + 36,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.player.bInvenLeftArrowBtn = false;
                     this.player.nInvenPosX += 74 * 9;
                     if(this.player.nInvenPosX >= Player.INVEN_STARTPOS)
                     {
                        this.player.nInvenPosX = Player.INVEN_STARTPOS;
                     }
                  }
               }
               else
               {
                  this.lib.drawImg(imgStore + 37,0,0,TOP | LEFT);
               }
               if(this.player.bInvenRightArrowBtn)
               {
                  this.lib.drawImg(imgStore + 38,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.player.bInvenRightArrowBtn = false;
                     this.player.nInvenPosX -= 74 * 9;
                     if(this.player.nInvenPosX <= -Player.INVEN_ENDPOS)
                     {
                        this.player.nInvenPosX = -Player.INVEN_ENDPOS;
                     }
                  }
               }
               else
               {
                  this.lib.drawImg(imgStore + 39,0,0,TOP | LEFT);
               }
               this.lib.drawNumImg("" + this.lib.setStrMoney(this.player.nMoney),685,436,NUM_MONEY,TOP | RIGHT);
               if(this.bSortingBtn)
               {
                  this.lib.drawImg(imgStore + 15,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bSortingBtn = false;
                     if(!this.bDrawSortingList)
                     {
                        this.bDrawSortingList = true;
                     }
                     else
                     {
                        this.bDrawSortingList = false;
                     }
                  }
               }
               else
               {
                  this.lib.drawImg(imgStore + 16,0,0,TOP | LEFT);
               }
               if(this.bDrawSortingList)
               {
                  this.lib.drawImgAlpha(imgStore + 14,0,0,70,TOP | LEFT);
                  if(this.bMaceSortingBtn)
                  {
                     this.lib.drawImg(imgStore + 17,0,0,TOP | LEFT);
                     this.nBtnFrame += 1 + this.nLeakFrame;
                     if(this.nBtnFrame > MAX_BTNFRAME)
                     {
                        this.nBtnFrame = 0;
                        this.bMaceSortingBtn = false;
                        this.bDrawSortingList = false;
                        this.ope.sortInven(Player.SORTING_MACE);
                     }
                  }
                  else
                  {
                     this.lib.drawImg(imgStore + 18,0,0,TOP | LEFT);
                  }
                  if(this.bRingSortingBtn)
                  {
                     this.lib.drawImg(imgStore + 12,0,0,TOP | LEFT);
                     this.nBtnFrame += 1 + this.nLeakFrame;
                     if(this.nBtnFrame > MAX_BTNFRAME)
                     {
                        this.nBtnFrame = 0;
                        this.bRingSortingBtn = false;
                        this.bDrawSortingList = false;
                        this.ope.sortInven(Player.SORTING_RING);
                     }
                  }
                  else
                  {
                     this.lib.drawImg(imgStore + 13,0,0,TOP | LEFT);
                  }
               }
               if(this.bStoreBtn)
               {
                  this.lib.drawImg(imgStore + 10,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bStoreBtn = false;
                     this.nPigDialogStep = 0;
                     this.nPigDialogFrame = 0;
                     this.bPigThanksBuy = false;
                     this.bPigThanksSell = false;
                     this.nMainScene = 300;
                  }
               }
               else
               {
                  this.lib.drawImg(imgStore + 11,0,0,TOP | LEFT);
               }
               if(this.bStageSelectBtn)
               {
                  this.lib.drawImg(imgStore + 4,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bStageSelectBtn = false;
                     this.nMainScene = 100;
                  }
               }
               else
               {
                  this.lib.drawImg(imgStore + 5,0,0,TOP | LEFT);
               }
               this.bActive = false;
               break;
            case 1000:
               this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,0,TOP | LEFT);
               this.lib.drawImg(imgTutorial + 21,0,0,TOP | LEFT);
               if(this.bOkBtn)
               {
                  this.lib.drawImg(imgTutorial + 7,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bOkBtn = false;
                     this.nTutorial[4] = 0;
                     this.lib.saveFile(DB_GAME,"paladog_game" + this.nGameSlot);
                     this.nUnitUpgradeFrame = 0;
                     this.nMainScene = 200;
                  }
               }
               else
               {
                  this.lib.drawImg(imgTutorial + 8,0,0,TOP | LEFT);
               }
               this.bActive = false;
               break;
            case 1001:
               this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,0,TOP | LEFT);
               this.lib.drawImg(imgTutorial + 22,0,0,TOP | LEFT);
               if(this.bOkBtn)
               {
                  this.lib.drawImg(imgTutorial + 7,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bOkBtn = false;
                     this.nTutorial[5] = 0;
                     this.lib.saveFile(DB_GAME,"paladog_game" + this.nGameSlot);
                     this.nMainScene = 300;
                  }
               }
               else
               {
                  this.lib.drawImg(imgTutorial + 8,0,0,TOP | LEFT);
               }
               this.bActive = false;
               break;
            case 1002:
               this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,0,TOP | LEFT);
               this.lib.drawImg(imgTutorial + 23,0,0,TOP | LEFT);
               if(this.bOkBtn)
               {
                  this.lib.drawImg(imgTutorial + 7,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bOkBtn = false;
                     this.nTutorial[6] = 0;
                     this.lib.saveFile(DB_GAME,"paladog_game" + this.nGameSlot);
                     this.nMainScene = 400;
                  }
               }
               else
               {
                  this.lib.drawImg(imgTutorial + 8,0,0,TOP | LEFT);
               }
               this.bActive = false;
               break;
            default:
               this.drawLoadImg();
               if(this.nMainScene >= 1 && this.nMainScene < 1 + Library.LOADUNITIMG_LEN)
               {
                  this.lib.loadImgFlashDat(this.lib.LOADUNITIMG[this.nMainScene - 1],this.lib.LOADUNITIMGINDEX[this.nMainScene - 1]);
               }
               else if(this.nMainScene >= 10 && this.nMainScene < 10 + Library.LOADSTAGESELECTIMG_LEN)
               {
                  this.lib.loadImgFlashDat(this.lib.LOADSTAGESELECTIMG[this.nMainScene - 10],this.lib.LOADSTAGESELECTIMGINDEX[this.nMainScene - 10]);
               }
               else if(this.nMainScene >= 13 && this.nMainScene < 13 + Library.LOADSTOREIMG_LEN)
               {
                  this.lib.loadImgFlashDat(this.lib.LOADSTOREIMG[this.nMainScene - 13],this.lib.LOADSTOREIMGINDEX[this.nMainScene - 13]);
               }
               else if(this.nMainScene >= 17 && this.nMainScene < 17 + Library.LOADMACEEFFIMG_LEN)
               {
                  this.lib.loadImgFlashDat(this.lib.LOADMACEEFFIMG[this.nMainScene - 17],this.lib.LOADMACEEFFIMGINDEX[this.nMainScene - 17]);
               }
               else if(this.nMainScene >= 29 && this.nMainScene < 29 + Library.LOADMACEIMG_LEN)
               {
                  this.lib.loadImgFlashDat(this.lib.LOADMACEIMG[this.nMainScene - 29],this.lib.LOADMACEIMGINDEX[this.nMainScene - 29]);
               }
               else if(this.nMainScene >= 30 && this.nMainScene < 30 + Library.MACEANI_LEN)
               {
                  this.lib.loadASEAni(this.lib.MACEANINAME[this.nMainScene - 30],Ani_Mace + (this.nMainScene - 30),this.lib.MACEANIINDEX[this.nMainScene - 30]);
               }
               else if(this.nMainScene >= 31 && this.nMainScene < 31 + Library.LOADSTORECHAIMG_LEN)
               {
                  this.lib.loadImgFlashDat(this.lib.LOADSTORECHAIMG[this.nMainScene - 31],this.lib.LOADSTORECHAIMGINDEX[this.nMainScene - 31]);
               }
               else if(this.nMainScene >= 33 && this.nMainScene < 33 + Library.STORECHAANI_LEN)
               {
                  this.lib.loadASEAni(this.lib.STORECHAANINAME[this.nMainScene - 33],Ani_StoreCha + (this.nMainScene - 33),this.lib.STORECHAANIINDEX[this.nMainScene - 33]);
               }
               else if(this.nMainScene >= 35 && this.nMainScene < 35 + Library.LOADPALADOGIMG_LEN)
               {
                  this.lib.loadImgFlashDat(this.lib.LOADPALADOGIMG[this.nMainScene - 35],this.lib.LOADPALADOGIMGINDEX[this.nMainScene - 35]);
               }
               else if(this.nMainScene >= 36 && this.nMainScene < 36 + Library.PALADOGANI_LEN)
               {
                  this.lib.loadASEAni(this.lib.PALADOGANINAME[this.nMainScene - 36],Ani_Paladog + (this.nMainScene - 36),this.lib.PALADOGANIINDEX[this.nMainScene - 36]);
               }
         }
      }
      
      public function drawTutorial() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         switch(this.nMainScene)
         {
            case 0:
               this.lib.stopMusic();
               this.ope.initStage(this.player.nTouchStage);
               if(this.player.nGameMode == MODE_SURVIVAL)
               {
                  this.ope.setLoading(true,LOADINGSTATE_IMG);
                  this.drawLoadImg();
               }
               else
               {
                  this.ope.setLoading(true,LOADINGSTATE_STAGE);
                  this.drawLoadImg();
               }
               this.nMainScene = 100;
               break;
            case 100:
               if(this.player.nGameMode == MODE_SURVIVAL)
               {
                  this.drawLoadImg();
               }
               else
               {
                  this.drawLoadImg();
               }
               this.bTutorial = true;
               if(this.nTutorial[0] == INITDATA && this.player.nChapter == 0 && this.player.nStage == 0)
               {
                  this.lib.loadImgFlashDat(this.lib.LOADTUTORIALIMG[this.nMainScene - 100],this.lib.LOADTUTORIALIMGINDEX[this.nMainScene - 100]);
               }
               else if(this.nTutorial[1] == INITDATA && this.player.nChapter == 0 && this.player.nStage == 2)
               {
                  this.lib.loadImgFlashDat(this.lib.LOADTUTORIALIMG[this.nMainScene - 100 + 1],this.lib.LOADTUTORIALIMGINDEX[this.nMainScene - 100 + 1]);
               }
               else if(this.nTutorial[2] == INITDATA && this.player.nChapter == 0 && this.player.nStage == 5)
               {
                  this.lib.loadImgFlashDat(this.lib.LOADTUTORIALIMG[this.nMainScene - 100 + 1],this.lib.LOADTUTORIALIMGINDEX[this.nMainScene - 100 + 1]);
               }
               else if(this.nTutorial[3] == INITDATA && this.player.nChapter == 0 && this.player.nStage == 8)
               {
                  this.lib.loadImgFlashDat(this.lib.LOADTUTORIALIMG[this.nMainScene - 100 + 2],this.lib.LOADTUTORIALIMGINDEX[this.nMainScene - 100 + 2]);
               }
               else
               {
                  this.bTutorial = false;
                  ++this.nMainScene;
               }
               break;
            case 101:
               _loc2_ = int((this.player.nTouchStage - 1) / 12) + this.player.nChapter * 2;
               if(this.player.nGameMode == MODE_SURVIVAL)
               {
                  this.drawLoadImg();
                  _loc3_ = this.player.nTouchStage - 1;
                  if(_loc3_ >= 30)
                  {
                     _loc3_ -= 30;
                  }
                  _loc2_ = int(_loc3_ / 3) + this.player.nChapter * 2;
               }
               else
               {
                  this.drawLoadImg();
               }
               this.lib.loadImgFlashDat(this.lib.LOADBACKGROUNDIMG[_loc2_],this.lib.LOADBACKGROUNDIMGINDEX[_loc2_]);
               break;
            case 102:
               if(this.player.nGameMode == MODE_SURVIVAL)
               {
                  this.drawLoadImg();
               }
               else
               {
                  this.drawLoadImg();
               }
               ++this.nMainScene;
               break;
            default:
               if(this.player.nGameMode == MODE_SURVIVAL)
               {
                  this.drawLoadImg();
               }
               else
               {
                  this.drawLoadImg();
               }
               if(this.nMainScene >= 103 && this.nMainScene < 106)
               {
                  ++this.nMainScene;
               }
               else if(this.nMainScene >= 106 && this.nMainScene < 106 + Library.LOADUNITIMG_LEN)
               {
                  if(this.player.UNITEQUIP[this.nMainScene - 106])
                  {
                     this.lib.loadImgFlashDat(this.lib.LOADUNITIMG[this.nMainScene - 106],this.lib.LOADUNITIMGINDEX[this.nMainScene - 106]);
                  }
                  else
                  {
                     ++this.nMainScene;
                  }
               }
               else if(this.nMainScene >= 115 && this.nMainScene < 115 + Library.LOADSTARTIMG_LEN)
               {
                  this.lib.loadImgFlashDat(this.lib.LOADSTARTIMG[this.nMainScene - 115],this.lib.LOADSTARTIMGINDEX[this.nMainScene - 115]);
               }
               else if(this.nMainScene >= 134 && this.nMainScene < 134 + Library.LOADGAMEIMG_LEN)
               {
                  if(this.player.nGameMode == MODE_SURVIVAL)
                  {
                     if(this.nMainScene == 134)
                     {
                        this.lib.loadImgFlashDat(Library.e01,imgEnemyE01Att);
                     }
                     else if(this.nMainScene == 135)
                     {
                        this.lib.loadImgFlashDat(Library.e07,imgEnemyE07Att);
                     }
                     else
                     {
                        ++this.nMainScene;
                     }
                  }
                  else
                  {
                     switch(this.player.nTouchStage)
                     {
                        case 3:
                        case 15:
                        case 6:
                        case 18:
                           this.lib.loadImgFlashDat(this.lib.LOADGAMEIMG[(this.player.nTouchStage / 3 - 1 + this.player.nChapter * 8) * Library.LOADGAMEIMG_LEN + (this.nMainScene - 134)],this.lib.LOADGAMEIMGINDEX[(this.player.nTouchStage / 3 - 1 + this.player.nChapter * 8) * Library.LOADGAMEIMG_LEN + (this.nMainScene - 134)]);
                           break;
                        case 9:
                        case 21:
                        case 12:
                        case 24:
                           if(this.nMainScene == 134)
                           {
                              _loc4_ = int((this.player.nTouchStage - 1) / 12) + this.player.nChapter * 2;
                              this.lib.loadASEAni(this.lib.BOSSANIDATNAME[_loc4_ * 2],Ani_Boss01 + _loc4_,this.lib.BOSSANIDATINDEX[_loc4_ * 2]);
                           }
                           else
                           {
                              this.lib.loadImgFlashDat(this.lib.LOADGAMEIMG[(this.player.nTouchStage / 3 - 1 + this.player.nChapter * 8) * Library.LOADGAMEIMG_LEN + (this.nMainScene - 134)],this.lib.LOADGAMEIMGINDEX[(this.player.nTouchStage / 3 - 1 + this.player.nChapter * 8) * Library.LOADGAMEIMG_LEN + (this.nMainScene - 134)]);
                           }
                           break;
                        default:
                           ++this.nMainScene;
                     }
                  }
               }
               else if(this.nMainScene >= 139 && this.nMainScene < 139 + Library.LOADGAMEMOBIMG_LEN)
               {
                  if(this.STAGEDB[this.player.nChapter * Player.MAX_STAGE + this.player.nStage].APPEARMOBKIND[this.nMainScene - 139] > 0)
                  {
                     if(this.STAGEDB[this.player.nChapter * Player.MAX_STAGE + this.player.nStage].APPEARMOBKIND[this.nMainScene - 139] > 100)
                     {
                        _loc5_ = this.STAGEDB[this.player.nChapter * Player.MAX_STAGE + this.player.nStage].APPEARMOBKIND[this.nMainScene - 139] - 100;
                        this.lib.loadASEAni(this.lib.BOSSANIDATNAME[(_loc5_ - 1) * 2],Ani_Boss01 + (_loc5_ - 1),this.lib.BOSSANIDATINDEX[(_loc5_ - 1) * 2]);
                     }
                     else
                     {
                        this.lib.loadImgFlashDat(this.lib.MOBIMGDATNAME[this.STAGEDB[this.player.nChapter * Player.MAX_STAGE + this.player.nStage].APPEARMOBKIND[this.nMainScene - 139] - 1],this.lib.MOBIMGDATINDEX[this.STAGEDB[this.player.nChapter * Player.MAX_STAGE + this.player.nStage].APPEARMOBKIND[this.nMainScene - 139] - 1]);
                     }
                  }
                  else
                  {
                     ++this.nMainScene;
                  }
               }
               else if(this.player.nGameMode == MODE_SURVIVAL)
               {
                  if(this.nMainFrame >= 1)
                  {
                     this.ope.startStage();
                  }
               }
               else if(this.bTutorial)
               {
                  if(this.player.nChapter == 0 && this.player.nStage == 0)
                  {
                     this.bEventSkipBtn = false;
                     this.bEventNextBtn = false;
                     this.nEventScene = 0;
                     this.nEventFrame = 0;
                     this.nEventSoundCount = 0;
                     this.nMainScene = 1000;
                     this.lib.playMusic(Library.MUSIC_STAGE,true);
                  }
                  else
                  {
                     this.nMainScene = 10;
                  }
               }
               else if(this.player.nChapter == 0 && this.player.nStage == 0)
               {
                  this.bEventSkipBtn = false;
                  this.bEventNextBtn = false;
                  this.nEventScene = 0;
                  this.nEventFrame = 0;
                  this.nEventSoundCount = 0;
                  this.nMainScene = 1000;
                  this.lib.playMusic(Library.MUSIC_STAGE,true);
               }
               else
               {
                  this.ope.startStage();
               }
               break;
            case 1000:
               this.drawEvent(this.player.nChapter,true);
               this.bActive = false;
               break;
            case 10:
               this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,0,TOP | LEFT);
               switch(this.player.nStage)
               {
                  case 0:
                     this.lib.drawImg(imgTutorial,0,0,TOP | LEFT);
                     this.lib.drawImg(imgTutorial + 1,0,0,TOP | LEFT);
                     break;
                  case 2:
                     this.lib.drawImg(imgTutorial + 11,0,0,TOP | LEFT);
                     this.lib.drawImg(imgTutorial + 9,0,0,TOP | LEFT);
                     break;
                  case 5:
                     this.lib.drawImg(imgTutorial,0,0,TOP | LEFT);
                     this.lib.drawImg(imgTutorial + 14,0,0,TOP | LEFT);
                     break;
                  case 8:
                     this.lib.drawImg(imgTutorial + 15,0,0,TOP | LEFT);
                     this.lib.drawImg(imgTutorial + 16,0,0,TOP | LEFT);
               }
               if(this.bOkBtn)
               {
                  this.lib.drawImg(imgTutorial + 24,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bOkBtn = false;
                     ++this.nMainScene;
                  }
               }
               else
               {
                  this.lib.drawImg(imgTutorial + 25,0,0,TOP | LEFT);
               }
               this.bActive = false;
               break;
            case 11:
               this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,0,TOP | LEFT);
               switch(this.player.nStage)
               {
                  case 0:
                     this.lib.drawImg(imgTutorial,0,0,TOP | LEFT);
                     this.lib.drawImg(imgTutorial + 2,0,0,TOP | LEFT);
                     break;
                  case 2:
                     this.lib.drawImg(imgTutorial + 11,0,0,TOP | LEFT);
                     this.lib.drawImg(imgTutorial + 10,0,0,TOP | LEFT);
                     break;
                  case 5:
                     this.lib.drawImg(imgTutorial,0,0,TOP | LEFT);
                     this.lib.drawImg(imgTutorial + 28,0,0,TOP | LEFT);
                     break;
                  case 8:
                     this.lib.drawImg(imgTutorial + 15,0,0,TOP | LEFT);
                     this.lib.drawImg(imgTutorial + 17,0,0,TOP | LEFT);
               }
               if(this.bOkBtn)
               {
                  this.lib.drawImg(imgTutorial + 24,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bOkBtn = false;
                     ++this.nMainScene;
                  }
               }
               else
               {
                  this.lib.drawImg(imgTutorial + 25,0,0,TOP | LEFT);
               }
               this.bActive = false;
               break;
            case 12:
               this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,0,TOP | LEFT);
               switch(this.player.nStage)
               {
                  case 0:
                     this.lib.drawImg(imgTutorial,0,0,TOP | LEFT);
                     this.lib.drawImg(imgTutorial + 3,0,0,TOP | LEFT);
                     break;
                  case 2:
                     this.lib.drawImg(imgTutorial + 11,0,0,TOP | LEFT);
                     this.lib.drawImg(imgTutorial + 12,0,0,TOP | LEFT);
                     break;
                  case 5:
                     this.lib.drawImg(imgTutorial,0,0,TOP | LEFT);
                     this.lib.drawImg(imgTutorial + 6,0,0,TOP | LEFT);
                     break;
                  case 8:
                     this.lib.drawImg(imgTutorial + 15,0,0,TOP | LEFT);
                     this.lib.drawImg(imgTutorial + 31,0,0,TOP | LEFT);
               }
               if(this.bOkBtn)
               {
                  this.lib.drawImg(imgTutorial + 24,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bOkBtn = false;
                     switch(this.player.nStage)
                     {
                        case 5:
                           this.nMainScene = 19;
                           break;
                        default:
                           ++this.nMainScene;
                     }
                  }
               }
               else
               {
                  this.lib.drawImg(imgTutorial + 25,0,0,TOP | LEFT);
               }
               this.bActive = false;
               break;
            case 13:
               this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,0,TOP | LEFT);
               switch(this.player.nStage)
               {
                  case 0:
                     this.lib.drawImg(imgTutorial,0,0,TOP | LEFT);
                     this.lib.drawImg(imgTutorial + 4,0,0,TOP | LEFT);
                     break;
                  case 2:
                     this.lib.drawImg(imgTutorial + 11,0,0,TOP | LEFT);
                     this.lib.drawImg(imgTutorial + 28,0,0,TOP | LEFT);
                     break;
                  case 8:
                     this.lib.drawImg(imgTutorial + 15,0,0,TOP | LEFT);
                     this.lib.drawImg(imgTutorial + 19,0,0,TOP | LEFT);
               }
               if(this.bOkBtn)
               {
                  if(this.player.nStage == 2 || this.player.nStage == 8)
                  {
                     this.lib.drawImg(imgTutorial + 24,0,0,TOP | LEFT);
                  }
                  else
                  {
                     this.lib.drawImg(imgTutorial + 7,0,0,TOP | LEFT);
                  }
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bOkBtn = false;
                     ++this.nMainScene;
                  }
               }
               else if(this.player.nStage == 2 || this.player.nStage == 8)
               {
                  this.lib.drawImg(imgTutorial + 25,0,0,TOP | LEFT);
               }
               else
               {
                  this.lib.drawImg(imgTutorial + 8,0,0,TOP | LEFT);
               }
               this.bActive = false;
               break;
            case 14:
               this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,0,TOP | LEFT);
               switch(this.player.nStage)
               {
                  case 0:
                     this.lib.drawImg(imgTutorial,0,0,TOP | LEFT);
                     this.lib.drawImg(imgTutorial + 5,0,0,TOP | LEFT);
                     break;
                  case 2:
                     this.lib.drawImg(imgTutorial + 11,0,0,TOP | LEFT);
                     this.lib.drawImg(imgTutorial + 6,0,0,TOP | LEFT);
                     break;
                  case 8:
                     this.lib.drawImg(imgTutorial + 15,0,0,TOP | LEFT);
                     this.lib.drawImg(imgTutorial + 20,0,0,TOP | LEFT);
               }
               if(this.bOkBtn)
               {
                  if(this.player.nStage == 2 || this.player.nStage == 8)
                  {
                     this.lib.drawImg(imgTutorial + 24,0,0,TOP | LEFT);
                  }
                  else
                  {
                     this.lib.drawImg(imgTutorial + 7,0,0,TOP | LEFT);
                  }
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bOkBtn = false;
                     switch(this.player.nStage)
                     {
                        case 2:
                           this.nMainScene = 19;
                           break;
                        default:
                           ++this.nMainScene;
                     }
                  }
               }
               else if(this.player.nStage == 2 || this.player.nStage == 8)
               {
                  this.lib.drawImg(imgTutorial + 25,0,0,TOP | LEFT);
               }
               else
               {
                  this.lib.drawImg(imgTutorial + 8,0,0,TOP | LEFT);
               }
               this.bActive = false;
               break;
            case 15:
               this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,0,TOP | LEFT);
               switch(this.player.nStage)
               {
                  case 0:
                     this.lib.drawImg(imgTutorial,0,0,TOP | LEFT);
                     this.lib.drawImg(imgTutorial + 28,0,0,TOP | LEFT);
                     break;
                  case 8:
                     this.lib.drawImg(imgTutorial + 15,0,0,TOP | LEFT);
                     this.lib.drawImg(imgTutorial + 28,0,0,TOP | LEFT);
               }
               if(this.bOkBtn)
               {
                  if(this.player.nStage == 8)
                  {
                     this.lib.drawImg(imgTutorial + 24,0,0,TOP | LEFT);
                  }
                  else
                  {
                     this.lib.drawImg(imgTutorial + 7,0,0,TOP | LEFT);
                  }
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bOkBtn = false;
                     ++this.nMainScene;
                  }
               }
               else if(this.player.nStage == 8)
               {
                  this.lib.drawImg(imgTutorial + 25,0,0,TOP | LEFT);
               }
               else
               {
                  this.lib.drawImg(imgTutorial + 8,0,0,TOP | LEFT);
               }
               this.bActive = false;
               break;
            case 16:
               this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,0,TOP | LEFT);
               switch(this.player.nStage)
               {
                  case 0:
                     this.lib.drawImg(imgTutorial,0,0,TOP | LEFT);
                     this.lib.drawImg(imgTutorial + 6,0,0,TOP | LEFT);
                     break;
                  case 8:
                     this.lib.drawImg(imgTutorial + 15,0,0,TOP | LEFT);
                     this.lib.drawImg(imgTutorial + 6,0,0,TOP | LEFT);
               }
               if(this.bOkBtn)
               {
                  if(this.player.nStage == 8)
                  {
                     this.lib.drawImg(imgTutorial + 24,0,0,TOP | LEFT);
                  }
                  else
                  {
                     this.lib.drawImg(imgTutorial + 7,0,0,TOP | LEFT);
                  }
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bOkBtn = false;
                     this.nMainScene = 19;
                  }
               }
               else if(this.player.nStage == 8)
               {
                  this.lib.drawImg(imgTutorial + 25,0,0,TOP | LEFT);
               }
               else
               {
                  this.lib.drawImg(imgTutorial + 8,0,0,TOP | LEFT);
               }
               this.bActive = false;
               break;
            case 19:
               if(this.nTutorial[0] == INITDATA && this.player.nChapter == 0 && this.player.nStage == 0)
               {
                  this.nTutorial[0] = 0;
               }
               else if(this.nTutorial[1] == INITDATA && this.player.nChapter == 0 && this.player.nStage == 2)
               {
                  this.nTutorial[1] = 0;
               }
               else if(this.nTutorial[2] == INITDATA && this.player.nChapter == 0 && this.player.nStage == 5)
               {
                  this.nTutorial[2] = 0;
               }
               else if(this.nTutorial[3] == INITDATA && this.player.nChapter == 0 && this.player.nStage == 8)
               {
                  this.nTutorial[3] = 0;
               }
               this.bTutorial = false;
               this.ope.startStage();
         }
      }
      
      public function drawQuest() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         this.lib.drawImg(imgQuestUi + 1,0,0,TOP | LEFT);
         _loc1_ = 0;
         while(_loc1_ < Player.MAX_QUEST)
         {
            this.lib.drawImg(imgQuestIcon + this.player.QUESTICON[_loc1_],336,195 + _loc1_ * 110,TOP | LEFT);
            _loc2_ = 0;
            while(_loc2_ < this.player.STRQUESTLINE[_loc1_])
            {
               this.lib.drawBorderString(this.player.STRQUEST[_loc2_ + _loc1_ * Player.MAX_QUEST],417,237 - (this.player.STRQUESTLINE[_loc1_] * 20 >> 1) + _loc2_ * 20 + _loc1_ * 110,6041349,16776960,100,TOP | LEFT);
               _loc2_++;
            }
            this.ope.drawQuestProcess(false,336,272,_loc1_);
            this.drawQuestReward(_loc1_);
            switch(this.player.QUESTCOMPLETE[_loc1_])
            {
               case Player.QUEST_COMPLETE:
                  this.lib.drawImg(imgQuestUi + 5,0,_loc1_ * 110,TOP | LEFT);
                  break;
               case Player.QUEST_WARNING:
                  this.lib.drawImg(imgQuestUi + 3,0,_loc1_ * 110,TOP | LEFT);
                  break;
               case Player.QUEST_FAIL:
                  this.lib.drawImg(imgQuestUi + 4,0,_loc1_ * 110,TOP | LEFT);
            }
            _loc1_++;
         }
      }
      
      public function drawQuestReward(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         _loc4_ = this.lib.strToInt(this.player.QUESTREWARD[param1 * Player.MAX_QUESTREWARD]);
         if(_loc4_ > 0)
         {
            this.lib.drawImg(imgMaceIcon + 24,685,238 + param1 * 110,VCENTER | HCENTER);
            this.lib.drawNumImg("" + this.lib.setStrMoney(_loc4_),685,257 + param1 * 110,NUM_ITEMPRICE,TOP | HCENTER);
         }
         _loc6_ = 0;
         _loc7_ = 0;
         _loc3_ = Number(this.player.QUESTREWARD[param1 * Player.MAX_QUESTREWARD + 1].charCodeAt(0));
         if(_loc3_ != 48)
         {
            if(_loc3_ == 109)
            {
               _loc5_ = Drawing.MACE_GODPUNCH;
            }
            else
            {
               _loc5_ = Drawing.RING_EXP;
            }
            _loc2_ = 1;
            while(_loc2_ < 3)
            {
               _loc3_ = Number(this.player.QUESTREWARD[param1 * Player.MAX_QUESTREWARD + 1].charCodeAt(_loc2_));
               _loc6_ *= 10;
               _loc6_ = _loc6_ + (_loc3_ - 48);
               _loc2_++;
            }
            _loc2_ = 4;
            while(_loc2_ < 6)
            {
               _loc3_ = Number(this.player.QUESTREWARD[param1 * Player.MAX_QUESTREWARD + 1].charCodeAt(_loc2_));
               _loc7_ *= 10;
               _loc7_ = _loc7_ + (_loc3_ - 48);
               _loc2_++;
            }
            this.lib.drawImg(imgMaceIcon + _loc5_ + (_loc6_ - 1),685,238 + param1 * 110,VCENTER | HCENTER);
            if(_loc7_ > 0)
            {
               this.lib.drawNumImg("/" + _loc7_,715,208 + param1 * 110,NUM_ITEMLEVEL,TOP | RIGHT);
            }
         }
      }
      
      public function drawGame() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:URLRequest = null;
         var _loc4_:URLRequest = null;
         if(this.nGameState < GAME_OVER)
         {
            this.drawMain();
            this.drawUi();
         }
         if(this.nGameState != this.nBeforeGameState)
         {
            this.nBeforeGameState = this.nGameState;
            this.nGameScene = 0;
            this.nBeforeGameScene = 0;
            this.nGameFrame = 0;
         }
         else if(this.nGameScene != this.nBeforeGameScene)
         {
            this.nBeforeGameScene = this.nGameScene;
            this.nGameFrame = 0;
         }
         switch(this.nGameState)
         {
            case GAME_START:
               this.ope.setLoading(false,INITDATA);
               this.drawReady(this.nGameScene);
               if(TEST_EVENT)
               {
                  this.nGameState = GAME_CLEAR;
               }
               break;
            case GAME_PLAY:
               switch(this.nGameScene)
               {
                  case 0:
                     if(!this.player.bDrawLevelUp && !this.bGameMenu)
                     {
                        this.player.nPlayTime = 0;
                        this.player.nStartTime = this.player.nEnemySetTime = getTimer();
                        this.player.nAppearTime = this.ope.setAppearEnemyTime();
                        switch(this.player.nGameMode)
                        {
                           case MODE_DESTINY:
                              this.player.nDestinyIconSetTime = getTimer();
                        }
                        this.player.nHpRegenTime = getTimer();
                        this.player.nManaRegenTime = getTimer();
                        this.player.nFoodRegenTime = getTimer();
                     }
                     else
                     {
                        this.player.nNowTime = getTimer();
                        this.player.nStartTime += this.player.nNowTime - this.player.nPauseTime;
                        this.player.nHpRegenTime += this.player.nNowTime - this.player.nPauseTime;
                        this.player.nManaRegenTime += this.player.nNowTime - this.player.nPauseTime;
                        this.player.nFoodRegenTime += this.player.nNowTime - this.player.nPauseTime;
                        this.player.nEnemySetTime += this.player.nNowTime - this.player.nPauseTime;
                        this.player.nDestinyIconSetTime += this.player.nNowTime - this.player.nPauseTime;
                        this.nKeyPressTime += this.player.nNowTime - this.player.nPauseTime;
                        this.player.nGamePlayStartTime += this.player.nNowTime - this.player.nPauseTime;
                        this.player.bDrawLevelUp = false;
                        this.bGameMenu = false;
                     }
                     ++this.nGameScene;
                     break;
                  case 1:
                     if(!this.player.bStageClear)
                     {
                        if(!this.bBossDiaEvent && !this.bBossDialog)
                        {
                           if(this.player.nExp >= this.ope.nextExp())
                           {
                              this.ope.levelUp();
                           }
                        }
                        switch(this.player.nGameMode)
                        {
                           case MODE_NORMAL:
                              if(!this.player.bEnemyStationCrashed)
                              {
                                 this.ope.appearNextEnemy();
                              }
                              break;
                           case MODE_SURVIVAL:
                              if(this.player.nAppearTotalEnemy < this.player.nSurvivalMobMaxNum)
                              {
                                 this.ope.appearNextEnemy();
                              }
                              break;
                           case MODE_WAGON:
                              this.ope.appearNextEnemy();
                              this.ope.wagonClear();
                              break;
                           case MODE_BOSS:
                              if(!this.bBossDiaEvent && !this.bBossDialog)
                              {
                                 this.ope.appearNextEnemy();
                              }
                              break;
                           case MODE_DESTINY:
                              if(this.player.nAppearTotalEnemy < Player.DESTINYTOTALENEMYNUM)
                              {
                                 this.ope.appearNextEnemy();
                              }
                              this.ope.appearNextDestinyIcon();
                              this.ope.destinyClear();
                              break;
                           case MODE_WARROAD:
                              this.ope.appearNextEnemy();
                              this.ope.warRoadClear();
                        }
                        if(GAME_RELEASE)
                        {
                           if(!this.bBossDiaEvent && !this.bBossDialog)
                           {
                              this.player.nMana += this.ope.regenMana();
                              if(this.player.nMana >= this.ope.playerMana())
                              {
                                 this.player.nMana = this.ope.playerMana();
                              }
                              this.player.nFood += this.ope.regenFood();
                              if(this.player.nFood >= this.ope.playerFood())
                              {
                                 this.player.nFood = this.ope.playerFood();
                              }
                           }
                        }
                        else if(!this.bBossDiaEvent && !this.bBossDialog)
                        {
                           ++this.player.nFood;
                           if(this.player.nFood >= this.ope.playerFood())
                           {
                              this.player.nFood = this.ope.playerFood();
                           }
                           ++this.player.nMana;
                           if(this.player.nMana >= this.ope.playerMana())
                           {
                              this.player.nMana = this.ope.playerMana();
                           }
                        }
                        if(this.player.nGameMode == MODE_WARROAD)
                        {
                           if(this.player.nWarRoadEnemyHp >= Player.nWarRoadEnemyMaxHp)
                           {
                              if(!this.player.bLevelUp)
                              {
                                 this.ope.setGameOver();
                              }
                           }
                        }
                        else if(!this.bBossDiaEvent && !this.bBossDialog)
                        {
                           this.player.nHp += this.ope.regenHp();
                           if(this.player.nHp >= this.ope.playerHp())
                           {
                              this.player.nHp = this.ope.playerHp();
                           }
                           if(this.player.nHp <= 0)
                           {
                              if(!this.player.bLevelUp)
                              {
                                 this.ope.setGameOver();
                              }
                           }
                        }
                        this.player.nNowTime = getTimer();
                        this.player.nPlayTime = (this.player.nNowTime - this.player.nStartTime) / 1000 * (1 + this.player.nGameSpeed);
                        this.bActive = false;
                     }
                     else
                     {
                        this.bKeyPressed = true;
                        if(this.player.nExp >= this.ope.nextExp())
                        {
                           this.ope.levelUp();
                        }
                        if(this.nGameFrame >= FPS && !this.bStageClearSnd)
                        {
                           this.lib.stopMusic();
                           this.lib.playMusic(Library.MUSIC_CLEAR,false);
                           this.bStageClearSnd = true;
                        }
                        if(this.nGameFrame >= CLEAR_TIME + FPS)
                        {
                           this.ope.playerStop();
                           _loc1_ = 0;
                           while(_loc1_ < 10)
                           {
                              this.player.EQUIPINVEN[_loc1_] = this.player.SAVEEQUIPINVEN[_loc1_];
                              _loc1_++;
                           }
                           if(this.player.nGameMode == MODE_SURVIVAL)
                           {
                              this.ope.setGamePlayTime(false);
                           }
                           else
                           {
                              _loc2_ = 0;
                              _loc2_ = this.player.STAGECLEARRESULTTIME[(this.player.nStage + this.player.nChapter * Player.MAX_STAGE) * 3] * 60 * 60;
                              _loc2_ += this.player.STAGECLEARRESULTTIME[(this.player.nStage + this.player.nChapter * Player.MAX_STAGE) * 3 + 1] * 60;
                              _loc2_ += this.player.STAGECLEARRESULTTIME[(this.player.nStage + this.player.nChapter * Player.MAX_STAGE) * 3 + 2];
                              if(_loc2_ > 0)
                              {
                                 if(this.player.nPlayTime < _loc2_)
                                 {
                                    this.player.bNewRecord = true;
                                 }
                              }
                              else
                              {
                                 this.player.bNewRecord = true;
                              }
                              this.nBeforeClearStar = this.player.STAGECLEARRESULTSTAR[this.player.nStage + this.player.nChapter * Player.MAX_STAGE];
                              if(this.player.nPlayTime <= this.player.nClearTime)
                              {
                                 this.player.nClearMoney <<= 1;
                                 if(this.player.bNewRecord)
                                 {
                                    this.player.STAGECLEARRESULTSTAR[this.player.nStage + this.player.nChapter * Player.MAX_STAGE] = 3;
                                 }
                              }
                              else if(this.player.nPlayTime <= this.player.nClearTime + Player.nClearTimeDepth)
                              {
                                 if(this.player.bNewRecord)
                                 {
                                    this.player.STAGECLEARRESULTSTAR[this.player.nStage + this.player.nChapter * Player.MAX_STAGE] = 2;
                                 }
                              }
                              else
                              {
                                 this.player.nClearMoney >>= 1;
                                 if(this.player.bNewRecord)
                                 {
                                    this.player.STAGECLEARRESULTSTAR[this.player.nStage + this.player.nChapter * Player.MAX_STAGE] = 1;
                                 }
                              }
                              this.player.nMoney += this.player.nClearMoney;
                              this.player.nClearS = this.player.nPlayTime;
                              this.player.nClearH = int(this.player.nClearS / 60);
                              this.player.nClearH = int(this.player.nClearH / 60);
                              this.player.nClearS -= this.player.nClearH * 60 * 60;
                              this.player.nClearM = int(this.player.nClearS / 60);
                              this.player.nClearS -= this.player.nClearM * 60;
                              if(this.player.bNewRecord)
                              {
                                 this.player.STAGECLEARRESULTTIME[(this.player.nStage + this.player.nChapter * Player.MAX_STAGE) * 3] = this.player.nClearH;
                                 this.player.STAGECLEARRESULTTIME[(this.player.nStage + this.player.nChapter * Player.MAX_STAGE) * 3 + 1] = this.player.nClearM;
                                 this.player.STAGECLEARRESULTTIME[(this.player.nStage + this.player.nChapter * Player.MAX_STAGE) * 3 + 2] = this.player.nClearS;
                              }
                              this.player.nNowPlayChapter = this.player.nChapter;
                              if(this.player.nClearStage <= this.player.nStage + this.player.nChapter * Player.MAX_STAGE)
                              {
                                 ++this.player.nClearStage;
                                 if(this.player.nClearStage >= Player.MAX_TOTALSTAGE - 1)
                                 {
                                    this.player.nClearStage = Player.MAX_TOTALSTAGE - 1;
                                 }
                                 if(this.player.nClearChapter <= int(this.player.nClearStage / Player.MAX_STAGE))
                                 {
                                    this.player.nClearChapter = int(this.player.nClearStage / Player.MAX_STAGE);
                                    this.player.nChapter = this.player.nClearChapter;
                                 }
                              }
                              if(this.player.nRealClearStage <= this.player.nStage + this.player.nChapter * Player.MAX_STAGE)
                              {
                                 ++this.player.nRealClearStage;
                                 _loc1_ = 0;
                                 while(_loc1_ < Player.STOREDATA_LEVELPOS)
                                 {
                                    this.player.STOREDATA[_loc1_ + Player.STOREDATA_LEVELPOS] = int(this.player.nRealClearStage / 12);
                                    _loc1_++;
                                 }
                              }
                              this.ope.setGamePlayTime(false);
                              this.lib.saveFile(DB_SLOT,"paladog_slot" + this.nGameSlot);
                              this.lib.saveFile(DB_GAME,"paladog_game" + this.nGameSlot);
                              this.bStageClearSnd = false;
                           }
                           this.nGameState = GAME_CLEAR;
                        }
                     }
                     break;
                  case Player.PALADOGDIESCENE:
                     if(this.player.nPaladogDieFrame < 150)
                     {
                        this.lib.fillRectAlpha(0,0,this.nLcdW,this.nLcdH,0,100 / 150 * this.player.nPaladogDieFrame,TOP | LEFT);
                     }
                     else
                     {
                        this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,0,TOP | LEFT);
                     }
                     if(this.player.nNowArms > INITDATA)
                     {
                        if(this.player.nGameMode != MODE_WARROAD)
                        {
                           this.lib.drawASEAni(Ani_Mace,Player.ANI_DEAD,imgMace01 + this.player.nNowArms,int(this.player.nPaladogDieFrame / 9),this.player.nPosX,this.player.nPosY - 5,100,100,false);
                        }
                     }
                     _loc1_ = 0;
                     while(_loc1_ < Player.MAX_DMG)
                     {
                        switch(this.player.DMGKIND[_loc1_])
                        {
                           case ENEMY_DARKZOMBIE:
                              this.lib.drawImgAlpha(imgEnemyE10Arms + 14,this.player.DMGPOSX[_loc1_],this.player.DMGPOSY[_loc1_],90 - 1.5 * this.player.DMGANIFRAME[_loc1_],BOTTOM | HCENTER);
                              break;
                           case ENEMY_DARKZOMBIE2:
                              this.lib.drawImgAlpha(imgEnemyE30Arms + 14,this.player.DMGPOSX[_loc1_],this.player.DMGPOSY[_loc1_],90 - 1.5 * this.player.DMGANIFRAME[_loc1_],BOTTOM | HCENTER);
                        }
                        _loc1_++;
                     }
                     if(this.player.nGameMode == MODE_WARROAD)
                     {
                        this.lib.drawASEAni(Ani_Paladog,Player.ANI_DEAD,imgPaladog,int(this.player.nPaladogDieFrame / 9),this.player.nPosX,this.player.nPosY - 5,50 + 50 / Player.PALADOGDIETOTALFRAME * this.player.nPaladogDieFrame,50 + 50 / Player.PALADOGDIETOTALFRAME * this.player.nPaladogDieFrame,false);
                     }
                     else
                     {
                        if(this.player.bAttacked && this.ope.bDrawDmgEff(Player.PALADOGATTACKED,INITDATA))
                        {
                           this.lib.drawASEAni(Ani_Paladog,Player.ANI_DEAD,imgPaladog,int(this.player.nPaladogDieFrame / 9),this.player.nPosX,this.player.nPosY - 5,100,100,true);
                        }
                        else
                        {
                           this.lib.drawASEAni(Ani_Paladog,Player.ANI_DEAD,imgPaladog,int(this.player.nPaladogDieFrame / 9),this.player.nPosX,this.player.nPosY - 5,100,100,false);
                        }
                        this.drawAttackedEff(Player.PALADOGATTACKED,INITDATA);
                        this.ope.resetAttacked(Player.PALADOGATTACKED,INITDATA);
                     }
                     _loc1_ = 0;
                     while(_loc1_ < Player.MAX_DMG)
                     {
                        switch(this.player.DMGKIND[_loc1_])
                        {
                           case ENEMY_DARKZOMBIE:
                              if(int(this.player.DMGANIFRAME[_loc1_] >> 1) <= 14)
                              {
                                 this.lib.drawImgDodge(imgEnemyE10Eff + int(this.player.DMGANIFRAME[_loc1_] >> 1),this.player.DMGPOSX[_loc1_],this.player.DMGPOSY[_loc1_],BlendMode.NORMAL,BOTTOM | HCENTER);
                              }
                              this.player.DMGANIFRAME[_loc1_] += 1 + this.nLeakFrame;
                              if(this.player.DMGANIFRAME[_loc1_] >= FPS)
                              {
                                 this.player.DMGKIND[_loc1_] = INITDATA;
                                 this.player.DMGPOSX[_loc1_] = INITDATA;
                                 this.player.DMGPOSY[_loc1_] = INITDATA;
                                 this.player.DMGANIFRAME[_loc1_] = 0;
                              }
                              break;
                           case ENEMY_DARKZOMBIE2:
                              if(int(this.player.DMGANIFRAME[_loc1_] >> 1) <= 14)
                              {
                                 this.lib.drawImgDodge(imgEnemyE30Eff + int(this.player.DMGANIFRAME[_loc1_] >> 1),this.player.DMGPOSX[_loc1_],this.player.DMGPOSY[_loc1_],BlendMode.NORMAL,BOTTOM | HCENTER);
                              }
                              this.player.DMGANIFRAME[_loc1_] += 1 + this.nLeakFrame;
                              if(this.player.DMGANIFRAME[_loc1_] >= FPS)
                              {
                                 this.player.DMGKIND[_loc1_] = INITDATA;
                                 this.player.DMGPOSX[_loc1_] = INITDATA;
                                 this.player.DMGPOSY[_loc1_] = INITDATA;
                                 this.player.DMGANIFRAME[_loc1_] = 0;
                              }
                              break;
                           case ENEMY_BOSSMANDEVIL:
                              this.lib.drawImgDodge(imgEnemyBoss10Magic + int(this.player.DMGANIFRAME[_loc1_] >> 1),this.player.DMGPOSX[_loc1_],this.player.DMGPOSY[_loc1_],BlendMode.ADD,BOTTOM | HCENTER);
                              this.player.DMGANIFRAME[_loc1_] += 1 + this.nLeakFrame;
                              if(this.player.DMGANIFRAME[_loc1_] >= FPS)
                              {
                                 this.player.DMGKIND[_loc1_] = INITDATA;
                                 this.player.DMGPOSX[_loc1_] = INITDATA;
                                 this.player.DMGPOSY[_loc1_] = INITDATA;
                                 this.player.DMGANIFRAME[_loc1_] = 0;
                                 this.player.DMGFROMENEMY[_loc1_] = INITDATA;
                              }
                              break;
                           case ENEMY_PUMPKIN:
                              this.lib.drawImgDodge(imgEnemyE14Arms + int(this.player.DMGANIFRAME[_loc1_] >> 1),this.player.DMGPOSX[_loc1_],this.player.DMGPOSY[_loc1_],BlendMode.NORMAL,BOTTOM | HCENTER);
                              this.player.DMGANIFRAME[_loc1_] += 1 + this.nLeakFrame;
                              if(this.player.DMGANIFRAME[_loc1_] >= FPS >> 1)
                              {
                                 this.player.DMGKIND[_loc1_] = INITDATA;
                                 this.player.DMGPOSX[_loc1_] = INITDATA;
                                 this.player.DMGPOSY[_loc1_] = INITDATA;
                                 this.player.DMGANIFRAME[_loc1_] = 0;
                                 this.player.DMGFROMENEMY[_loc1_] = INITDATA;
                              }
                              break;
                           case ENEMY_PUMPKIN2:
                              this.lib.drawImgDodge(imgEnemyE34Arms + int(this.player.DMGANIFRAME[_loc1_] >> 1),this.player.DMGPOSX[_loc1_],this.player.DMGPOSY[_loc1_],BlendMode.NORMAL,BOTTOM | HCENTER);
                              this.player.DMGANIFRAME[_loc1_] += 1 + this.nLeakFrame;
                              if(this.player.DMGANIFRAME[_loc1_] >= FPS >> 1)
                              {
                                 this.player.DMGKIND[_loc1_] = INITDATA;
                                 this.player.DMGPOSX[_loc1_] = INITDATA;
                                 this.player.DMGPOSY[_loc1_] = INITDATA;
                                 this.player.DMGANIFRAME[_loc1_] = 0;
                                 this.player.DMGFROMENEMY[_loc1_] = INITDATA;
                              }
                        }
                        _loc1_++;
                     }
                     if(this.player.nGameMode == MODE_WARROAD)
                     {
                        this.player.nPosY += 175 / Player.PALADOGDIETOTALFRAME * (1 + this.nLeakFrame);
                     }
                     this.player.nPaladogDieFrame += 1 + this.nLeakFrame;
                     if(this.player.nPaladogDieFrame >= Player.PALADOGDIETOTALFRAME)
                     {
                        this.ope.playerStop();
                        this.player.nPaladogDieFrame = 0;
                        this.nGameState = GAME_OVER;
                     }
               }
               break;
            case GAME_LEVELUP:
               switch(this.nGameScene)
               {
                  case 0:
                  case 1:
                     this.lib.drawImg(imgLevelUp,0,0,TOP | LEFT);
                     this.lib.drawImg(imgLevelUp + 1,0,0,TOP | LEFT);
                     _loc1_ = 0;
                     while(_loc1_ < 3)
                     {
                        if(this.player.SKILLINDEX[_loc1_] > INITDATA)
                        {
                           this.lib.drawImg(imgSkillInfor + 23,_loc1_ * 236,0,TOP | LEFT);
                           if(this.player.SKILLINDEX[_loc1_] < Player.SKILL_MOUSE)
                           {
                              this.lib.drawImg(imgSkillInfor + this.player.SKILLINDEX[_loc1_],_loc1_ * 236,0,TOP | LEFT);
                           }
                           else
                           {
                              this.lib.drawImg(imgSkillInfor + 25,_loc1_ * 236,0,TOP | LEFT);
                              this.lib.drawImg(imgSkillInfor + 3 + this.player.SKILLINDEX[_loc1_],_loc1_ * 236,0,TOP | LEFT);
                           }
                           if(this.player.SKILLINDEX[_loc1_] < Player.SKILL_MOUSE)
                           {
                              this.lib.drawNumImg("" + this.player.HEROSKILL[this.player.SKILLINDEX[_loc1_]],160 + _loc1_ * 236,441,NUM_LEVELUPPOINT,TOP | RIGHT);
                              if(this.player.nGameMode == MODE_SURVIVAL)
                              {
                                 this.lib.drawNumImg("" + this.player.HEROSURVIVALMAXSKILL[this.player.SKILLINDEX[_loc1_]],185 + _loc1_ * 236,443,NUM_LEVELUPMAX,TOP | LEFT);
                              }
                              else
                              {
                                 this.lib.drawNumImg("" + this.player.HEROMAXSKILL[this.player.SKILLINDEX[_loc1_]],185 + _loc1_ * 236,443,NUM_LEVELUPMAX,TOP | LEFT);
                              }
                           }
                           else
                           {
                              this.lib.drawNumImg("" + this.player.UNITUPGRADE[this.player.SKILLINDEX[_loc1_] - Player.SKILL_MOUSE],160 + _loc1_ * 236,441,NUM_LEVELUPPOINT,TOP | RIGHT);
                              this.lib.drawNumImg("" + Player.MAX_UNITSKILL,185 + _loc1_ * 236,443,NUM_LEVELUPMAX,TOP | LEFT);
                           }
                        }
                        _loc1_++;
                     }
                     this.lib.drawImg(imgSkillInfor + 24,0,0,TOP | LEFT);
                     if(this.nGameScene == 0)
                     {
                        if(this.nGameFrame == 0)
                        {
                           this.player.nPauseTime = getTimer();
                        }
                        if(this.nGameFrame >= FPS)
                        {
                           ++this.nGameScene;
                        }
                     }
                     else
                     {
                        this.bActive = false;
                     }
               }
               break;
            case GAME_MENU:
               switch(this.nGameScene)
               {
                  case 0:
                     this.lib.fillRectAlpha(0,Player.BG_BASEPOSY,this.nLcdW,this.nLcdH,0,75,TOP | LEFT);
                     if(!this.bGameMenu)
                     {
                        this.lib.sndEffectAllStop();
                        this.player.nPauseTime = getTimer();
                        _loc1_ = 0;
                        while(_loc1_ < MAX_UNITKIND)
                        {
                           this.nUiPassTime[_loc1_] = getTimer();
                           _loc1_++;
                        }
                        this.nMenuPos = 0;
                        this.nLoadFrame = 0;
                        this.bGameMenu = true;
                        ++this.nGameScene;
                     }
                     else
                     {
                        this.nGameState = GAME_PLAY;
                     }
                     break;
                  case 1:
                     this.lib.fillRectAlpha(0,Player.BG_BASEPOSY,this.nLcdW,this.nLcdH,0,75,TOP | LEFT);
                     this.lib.drawImg(imgPause,0,0,TOP | LEFT);
                     this.lib.drawImg(imgLinkBtn + 3,0,0,TOP | LEFT);
                     this.lib.drawImg(imgLinkBtn,0,0,TOP | LEFT);
                     if(this.bAppStoreBtn)
                     {
                        this.nBtnFrame += 1 + this.nLeakFrame;
                        if(this.nBtnFrame > MAX_BTNFRAME)
                        {
                           this.nBtnFrame = 0;
                           this.bAppStoreBtn = false;
                           _loc3_ = new URLRequest("http://itunes.apple.com/us/app/paladog!/id415458476?mt=8");
                           navigateToURL(_loc3_);
                           this.sendServerLog(GAME_VERSION,1,1);
                        }
                     }
                     if(this.bGooglePlayBtn)
                     {
                        this.nBtnFrame += 1 + this.nLeakFrame;
                        if(this.nBtnFrame > MAX_BTNFRAME)
                        {
                           this.nBtnFrame = 0;
                           this.bGooglePlayBtn = false;
                           _loc4_ = new URLRequest("https://market.android.com/details?id=com.Paladog.KorGG&feature=search_result");
                           navigateToURL(_loc4_);
                           this.sendServerLog(GAME_VERSION,2,1);
                        }
                     }
                     if(this.bResumeBtn)
                     {
                        this.lib.drawImg(imgPause + 3,0,0,TOP | LEFT);
                        this.nBtnFrame += 1 + this.nLeakFrame;
                        if(this.nBtnFrame > MAX_BTNFRAME)
                        {
                           this.nBtnFrame = 0;
                           this.bResumeBtn = false;
                           this.nGameScene = 0;
                           this.nLoadingState = INITDATA;
                        }
                     }
                     else
                     {
                        this.lib.drawImg(imgPause + 4,0,0,TOP | LEFT);
                     }
                     if(this.bGiveUpBtn)
                     {
                        this.lib.drawImg(imgPause + 1,0,0,TOP | LEFT);
                        this.nBtnFrame += 1 + this.nLeakFrame;
                        if(this.nBtnFrame > MAX_BTNFRAME)
                        {
                           this.nBtnFrame = 0;
                           this.bGiveUpBtn = false;
                           this.bGameMenu = false;
                           _loc1_ = 0;
                           while(_loc1_ < 10)
                           {
                              this.player.EQUIPINVEN[_loc1_] = this.player.SAVEEQUIPINVEN[_loc1_];
                              _loc1_++;
                           }
                           this.ope.setGamePlayTime(false);
                           this.lib.saveFile(DB_SLOT,"paladog_slot" + this.nGameSlot);
                           this.lib.saveFile(DB_GAME,"paladog_game" + this.nGameSlot);
                           this.lib.playMusic(Library.MUSIC_TITLE,true);
                           this.bOpenUnitTab = true;
                           this.nMainState = MAIN_STAGESELECT;
                           this.player.nGameSpeed = 0;
                           this.SLEEP = 1000 / FPS;
                           this.nLoadingState = INITDATA;
                        }
                     }
                     else
                     {
                        this.lib.drawImg(imgPause + 2,0,0,TOP | LEFT);
                     }
                     this.bActive = false;
               }
               break;
            case GAME_CLEAR:
               switch(this.nGameScene)
               {
                  case 0:
                     this.lib.fillRectAlpha(0,0,this.nLcdW,this.nLcdH,0,60,TOP | LEFT);
                     this.lib.drawImg(imgStageClear,0,0,TOP | LEFT);
                     this.lib.drawNumImg("" + (this.player.nNowPlayChapter + 1),195,93,NUM_CLEAR,TOP | RIGHT);
                     if(this.player.nStage + 1 < 10)
                     {
                        this.lib.drawNumImg("0" + (this.player.nStage + 1),232,93,NUM_CLEAR,TOP | LEFT);
                     }
                     else
                     {
                        this.lib.drawNumImg("" + (this.player.nStage + 1),232,93,NUM_CLEAR,TOP | LEFT);
                     }
                     if(this.player.bNewRecord)
                     {
                        this.lib.drawImg(imgStageClear + 5,0,0,TOP | LEFT);
                     }
                     if(this.nBeforeClearStar > 0)
                     {
                        _loc1_ = 0;
                        while(_loc1_ < this.nBeforeClearStar)
                        {
                           this.lib.drawImg(imgStageClear + 4,_loc1_ * 43,0,TOP | LEFT);
                           _loc1_++;
                        }
                     }
                     if(this.player.nPlayTime <= this.player.nClearTime)
                     {
                        _loc1_ = 0;
                        while(_loc1_ < 3)
                        {
                           this.lib.drawImg(imgStageClear + 1,_loc1_ * 100,0,TOP | LEFT);
                           _loc1_++;
                        }
                     }
                     else if(this.player.nPlayTime <= this.player.nClearTime + Player.nClearTimeDepth)
                     {
                        _loc1_ = 0;
                        while(_loc1_ < 2)
                        {
                           this.lib.drawImg(imgStageClear + 1,_loc1_ * 100,0,TOP | LEFT);
                           _loc1_++;
                        }
                     }
                     else
                     {
                        this.lib.drawImg(imgStageClear + 1,0,0,TOP | LEFT);
                     }
                     this.lib.drawNumImg("" + this.player.nClearMoney,406,222,NUM_MONEY,TOP | LEFT);
                     this.lib.drawNumImg("" + this.player.nClearH,248,262,NUM_MANA,TOP | RIGHT);
                     this.lib.drawNumImg("" + this.player.nClearM,324,262,NUM_MANA,TOP | RIGHT);
                     this.lib.drawNumImg("" + this.player.nClearS,406,262,NUM_MANA,TOP | RIGHT);
                     if(this.bOkBtn)
                     {
                        this.lib.drawImg(imgStageClear + 2,0,0,TOP | LEFT);
                        this.nBtnFrame += 1 + this.nLeakFrame;
                        if(this.nBtnFrame > MAX_BTNFRAME)
                        {
                           this.nBtnFrame = 0;
                           this.bOkBtn = false;
                           if(this.player.nStage < 23)
                           {
                              this.lib.stopMusic();
                              this.lib.playMusic(Library.MUSIC_TITLE,true);
                              this.bOpenUnitTab = true;
                              this.nMainState = MAIN_STAGESELECT;
                           }
                           else
                           {
                              this.bChapterClearSnd = false;
                              this.bEndingSnd1 = false;
                              this.bEndingSnd2 = false;
                              this.bEndingSnd3 = false;
                              this.nGameState = GAME_CINEMA;
                              this.lib.stopMusic();
                           }
                           this.player.nGameSpeed = 0;
                           this.SLEEP = 1000 / FPS;
                           this.player.bNewRecord = false;
                           this.nLoadingState = INITDATA;
                        }
                     }
                     else
                     {
                        this.lib.drawImg(imgStageClear + 3,0,0,TOP | LEFT);
                     }
                     this.bActive = false;
               }
               break;
            case GAME_CINEMA:
               switch(this.nGameScene)
               {
                  case 0:
                     if(this.player.nNowPlayChapter < 4)
                     {
                        if(this.nGameFrame == 0)
                        {
                           switch(this.player.nNowPlayChapter)
                           {
                              case 0:
                                 this.lib.playEffect(28);
                                 break;
                              case 1:
                                 this.lib.playEffect(29);
                                 break;
                              case 2:
                                 this.lib.playEffect(27);
                                 break;
                              case 3:
                                 this.lib.playEffect(29);
                           }
                        }
                        else if(this.nGameFrame >= 99)
                        {
                           if(!this.bChapterClearSnd)
                           {
                              this.lib.playEffect(78);
                              this.bChapterClearSnd = true;
                           }
                        }
                        if(this.nGameFrame < 119)
                        {
                           this.lib.drawASEAni(Ani_ChapterClear_01 + this.player.nNowPlayChapter,0,imgChapterClear,this.nGameFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                        }
                        else
                        {
                           this.lib.drawASEAni(Ani_ChapterClear_01 + this.player.nNowPlayChapter,0,imgChapterClear,119,this.nLcdWC,this.nLcdHC,100,100,false);
                        }
                        this.bActive = false;
                     }
                     else
                     {
                        this.lib.drawASEAni(Ani_Ending01 + 3,0,imgTitle,this.nGameFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                        this.lib.drawASEAni(Ani_Ending01 + 2,0,imgMace01,this.nGameFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                        this.lib.drawASEAni(Ani_Ending01 + 1,0,imgPaladog,this.nGameFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                        this.lib.drawASEAni(Ani_Ending01,0,imgEnding,this.nGameFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                        if(this.nGameFrame >= 239)
                        {
                           ++this.nGameScene;
                        }
                        if(this.nGameFrame >= 2)
                        {
                           if(!this.bEndingSnd1)
                           {
                              this.lib.playEffect(42);
                              this.bEndingSnd1 = true;
                           }
                        }
                        if(this.nGameFrame >= 120)
                        {
                           if(!this.bEndingSnd2)
                           {
                              this.lib.playEffect(43);
                              this.bEndingSnd2 = true;
                           }
                        }
                     }
                     break;
                  case 1:
                     if(this.player.nNowPlayChapter < 4)
                     {
                        this.drawEvent(this.player.nNowPlayChapter,false);
                        this.bActive = false;
                     }
                     else
                     {
                        this.lib.drawASEAni(Ani_Ending02,0,imgEnding,this.nGameFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                        if(this.nGameFrame >= 59)
                        {
                           ++this.nGameScene;
                        }
                     }
                     break;
                  case 2:
                     this.lib.drawASEAni(Ani_Ending03 + 3,0,imgTitle,this.nGameFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                     this.lib.drawASEAni(Ani_Ending03 + 2,0,imgMace01,this.nGameFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                     this.lib.drawASEAni(Ani_Ending03 + 1,0,imgPaladog,this.nGameFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                     this.lib.drawASEAni(Ani_Ending03,0,imgEnding,this.nGameFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                     if(this.nGameFrame >= 599)
                     {
                        this.nEndingScene = 0;
                        this.nEndingFrame = 0;
                        ++this.nGameScene;
                        this.lib.playMusic(Library.MUSIC_STAGE,true);
                     }
                     if(this.nGameFrame >= 60)
                     {
                        if(!this.bEndingSnd3)
                        {
                           this.lib.playMusic(Library.MUSIC_CLEAR,false);
                           this.bEndingSnd3 = true;
                        }
                     }
                     break;
                  case 3:
                     this.lib.drawASEAni(Ani_EndingBg,this.nEndingScene,imgEndingBg,this.nEndingFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                     this.lib.drawASEAni(Ani_EndingCha,this.nEndingScene,imgEnding,this.nEndingFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                     this.drawEndingTxt(this.nEndingScene,this.nEndingFrame);
                     ++this.nEndingFrame;
                     if(this.nEndingScene == 0)
                     {
                        if(this.nEndingFrame >= 60)
                        {
                           this.nEndingFrame = 0;
                           ++this.nEndingScene;
                        }
                     }
                     else if(this.nEndingScene == 11)
                     {
                        if(this.nEndingFrame >= 60)
                        {
                           this.nEndingScene = 0;
                           this.nEndingFrame = 0;
                           ++this.nGameScene;
                        }
                     }
                     else if(this.nEndingFrame >= 360)
                     {
                        this.nEndingFrame = 0;
                        ++this.nEndingScene;
                     }
                     break;
                  case 4:
                     this.lib.drawASEAni(Ani_EndingTxt,this.nEndingScene,imgEnding,this.nEndingFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                     ++this.nEndingFrame;
                     if(this.nEndingScene == 0)
                     {
                        if(this.nEndingFrame >= 180)
                        {
                           this.nEndingFrame = 0;
                           ++this.nEndingScene;
                        }
                     }
                     else if(this.nEndingFrame >= 300)
                     {
                        this.bEndingSnd1 = false;
                        this.bEndingSnd2 = false;
                        this.bEndingSnd3 = false;
                        this.bEnding = true;
                        this.nMainState = MAIN_AD;
                        this.lib.stopMusic();
                     }
               }
               break;
            case GAME_OVER:
               switch(this.nGameScene)
               {
                  case 0:
                     this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,0,TOP | LEFT);
                     this.lib.drawImgZoomAlpha(imgFail + 1,this.nLcdWC,0,100,100,100 / 120 * this.player.nPaladogDieFrame,TOP | HCENTER);
                     this.lib.drawASEAni(Ani_Paladog,Player.ANI_DEAD,imgPaladog,39,this.player.nPosX,this.player.nPosY - 5,100,100,false);
                     this.player.nPaladogDieFrame += 1 + this.nLeakFrame;
                     if(this.player.nPaladogDieFrame >= 120)
                     {
                        this.player.nPaladogDieFrame = 0;
                        ++this.nGameScene;
                     }
                     break;
                  case 1:
                     this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,0,TOP | LEFT);
                     this.lib.drawImgZoom(imgFail + 1,this.nLcdWC,0,100,100,TOP | HCENTER);
                     this.lib.drawASEAni(Ani_Paladog,Player.ANI_DEAD,imgPaladog,39,this.player.nPosX,this.player.nPosY - 5,100,100,false);
                     this.lib.drawImgAlpha(imgFail,0,0,100 / 60 * this.player.nPaladogDieFrame,TOP | LEFT);
                     this.lib.drawImgAlpha(imgFail + 2,0,0,100 / 60 * this.player.nPaladogDieFrame,TOP | LEFT);
                     this.player.nPaladogDieFrame += 1 + this.nLeakFrame;
                     if(this.player.nPaladogDieFrame >= 60)
                     {
                        this.player.nPaladogDieFrame = 0;
                        ++this.nGameScene;
                     }
                     break;
                  case 2:
                     this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,0,TOP | LEFT);
                     this.lib.drawImgZoom(imgFail + 1,this.nLcdWC,0,100,100,TOP | HCENTER);
                     this.lib.drawASEAni(Ani_Paladog,Player.ANI_DEAD,imgPaladog,39,this.player.nPosX,this.player.nPosY - 5,100,100,false);
                     this.lib.drawImg(imgFail,0,0,TOP | LEFT);
                     if(this.bOkBtn)
                     {
                        this.lib.drawImg(imgFail + 3,0,0,TOP | LEFT);
                        this.nBtnFrame += 1 + this.nLeakFrame;
                        if(this.nBtnFrame > MAX_BTNFRAME)
                        {
                           this.nBtnFrame = 0;
                           this.bOkBtn = false;
                           _loc1_ = 0;
                           while(_loc1_ < 10)
                           {
                              this.player.EQUIPINVEN[_loc1_] = this.player.SAVEEQUIPINVEN[_loc1_];
                              _loc1_++;
                           }
                           this.ope.setGamePlayTime(false);
                           this.lib.saveFile(DB_SLOT,"paladog_slot" + this.nGameSlot);
                           this.lib.saveFile(DB_GAME,"paladog_game" + this.nGameSlot);
                           this.lib.playMusic(Library.MUSIC_TITLE,true);
                           this.bOpenUnitTab = true;
                           this.nMainState = MAIN_STAGESELECT;
                           this.player.nGameSpeed = 0;
                           this.SLEEP = 1000 / FPS;
                        }
                     }
                     else
                     {
                        this.lib.drawImg(imgFail + 2,0,0,TOP | LEFT);
                     }
                     this.player.nPaladogDieFrame += 1 + this.nLeakFrame;
                     if(this.player.nPaladogDieFrame >= 60)
                     {
                        this.bActive = false;
                     }
               }
         }
         if(!this.bGameMenu)
         {
            this.nGameFrame += 1 + this.nLeakFrame;
         }
      }
      
      public function drawMain() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         if(!this.bGameMenu)
         {
            if(!this.bBossDiaEvent && !this.bBossDialog)
            {
               this.ope.armsCharge();
               this.ope.unitCharge();
            }
            _loc1_ = 0;
            while(_loc1_ < this.nTotalDrawObjNum + 1)
            {
               if(this.nObjDrawPos[_loc1_] == HEROPOS)
               {
                  if(!this.bBossDiaEvent && !this.bBossDialog)
                  {
                     this.ope.movePlayer();
                  }
               }
               else if(this.nObjDrawPos[_loc1_] < MAX_ENEMYNUM)
               {
                  if(!this.bBossDialog)
                  {
                     this.ope.moveEnemy(this.nObjDrawPos[_loc1_]);
                  }
               }
               else
               {
                  this.ope.moveUnit(this.nObjDrawPos[_loc1_] - MAX_ENEMYNUM);
               }
               _loc1_++;
            }
            if(this.player.nGameMode == MODE_DESTINY)
            {
               _loc1_ = 0;
               while(_loc1_ < MAX_DESTINYICONNUM)
               {
                  this.ope.moveDestinyIcon(_loc1_);
                  _loc1_++;
               }
            }
         }
         if(this.player.bBgEff)
         {
            this.player.nBgEffPosY = this.player.BGEFFPOS[this.player.nBgEffFrame];
            this.player.nBgPosY = this.player.BGEFFPOS[this.player.nBgEffFrame] + Player.BG_BASEPOSY;
            this.player.nEnemyStationPosY = Player.BG_BASEPOSY + this.player.BGEFFPOS[this.player.nBgEffFrame];
            this.player.nBgEffFrame += 1 + this.nLeakFrame;
            if(this.player.nBgEffFrame >= Player.nBgEffTotalFrame)
            {
               this.player.nBgEffPosY = 0;
               this.player.nBgPosY = Player.BG_BASEPOSY;
               this.player.nEnemyStationPosY = Player.BG_BASEPOSY;
               this.player.nBgEffFrame = 0;
               this.player.bBgEff = false;
            }
         }
         this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,0,TOP | LEFT);
         if(this.player.nGameMode == MODE_WARROAD)
         {
            this.lib.drawImg(imgWarRoad,this.player.nBgPosX,this.player.nBgPosY,TOP | LEFT);
            if(this.player.bWarRoadSelectUnit)
            {
               _loc1_ = 0;
               while(_loc1_ < Player.NUM_WARROAD)
               {
                  _loc6_ = this.lib.getRand(2);
                  if(!this.bGameMenu)
                  {
                     this.player.nWarRoadPosX[_loc1_] += _loc6_;
                     this.player.nWarRoadPosX[_loc1_ + Player.NUM_WARROAD] += _loc6_;
                     if(this.player.nWarRoadPosX[_loc1_] >= this.nLcdW)
                     {
                        this.player.nWarRoadPosX[_loc1_] = this.player.nWarRoadPosX[_loc1_ + Player.NUM_WARROAD] - this.nLcdW;
                     }
                     if(this.player.nWarRoadPosX[_loc1_ + Player.NUM_WARROAD] >= this.nLcdW)
                     {
                        this.player.nWarRoadPosX[_loc1_ + Player.NUM_WARROAD] = this.player.nWarRoadPosX[_loc1_] - this.nLcdW;
                     }
                  }
                  _loc2_ = 0;
                  while(_loc2_ < 2)
                  {
                     this.lib.drawImgDodge(imgWarRoad + 13,this.player.nWarRoadPosX[_loc1_ + _loc2_ * Player.NUM_WARROAD],Player.WARROAD_BASEY + _loc1_ * Player.WARROAD_UNITBASEYGAGAP,BlendMode.ADD,TOP | LEFT);
                     _loc2_++;
                  }
                  _loc1_++;
               }
               this.lib.drawImg(imgTowerKey,0,0,TOP | LEFT);
            }
         }
         else
         {
            _loc7_ = (int(this.player.nStage / 12) + this.player.nNowPlayChapter * 2) * 3;
            if(this.player.nGameMode == MODE_SURVIVAL)
            {
               _loc8_ = this.player.nStage - 120;
               if(_loc8_ >= 30)
               {
                  _loc8_ -= 30;
               }
               _loc7_ = (int(_loc8_ / 3) + this.player.nChapter * 2) * 3;
            }
            this.lib.drawImg(imgBg + _loc7_ + 2,0,this.player.nBgPosY,TOP | LEFT);
            this.lib.drawImg(imgBg + _loc7_ + 1,this.player.nBg2PosX,this.player.nBgPosY,TOP | LEFT);
            this.lib.drawImg(imgBg + _loc7_,this.player.nBgPosX,this.player.nBgPosY,TOP | LEFT);
         }
         if(this.player.nGameMode == MODE_WAGON)
         {
            this.lib.drawImgZoom(imgWagon + 2,Player.BG_W + this.player.nBgPosX + 20,Player.WAGON_GOALLINE,35,35,TOP | RIGHT);
         }
         if(this.player.bLevelUp)
         {
            if(!this.player.bDrawLevelUpTurn)
            {
               this.lib.drawASEAni(Ani_LevelUp,5,imgLevelUpEff,this.player.nLevelUpFrame,this.nLcdWC,this.nLcdHC,100,100,false);
            }
            else if(this.player.bDrawLevelUpTurn && this.nGameState != GAME_LEVELUP)
            {
               this.lib.drawASEAni(Ani_LevelUp,2,imgLevelUpEff,this.player.nLevelUpFrame,this.nLcdWC,this.nLcdHC,100,100,false);
            }
            if(this.player.bDarkBg)
            {
               if(!this.bGameMenu)
               {
                  this.player.nDarkBgFrame += 1 + this.nLeakFrame;
               }
            }
         }
         else if(this.player.bDarkBg)
         {
            _loc9_ = FPS / 10 * 4;
            _loc10_ = FPS / 10 * 10;
            _loc11_ = FPS / 10 * 14;
            _loc12_ = 50 / (FPS / 10 * 4);
            if(!this.bGameMenu)
            {
               this.player.nDarkBgFrame += 1 + this.nLeakFrame;
            }
            if(this.player.nDarkBgFrame <= _loc11_)
            {
               if(this.player.nDarkBgFrame <= _loc9_)
               {
                  this.lib.fillRectAlpha(0,0,this.nLcdW,this.nLcdH,0,this.player.nDarkBgFrame * _loc12_,TOP | LEFT);
               }
               else if(this.player.nDarkBgFrame <= _loc10_)
               {
                  this.lib.fillRectAlpha(0,0,this.nLcdW,this.nLcdH,0,50,TOP | LEFT);
               }
               else
               {
                  this.lib.fillRectAlpha(0,0,this.nLcdW,this.nLcdH,0,50 - (this.player.nDarkBgFrame - _loc10_) * _loc12_,TOP | LEFT);
               }
            }
            if(this.player.nDarkBgFrame >= _loc11_)
            {
               this.player.nDarkBgFrame = 0;
               this.player.bDarkBg = false;
            }
         }
         switch(this.player.nGameMode)
         {
            case MODE_NORMAL:
            case MODE_BOSS:
               if(this.player.bEnemyStationCrashed)
               {
                  if(this.player.nGameMode == MODE_NORMAL)
                  {
                     this.lib.drawImg(imgEnemyStation + 5,this.player.nEnemyStationPosX + this.player.nBgPosX,this.player.nEnemyStationPosY,TOP | RIGHT);
                  }
                  else if(!this.player.bEnemyStationDisAppear)
                  {
                     if(this.player.nEnemyStationDisAppearTime > 0)
                     {
                        this.player.nNowTime = getTimer();
                        _loc4_ = (this.player.nNowTime - this.player.nEnemyStationDisAppearTime) * (1 + this.player.nGameSpeed);
                        _loc5_ = _loc4_ / 30;
                        this.lib.drawImgAlpha(imgEnemyStation + 5,this.player.nEnemyStationPosX + this.player.nBgPosX,this.player.nEnemyStationPosY,100 - _loc5_,TOP | RIGHT);
                     }
                     else
                     {
                        this.lib.drawImg(imgEnemyStation + 5,this.player.nEnemyStationPosX + this.player.nBgPosX,this.player.nEnemyStationPosY,TOP | RIGHT);
                     }
                  }
               }
               else
               {
                  _loc3_ = imgEnemyStation + 1;
                  if(this.player.nEnemyStationHp <= this.player.nEnemyStationMaxHp >> 1)
                  {
                     _loc3_ = imgEnemyStation + 3;
                  }
                  if(this.ope.bDrawEnemyStationDmgEff())
                  {
                     this.lib.drawObjDmg(_loc3_,this.player.nEnemyStationPosX + this.player.nBgPosX,this.player.nEnemyStationPosY,TOP | RIGHT);
                  }
                  else
                  {
                     this.lib.drawImg(_loc3_,this.player.nEnemyStationPosX + this.player.nBgPosX,this.player.nEnemyStationPosY,TOP | RIGHT);
                  }
               }
         }
         this.drawObj();
         switch(this.player.nGameMode)
         {
            case MODE_NORMAL:
            case MODE_BOSS:
               if(this.player.bEnemyStationBadEnergy)
               {
                  if(this.player.nEnemyStationBadEnergyFrame < 36)
                  {
                     this.lib.drawImgZoomDodge(imgBadEnergy + int(this.player.nEnemyStationBadEnergyFrame >> 1),this.player.nBgPosX + this.player.nEnemyStationPosX - 100,this.player.nEnemyStationPosY + 180,200,200,BlendMode.ADD,VCENTER | RIGHT);
                     if(!this.bGameMenu)
                     {
                        this.player.nEnemyStationBadEnergyFrame += 1 + this.nLeakFrame;
                     }
                  }
               }
         }
         switch(this.player.nGameMode)
         {
            case MODE_NORMAL:
            case MODE_BOSS:
               if(this.player.bEnemyStationCrashed)
               {
                  if(this.player.nGameMode == MODE_NORMAL)
                  {
                     this.lib.drawImg(imgEnemyStation + 4,this.player.nEnemyStationPosX + this.player.nBgPosX,this.player.nEnemyStationPosY,TOP | RIGHT);
                  }
                  else if(!this.player.bEnemyStationDisAppear)
                  {
                     if(this.player.nEnemyStationDisAppearTime > 0)
                     {
                        this.lib.drawImgAlpha(imgEnemyStation + 4,this.player.nEnemyStationPosX + this.player.nBgPosX,this.player.nEnemyStationPosY,100 - _loc5_,TOP | RIGHT);
                        if(_loc4_ >= Player.ENEMYSTATIONDISAPPEARTIME)
                        {
                           this.player.bEnemyStationDisAppear = true;
                        }
                     }
                     else
                     {
                        this.lib.drawImg(imgEnemyStation + 4,this.player.nEnemyStationPosX + this.player.nBgPosX,this.player.nEnemyStationPosY,TOP | RIGHT);
                     }
                  }
               }
               else
               {
                  _loc3_ = imgEnemyStation;
                  if(this.player.nEnemyStationHp <= this.player.nEnemyStationMaxHp >> 1)
                  {
                     _loc3_ = imgEnemyStation + 2;
                  }
                  if(this.ope.bDrawEnemyStationDmgEff())
                  {
                     this.lib.drawObjDmg(_loc3_,this.player.nEnemyStationPosX + this.player.nBgPosX,this.player.nEnemyStationPosY,TOP | RIGHT);
                  }
                  else
                  {
                     this.lib.drawImg(_loc3_,this.player.nEnemyStationPosX + this.player.nBgPosX,this.player.nEnemyStationPosY,TOP | RIGHT);
                  }
               }
         }
         switch(this.player.nGameMode)
         {
            case MODE_NORMAL:
            case MODE_BOSS:
               if(!this.player.bStageClear)
               {
                  if(this.player.bEnemyStationAttacked)
                  {
                     this.lib.drawImgZoom(imgEnemyStationHit + int(this.player.nEnemyStationAttackedFrame >> 1),this.player.nBgPosX + this.player.nEnemyStationPosX - 125,this.player.nEnemyStationPosY + 132,100,100,VCENTER | HCENTER);
                     if(this.player.nEnemyStationAttackedFrame < 2)
                     {
                        this.player.nEnemyStationPosX = Player.BG_W + 5;
                     }
                     else
                     {
                        this.player.nEnemyStationPosX = Player.BG_W;
                     }
                     if(!this.bGameMenu)
                     {
                        this.player.nEnemyStationAttackedFrame += 1 + this.nLeakFrame;
                     }
                     if(this.player.nEnemyStationAttackedFrame >= 20)
                     {
                        this.player.nEnemyStationAttackedFrame = 0;
                        this.player.bEnemyStationAttacked = false;
                     }
                  }
                  else if(this.player.bEnemyStationCrashed)
                  {
                     if(!this.player.bBossEnemyAppear)
                     {
                        this.lib.drawImgZoom(imgEnemyStationCrash + int(this.player.nEnemyStationAttackedFrame >> 2),this.player.nBgPosX + this.player.nEnemyStationPosX - 100,this.player.nEnemyStationPosY + 180,100,100,VCENTER | HCENTER);
                        if(!this.bGameMenu)
                        {
                           this.player.nEnemyStationAttackedFrame += 1 + this.nLeakFrame;
                        }
                        if(this.player.nEnemyStationAttackedFrame >= 80)
                        {
                           this.player.nEnemyStationAttackedFrame = 0;
                           if(this.player.nGameMode == MODE_NORMAL)
                           {
                              this.player.bStageClear = true;
                              this.nGameFrame = 0;
                           }
                           else if(this.player.nGameMode == MODE_BOSS)
                           {
                              this.player.bBossEnemyAppear = true;
                              this.player.nEnemyStationDisAppearTime = getTimer();
                           }
                        }
                     }
                  }
               }
         }
      }
      
      public function drawObj() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         if(this.player.nGameMode == MODE_WARROAD)
         {
            this.lib.drawImgZoomAlpha(imgShadow,this.player.nPosX,this.player.nPosY - ((Player.CHAIMG_HEIGHT >> 2) - (Player.SHADOWIMG_POS >> 1)),16,20,60,VCENTER | HCENTER);
            this.lib.drawImgZoomAlpha(imgShadow,this.player.nBossPosX,this.player.nBossPosY - ((Player.CHAIMG_HEIGHT >> 2) - (Player.SHADOWIMG_POS >> 1)),16,20,60,VCENTER | HCENTER);
            if(this.player.nWarRoadEnemyHp <= 0)
            {
               if(int(this.player.nStage / 12) + this.player.nChapter * 2 == 6)
               {
                  this.lib.drawASEAniEffect(Ani_Boss01 + (int(this.player.nStage / 12) + this.player.nChapter * 2),Player.ANI_DEAD,this.BOSSIMG[int(this.player.nStage / 12) + this.player.nChapter * 2],this.nAniBossDieFrame,this.player.nBossPosX,this.player.nBossPosY - 8,50,50,false);
               }
               else
               {
                  this.lib.drawASEAni(Ani_Boss01 + (int(this.player.nStage / 12) + this.player.nChapter * 2),Player.ANI_DEAD,this.BOSSIMG[int(this.player.nStage / 12) + this.player.nChapter * 2],this.nAniBossDieFrame,this.player.nBossPosX,this.player.nBossPosY - 8,50,50,false);
               }
               this.nAniBossDieFrame += 1 + this.nLeakFrame;
               if(this.nAniBossDieFrame >= this.player.ENEMYKNOCKDOWNTOTALFRAME[int(this.player.nStage / 12) + this.player.nChapter * 2 + 20] - 1)
               {
                  this.nAniBossDieFrame = this.player.ENEMYKNOCKDOWNTOTALFRAME[int(this.player.nStage / 12) + this.player.nChapter * 2 + 20] - 1;
               }
            }
            else if(int(this.player.nStage / 12) + this.player.nChapter * 2 == 6)
            {
               this.lib.drawASEAniEffect(Ani_Boss01 + (int(this.player.nStage / 12) + this.player.nChapter * 2),Player.ANI_WAIT,this.BOSSIMG[int(this.player.nStage / 12) + this.player.nChapter * 2],this.nGameFrame % 24,this.player.nBossPosX,this.player.nBossPosY - 8,50,50,false);
            }
            else
            {
               this.lib.drawASEAni(Ani_Boss01 + (int(this.player.nStage / 12) + this.player.nChapter * 2),Player.ANI_WAIT,this.BOSSIMG[int(this.player.nStage / 12) + this.player.nChapter * 2],this.nGameFrame % 24,this.player.nBossPosX,this.player.nBossPosY - 8,50,50,false);
            }
         }
         else
         {
            this.lib.drawImgZoomAlpha(imgShadow,this.player.nPosX,this.player.nPosY + 10 - ((Player.CHAIMG_HEIGHT >> 1) - Player.SHADOWIMG_POS),32,40,60,VCENTER | HCENTER);
            this.lib.drawImgZoomDodge(imgAura + int(this.nGameFrame / 6) % 6,this.player.nPosX,this.player.nPosY + 10 - ((Player.CHAIMG_HEIGHT >> 1) - Player.SHADOWIMG_POS),75 + this.player.HEROSKILL[Player.SKILL_AREAAURA] * 25,75 + this.player.HEROSKILL[Player.SKILL_AREAAURA] * 25,BlendMode.ADD,VCENTER | HCENTER);
         }
         if(this.player.nGameMode == MODE_WARROAD)
         {
            _loc1_ = 0;
            for(; _loc1_ < Player.MAX_ATTACK; _loc1_++)
            {
               if(this.player.ATTACKANI[_loc1_] <= INITDATA)
               {
                  continue;
               }
               switch(this.player.ATTACKANI[_loc1_])
               {
                  case ATTACK_HEAL:
                     this.lib.drawImgZoomDodge(this.player.ARMSANIIMG[MACE_HEAL * Player.MACEACT_NUM + Player.MACEACT_EFFC] + int(this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] >> 1),this.player.ATTACKPOSX[_loc1_],this.player.ATTACKPOSY[_loc1_] + 49,50,50,BlendMode.ADD,BOTTOM | HCENTER);
               }
            }
         }
         else
         {
            _loc1_ = 0;
            for(; _loc1_ < Player.MAX_ATTACK; _loc1_++)
            {
               if(this.player.ATTACKANI[_loc1_] <= INITDATA)
               {
                  continue;
               }
               switch(this.player.ATTACKANI[_loc1_])
               {
                  case MACE_HEAL:
                     this.lib.drawImgZoomDodge(this.player.ARMSANIIMG[this.player.ATTACKANI[_loc1_] * Player.MACEACT_NUM + Player.MACEACT_EFFC] + int(this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] >> 1),this.player.ATTACKPOSX[_loc1_],this.player.ATTACKPOSY[_loc1_] + 110,100,100,BlendMode.ADD,BOTTOM | HCENTER);
                     break;
                  case MACE_TURNUNDEAD:
                     this.lib.drawImgZoomDodge(this.player.ARMSANIIMG[this.player.ATTACKANI[_loc1_] * Player.MACEACT_NUM + Player.MACEACT_EFFC] + int(this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] >> 1),this.player.ATTACKPOSX[_loc1_] + Player.MACE_TURNUNDEAD_EFFCPOS,this.player.ATTACKPOSY[_loc1_] + 16,100,100,BlendMode.ADD,BOTTOM | HCENTER);
               }
            }
         }
         _loc1_ = 0;
         while(_loc1_ < Player.MAX_DMG)
         {
            switch(this.player.DMGKIND[_loc1_])
            {
               case ENEMY_DARKZOMBIE:
                  this.lib.drawImgAlpha(imgEnemyE10Arms + 14,this.player.DMGPOSX[_loc1_],this.player.DMGPOSY[_loc1_],90 - 1.5 * this.player.DMGANIFRAME[_loc1_],BOTTOM | HCENTER);
                  break;
               case ENEMY_DARKZOMBIE2:
                  this.lib.drawImgAlpha(imgEnemyE30Arms + 14,this.player.DMGPOSX[_loc1_],this.player.DMGPOSY[_loc1_],90 - 1.5 * this.player.DMGANIFRAME[_loc1_],BOTTOM | HCENTER);
            }
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.nTotalDrawObjNum + 1)
         {
            if(this.nObjDrawPos[_loc1_] == HEROPOS)
            {
               this.drawHero();
            }
            else if(this.nObjDrawPos[_loc1_] < MAX_ENEMYNUM)
            {
               this.drawEnemy(this.nObjDrawPos[_loc1_]);
            }
            else
            {
               this.drawUnit(this.nObjDrawPos[_loc1_] - MAX_ENEMYNUM);
            }
            _loc1_++;
         }
         if(this.player.nGameMode == MODE_WARROAD)
         {
            _loc1_ = 0;
            for(; _loc1_ < Player.MAX_ATTACK; _loc1_++)
            {
               if(this.player.ATTACKANI[_loc1_] <= INITDATA)
               {
                  continue;
               }
               switch(this.player.ATTACKANI[_loc1_])
               {
                  case ATTACK_HEAL:
                     if(int(this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] >> 1) < 19)
                     {
                        this.lib.drawImgZoomDodge(this.player.ARMSANIIMG[MACE_HEAL * Player.MACEACT_NUM + Player.MACEACT_EFFB] + int(this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] >> 1),this.player.ATTACKPOSX[_loc1_],this.player.ATTACKPOSY[_loc1_] - 10,50,50,BlendMode.ADD,BOTTOM | HCENTER);
                     }
                     if(!this.bGameMenu)
                     {
                        this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] += 1 + this.nLeakFrame;
                        if(this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] >= this.player.MACEATTACKTOTALFRAME[MACE_HEAL])
                        {
                           this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] = 0;
                           this.player.ATTACKANI[_loc1_] = INITDATA;
                           this.player.ATTACKPOSX[_loc1_] = INITDATA;
                           this.player.ATTACKPOSY[_loc1_] = INITDATA;
                        }
                     }
               }
            }
         }
         else
         {
            _loc2_ = 0;
            while(_loc2_ < Player.BOSSPALADOGNUM)
            {
               if(this.player.BOSSPALADOGPOS[_loc2_] > INITDATA)
               {
                  _loc1_ = 0;
                  while(_loc1_ < Enemy.MAX_ENEMYATTACK)
                  {
                     if(this.ENEMY[this.player.BOSSPALADOGPOS[_loc2_]].ATTACKANI[_loc1_] > INITDATA)
                     {
                        if(this.ENEMY[this.player.BOSSPALADOGPOS[_loc2_]].ATTACKARMSPOSX[_loc1_] > INITDATA)
                        {
                           this.lib.drawImgZoomDodge(imgEnemyBoss07Effb + int(this.ENEMY[this.player.BOSSPALADOGPOS[_loc2_]].ATTACKANI[_loc1_ + Enemy.MAX_ENEMYATTACK] >> 1) % 5,this.ENEMY[this.player.BOSSPALADOGPOS[_loc2_]].ATTACKARMSPOSX[_loc1_],this.ENEMY[this.player.BOSSPALADOGPOS[_loc2_]].ATTACKARMSPOSY[_loc1_],this.ENEMY[this.player.BOSSPALADOGPOS[_loc2_]].nSizeScale,this.ENEMY[this.player.BOSSPALADOGPOS[_loc2_]].nSizeScale,BlendMode.ADD,BOTTOM | HCENTER);
                           if(!this.bGameMenu)
                           {
                              this.ope.dmgFromEnemy(this.player.BOSSPALADOGPOS[_loc2_],true,_loc1_);
                              if(this.ENEMY[this.player.BOSSPALADOGPOS[_loc2_]].ATTACKARMSPOSX[_loc1_] > INITDATA)
                              {
                                 this.ENEMY[this.player.BOSSPALADOGPOS[_loc2_]].SUBATTACKARMSPOSX[_loc1_] = this.ENEMY[this.player.BOSSPALADOGPOS[_loc2_]].ATTACKARMSPOSX[_loc1_];
                                 _loc3_ = 250 / FPS;
                                 if(this.player.nGameMode == MODE_WARROAD)
                                 {
                                    _loc3_ >>= 1;
                                 }
                                 this.ENEMY[this.player.BOSSPALADOGPOS[_loc2_]].ATTACKARMSPOSX[_loc1_] -= _loc3_ * (1 + this.nLeakFrame);
                              }
                           }
                        }
                        if(!this.bGameMenu)
                        {
                           this.ENEMY[this.player.BOSSPALADOGPOS[_loc2_]].ATTACKANI[_loc1_ + Enemy.MAX_ENEMYATTACK] += 1 + this.nLeakFrame;
                           if(int(this.ENEMY[this.player.BOSSPALADOGPOS[_loc2_]].ATTACKANI[_loc1_ + Enemy.MAX_ENEMYATTACK] >> 1) >= 14)
                           {
                              if(this.ENEMY[this.player.BOSSPALADOGPOS[_loc2_]].ATTACKARMSPOSX[_loc1_] <= INITDATA || this.ENEMY[this.player.BOSSPALADOGPOS[_loc2_]].ATTACKARMSPOSX[_loc1_] < this.player.nBgPosX)
                              {
                                 this.ope.resetEnemyAttack(this.player.BOSSPALADOGPOS[_loc2_],_loc1_);
                              }
                           }
                        }
                     }
                     _loc1_++;
                  }
               }
               _loc2_++;
            }
            _loc1_ = 0;
            for(; _loc1_ < Player.MAX_ATTACK; _loc1_++)
            {
               if(this.player.ATTACKANI[_loc1_] <= INITDATA)
               {
                  continue;
               }
               switch(this.player.ATTACKANI[_loc1_])
               {
                  case MACE_GODPUNCH:
                     if(this.player.ATTACKARMSPOSX[_loc1_] > INITDATA)
                     {
                        this.lib.drawImgDodge(this.player.ARMSANIIMG[this.player.ATTACKANI[_loc1_] * Player.MACEACT_NUM + Player.MACEACT_EFFB] + int(this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] >> 1) % 5,this.player.ATTACKARMSPOSX[_loc1_],this.player.ATTACKARMSPOSY[_loc1_],BlendMode.ADD,BOTTOM | HCENTER);
                        if(!this.bGameMenu)
                        {
                           if(!this.bBossDiaEvent && !this.bBossDialog)
                           {
                              this.ope.enemyDmg(_loc1_);
                              if(this.player.ATTACKARMSPOSX[_loc1_] > INITDATA)
                              {
                                 this.player.SUBATTACKARMSPOSX[_loc1_] = this.player.ATTACKARMSPOSX[_loc1_];
                                 this.player.ATTACKARMSPOSX[_loc1_] += Player.MACE_GODPUNCH_PPS / FPS * (1 + this.nLeakFrame);
                              }
                           }
                        }
                     }
                     if(!this.bGameMenu)
                     {
                        this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] += 1 + this.nLeakFrame;
                        if(int(this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] >> 1) >= 14)
                        {
                           if(this.player.ATTACKARMSPOSX[_loc1_] <= INITDATA || this.player.ATTACKARMSPOSX[_loc1_] > this.player.nBgPosX + Player.BG_W)
                           {
                              this.ope.initPlayerAttackObj(_loc1_);
                           }
                        }
                     }
                     break;
                  case MACE_HEAL:
                     if(int(this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] >> 1) < 19)
                     {
                        this.lib.drawImgDodge(this.player.ARMSANIIMG[this.player.ATTACKANI[_loc1_] * Player.MACEACT_NUM + Player.MACEACT_EFFB] + int(this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] >> 1),this.player.ATTACKPOSX[_loc1_],this.player.ATTACKPOSY[_loc1_],BlendMode.ADD,BOTTOM | HCENTER);
                     }
                     if(!this.bGameMenu)
                     {
                        if(!this.bBossDiaEvent && !this.bBossDialog)
                        {
                           this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] += 1 + this.nLeakFrame;
                           if(this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] >= this.player.MACEATTACKTOTALFRAME[this.player.ATTACKANI[_loc1_]])
                           {
                              this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] = 0;
                              this.player.ATTACKANI[_loc1_] = INITDATA;
                              this.player.ATTACKPOSX[_loc1_] = INITDATA;
                              this.player.ATTACKPOSY[_loc1_] = INITDATA;
                           }
                        }
                     }
                     break;
                  case MACE_TURNUNDEAD:
                     if(int(this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] >> 1) < 20)
                     {
                        this.lib.drawImgZoomDodge(this.player.ARMSANIIMG[this.player.ATTACKANI[_loc1_] * Player.MACEACT_NUM + Player.MACEACT_EFFA] + int(this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] >> 1),this.player.ATTACKPOSX[_loc1_],this.player.ATTACKPOSY[_loc1_],100,100,BlendMode.ADD,BOTTOM | HCENTER);
                     }
                     if(!this.bGameMenu)
                     {
                        if(!this.bBossDiaEvent && !this.bBossDialog)
                        {
                           this.nBeforeAtkFrame = this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK];
                           this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] += 1 + this.nLeakFrame;
                           if(this.nBeforeAtkFrame < TURNUNDEAD_ATTACKPOINT && this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] >= TURNUNDEAD_ATTACKPOINT)
                           {
                              this.ope.enemyDmg(_loc1_);
                           }
                           if(this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] >= this.player.MACEATTACKTOTALFRAME[this.player.ATTACKANI[_loc1_]])
                           {
                              this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] = 0;
                              this.player.ATTACKANI[_loc1_] = INITDATA;
                              this.player.ATTACKPOSX[_loc1_] = INITDATA;
                              this.player.ATTACKPOSY[_loc1_] = INITDATA;
                           }
                        }
                     }
                     break;
                  case MACE_ICE:
                     if(int(this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] >> 1) < 10)
                     {
                        this.lib.drawImgDodge(this.player.ARMSANIIMG[this.player.ATTACKANI[_loc1_] * Player.MACEACT_NUM + Player.MACEACT_EFFA] + int(this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] >> 1),this.player.ATTACKPOSX[_loc1_],this.player.ATTACKPOSY[_loc1_],BlendMode.ADD,BOTTOM | HCENTER);
                     }
                     if(this.player.ATTACKARMSPOSX[_loc1_] > INITDATA)
                     {
                        this.lib.drawImgDodge(this.player.ARMSANIIMG[this.player.ATTACKANI[_loc1_] * Player.MACEACT_NUM + Player.MACEACT_EFFB],this.player.ATTACKARMSPOSX[_loc1_],this.player.ATTACKARMSPOSY[_loc1_],BlendMode.ADD,BOTTOM | HCENTER);
                        if(!this.bGameMenu)
                        {
                           if(!this.bBossDiaEvent && !this.bBossDialog)
                           {
                              this.ope.enemyDmg(_loc1_);
                              if(this.player.ATTACKARMSPOSX[_loc1_] > INITDATA)
                              {
                                 this.player.SUBATTACKARMSPOSX[_loc1_] = this.player.ATTACKARMSPOSX[_loc1_];
                                 this.player.ATTACKARMSPOSX[_loc1_] += Player.MACE_ICE_PPS / FPS * (1 + this.nLeakFrame);
                              }
                           }
                        }
                     }
                     if(!this.bGameMenu)
                     {
                        this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] += 1 + this.nLeakFrame;
                        if(int(this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] >> 1) >= 10)
                        {
                           if(this.player.ATTACKARMSPOSX[_loc1_] <= INITDATA || this.player.ATTACKARMSPOSX[_loc1_] > this.player.nBgPosX + Player.BG_W)
                           {
                              this.ope.initPlayerAttackObj(_loc1_);
                           }
                        }
                     }
                     break;
                  case MACE_LIGHT:
                     if(!this.bGameMenu)
                     {
                        if(!this.bBossDiaEvent && !this.bBossDialog)
                        {
                           this.nBeforeAtkFrame = this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK];
                           this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] += 1 + this.nLeakFrame;
                           if(this.nBeforeAtkFrame < LIGHT_ATTACKPOINT && this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] >= LIGHT_ATTACKPOINT)
                           {
                              this.ope.enemyDmg(_loc1_);
                           }
                           if(this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] >= this.player.MACEATTACKTOTALFRAME[this.player.ATTACKANI[_loc1_]])
                           {
                              this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] = 0;
                              this.player.ATTACKANI[_loc1_] = INITDATA;
                              this.player.ATTACKPOSX[_loc1_] = INITDATA;
                              this.player.ATTACKPOSY[_loc1_] = INITDATA;
                           }
                        }
                     }
                     break;
                  case MACE_FIRE:
                     if(!this.bGameMenu)
                     {
                        if(!this.bBossDiaEvent && !this.bBossDialog)
                        {
                           this.nBeforeAtkFrame = this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK];
                           this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] += 1 + this.nLeakFrame;
                           if(this.nBeforeAtkFrame < FIRE_ATTACKPOINT && this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] >= FIRE_ATTACKPOINT)
                           {
                              this.ope.enemyDmg(_loc1_);
                           }
                           if(this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] >= this.player.MACEATTACKTOTALFRAME[this.player.ATTACKANI[_loc1_]])
                           {
                              this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] = 0;
                              this.player.ATTACKANI[_loc1_] = INITDATA;
                              this.player.ATTACKPOSX[_loc1_] = INITDATA;
                              this.player.ATTACKPOSY[_loc1_] = INITDATA;
                           }
                        }
                     }
                     break;
                  case MACE_METEO:
                     if(!this.bGameMenu)
                     {
                        if(!this.bBossDiaEvent && !this.bBossDialog)
                        {
                           this.nBeforeAtkFrame = this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK];
                           this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] += 1 + this.nLeakFrame;
                           if(this.nBeforeAtkFrame < METEO_ATTACKPOINT && this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] >= METEO_ATTACKPOINT)
                           {
                              this.lib.playEffect(47);
                              this.ope.enemyDmg(_loc1_);
                           }
                           if(this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] >= this.player.MACEATTACKTOTALFRAME[this.player.ATTACKANI[_loc1_]])
                           {
                              this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] = 0;
                              this.player.ATTACKANI[_loc1_] = INITDATA;
                              this.player.ATTACKPOSX[_loc1_] = INITDATA;
                              this.player.ATTACKPOSY[_loc1_] = INITDATA;
                           }
                        }
                     }
                     break;
                  case MACE_WIND:
                     if(!this.bGameMenu)
                     {
                        if(!this.bBossDiaEvent && !this.bBossDialog)
                        {
                           this.nBeforeAtkFrame = this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK];
                           this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] += 1 + this.nLeakFrame;
                           if(this.nBeforeAtkFrame < WIND_ATTACKPOINT && this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] == WIND_ATTACKPOINT)
                           {
                              this.ope.enemyDmg(_loc1_);
                           }
                           if(this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] >= this.player.MACEATTACKTOTALFRAME[this.player.ATTACKANI[_loc1_]])
                           {
                              this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] = 0;
                              this.player.ATTACKANI[_loc1_] = INITDATA;
                              this.player.ATTACKPOSX[_loc1_] = INITDATA;
                              this.player.ATTACKPOSY[_loc1_] = INITDATA;
                           }
                        }
                     }
                     break;
                  case MACE_FOOD:
                     if(!this.bGameMenu)
                     {
                        if(!this.bBossDiaEvent && !this.bBossDialog)
                        {
                           this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] += 1 + this.nLeakFrame;
                           if(this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] >= this.player.MACEATTACKTOTALFRAME[this.player.ATTACKANI[_loc1_]])
                           {
                              this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] = 0;
                              this.player.ATTACKANI[_loc1_] = INITDATA;
                              this.player.ATTACKPOSX[_loc1_] = INITDATA;
                              this.player.ATTACKPOSY[_loc1_] = INITDATA;
                           }
                        }
                     }
                     break;
                  case MACE_POISON:
                     if(int(this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] >> 1) < 7)
                     {
                        this.lib.drawImgDodge(this.player.ARMSANIIMG[this.player.ATTACKANI[_loc1_] * Player.MACEACT_NUM + Player.MACEACT_EFFA] + int(this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] >> 1),this.player.ATTACKPOSX[_loc1_],this.player.ATTACKPOSY[_loc1_],BlendMode.ADD,BOTTOM | HCENTER);
                     }
                     if(this.player.ATTACKARMSPOSX[_loc1_] > INITDATA)
                     {
                        this.lib.drawImgDodge(this.player.ARMSANIIMG[this.player.ATTACKANI[_loc1_] * Player.MACEACT_NUM + Player.MACEACT_EFFB] + int(this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] >> 1) % 14,this.player.ATTACKARMSPOSX[_loc1_],this.player.ATTACKARMSPOSY[_loc1_],BlendMode.ADD,BOTTOM | HCENTER);
                        if(!this.bGameMenu)
                        {
                           if(!this.bBossDiaEvent && !this.bBossDialog)
                           {
                              this.ope.enemyDmg(_loc1_);
                              if(this.player.ATTACKARMSPOSX[_loc1_] > INITDATA)
                              {
                                 this.player.SUBATTACKARMSPOSX[_loc1_] = this.player.ATTACKARMSPOSX[_loc1_];
                                 this.player.ATTACKARMSPOSX[_loc1_] += Player.MACE_POISON_PPS / FPS * (1 + this.nLeakFrame);
                              }
                           }
                        }
                     }
                     if(!this.bGameMenu)
                     {
                        this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] += 1 + this.nLeakFrame;
                        if(int(this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] >> 1) >= 7)
                        {
                           if(this.player.ATTACKARMSPOSX[_loc1_] <= INITDATA || this.player.ATTACKARMSPOSX[_loc1_] > this.player.nBgPosX + Player.BG_W)
                           {
                              this.ope.initPlayerAttackObj(_loc1_);
                           }
                        }
                     }
               }
            }
         }
      }
      
      public function drawEnemy(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         if(this.ENEMY[param1].bFence)
         {
            this.ENEMY[param1]._nPosY = this.ENEMY[param1].nPosY;
            this.ENEMY[param1].nPosY += this.player.nBgEffPosY;
            this.lib.drawImgZoomAlpha(imgShadow,this.ENEMY[param1].nPosX,this.ENEMY[param1].nPosY - 3,20,20,60,VCENTER | HCENTER);
            this.lib.drawImg(imgDestiny,this.ENEMY[param1].nPosX,this.ENEMY[param1].nPosY,BOTTOM | HCENTER);
            this.ENEMY[param1].nPosY = this.ENEMY[param1]._nPosY;
         }
         else if(this.ENEMY[param1].bAppear)
         {
            _loc3_ = (Player.CHAIMG_HEIGHT * this.ENEMY[param1].nSizeScale / 100 >> 1) - Player.SHADOWIMG_POS * this.ENEMY[param1].nSizeScale / 100 - 10;
            _loc4_ = 0;
            this.ENEMY[param1]._nPosY = this.ENEMY[param1].nPosY;
            this.ENEMY[param1].nPosY += this.player.nBgEffPosY;
            if(this.player.nGameMode == MODE_WARROAD)
            {
               _loc3_ = (Player.CHAIMG_HEIGHT * this.ENEMY[param1].nSizeScale / 100 >> 1) - Player.SHADOWIMG_POS * this.ENEMY[param1].nSizeScale / 100 - 10;
            }
            if(this.ENEMY[param1].bAlive)
            {
               this.lib.drawImgZoomAlpha(imgShadow,this.ENEMY[param1].nPosX,this.ENEMY[param1].nPosY - _loc3_,this.player.ENEMYSHADOWWIDTH[this.ENEMY[param1].nBaseType] * this.ENEMY[param1].nSizeScale / 100,this.player.ENEMYSHADOWWIDTH[this.ENEMY[param1].nBaseType] * this.ENEMY[param1].nSizeScale / 100,60,VCENTER | HCENTER);
               if(this.ENEMY[param1].bMove)
               {
                  if(this.ENEMY[param1].bGhostMove)
                  {
                     _loc7_ = 0;
                     if(!this.ENEMY[param1].bInvisible)
                     {
                        this.player.nNowTime = getTimer();
                        _loc7_ = 100 - (this.player.nNowTime - this.ENEMY[param1].nGhostStartTime) * (1 + this.player.nGameSpeed) / 10;
                        if(_loc7_ <= 0)
                        {
                           _loc7_ = 0;
                        }
                     }
                     else if(this.ENEMY[param1].bVisible)
                     {
                        this.player.nNowTime = getTimer();
                        _loc7_ = (this.player.nNowTime - this.ENEMY[param1].nGhostStartTime) * (1 + this.player.nGameSpeed) / 10;
                        if(_loc7_ >= 100)
                        {
                           _loc7_ = 100;
                        }
                     }
                     _loc5_ = Player.ANI_WALK;
                     _loc6_ = int(this.ENEMY[param1].nStep);
                     if(Boolean(this.ENEMY[param1].bAttacked) && this.ope.bDrawDmgEff(Player.ENEMYATTACKED,param1))
                     {
                        this.lib.drawASEAniBoss(Ani_Boss01 + (this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE),_loc5_,this.BOSSIMG[this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE],_loc6_,this.ENEMY[param1].nPosX,this.ENEMY[param1].nPosY - 5,this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,true,BlendMode.ALPHA,_loc7_);
                     }
                     else
                     {
                        this.lib.drawASEAniBoss(Ani_Boss01 + (this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE),_loc5_,this.BOSSIMG[this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE],_loc6_,this.ENEMY[param1].nPosX,this.ENEMY[param1].nPosY - 5,this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,false,BlendMode.ALPHA,_loc7_);
                     }
                     this.drawAttackedEff(Player.ENEMYATTACKED,param1);
                     this.ope.resetAttacked(Player.ENEMYATTACKED,param1);
                     this.player.nNowTime = getTimer();
                     if((this.player.nNowTime - this.ENEMY[param1].nGhostStartTime) * (1 + this.player.nGameSpeed) >= this.ENEMY[param1].nGhostTime)
                     {
                        if(!this.ENEMY[param1].bInvisible)
                        {
                           this.ENEMY[param1].bInvisible = true;
                           this.ENEMY[param1].nGhostStartTime = getTimer();
                           this.ENEMY[param1].nGhostTime = 1000;
                        }
                        else if(!this.ENEMY[param1].bVisible)
                        {
                           this.ENEMY[param1].bVisible = true;
                           this.ENEMY[param1].nGhostStartTime = getTimer();
                           this.ENEMY[param1].nGhostTime = 1000;
                           this.ENEMY[param1].nPosX = 400 * Player.WEB_SCALE + this.lib.getRand(Player.BG_W - 450 * Player.WEB_SCALE) + this.player.nBgPosX;
                        }
                        else
                        {
                           this.ENEMY[param1].bGhostMove = false;
                           this.ENEMY[param1].bInvisible = false;
                           this.ENEMY[param1].bVisible = false;
                           this.ENEMY[param1].nGhostStartTime = INITDATA;
                           this.ENEMY[param1].nGhostTime = INITDATA;
                        }
                     }
                  }
                  else if(this.ENEMY[param1].bBabyGhostMove)
                  {
                     _loc8_ = 20;
                     if(!this.ENEMY[param1].bBabyInvisible)
                     {
                        this.player.nNowTime = getTimer();
                        _loc8_ = 100 - (this.player.nNowTime - this.ENEMY[param1].nBabyGhostStartTime) * (1 + this.player.nGameSpeed) / 12.5;
                        if(_loc8_ <= 20)
                        {
                           _loc8_ = 20;
                        }
                     }
                     else if(this.ENEMY[param1].bBabyVisible)
                     {
                        this.player.nNowTime = getTimer();
                        _loc8_ = (this.player.nNowTime - this.ENEMY[param1].nBabyGhostStartTime) * (1 + this.player.nGameSpeed) / 12.5 + 20;
                        if(_loc8_ >= 100)
                        {
                           _loc8_ = 100;
                        }
                     }
                     _loc6_ = this.ENEMYIMG[this.ENEMY[param1].nType * ENEMYIMG_TYPE] + this.ENEMY[param1].nStep;
                     if(Boolean(this.ENEMY[param1].bAttacked) && this.ope.bDrawDmgEff(Player.ENEMYATTACKED,param1))
                     {
                        this.lib.drawObjDmgZoomAlpha(_loc6_,this.ENEMY[param1].nPosX,this.ENEMY[param1].nPosY + 10,this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,_loc8_,BOTTOM | HCENTER);
                     }
                     else
                     {
                        this.lib.drawImgZoomAlpha(_loc6_,this.ENEMY[param1].nPosX,this.ENEMY[param1].nPosY + 10,this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,_loc8_,BOTTOM | HCENTER);
                     }
                     this.drawAttackedEff(Player.ENEMYATTACKED,param1);
                     this.ope.resetAttacked(Player.ENEMYATTACKED,param1);
                     if(!this.ENEMY[param1].bBabyGhostMoving)
                     {
                        this.player.nNowTime = getTimer();
                        if((this.player.nNowTime - this.ENEMY[param1].nBabyGhostStartTime) * (1 + this.player.nGameSpeed) >= this.ENEMY[param1].nBabyGhostTime)
                        {
                           if(!this.ENEMY[param1].bBabyInvisible)
                           {
                              this.ENEMY[param1].bBabyInvisible = true;
                              this.ENEMY[param1].nBabyGhostStartTime = getTimer();
                              this.ENEMY[param1].nBabyGhostTime = 1000;
                              this.ENEMY[param1].bBabyGhostMoving = true;
                           }
                           else if(!this.ENEMY[param1].bBabyVisible)
                           {
                              this.ENEMY[param1].bBabyVisible = true;
                              this.ENEMY[param1].nBabyGhostStartTime = getTimer();
                              this.ENEMY[param1].nBabyGhostTime = 1000;
                           }
                           else
                           {
                              this.ENEMY[param1].bBabyGhostMove = false;
                              this.ENEMY[param1].bBabyGhostMoving = false;
                              this.ENEMY[param1].bBabyInvisible = false;
                              this.ENEMY[param1].bBabyVisible = false;
                              this.ENEMY[param1].bBabyGhostMoveOk = true;
                              this.ENEMY[param1].nGhostStartTime = INITDATA;
                              this.ENEMY[param1].nGhostTime = INITDATA;
                              this.ENEMY[param1].nBabyGhostMoveDistance = INITDATA;
                           }
                        }
                     }
                     else if(this.player.nGameMode == MODE_WARROAD)
                     {
                        if(this.ENEMY[param1].nBabyGhostMoveDistance >= 118)
                        {
                           this.ENEMY[param1].bBabyGhostMoving = false;
                        }
                     }
                     else if(this.ENEMY[param1].nBabyGhostMoveDistance >= 237)
                     {
                        this.ENEMY[param1].bBabyGhostMoving = false;
                     }
                  }
                  else
                  {
                     if(this.ENEMY[param1].nBaseType >= ENEMY_BOSSZOMBIE)
                     {
                        _loc5_ = Player.ANI_WALK;
                        _loc6_ = int(this.ENEMY[param1].nStep);
                     }
                     else
                     {
                        _loc6_ = this.ENEMYIMG[this.ENEMY[param1].nType * ENEMYIMG_TYPE] + this.ENEMY[param1].nStep;
                     }
                     if(this.ENEMY[param1].nAttackDelayStartTime > INITDATA)
                     {
                        if(this.ENEMY[param1].bLastAttackFrame)
                        {
                           if(this.ENEMY[param1].nBaseType >= ENEMY_BOSSZOMBIE)
                           {
                              _loc5_ = Player.ANI_WAIT;
                              _loc6_ = this.nGameFrame % 24;
                           }
                           else
                           {
                              _loc6_ = this.ENEMYIMG[this.ENEMY[param1].nType * ENEMYIMG_TYPE + 1] + int(this.ENEMY[param1].nAtkTotalFrame - 1 >> 1);
                           }
                        }
                        else if(this.ENEMY[param1].bAttackReady)
                        {
                           if(this.ENEMY[param1].nBaseType >= ENEMY_BOSSZOMBIE)
                           {
                              _loc5_ = Player.ANI_WAIT;
                              _loc6_ = this.nGameFrame % 24;
                           }
                           else
                           {
                              _loc6_ = this.ENEMYIMG[this.ENEMY[param1].nType * ENEMYIMG_TYPE] + (this.ENEMY[param1].nMaxStep - 1);
                           }
                        }
                        this.player.nNowTime = getTimer();
                        if((this.player.nNowTime - this.ENEMY[param1].nAttackDelayStartTime) * (1 + this.player.nGameSpeed) >= this.ENEMY[param1].nAttackDelay)
                        {
                           this.ENEMY[param1].nAttackDelayStartTime = INITDATA;
                        }
                     }
                     if(this.ENEMY[param1].nBaseType >= ENEMY_BOSSZOMBIE)
                     {
                        if(this.ENEMY[param1].nBaseType == ENEMY_BOSSPALADOG)
                        {
                           if(this.bBossDialog)
                           {
                              this.lib.drawASEAniBoss(Ani_Boss01 + (this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE),Player.ANI_WAIT,this.BOSSIMG[this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE],this.nGameFrame % 24,this.ENEMY[param1].nPosX,this.ENEMY[param1].nPosY - 5,this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,false,BlendMode.ADD,100);
                           }
                           else if(Boolean(this.ENEMY[param1].bAttacked) && this.ope.bDrawDmgEff(Player.ENEMYATTACKED,param1))
                           {
                              this.lib.drawASEAniBoss(Ani_Boss01 + (this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE),_loc5_,this.BOSSIMG[this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE],_loc6_,this.ENEMY[param1].nPosX,this.ENEMY[param1].nPosY - 5,this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,true,BlendMode.ADD,100);
                           }
                           else
                           {
                              this.lib.drawASEAniBoss(Ani_Boss01 + (this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE),_loc5_,this.BOSSIMG[this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE],_loc6_,this.ENEMY[param1].nPosX,this.ENEMY[param1].nPosY - 5,this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,false,BlendMode.ADD,100);
                           }
                        }
                        else if(this.bBossDialog)
                        {
                           this.lib.drawASEAniBoss(Ani_Boss01 + (this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE),Player.ANI_WAIT,this.BOSSIMG[this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE],this.nGameFrame % 24,this.ENEMY[param1].nPosX,this.ENEMY[param1].nPosY - 5,this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,false,BlendMode.ALPHA,100);
                        }
                        else if(Boolean(this.ENEMY[param1].bAttacked) && this.ope.bDrawDmgEff(Player.ENEMYATTACKED,param1))
                        {
                           this.lib.drawASEAniBoss(Ani_Boss01 + (this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE),_loc5_,this.BOSSIMG[this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE],_loc6_,this.ENEMY[param1].nPosX,this.ENEMY[param1].nPosY - 5,this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,true,BlendMode.ALPHA,100);
                        }
                        else
                        {
                           this.lib.drawASEAniBoss(Ani_Boss01 + (this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE),_loc5_,this.BOSSIMG[this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE],_loc6_,this.ENEMY[param1].nPosX,this.ENEMY[param1].nPosY - 5,this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,false,BlendMode.ALPHA,100);
                        }
                     }
                     else if(Boolean(this.ENEMY[param1].bAttacked) && this.ope.bDrawDmgEff(Player.ENEMYATTACKED,param1))
                     {
                        this.lib.drawObjDmgZoom(_loc6_,this.ENEMY[param1].nPosX,this.ENEMY[param1].nPosY + 10,this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,BOTTOM | HCENTER);
                     }
                     else
                     {
                        this.lib.drawImgZoom(_loc6_,this.ENEMY[param1].nPosX,this.ENEMY[param1].nPosY + 10,this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,BOTTOM | HCENTER);
                     }
                     this.drawAttackedEff(Player.ENEMYATTACKED,param1);
                     this.ope.resetAttacked(Player.ENEMYATTACKED,param1);
                  }
               }
               else if(this.ENEMY[param1].bKnockDown)
               {
                  if(this.ENEMY[param1].nKnockDownAniFrame < this.player.ENEMYKNOCKDOWNTOTALFRAME[this.ENEMY[param1].nBaseType])
                  {
                     if(this.ENEMY[param1].nBaseType >= ENEMY_BOSSZOMBIE)
                     {
                        _loc5_ = Player.ANI_DEAD;
                        _loc6_ = int(this.ENEMY[param1].nKnockDownAniFrame);
                     }
                     else
                     {
                        _loc6_ = this.ENEMYIMG[this.ENEMY[param1].nType * ENEMYIMG_TYPE + 2] + int(this.ENEMY[param1].nKnockDownAniFrame >> 1);
                     }
                     if(!this.bGameMenu)
                     {
                        this.ope.enemyKnockBack(param1,this.ENEMY[param1].nKnockDownDistance);
                        this.ENEMY[param1].nKnockDownAniFrame += 1 + this.nLeakFrame;
                        if(this.ENEMY[param1].nKnockDownAniFrame >= this.player.ENEMYKNOCKDOWNTOTALFRAME[this.ENEMY[param1].nBaseType])
                        {
                           this.ENEMY[param1].nKnockDownTime = getTimer();
                        }
                     }
                  }
                  else
                  {
                     if(this.ENEMY[param1].nBaseType >= ENEMY_BOSSZOMBIE)
                     {
                        _loc5_ = Player.ANI_DEAD;
                        _loc6_ = int(this.player.ENEMYKNOCKDOWNTOTALFRAME[this.ENEMY[param1].nBaseType] - 1);
                     }
                     else
                     {
                        _loc6_ = this.ENEMYIMG[this.ENEMY[param1].nType * ENEMYIMG_TYPE + 2] + int(this.player.ENEMYKNOCKDOWNTOTALFRAME[this.ENEMY[param1].nBaseType] - 1 >> 1);
                     }
                     this.player.nNowTime = getTimer();
                     if((this.player.nNowTime - this.ENEMY[param1].nKnockDownTime) * (1 + this.player.nGameSpeed) >= 3000)
                     {
                        this.ENEMY[param1].bMove = true;
                        this.ENEMY[param1].bKnockDown = false;
                        this.ENEMY[param1].nKnockDownDistance = 0;
                        this.ENEMY[param1].nKnockDownAniFrame = 0;
                     }
                  }
                  if(this.ENEMY[param1].nBaseType >= ENEMY_BOSSZOMBIE)
                  {
                     if(this.ENEMY[param1].nBaseType == ENEMY_BOSSPALADOG)
                     {
                        if(Boolean(this.ENEMY[param1].bAttacked) && this.ope.bDrawDmgEff(Player.ENEMYATTACKED,param1))
                        {
                           this.lib.drawASEAniBoss(Ani_Boss01 + (this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE),_loc5_,this.BOSSIMG[this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE],_loc6_,this.ENEMY[param1].nPosX,this.ENEMY[param1].nPosY - 5,this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,true,BlendMode.ADD,100);
                        }
                        else
                        {
                           this.lib.drawASEAniBoss(Ani_Boss01 + (this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE),_loc5_,this.BOSSIMG[this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE],_loc6_,this.ENEMY[param1].nPosX,this.ENEMY[param1].nPosY - 5,this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,false,BlendMode.ADD,100);
                        }
                     }
                     else if(Boolean(this.ENEMY[param1].bAttacked) && this.ope.bDrawDmgEff(Player.ENEMYATTACKED,param1))
                     {
                        this.lib.drawASEAniBoss(Ani_Boss01 + (this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE),_loc5_,this.BOSSIMG[this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE],_loc6_,this.ENEMY[param1].nPosX,this.ENEMY[param1].nPosY - 5,this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,true,BlendMode.ALPHA,100);
                     }
                     else
                     {
                        this.lib.drawASEAniBoss(Ani_Boss01 + (this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE),_loc5_,this.BOSSIMG[this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE],_loc6_,this.ENEMY[param1].nPosX,this.ENEMY[param1].nPosY - 5,this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,false,BlendMode.ALPHA,100);
                     }
                  }
                  else if(Boolean(this.ENEMY[param1].bAttacked) && this.ope.bDrawDmgEff(Player.ENEMYATTACKED,param1))
                  {
                     this.lib.drawObjDmgZoom(_loc6_,this.ENEMY[param1].nPosX,this.ENEMY[param1].nPosY + 10,this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,BOTTOM | HCENTER);
                  }
                  else
                  {
                     this.lib.drawImgZoom(_loc6_,this.ENEMY[param1].nPosX,this.ENEMY[param1].nPosY + 10,this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,BOTTOM | HCENTER);
                  }
                  this.drawAttackedEff(Player.ENEMYATTACKED,param1);
                  this.ope.resetAttacked(Player.ENEMYATTACKED,param1);
                  if(this.ENEMY[param1].nKnockDownAniFrame >= this.player.ENEMYKNOCKDOWNTOTALFRAME[this.ENEMY[param1].nBaseType])
                  {
                     this.lib.drawImgDodge(imgStun + int((this.nGameFrame >> 1) % 16),this.ENEMY[param1].nPosX,this.ENEMY[param1].nPosY + 30,BlendMode.ADD,BOTTOM | HCENTER);
                  }
               }
               else if(this.ENEMY[param1].bAttack)
               {
                  this.ope.enemyAtkSnd(param1);
                  if(this.ENEMY[param1].nBaseType >= ENEMY_BOSSZOMBIE)
                  {
                     _loc5_ = Player.ANI_ATT;
                     _loc6_ = int(this.ENEMY[param1].nAtkFrame);
                     if(this.ENEMY[param1].nBaseType == ENEMY_BOSSPALADOG)
                     {
                        if(Boolean(this.ENEMY[param1].bAttacked) && this.ope.bDrawDmgEff(Player.ENEMYATTACKED,param1))
                        {
                           this.lib.drawASEAniBoss(Ani_Boss01 + (this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE),_loc5_,this.BOSSIMG[this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE],_loc6_,this.ENEMY[param1].nPosX,this.ENEMY[param1].nPosY - 5,this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,true,BlendMode.ADD,100);
                        }
                        else
                        {
                           this.lib.drawASEAniBoss(Ani_Boss01 + (this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE),_loc5_,this.BOSSIMG[this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE],_loc6_,this.ENEMY[param1].nPosX,this.ENEMY[param1].nPosY - 5,this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,false,BlendMode.ADD,100);
                        }
                     }
                     else if(Boolean(this.ENEMY[param1].bAttacked) && this.ope.bDrawDmgEff(Player.ENEMYATTACKED,param1))
                     {
                        this.lib.drawASEAniBoss(Ani_Boss01 + (this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE),_loc5_,this.BOSSIMG[this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE],_loc6_,this.ENEMY[param1].nPosX,this.ENEMY[param1].nPosY - 5,this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,true,BlendMode.ALPHA,100);
                     }
                     else
                     {
                        this.lib.drawASEAniBoss(Ani_Boss01 + (this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE),_loc5_,this.BOSSIMG[this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE],_loc6_,this.ENEMY[param1].nPosX,this.ENEMY[param1].nPosY - 5,this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,false,BlendMode.ALPHA,100);
                     }
                  }
                  else
                  {
                     _loc6_ = this.ENEMYIMG[this.ENEMY[param1].nType * ENEMYIMG_TYPE + 1] + int(this.ENEMY[param1].nAtkFrame >> 1);
                     if(Boolean(this.ENEMY[param1].bAttacked) && this.ope.bDrawDmgEff(Player.ENEMYATTACKED,param1))
                     {
                        this.lib.drawObjDmgZoom(_loc6_,this.ENEMY[param1].nPosX,this.ENEMY[param1].nPosY + 10,this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,BOTTOM | HCENTER);
                     }
                     else
                     {
                        this.lib.drawImgZoom(_loc6_,this.ENEMY[param1].nPosX,this.ENEMY[param1].nPosY + 10,this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,BOTTOM | HCENTER);
                     }
                  }
                  this.drawAttackedEff(Player.ENEMYATTACKED,param1);
                  this.ope.resetAttacked(Player.ENEMYATTACKED,param1);
                  if(this.ENEMY[param1].nBaseType == ENEMY_BOSSDRAGON)
                  {
                     if(this.ENEMY[param1].nAtkFrame >= 16 && this.ENEMY[param1].nAtkFrame <= 27)
                     {
                        this.lib.drawImgZoomDodge(imgEnemyBoss08Fire + int(this.ENEMY[param1].nAtkFrame - 16 >> 1),this.ENEMY[param1].nPosX,this.ENEMY[param1].nPosY + 10,this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,BlendMode.ADD,BOTTOM | HCENTER);
                     }
                  }
                  if(!this.bGameMenu)
                  {
                     this.nBeforeAtkFrame = this.ENEMY[param1].nAtkFrame;
                     this.ENEMY[param1].nAtkFrame += 1 + this.nLeakFrame;
                     if(this.nBeforeAtkFrame < this.player.ENEMYATTACKFRAME[this.ENEMY[param1].nBaseType] && this.ENEMY[param1].nAtkFrame >= this.player.ENEMYATTACKFRAME[this.ENEMY[param1].nBaseType])
                     {
                        this.ope.dmgFromEnemy(param1,false,INITDATA);
                     }
                     if(this.ENEMY[param1].nAtkFrame >= this.ENEMY[param1].nAtkTotalFrame)
                     {
                        this.ENEMY[param1].nAttackDelayStartTime = getTimer();
                        if(this.ENEMY[param1].nBaseType == ENEMY_STONE || this.ENEMY[param1].nBaseType == ENEMY_ARMORSHIELD)
                        {
                           this.ENEMY[param1].bDefense = true;
                        }
                        this.ENEMY[param1].nAtkFrame = 0;
                        this.ENEMY[param1].bAttack = false;
                        this.ENEMY[param1].bMove = true;
                        this.ENEMY[param1].bLastAttackFrame = true;
                        this.ENEMY[param1].bAttackReady = false;
                     }
                  }
               }
               if(this.ENEMY[param1].bIce)
               {
                  if(this.ENEMY[param1].nBaseType >= ENEMY_BOSSZOMBIE)
                  {
                     _loc5_ = Player.ANI_WALK;
                     _loc6_ = int(this.ENEMY[param1].nStep);
                     if(this.ENEMY[param1].nBaseType == ENEMY_BOSSPALADOG)
                     {
                        if(Boolean(this.ENEMY[param1].bAttacked) && this.ope.bDrawDmgEff(Player.ENEMYATTACKED,param1))
                        {
                           this.lib.drawASEAniBoss(Ani_Boss01 + (this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE),_loc5_,this.BOSSIMG[this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE],_loc6_,this.ENEMY[param1].nPosX,this.ENEMY[param1].nPosY - 5,this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,true,BlendMode.ADD,100);
                        }
                        else
                        {
                           this.lib.drawASEAniBoss(Ani_Boss01 + (this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE),_loc5_,this.BOSSIMG[this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE],_loc6_,this.ENEMY[param1].nPosX,this.ENEMY[param1].nPosY - 5,this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,false,BlendMode.ADD,100);
                        }
                     }
                     else if(Boolean(this.ENEMY[param1].bAttacked) && this.ope.bDrawDmgEff(Player.ENEMYATTACKED,param1))
                     {
                        this.lib.drawASEAniBoss(Ani_Boss01 + (this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE),_loc5_,this.BOSSIMG[this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE],_loc6_,this.ENEMY[param1].nPosX,this.ENEMY[param1].nPosY - 5,this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,true,BlendMode.ALPHA,100);
                     }
                     else
                     {
                        this.lib.drawASEAniBoss(Ani_Boss01 + (this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE),_loc5_,this.BOSSIMG[this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE],_loc6_,this.ENEMY[param1].nPosX,this.ENEMY[param1].nPosY - 5,this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,false,BlendMode.ALPHA,100);
                     }
                  }
                  else if(!this.ENEMY[param1].bKnockDown)
                  {
                     _loc6_ = this.ENEMYIMG[this.ENEMY[param1].nType * ENEMYIMG_TYPE] + this.ENEMY[param1].nStep;
                     if(Boolean(this.ENEMY[param1].bAttacked) && this.ope.bDrawDmgEff(Player.ENEMYATTACKED,param1))
                     {
                        this.lib.drawObjDmgZoom(_loc6_,this.ENEMY[param1].nPosX,this.ENEMY[param1].nPosY + 10,this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,BOTTOM | HCENTER);
                     }
                     else
                     {
                        this.lib.drawObjIceDmgZoom(_loc6_,this.ENEMY[param1].nPosX,this.ENEMY[param1].nPosY + 10,this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,BOTTOM | HCENTER);
                     }
                  }
                  this.drawAttackedEff(Player.ENEMYATTACKED,param1);
                  this.ope.resetAttacked(Player.ENEMYATTACKED,param1);
                  if(this.ENEMY[param1].nIceAniFrame < this.player.ENEMYDAMAGETOTALFRAME[MACE_ICE])
                  {
                     this.lib.drawImgZoomDodge(imgIce + int(this.ENEMY[param1].nIceAniFrame >> 1),this.ENEMY[param1].nPosX,this.ENEMY[param1].nPosY + 10,this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,BlendMode.ADD,BOTTOM | HCENTER);
                     if(!this.bGameMenu)
                     {
                        this.ENEMY[param1].nIceAniFrame += 1 + this.nLeakFrame;
                        if(this.ENEMY[param1].nIceAniFrame >= this.player.ENEMYDAMAGETOTALFRAME[MACE_ICE])
                        {
                           this.ENEMY[param1].nIceAniFrame = this.player.ENEMYDAMAGETOTALFRAME[MACE_ICE];
                        }
                     }
                  }
                  else
                  {
                     this.lib.drawImgZoomDodge(imgIce + int(this.ENEMY[param1].nIceAniFrame - 1 >> 1),this.ENEMY[param1].nPosX,this.ENEMY[param1].nPosY + 10,this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,BlendMode.ADD,BOTTOM | HCENTER);
                  }
                  this.player.nNowTime = getTimer();
                  if((this.player.nNowTime - this.ENEMY[param1].nIceStartTime) * (1 + this.player.nGameSpeed) >= this.ENEMY[param1].nIceTime)
                  {
                     this.ENEMY[param1].bMove = true;
                     this.ENEMY[param1].bIce = false;
                     this.ENEMY[param1].nIceStartTime = INITDATA;
                     this.ENEMY[param1].nIceTime = INITDATA;
                     this.ENEMY[param1].nIceAniFrame = 0;
                  }
               }
               if(this.ENEMY[param1].bPoison)
               {
                  this.lib.drawImgDodge(this.player.ARMSANIIMG[MACE_POISON * Player.MACEACT_NUM + Player.MACEACT_EFFC] + int((this.nGameFrame >> 1) % 29),this.ENEMY[param1].nPosX,this.ENEMY[param1].nPosY,BlendMode.ADD,BOTTOM | HCENTER);
                  this.player.nNowTime = getTimer();
                  _loc9_ = (this.player.nNowTime - this.ENEMY[param1].nPoisonDpsTime) * (1 + this.player.nGameSpeed);
                  _loc9_ = 1000 / _loc9_;
                  _loc9_ = this.ENEMY[param1].nPoisonDps / _loc9_;
                  this.ENEMY[param1].nHp -= _loc9_;
                  this.ENEMY[param1].nPoisonDpsTime = getTimer();
                  if(this.ENEMY[param1].nHp <= 1)
                  {
                     this.ENEMY[param1].nHp = 1;
                     this.ope.detoxication(Player.ENEMYATTACKED,param1);
                  }
                  if((this.player.nNowTime - this.ENEMY[param1].nPoisonStartTime) * (1 + this.player.nGameSpeed) >= this.ENEMY[param1].nPoisonTime)
                  {
                     this.ope.detoxication(Player.ENEMYATTACKED,param1);
                  }
               }
               if(this.ENEMY[param1].nBaseType == ENEMY_BOSSMANDEVIL)
               {
                  this.lib.drawImgZoomDodge(imgEnemyBoss10Eff + int((this.nGameFrame >> 1) % 9),this.ENEMY[param1].nPosX,this.ENEMY[param1].nPosY + 10,this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,BlendMode.ADD,BOTTOM | HCENTER);
               }
               if(this.ENEMY[param1].nHp < this.ENEMY[param1].nMaxHp)
               {
                  if(this.ENEMY[param1].nBaseType == ENEMY_BOSSBIGMOUTH && Boolean(this.ENEMY[param1].bAttack))
                  {
                     this.lib.fillRect(this.ENEMY[param1].nPosX - (40 * this.ENEMY[param1].nSizeScale / 100 >> 1),this.ENEMY[param1].nPosY - 102 * this.ENEMY[param1].nSizeScale / 100,40 * this.ENEMY[param1].nSizeScale / 100,3,14474460,TOP | LEFT);
                     this.lib.fillRect(this.ENEMY[param1].nPosX - (40 * this.ENEMY[param1].nSizeScale / 100 >> 1),this.ENEMY[param1].nPosY - 102 * this.ENEMY[param1].nSizeScale / 100,40 * this.ENEMY[param1].nSizeScale / 100 * this.ENEMY[param1].nHp / this.ENEMY[param1].nMaxHp,3,16711680,TOP | LEFT);
                  }
                  else if(!this.ENEMY[param1].bGhostMove && !this.ENEMY[param1].bBabyGhostMove)
                  {
                     this.lib.fillRect(this.ENEMY[param1].nPosX - (40 * this.ENEMY[param1].nSizeScale / 100 >> 1),this.ENEMY[param1].nPosY - this.player.ENEMYHPGAGEPOS[this.ENEMY[param1].nBaseType] * this.ENEMY[param1].nSizeScale / 100,40 * this.ENEMY[param1].nSizeScale / 100,3,14474460,TOP | LEFT);
                     this.lib.fillRect(this.ENEMY[param1].nPosX - (40 * this.ENEMY[param1].nSizeScale / 100 >> 1),this.ENEMY[param1].nPosY - this.player.ENEMYHPGAGEPOS[this.ENEMY[param1].nBaseType] * this.ENEMY[param1].nSizeScale / 100,40 * this.ENEMY[param1].nSizeScale / 100 * this.ENEMY[param1].nHp / this.ENEMY[param1].nMaxHp,3,16711680,TOP | LEFT);
                  }
               }
               switch(this.ENEMY[param1].nBaseType)
               {
                  case ENEMY_BOSSPALADOG:
                     _loc2_ = 0;
                     while(_loc2_ < Enemy.MAX_ENEMYATTACK)
                     {
                        if(this.ENEMY[param1].ATTACKANI[_loc2_] > INITDATA)
                        {
                           if(int(this.ENEMY[param1].ATTACKANI[_loc2_ + Enemy.MAX_ENEMYATTACK] >> 1) < 14)
                           {
                              this.lib.drawImgZoomDodge(imgEnemyBoss07Effa + int(this.ENEMY[param1].ATTACKANI[_loc2_ + Enemy.MAX_ENEMYATTACK] >> 1),this.ENEMY[param1].ATTACKPOSX[_loc2_],this.ENEMY[param1].ATTACKPOSY[_loc2_],this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,BlendMode.ADD,BOTTOM | HCENTER);
                           }
                        }
                        _loc2_++;
                     }
                     break;
                  case ENEMY_WOMANSKELETON:
                  case ENEMY_MANSKELETON:
                  case ENEMY_ONEEYEDMONSTER:
                  case ENEMY_BOSSWOMANDEVIL:
                     _loc2_ = 0;
                     while(_loc2_ < Enemy.MAX_ENEMYATTACK)
                     {
                        if(this.ENEMY[param1].ATTACKANI[_loc2_] > INITDATA)
                        {
                           if(this.ENEMY[param1].ATTACKARMSPOSX[_loc2_] > INITDATA)
                           {
                              if(this.ENEMY[param1].nBaseType == ENEMY_WOMANSKELETON)
                              {
                                 if(this.ENEMY[param1].nType == ENEMY_WOMANSKELETON)
                                 {
                                    this.lib.drawImgZoom(imgEnemyE02Arms + int(this.ENEMY[param1].ATTACKANI[_loc2_ + Enemy.MAX_ENEMYATTACK] >> 1) % 4,this.ENEMY[param1].ATTACKARMSPOSX[_loc2_],this.ENEMY[param1].ATTACKARMSPOSY[_loc2_],this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,BOTTOM | HCENTER);
                                 }
                                 else
                                 {
                                    this.lib.drawImgZoom(imgEnemyE22Arms + int(this.ENEMY[param1].ATTACKANI[_loc2_ + Enemy.MAX_ENEMYATTACK] >> 1) % 4,this.ENEMY[param1].ATTACKARMSPOSX[_loc2_],this.ENEMY[param1].ATTACKARMSPOSY[_loc2_],this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,BOTTOM | HCENTER);
                                 }
                              }
                              else if(this.ENEMY[param1].nBaseType == ENEMY_MANSKELETON)
                              {
                                 if(this.ENEMY[param1].nType == ENEMY_MANSKELETON)
                                 {
                                    this.lib.drawImgZoom(imgEnemyE06Arms,this.ENEMY[param1].ATTACKARMSPOSX[_loc2_],this.ENEMY[param1].ATTACKARMSPOSY[_loc2_],this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,BOTTOM | HCENTER);
                                 }
                                 else
                                 {
                                    this.lib.drawImgZoom(imgEnemyE26Arms,this.ENEMY[param1].ATTACKARMSPOSX[_loc2_],this.ENEMY[param1].ATTACKARMSPOSY[_loc2_],this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,BOTTOM | HCENTER);
                                 }
                              }
                              else if(this.ENEMY[param1].nBaseType == ENEMY_BOSSWOMANDEVIL)
                              {
                                 this.lib.drawImgZoomDodge(imgEnemyBoss09Arms + int(this.ENEMY[param1].ATTACKANI[_loc2_ + Enemy.MAX_ENEMYATTACK] >> 1) % 20,this.ENEMY[param1].ATTACKARMSPOSX[_loc2_],this.ENEMY[param1].ATTACKARMSPOSY[_loc2_],this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,BlendMode.ADD,BOTTOM | HCENTER);
                              }
                              else if(this.ENEMY[param1].nBaseType == ENEMY_ONEEYEDMONSTER)
                              {
                                 if(this.ENEMY[param1].nType == ENEMY_ONEEYEDMONSTER)
                                 {
                                    this.lib.drawImgZoomDodge(imgEnemyE18Arms,this.ENEMY[param1].ATTACKARMSPOSX[_loc2_],this.ENEMY[param1].ATTACKARMSPOSY[_loc2_],this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,BlendMode.ADD,BOTTOM | HCENTER);
                                 }
                                 else
                                 {
                                    this.lib.drawImgZoomDodge(imgEnemyE38Arms,this.ENEMY[param1].ATTACKARMSPOSX[_loc2_],this.ENEMY[param1].ATTACKARMSPOSY[_loc2_],this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,BlendMode.ADD,BOTTOM | HCENTER);
                                 }
                              }
                              if(!this.bGameMenu)
                              {
                                 this.ope.dmgFromEnemy(param1,true,_loc2_);
                                 if(this.ENEMY[param1].ATTACKARMSPOSX[_loc2_] > INITDATA)
                                 {
                                    this.ENEMY[param1].SUBATTACKARMSPOSX[_loc2_] = this.ENEMY[param1].ATTACKARMSPOSX[_loc2_];
                                    if(this.ENEMY[param1].nBaseType == ENEMY_WOMANSKELETON)
                                    {
                                       _loc4_ = 150 * Player.WEB_SCALE / FPS;
                                    }
                                    else if(this.ENEMY[param1].nBaseType == ENEMY_MANSKELETON)
                                    {
                                       _loc4_ = 400 * Player.WEB_SCALE / FPS;
                                    }
                                    else if(this.ENEMY[param1].nBaseType == ENEMY_BOSSWOMANDEVIL)
                                    {
                                       _loc4_ = 150 * Player.WEB_SCALE / FPS;
                                    }
                                    else if(this.ENEMY[param1].nBaseType == ENEMY_ONEEYEDMONSTER)
                                    {
                                       _loc4_ = 800 * Player.WEB_SCALE / FPS;
                                    }
                                    if(this.player.nGameMode == MODE_WARROAD)
                                    {
                                       _loc4_ >>= 1;
                                    }
                                    this.ENEMY[param1].ATTACKARMSPOSX[_loc2_] -= _loc4_ * (1 + this.nLeakFrame);
                                 }
                              }
                           }
                           if(!this.bGameMenu)
                           {
                              this.ENEMY[param1].ATTACKANI[_loc2_ + Enemy.MAX_ENEMYATTACK] += 1 + this.nLeakFrame;
                              if(this.ENEMY[param1].ATTACKARMSPOSX[_loc2_] <= INITDATA || this.ENEMY[param1].ATTACKARMSPOSX[_loc2_] < this.player.nBgPosX)
                              {
                                 this.ope.resetEnemyAttack(param1,_loc2_);
                              }
                           }
                        }
                        _loc2_++;
                     }
                     break;
                  case ENEMY_DARKZOMBIE:
                     _loc2_ = 0;
                     while(_loc2_ < Enemy.MAX_ENEMYATTACK)
                     {
                        if(this.ENEMY[param1].ATTACKANI[_loc2_] > INITDATA)
                        {
                           if(int(this.ENEMY[param1].ATTACKANI[_loc2_ + Enemy.MAX_ENEMYATTACK] >> 1) <= 14)
                           {
                              if(this.ENEMY[param1].nType == ENEMY_DARKZOMBIE)
                              {
                                 this.lib.drawImgZoomDodge(imgEnemyE10Arms + int(this.ENEMY[param1].ATTACKANI[_loc2_ + Enemy.MAX_ENEMYATTACK] >> 1) % 15,this.ENEMY[param1].ATTACKARMSPOSX[_loc2_],this.ENEMY[param1].ATTACKARMSPOSY[_loc2_],this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,BlendMode.NORMAL,BOTTOM | HCENTER);
                              }
                              else
                              {
                                 this.lib.drawImgZoomDodge(imgEnemyE30Arms + int(this.ENEMY[param1].ATTACKANI[_loc2_ + Enemy.MAX_ENEMYATTACK] >> 1) % 15,this.ENEMY[param1].ATTACKARMSPOSX[_loc2_],this.ENEMY[param1].ATTACKARMSPOSY[_loc2_],this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,BlendMode.NORMAL,BOTTOM | HCENTER);
                              }
                              if(!this.bGameMenu)
                              {
                                 this.ENEMY[param1].SUBATTACKARMSPOSX[_loc2_] = this.ENEMY[param1].ATTACKARMSPOSX[_loc2_];
                                 this.ENEMY[param1].ATTACKARMSPOSX[_loc2_] -= this.ENEMY[param1].ATTACKARRIVEPOS[_loc2_] / (FPS >> 1) * (1 + this.nLeakFrame);
                              }
                           }
                           if(!this.bGameMenu)
                           {
                              this.nBeforeAtkFrame = this.ENEMY[param1].ATTACKANI[_loc2_ + Enemy.MAX_ENEMYATTACK];
                              this.ENEMY[param1].ATTACKANI[_loc2_ + Enemy.MAX_ENEMYATTACK] += 1 + this.nLeakFrame;
                              if(this.nBeforeAtkFrame < 30 && this.ENEMY[param1].ATTACKANI[_loc2_ + Enemy.MAX_ENEMYATTACK] >= 30)
                              {
                                 this.ope.dmgFromEnemy(param1,true,_loc2_);
                              }
                              if(this.ENEMY[param1].ATTACKANI[_loc2_ + Enemy.MAX_ENEMYATTACK] > 30)
                              {
                                 this.ope.resetEnemyAttack(param1,_loc2_);
                              }
                           }
                        }
                        _loc2_++;
                     }
                     break;
                  case ENEMY_BOSSZOMBIE:
                  case ENEMY_BOSSMUMMY:
                     _loc2_ = 0;
                     while(_loc2_ < Enemy.MAX_ENEMYATTACK)
                     {
                        if(this.ENEMY[param1].ATTACKANI[_loc2_] > INITDATA)
                        {
                           _loc10_ = imgEnemyBoss01Eff;
                           if(this.ENEMY[param1].nBaseType == ENEMY_BOSSMUMMY)
                           {
                              _loc10_ = imgEnemyBoss04Eff;
                           }
                           if(int(this.ENEMY[param1].ATTACKANI[_loc2_ + Enemy.MAX_ENEMYATTACK] >> 1) <= 14)
                           {
                              this.lib.drawImgDodge(_loc10_ + int(this.ENEMY[param1].ATTACKANI[_loc2_ + Enemy.MAX_ENEMYATTACK] >> 1) % 15,this.ENEMY[param1].ATTACKPOSX[_loc2_],this.ENEMY[param1].ATTACKPOSY[_loc2_],BlendMode.NORMAL,BOTTOM | HCENTER);
                           }
                           if(!this.bGameMenu)
                           {
                              this.ENEMY[param1].ATTACKANI[_loc2_ + Enemy.MAX_ENEMYATTACK] += 1 + this.nLeakFrame;
                              if(this.ENEMY[param1].ATTACKANI[_loc2_ + Enemy.MAX_ENEMYATTACK] > 30)
                              {
                                 this.ope.resetEnemyAttack(param1,_loc2_);
                              }
                           }
                        }
                        _loc2_++;
                     }
               }
               this.ope.drawEnemyMaceDmg(param1);
            }
            else if(this.ENEMY[param1].bBomb)
            {
               switch(this.ENEMY[param1].nBaseType)
               {
                  case ENEMY_BOMB:
                     _loc2_ = 0;
                     while(_loc2_ < Enemy.MAX_ENEMYATTACK)
                     {
                        if(this.ENEMY[param1].ATTACKANI[_loc2_] > INITDATA)
                        {
                           this.lib.drawImgZoomDodge(imgExplosion_s + int(this.ENEMY[param1].ATTACKANI[_loc2_ + Enemy.MAX_ENEMYATTACK] >> 1),this.ENEMY[param1].ATTACKPOSX[_loc2_],this.ENEMY[param1].ATTACKPOSY[_loc2_],this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,BlendMode.NORMAL,BOTTOM | HCENTER);
                           if(!this.bGameMenu)
                           {
                              this.nBeforeAtkFrame = this.ENEMY[param1].ATTACKANI[_loc2_ + Enemy.MAX_ENEMYATTACK];
                              this.ENEMY[param1].ATTACKANI[_loc2_ + Enemy.MAX_ENEMYATTACK] += 1 + this.nLeakFrame;
                              if(this.nBeforeAtkFrame < 1 && this.ENEMY[param1].ATTACKANI[_loc2_ + Enemy.MAX_ENEMYATTACK] >= 1)
                              {
                                 this.ope.dmgFromEnemy(param1,true,_loc2_);
                              }
                              if(this.ENEMY[param1].ATTACKANI[_loc2_ + Enemy.MAX_ENEMYATTACK] > 30)
                              {
                                 this.ope.resetEnemyAttack(param1,_loc2_);
                              }
                           }
                        }
                        _loc2_++;
                     }
               }
            }
            else if(this.ENEMY[param1].bDieAni)
            {
               if(!this.bGameMenu)
               {
                  if(this.ENEMY[param1].nDieFrame == 0)
                  {
                     this.lib.playEffect(this.player.ENEMYDIESOUND[this.ENEMY[param1].nBaseType]);
                  }
               }
               if(this.ENEMY[param1].nDieFrame < this.player.ENEMYKNOCKDOWNTOTALFRAME[this.ENEMY[param1].nBaseType])
               {
                  this.lib.drawImgZoomAlpha(imgShadow,this.ENEMY[param1].nPosX,this.ENEMY[param1].nPosY - _loc3_,this.player.ENEMYSHADOWWIDTH[this.ENEMY[param1].nBaseType] * this.ENEMY[param1].nSizeScale / 100,this.player.ENEMYSHADOWWIDTH[this.ENEMY[param1].nBaseType] * this.ENEMY[param1].nSizeScale / 100,60,VCENTER | HCENTER);
                  if(this.ENEMY[param1].nBaseType >= ENEMY_BOSSZOMBIE)
                  {
                     _loc5_ = Player.ANI_DEAD;
                     _loc6_ = int(this.ENEMY[param1].nDieFrame);
                     if(this.ENEMY[param1].nBaseType == ENEMY_BOSSPALADOG)
                     {
                        if(Boolean(this.ENEMY[param1].bAttacked) && this.ope.bDrawDmgEff(Player.ENEMYATTACKED,param1))
                        {
                           this.lib.drawASEAniBoss(Ani_Boss01 + (this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE),_loc5_,this.BOSSIMG[this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE],_loc6_,this.ENEMY[param1].nPosX,this.ENEMY[param1].nPosY - 5,this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,true,BlendMode.ADD,100);
                        }
                        else
                        {
                           this.lib.drawASEAniBoss(Ani_Boss01 + (this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE),_loc5_,this.BOSSIMG[this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE],_loc6_,this.ENEMY[param1].nPosX,this.ENEMY[param1].nPosY - 5,this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,false,BlendMode.ADD,100);
                        }
                     }
                     else if(Boolean(this.ENEMY[param1].bAttacked) && this.ope.bDrawDmgEff(Player.ENEMYATTACKED,param1))
                     {
                        this.lib.drawASEAniBoss(Ani_Boss01 + (this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE),_loc5_,this.BOSSIMG[this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE],_loc6_,this.ENEMY[param1].nPosX,this.ENEMY[param1].nPosY - 5,this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,true,BlendMode.ALPHA,100);
                     }
                     else
                     {
                        this.lib.drawASEAniBoss(Ani_Boss01 + (this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE),_loc5_,this.BOSSIMG[this.ENEMY[param1].nBaseType - ENEMY_BOSSZOMBIE],_loc6_,this.ENEMY[param1].nPosX,this.ENEMY[param1].nPosY - 5,this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,false,BlendMode.ALPHA,100);
                     }
                  }
                  else
                  {
                     _loc6_ = this.ENEMYIMG[this.ENEMY[param1].nType * ENEMYIMG_TYPE + 2] + int(this.ENEMY[param1].nDieFrame >> 1);
                     if(Boolean(this.ENEMY[param1].bAttacked) && this.ope.bDrawDmgEff(Player.ENEMYATTACKED,param1))
                     {
                        this.lib.drawObjDmgZoom(_loc6_,this.ENEMY[param1].nPosX,this.ENEMY[param1].nPosY + 10,this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,BOTTOM | HCENTER);
                     }
                     else
                     {
                        this.lib.drawImgZoom(_loc6_,this.ENEMY[param1].nPosX,this.ENEMY[param1].nPosY + 10,this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,BOTTOM | HCENTER);
                     }
                  }
                  this.drawAttackedEff(Player.ENEMYATTACKED,param1);
                  this.ope.resetAttacked(Player.ENEMYATTACKED,param1);
                  if(!this.bGameMenu)
                  {
                     this.ope.enemyKnockBack(param1,this.ENEMY[param1].nKnockDownDistance);
                  }
               }
               else
               {
                  if(!this.bGameMenu)
                  {
                     if(this.ENEMY[param1].nDieFrame == this.player.ENEMYKNOCKDOWNTOTALFRAME[this.ENEMY[param1].nBaseType])
                     {
                        this.lib.playEffect(106);
                     }
                  }
                  this.lib.drawImgZoomDodge(imgEnemyDie + int(this.ENEMY[param1].nDieFrame - this.player.ENEMYKNOCKDOWNTOTALFRAME[this.ENEMY[param1].nBaseType] >> 1),this.ENEMY[param1].nPosX,this.ENEMY[param1].nPosY + 10,this.ENEMY[param1].nSizeScale,this.ENEMY[param1].nSizeScale,BlendMode.ADD,BOTTOM | HCENTER);
               }
               this.ope.drawEnemyMaceDmg(param1);
               if(!this.bGameMenu)
               {
                  this.ENEMY[param1].nDieFrame += 1 + this.nLeakFrame;
                  if(this.ENEMY[param1].nDieFrame >= this.player.ENEMYGHOSTUPTOTALFRAME[this.ENEMY[param1].nBaseType])
                  {
                     this.ENEMY[param1].bDieAni = false;
                  }
               }
            }
            else
            {
               this.ENEMY[param1].bAppear = false;
               this.ENEMY[param1].bAttack = false;
               this.ENEMY[param1].nAttackDelayStartTime = INITDATA;
               this.ENEMY[param1].nAtkFrame = 0;
               this.ENEMY[param1].nAttackUnit = INITDATA;
               this.ENEMY[param1].bMove = false;
               this.ENEMY[param1].bIce = false;
               this.ENEMY[param1].nIceStartTime = INITDATA;
               this.ENEMY[param1].nIceTime = INITDATA;
               this.ENEMY[param1].nIceAniFrame = 0;
               this.ENEMY[param1].bPoison = false;
               this.ENEMY[param1].nPoisonStartTime = INITDATA;
               this.ENEMY[param1].nPoisonTime = INITDATA;
               this.ENEMY[param1].nPoisonDpsTime = INITDATA;
               this.ENEMY[param1].nPoisonDps = INITDATA;
               if(this.ENEMY[param1].nBossPaladogEffectPos > INITDATA)
               {
                  this.player.BOSSPALADOGPOS[this.ENEMY[param1].nBossPaladogEffectPos] = INITDATA;
               }
               this.ENEMY[param1].nBossPaladogEffectPos = INITDATA;
               _loc2_ = 0;
               while(_loc2_ < Enemy.MAX_DMG)
               {
                  this.ENEMY[param1].DMGKIND[_loc2_] = INITDATA;
                  this.ENEMY[param1].DMGPOSX[_loc2_] = INITDATA;
                  this.ENEMY[param1].DMGPOSY[_loc2_] = INITDATA;
                  this.ENEMY[param1].DMGANIFRAME[_loc2_] = 0;
                  this.ENEMY[param1].DMGFROMUNIT[_loc2_] = INITDATA;
                  _loc2_++;
               }
               this.ENEMY[param1].bKnockDown = false;
               this.ENEMY[param1].nKnockDownDistance = 0;
               this.ENEMY[param1].nKnockDownAniFrame = 0;
               this.ENEMY[param1].nPosY = Player.ENEMYDIEPOSY;
            }
            this.ENEMY[param1].nPosY = this.ENEMY[param1]._nPosY;
         }
         else if(this.ENEMY[param1].bArrive)
         {
            this.ENEMY[param1]._nPosY = this.ENEMY[param1].nPosY;
            this.ENEMY[param1].nPosY += this.player.nBgEffPosY;
            this.lib.drawImgDodge(imgWarRoadEnemyGoal + int(this.ENEMY[param1].nDieFrame >> 1),0,this.ENEMY[param1].nPosY,BlendMode.ADD,VCENTER | LEFT);
            this.ENEMY[param1].nPosY = this.ENEMY[param1]._nPosY;
            if(!this.bGameMenu)
            {
               this.ENEMY[param1].nDieFrame += 1 + this.nLeakFrame;
               if(this.ENEMY[param1].nDieFrame >= 36)
               {
                  this.ENEMY[param1].bArrive = false;
                  this.ENEMY[param1].bAppear = false;
                  this.ENEMY[param1].bAlive = false;
                  this.ENEMY[param1].bAttack = false;
                  this.ENEMY[param1].nAttackDelayStartTime = INITDATA;
                  this.ENEMY[param1].nAtkFrame = 0;
                  this.ENEMY[param1].nAttackUnit = INITDATA;
                  this.ENEMY[param1].bIce = false;
                  this.ENEMY[param1].nIceStartTime = INITDATA;
                  this.ENEMY[param1].nIceTime = INITDATA;
                  this.ENEMY[param1].nIceAniFrame = 0;
                  this.ENEMY[param1].bPoison = false;
                  this.ENEMY[param1].nPoisonStartTime = INITDATA;
                  this.ENEMY[param1].nPoisonTime = INITDATA;
                  this.ENEMY[param1].nPoisonDpsTime = INITDATA;
                  this.ENEMY[param1].nPoisonDps = INITDATA;
                  if(this.ENEMY[param1].nBossPaladogEffectPos > INITDATA)
                  {
                     this.player.BOSSPALADOGPOS[this.ENEMY[param1].nBossPaladogEffectPos] = INITDATA;
                  }
                  this.ENEMY[param1].nBossPaladogEffectPos = INITDATA;
                  _loc2_ = 0;
                  while(_loc2_ < Enemy.MAX_DMG)
                  {
                     this.ENEMY[param1].DMGKIND[_loc2_] = INITDATA;
                     this.ENEMY[param1].DMGPOSX[_loc2_] = INITDATA;
                     this.ENEMY[param1].DMGPOSY[_loc2_] = INITDATA;
                     this.ENEMY[param1].DMGANIFRAME[_loc2_] = 0;
                     this.ENEMY[param1].DMGFROMUNIT[_loc2_] = INITDATA;
                     _loc2_++;
                  }
                  this.ENEMY[param1].bKnockDown = false;
                  this.ENEMY[param1].nKnockDownDistance = 0;
                  this.ENEMY[param1].nKnockDownAniFrame = 0;
                  this.ENEMY[param1].nPosY = Player.ENEMYDIEPOSY;
                  ++this.player.nWarRoadArriveEnemy;
                  ++this.player.nWarRoadEnemyHp;
                  this.lib.playEffect(81);
                  if(this.player.nWarRoadEnemyHp >= Player.nWarRoadEnemyMaxHp)
                  {
                     this.player.nWarRoadEnemyHp = Player.nWarRoadEnemyMaxHp;
                  }
               }
            }
         }
      }
      
      public function drawUnit(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Number = NaN;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         if(this.UNIT[param1].bAppear)
         {
            _loc3_ = Player.UNIT_SCALE_NORMAL;
            _loc4_ = (Player.CHAIMG_HEIGHT * _loc3_ / 100 >> 1) - Player.SHADOWIMG_POS * _loc3_ / 100 - 10;
            _loc5_ = 0;
            this.UNIT[param1]._nPosY = this.UNIT[param1].nPosY;
            this.UNIT[param1].nPosY += this.player.nBgEffPosY;
            if(this.player.nGameMode == MODE_WARROAD)
            {
               _loc3_ = Player.UNIT_SCALE_WARROAD;
               _loc4_ = (Player.CHAIMG_HEIGHT * _loc3_ / 100 >> 1) - Player.SHADOWIMG_POS * _loc3_ / 100 - 10;
            }
            if(this.UNIT[param1].bAlive)
            {
               this.lib.drawImgZoomAlpha(imgShadow,this.UNIT[param1].nPosX,this.UNIT[param1].nPosY - _loc4_,this.player.UNITSHADOWWIDTH[this.UNIT[param1].nType] * _loc3_ / 100,this.player.UNITSHADOWWIDTH[this.UNIT[param1].nType] * _loc3_ / 100,60,VCENTER | HCENTER);
               if(this.player.nGameMode != MODE_WARROAD)
               {
                  if(this.UNIT[param1].nPosX >= this.player.nPosX - this.player.HEROAURAWIDTH[this.player.HEROSKILL[Player.SKILL_AREAAURA]] && this.UNIT[param1].nPosX <= this.player.nPosX + this.player.HEROAURAWIDTH[this.player.HEROSKILL[Player.SKILL_AREAAURA]])
                  {
                     if(this.UNIT[param1].nType == UNIT_WAGON)
                     {
                        this.UNIT[param1].bInAura = false;
                     }
                     else
                     {
                        this.lib.drawImgZoomDodge(imgAura + int(this.nGameFrame / 6) % 6,this.UNIT[param1].nPosX,this.UNIT[param1].nPosY - _loc4_,40,40,BlendMode.ADD,VCENTER | HCENTER);
                        this.UNIT[param1].bInAura = true;
                     }
                  }
                  else
                  {
                     this.UNIT[param1].bInAura = false;
                  }
               }
               else
               {
                  this.UNIT[param1].bInAura = false;
               }
               _loc2_ = 0;
               while(_loc2_ < Unit.MAX_DMG)
               {
                  switch(this.UNIT[param1].DMGKIND[_loc2_])
                  {
                     case ENEMY_DARKZOMBIE:
                        this.lib.drawImgZoomAlpha(imgEnemyE10Arms + 14,this.UNIT[param1].DMGPOSX[_loc2_],this.UNIT[param1].DMGPOSY[_loc2_],_loc3_,_loc3_,1.5 * this.UNIT[param1].DMGANIFRAME[_loc2_],BOTTOM | HCENTER);
                        if(this.UNIT[param1].DMGANIFRAME[_loc2_] >= FPS)
                        {
                           this.ope.resetUnitDmgEff(param1,_loc2_);
                        }
                        break;
                     case ENEMY_DARKZOMBIE2:
                        this.lib.drawImgZoomAlpha(imgEnemyE30Arms + 14,this.UNIT[param1].DMGPOSX[_loc2_],this.UNIT[param1].DMGPOSY[_loc2_],_loc3_,_loc3_,1.5 * this.UNIT[param1].DMGANIFRAME[_loc2_],BOTTOM | HCENTER);
                        if(this.UNIT[param1].DMGANIFRAME[_loc2_] >= FPS)
                        {
                           this.ope.resetUnitDmgEff(param1,_loc2_);
                        }
                  }
                  _loc2_++;
               }
               if(this.UNIT[param1].bMove)
               {
                  _loc6_ = this.UNITIMG[this.UNIT[param1].nType * UNITIMG_TYPE] + this.UNIT[param1].nStep;
                  if(this.UNIT[param1].nAttackDelayStartTime > INITDATA)
                  {
                     if(this.UNIT[param1].bLastAttackFrame)
                     {
                        if(this.UNIT[param1].bSkillAtk)
                        {
                           switch(this.UNIT[param1].nType)
                           {
                              case UNIT_RABBIT:
                              case UNIT_MONKEY:
                              case UNIT_PENGUIN:
                              case UNIT_DRAGON:
                                 _loc6_ = this.UNITIMG[this.UNIT[param1].nType * UNITIMG_TYPE + UNITIMG_ATK1] + int(this.UNIT[param1].nAtk2TotalFrame - 1 >> 1);
                                 break;
                              default:
                                 _loc6_ = this.UNITIMG[this.UNIT[param1].nType * UNITIMG_TYPE + UNITIMG_ATK2] + int(this.UNIT[param1].nAtk2TotalFrame - 1 >> 1);
                           }
                        }
                        else
                        {
                           _loc6_ = this.UNITIMG[this.UNIT[param1].nType * UNITIMG_TYPE + UNITIMG_ATK1] + int(this.UNIT[param1].nAtk1TotalFrame - 1 >> 1);
                        }
                     }
                     else if(this.UNIT[param1].bAttackReady)
                     {
                        _loc6_ = this.UNITIMG[this.UNIT[param1].nType * UNITIMG_TYPE] + (this.UNIT[param1].nMaxStep - 1);
                     }
                     this.player.nNowTime = getTimer();
                     if(this.UNIT[param1].bInAura)
                     {
                        this.player.nAuraAttackDelay = this.UNIT[param1].nAttackDelay * ((4 - this.player.HEROSKILL[Player.SKILL_DELAYAURA]) / 4);
                     }
                     else
                     {
                        this.player.nAuraAttackDelay = this.UNIT[param1].nAttackDelay;
                     }
                     if((this.player.nNowTime - this.UNIT[param1].nAttackDelayStartTime) * (1 + this.player.nGameSpeed) >= this.player.nAuraAttackDelay)
                     {
                        this.UNIT[param1].nAttackDelayStartTime = INITDATA;
                     }
                  }
                  if(Boolean(this.UNIT[param1].bAttacked) && this.ope.bDrawDmgEff(Player.UNITATTACKED,param1))
                  {
                     this.lib.drawObjDmgZoom(_loc6_,this.UNIT[param1].nPosX,this.UNIT[param1].nPosY + 10,_loc3_,_loc3_,BOTTOM | HCENTER);
                  }
                  else
                  {
                     this.lib.drawImgZoom(_loc6_,this.UNIT[param1].nPosX,this.UNIT[param1].nPosY + 10,_loc3_,_loc3_,BOTTOM | HCENTER);
                  }
                  this.drawAttackedEff(Player.UNITATTACKED,param1);
                  this.ope.resetAttacked(Player.UNITATTACKED,param1);
               }
               else if(Boolean(this.UNIT[param1].bKnockDown) && !this.UNIT[param1].bFrog)
               {
                  if(this.UNIT[param1].nKnockDownAniFrame < this.player.UNITKNOCKDOWNTOTALFRAME[this.UNIT[param1].nType])
                  {
                     _loc6_ = this.UNITIMG[this.UNIT[param1].nType * UNITIMG_TYPE + UNITIMG_DEAD] + int(this.UNIT[param1].nKnockDownAniFrame >> 1);
                     if(!this.bGameMenu)
                     {
                        _loc5_ = int(this.UNIT[param1].nKnockDownDistance);
                        if(this.player.nGameMode == MODE_WARROAD)
                        {
                           _loc5_ >>= 1;
                        }
                        this.UNIT[param1].nPosX -= _loc5_ * (1 + this.nLeakFrame);
                        if(this.UNIT[param1].nPosX <= 0)
                        {
                           this.UNIT[param1].nPosX = 0;
                        }
                        this.UNIT[param1].nKnockDownAniFrame += 1 + this.nLeakFrame;
                        if(this.UNIT[param1].nKnockDownAniFrame >= this.player.UNITKNOCKDOWNTOTALFRAME[this.UNIT[param1].nType])
                        {
                           this.UNIT[param1].nKnockDownTime = getTimer();
                        }
                     }
                  }
                  else
                  {
                     _loc6_ = this.UNITIMG[this.UNIT[param1].nType * UNITIMG_TYPE + UNITIMG_DEAD] + int(this.player.UNITKNOCKDOWNTOTALFRAME[this.UNIT[param1].nType] - 1 >> 1);
                     this.player.nNowTime = getTimer();
                     if(this.bBossDiaEvent || this.bBossDialog)
                     {
                        this.UNIT[param1].nKnockDownTime += this.player.nNowTime - this.UNIT[param1].nKnockDownTime;
                     }
                     if((this.player.nNowTime - this.UNIT[param1].nKnockDownTime) * (1 + this.player.nGameSpeed) >= 3000)
                     {
                        this.UNIT[param1].bMove = true;
                        this.UNIT[param1].bKnockDown = false;
                        this.UNIT[param1].nKnockDownDistance = 0;
                        this.UNIT[param1].nKnockDownAniFrame = 0;
                     }
                  }
                  if(Boolean(this.UNIT[param1].bAttacked) && this.ope.bDrawDmgEff(Player.UNITATTACKED,param1))
                  {
                     this.lib.drawObjDmgZoom(_loc6_,this.UNIT[param1].nPosX,this.UNIT[param1].nPosY + 10,_loc3_,_loc3_,BOTTOM | HCENTER);
                  }
                  else
                  {
                     this.lib.drawImgZoom(_loc6_,this.UNIT[param1].nPosX,this.UNIT[param1].nPosY + 10,_loc3_,_loc3_,BOTTOM | HCENTER);
                  }
                  this.drawAttackedEff(Player.UNITATTACKED,param1);
                  this.ope.resetAttacked(Player.UNITATTACKED,param1);
                  if(this.UNIT[param1].nKnockDownAniFrame >= this.player.UNITKNOCKDOWNTOTALFRAME[this.UNIT[param1].nType])
                  {
                     this.lib.drawImgZoomDodge(imgStun + int((this.nGameFrame >> 1) % 16),this.UNIT[param1].nPosX,this.UNIT[param1].nPosY + 30,_loc3_,_loc3_,BlendMode.ADD,BOTTOM | HCENTER);
                  }
               }
               else if(this.UNIT[param1].bAttack)
               {
                  this.ope.unitAtkSnd(param1);
                  if(this.UNIT[param1].bSkillAtk)
                  {
                     switch(this.UNIT[param1].nType)
                     {
                        case UNIT_RABBIT:
                        case UNIT_MONKEY:
                        case UNIT_PENGUIN:
                        case UNIT_DRAGON:
                           _loc6_ = this.UNITIMG[this.UNIT[param1].nType * UNITIMG_TYPE + UNITIMG_ATK1] + int(this.UNIT[param1].nAtkFrame >> 1);
                           break;
                        default:
                           _loc6_ = this.UNITIMG[this.UNIT[param1].nType * UNITIMG_TYPE + UNITIMG_ATK2] + int(this.UNIT[param1].nAtkFrame >> 1);
                     }
                     if(Boolean(this.UNIT[param1].bAttacked) && this.ope.bDrawDmgEff(Player.UNITATTACKED,param1))
                     {
                        this.lib.drawObjDmgZoom(_loc6_,this.UNIT[param1].nPosX,this.UNIT[param1].nPosY + 10,_loc3_,_loc3_,BOTTOM | HCENTER);
                     }
                     else
                     {
                        this.lib.drawImgZoom(_loc6_,this.UNIT[param1].nPosX,this.UNIT[param1].nPosY + 10,_loc3_,_loc3_,BOTTOM | HCENTER);
                     }
                     this.drawAttackedEff(Player.UNITATTACKED,param1);
                     this.ope.resetAttacked(Player.UNITATTACKED,param1);
                     if(this.UNIT[param1].nType == UNIT_DRAGON)
                     {
                        if(this.UNIT[param1].nAtkFrame >= 6 && this.UNIT[param1].nAtkFrame <= 17)
                        {
                           this.lib.drawImgZoomDodge(imgDragonFire + 6 + int(this.UNIT[param1].nAtkFrame - 6 >> 1),this.UNIT[param1].nPosX,this.UNIT[param1].nPosY + 10,_loc3_,_loc3_,BlendMode.ADD,BOTTOM | HCENTER);
                        }
                     }
                     if(!this.bGameMenu)
                     {
                        this.nBeforeAtkFrame = this.UNIT[param1].nAtkFrame;
                        this.UNIT[param1].nAtkFrame += 1 + this.nLeakFrame;
                        switch(this.UNIT[param1].nType)
                        {
                           case UNIT_KANGAROO:
                              if(this.UNIT[param1].nAtkFrame >= this.player.UNITATTACKFRAME[this.UNIT[param1].nType + 9] && this.UNIT[param1].nAtkFrame <= this.player.UNITATTACKFRAME[this.UNIT[param1].nType + 9] + 16)
                              {
                                 _loc2_ = 0;
                                 while(_loc2_ < 5)
                                 {
                                    if(this.UNIT[param1].nAtkFrame < this.player.KANGAROOATTACKFRAME[_loc2_])
                                    {
                                       break;
                                    }
                                    if(this.nBeforeAtkFrame < this.player.KANGAROOATTACKFRAME[_loc2_] && this.UNIT[param1].nAtkFrame >= this.player.KANGAROOATTACKFRAME[_loc2_])
                                    {
                                       this.ope.enemyDmgFromUnit(param1,false,INITDATA);
                                    }
                                    _loc2_++;
                                 }
                              }
                              break;
                           default:
                              if(this.nBeforeAtkFrame < this.player.UNITATTACKFRAME[this.UNIT[param1].nType + 9] && this.UNIT[param1].nAtkFrame >= this.player.UNITATTACKFRAME[this.UNIT[param1].nType + 9])
                              {
                                 this.ope.enemyDmgFromUnit(param1,false,INITDATA);
                              }
                        }
                        if(this.UNIT[param1].nAtkFrame >= this.UNIT[param1].nAtk2TotalFrame)
                        {
                           this.UNIT[param1].nAttackDelayStartTime = getTimer();
                           if(this.UNIT[param1].nType == UNIT_TURTLE)
                           {
                              this.UNIT[param1].bDefense = true;
                           }
                           this.UNIT[param1].nAtkFrame = 0;
                           this.UNIT[param1].bSkillAtk = false;
                           this.UNIT[param1].bAttack = false;
                           this.UNIT[param1].bMove = true;
                           this.UNIT[param1].bLastAttackFrame = true;
                           this.UNIT[param1].bAttackReady = false;
                        }
                     }
                  }
                  else
                  {
                     if(Boolean(this.UNIT[param1].bAttacked) && this.ope.bDrawDmgEff(Player.UNITATTACKED,param1))
                     {
                        this.lib.drawObjDmgZoom(this.UNITIMG[this.UNIT[param1].nType * UNITIMG_TYPE + UNITIMG_ATK1] + int(this.UNIT[param1].nAtkFrame >> 1),this.UNIT[param1].nPosX,this.UNIT[param1].nPosY + 10,_loc3_,_loc3_,BOTTOM | HCENTER);
                     }
                     else
                     {
                        this.lib.drawImgZoom(this.UNITIMG[this.UNIT[param1].nType * UNITIMG_TYPE + UNITIMG_ATK1] + int(this.UNIT[param1].nAtkFrame >> 1),this.UNIT[param1].nPosX,this.UNIT[param1].nPosY + 10,_loc3_,_loc3_,BOTTOM | HCENTER);
                     }
                     this.drawAttackedEff(Player.UNITATTACKED,param1);
                     this.ope.resetAttacked(Player.UNITATTACKED,param1);
                     if(this.UNIT[param1].nType == UNIT_DRAGON)
                     {
                        if(this.UNIT[param1].nAtkFrame >= 6 && this.UNIT[param1].nAtkFrame <= 17)
                        {
                           this.lib.drawImgZoomDodge(imgDragonFire + int(this.UNIT[param1].nAtkFrame - 6 >> 1),this.UNIT[param1].nPosX,this.UNIT[param1].nPosY + 10,_loc3_,_loc3_,BlendMode.ADD,BOTTOM | HCENTER);
                        }
                     }
                     if(!this.bGameMenu)
                     {
                        this.nBeforeAtkFrame = this.UNIT[param1].nAtkFrame;
                        this.UNIT[param1].nAtkFrame += 1 + this.nLeakFrame;
                        if(this.nBeforeAtkFrame < this.player.UNITATTACKFRAME[this.UNIT[param1].nType] && this.UNIT[param1].nAtkFrame >= this.player.UNITATTACKFRAME[this.UNIT[param1].nType])
                        {
                           this.ope.enemyDmgFromUnit(param1,false,INITDATA);
                        }
                        if(this.UNIT[param1].nAtkFrame >= this.UNIT[param1].nAtk1TotalFrame)
                        {
                           this.UNIT[param1].nAttackDelayStartTime = getTimer();
                           if(this.UNIT[param1].nType == UNIT_TURTLE)
                           {
                              this.UNIT[param1].bDefense = true;
                           }
                           this.UNIT[param1].nAtkFrame = 0;
                           this.UNIT[param1].bAttack = false;
                           this.UNIT[param1].bMove = true;
                           this.UNIT[param1].bLastAttackFrame = true;
                           this.UNIT[param1].bAttackReady = false;
                        }
                     }
                  }
               }
               if(this.UNIT[param1].bFrog)
               {
                  if(this.UNIT[param1].bKnockDown)
                  {
                     if(this.UNIT[param1].nKnockDownAniFrame < this.player.UNITKNOCKDOWNTOTALFRAME[this.UNIT[param1].nType])
                     {
                        _loc6_ = imgEnemyBoss02FrogDown + int(this.UNIT[param1].nKnockDownAniFrame >> 1);
                        if(!this.bGameMenu)
                        {
                           _loc5_ = int(this.UNIT[param1].nKnockDownDistance);
                           if(this.player.nGameMode == MODE_WARROAD)
                           {
                              _loc5_ >>= 1;
                           }
                           this.UNIT[param1].nPosX -= _loc5_ * (1 + this.nLeakFrame);
                           if(this.UNIT[param1].nPosX <= 0)
                           {
                              this.UNIT[param1].nPosX = 0;
                           }
                           this.UNIT[param1].nKnockDownAniFrame += 1 + this.nLeakFrame;
                           if(this.UNIT[param1].nKnockDownAniFrame >= this.player.UNITKNOCKDOWNTOTALFRAME[this.UNIT[param1].nType])
                           {
                              this.UNIT[param1].nKnockDownTime = getTimer();
                           }
                        }
                     }
                     else
                     {
                        _loc6_ = imgEnemyBoss02FrogDown + int(this.player.UNITKNOCKDOWNTOTALFRAME[this.UNIT[param1].nType] - 1 >> 1);
                        this.player.nNowTime = getTimer();
                        if((this.player.nNowTime - this.UNIT[param1].nKnockDownTime) * (1 + this.player.nGameSpeed) >= 3000)
                        {
                           this.UNIT[param1].bKnockDown = false;
                           this.UNIT[param1].nKnockDownDistance = 0;
                           this.UNIT[param1].nKnockDownAniFrame = 0;
                        }
                     }
                     if(Boolean(this.UNIT[param1].bAttacked) && this.ope.bDrawDmgEff(Player.UNITATTACKED,param1))
                     {
                        this.lib.drawObjDmgZoom(_loc6_,this.UNIT[param1].nPosX,this.UNIT[param1].nPosY + 10,_loc3_,_loc3_,BOTTOM | HCENTER);
                     }
                     else
                     {
                        this.lib.drawImgZoom(_loc6_,this.UNIT[param1].nPosX,this.UNIT[param1].nPosY + 10,_loc3_,_loc3_,BOTTOM | HCENTER);
                     }
                     this.drawAttackedEff(Player.UNITATTACKED,param1);
                     this.ope.resetAttacked(Player.UNITATTACKED,param1);
                     if(this.UNIT[param1].nKnockDownAniFrame >= this.player.UNITKNOCKDOWNTOTALFRAME[this.UNIT[param1].nType])
                     {
                        this.lib.drawImgZoomDodge(imgStun + int((this.nGameFrame >> 1) % 16),this.UNIT[param1].nPosX,this.UNIT[param1].nPosY + 30,_loc3_,_loc3_,BlendMode.ADD,BOTTOM | HCENTER);
                     }
                  }
                  else if(this.UNIT[param1].nFrogAniFrame < 30)
                  {
                     this.lib.drawImgZoomDodge(imgEnemyBoss02Magic + int(this.UNIT[param1].nFrogAniFrame >> 1),this.UNIT[param1].nPosX,this.UNIT[param1].nPosY + 10,_loc3_,_loc3_,BlendMode.NORMAL,BOTTOM | HCENTER);
                     this.UNIT[param1].nFrogAniFrame += 1 + this.nLeakFrame;
                     if(Boolean(this.UNIT[param1].bReturnFromFrog) && this.UNIT[param1].nFrogAniFrame >= 30)
                     {
                        this.UNIT[param1].bMove = true;
                        this.UNIT[param1].bFrog = false;
                        this.UNIT[param1].bReturnFromFrog = false;
                        this.UNIT[param1].nFrogStartTime = INITDATA;
                        this.UNIT[param1].nFrogTime = INITDATA;
                        this.UNIT[param1].nFrogAniFrame = 0;
                     }
                  }
                  else
                  {
                     if(Boolean(this.UNIT[param1].bAttacked) && this.ope.bDrawDmgEff(Player.UNITATTACKED,param1))
                     {
                        this.lib.drawObjDmgZoom(imgEnemyBoss02FrogWait,this.UNIT[param1].nPosX,this.UNIT[param1].nPosY + 10,_loc3_,_loc3_,BOTTOM | HCENTER);
                     }
                     else
                     {
                        this.lib.drawImgZoom(imgEnemyBoss02FrogWait,this.UNIT[param1].nPosX,this.UNIT[param1].nPosY + 10,_loc3_,_loc3_,BOTTOM | HCENTER);
                     }
                     this.drawAttackedEff(Player.UNITATTACKED,param1);
                     this.ope.resetAttacked(Player.UNITATTACKED,param1);
                  }
                  if(!this.UNIT[param1].bReturnFromFrog)
                  {
                     this.player.nNowTime = getTimer();
                     if((this.player.nNowTime - this.UNIT[param1].nFrogStartTime) * (1 + this.player.nGameSpeed) >= this.UNIT[param1].nFrogTime)
                     {
                        this.UNIT[param1].bReturnFromFrog = true;
                        this.UNIT[param1].nFrogAniFrame = 0;
                     }
                  }
               }
               if(this.UNIT[param1].bIce)
               {
                  if(!this.UNIT[param1].bKnockDown)
                  {
                     _loc6_ = this.UNITIMG[this.UNIT[param1].nType * UNITIMG_TYPE] + this.UNIT[param1].nStep;
                     if(Boolean(this.UNIT[param1].bAttacked) && this.ope.bDrawDmgEff(Player.UNITATTACKED,param1))
                     {
                        this.lib.drawObjDmgZoom(_loc6_,this.UNIT[param1].nPosX,this.UNIT[param1].nPosY + 10,_loc3_,_loc3_,BOTTOM | HCENTER);
                     }
                     else
                     {
                        this.lib.drawObjIceDmgZoom(_loc6_,this.UNIT[param1].nPosX,this.UNIT[param1].nPosY + 10,_loc3_,_loc3_,BOTTOM | HCENTER);
                     }
                  }
                  this.drawAttackedEff(Player.UNITATTACKED,param1);
                  this.ope.resetAttacked(Player.UNITATTACKED,param1);
                  if(this.UNIT[param1].nIceAniFrame < this.player.ENEMYDAMAGETOTALFRAME[MACE_ICE])
                  {
                     this.lib.drawImgZoomDodge(imgIce + int(this.UNIT[param1].nIceAniFrame >> 1),this.UNIT[param1].nPosX,this.UNIT[param1].nPosY + 10,_loc3_,_loc3_,BlendMode.ADD,BOTTOM | HCENTER);
                     if(!this.bGameMenu)
                     {
                        this.UNIT[param1].nIceAniFrame += 1 + this.nLeakFrame;
                        if(this.UNIT[param1].nIceAniFrame >= this.player.ENEMYDAMAGETOTALFRAME[MACE_ICE])
                        {
                           this.UNIT[param1].nIceAniFrame = this.player.ENEMYDAMAGETOTALFRAME[MACE_ICE];
                        }
                     }
                  }
                  else
                  {
                     this.lib.drawImgZoomDodge(imgIce + int(this.UNIT[param1].nIceAniFrame - 1 >> 1),this.UNIT[param1].nPosX,this.UNIT[param1].nPosY + 10,_loc3_,_loc3_,BlendMode.ADD,BOTTOM | HCENTER);
                  }
                  this.player.nNowTime = getTimer();
                  if((this.player.nNowTime - this.UNIT[param1].nIceStartTime) * (1 + this.player.nGameSpeed) >= this.UNIT[param1].nIceTime)
                  {
                     this.UNIT[param1].bMove = true;
                     this.UNIT[param1].bIce = false;
                     this.UNIT[param1].nIceStartTime = INITDATA;
                     this.UNIT[param1].nIceTime = INITDATA;
                     this.UNIT[param1].nIceAniFrame = 0;
                  }
               }
               if(this.UNIT[param1].bPoison)
               {
                  this.lib.drawImgDodge(imgEnemyBoss09Eff + int((this.nGameFrame >> 1) % 29),this.UNIT[param1].nPosX,this.UNIT[param1].nPosY,BlendMode.ADD,BOTTOM | HCENTER);
                  this.player.nNowTime = getTimer();
                  _loc7_ = (this.player.nNowTime - this.UNIT[param1].nPoisonDpsTime) * (1 + this.player.nGameSpeed);
                  _loc7_ = 1000 / _loc7_;
                  _loc7_ = this.UNIT[param1].nPoisonDps / _loc7_;
                  if(this.UNIT[param1].bInAura)
                  {
                     _loc7_ *= 1 - this.player.HEROSKILL[Player.SKILL_DEFAURA] / 10;
                  }
                  if(this.UNIT[param1].bDefense)
                  {
                     _loc7_ >>= 1;
                  }
                  this.UNIT[param1].nHp -= _loc7_;
                  if(this.UNIT[param1].nHp < this.UNIT[param1].nMaxHp * 20 / 100 && !this.UNIT[param1].bWarningHp)
                  {
                     this.UNIT[param1].bAttack = false;
                     this.UNIT[param1].nAttackEnemy = INITDATA;
                     this.UNIT[param1].nAtkFrame = 0;
                     this.UNIT[param1].bMove = false;
                     this.UNIT[param1].bKnockDown = true;
                     this.UNIT[param1].nKnockDownDistance = Player.UNIT_KNOCKDOWNDISTANCE;
                     this.UNIT[param1].nKnockDownAniFrame = 0;
                     this.UNIT[param1].bWarningHp = true;
                     this.lib.playEffect(57);
                  }
                  this.UNIT[param1].nPoisonDpsTime = getTimer();
                  if(this.UNIT[param1].nHp <= 1)
                  {
                     this.UNIT[param1].nHp = 1;
                     this.ope.detoxication(Player.UNITATTACKED,param1);
                  }
                  if((this.player.nNowTime - this.UNIT[param1].nPoisonStartTime) * (1 + this.player.nGameSpeed) >= this.UNIT[param1].nPoisonTime)
                  {
                     this.ope.detoxication(Player.UNITATTACKED,param1);
                  }
               }
               if(this.UNIT[param1].nHp < this.UNIT[param1].nMaxHp)
               {
                  this.lib.fillRect(this.UNIT[param1].nPosX - (40 * _loc3_ / 100 >> 1),this.UNIT[param1].nPosY - this.player.UNITHPGAGEPOS[this.UNIT[param1].nType] * _loc3_ / 100,40 * _loc3_ / 100,3,14474460,TOP | LEFT);
                  this.lib.fillRect(this.UNIT[param1].nPosX - (40 * _loc3_ / 100 >> 1),this.UNIT[param1].nPosY - this.player.UNITHPGAGEPOS[this.UNIT[param1].nType] * _loc3_ / 100,40 * _loc3_ / 100 * this.UNIT[param1].nHp / this.UNIT[param1].nMaxHp,3,65280,TOP | LEFT);
               }
               switch(this.UNIT[param1].nType)
               {
                  case UNIT_RABBIT:
                  case UNIT_KANGAROO:
                  case UNIT_PENGUIN:
                     _loc2_ = 0;
                     while(_loc2_ < Unit.MAX_UNITATTACK)
                     {
                        if(this.UNIT[param1].ATTACKANI[_loc2_] > INITDATA)
                        {
                           if(this.UNIT[param1].ATTACKARMSPOSX[_loc2_] > INITDATA)
                           {
                              if(this.UNIT[param1].nType == UNIT_RABBIT)
                              {
                                 if(this.UNIT[param1].ATTACKANI[_loc2_] == Unit.NORMAL_ATTACK)
                                 {
                                    _loc8_ = imgUnit02Arms;
                                 }
                                 else
                                 {
                                    _loc8_ = imgUnit02Arms + 1;
                                 }
                                 this.lib.drawImgZoom(_loc8_,this.UNIT[param1].ATTACKARMSPOSX[_loc2_],this.UNIT[param1].ATTACKARMSPOSY[_loc2_],_loc3_,_loc3_,BOTTOM | HCENTER);
                              }
                              else if(this.UNIT[param1].nType == UNIT_KANGAROO)
                              {
                                 this.lib.drawImgZoomDodge(imgUnit04Arms + int(this.UNIT[param1].ATTACKANI[_loc2_ + Unit.MAX_UNITATTACK] >> 1) % 5,this.UNIT[param1].ATTACKARMSPOSX[_loc2_],this.UNIT[param1].ATTACKARMSPOSY[_loc2_],_loc3_,_loc3_,BlendMode.ADD,BOTTOM | HCENTER);
                              }
                              else
                              {
                                 this.lib.drawImgZoomDodge(imgUnit08Arms,this.UNIT[param1].ATTACKARMSPOSX[_loc2_],this.UNIT[param1].ATTACKARMSPOSY[_loc2_],_loc3_,_loc3_,BlendMode.ADD,BOTTOM | HCENTER);
                              }
                              if(!this.bGameMenu)
                              {
                                 this.ope.enemyDmgFromUnit(param1,true,_loc2_);
                                 if(this.UNIT[param1].ATTACKARMSPOSX[_loc2_] > INITDATA)
                                 {
                                    this.UNIT[param1].SUBATTACKARMSPOSX[_loc2_] = this.UNIT[param1].ATTACKARMSPOSX[_loc2_];
                                    if(this.UNIT[param1].nType == UNIT_RABBIT)
                                    {
                                       _loc5_ = 600 * Player.WEB_SCALE / FPS;
                                    }
                                    else if(this.UNIT[param1].nType == UNIT_KANGAROO)
                                    {
                                       _loc5_ = 300 * Player.WEB_SCALE / FPS;
                                    }
                                    else
                                    {
                                       _loc5_ = 400 * Player.WEB_SCALE / FPS;
                                    }
                                    if(this.player.nGameMode == MODE_WARROAD)
                                    {
                                       _loc5_ >>= 1;
                                    }
                                    this.UNIT[param1].ATTACKARMSPOSX[_loc2_] += _loc5_ * (1 + this.nLeakFrame);
                                 }
                              }
                           }
                           if(!this.bGameMenu)
                           {
                              this.UNIT[param1].ATTACKANI[_loc2_ + Unit.MAX_UNITATTACK] += 1 + this.nLeakFrame;
                              if(this.UNIT[param1].ATTACKARMSPOSX[_loc2_] <= INITDATA || this.UNIT[param1].ATTACKARMSPOSX[_loc2_] > this.player.nBgPosX + Player.BG_W)
                              {
                                 this.ope.resetUnitAttack(param1,_loc2_);
                              }
                           }
                        }
                        _loc2_++;
                     }
                     break;
                  case UNIT_MONKEY:
                     _loc2_ = 0;
                     while(_loc2_ < Unit.MAX_UNITATTACK)
                     {
                        if(this.UNIT[param1].ATTACKANI[_loc2_] > INITDATA)
                        {
                           if(int(this.UNIT[param1].ATTACKANI[_loc2_ + Unit.MAX_UNITATTACK] >> 1) <= 14)
                           {
                              if(this.UNIT[param1].ATTACKANI[_loc2_] == Unit.NORMAL_ATTACK)
                              {
                                 this.lib.drawImgZoom(imgUnit06Arms + int(this.UNIT[param1].ATTACKANI[_loc2_ + Unit.MAX_UNITATTACK] >> 1) % 15,this.UNIT[param1].ATTACKARMSPOSX[_loc2_],this.UNIT[param1].ATTACKARMSPOSY[_loc2_],_loc3_,_loc3_,BOTTOM | HCENTER);
                              }
                              else
                              {
                                 this.lib.drawImgZoom(imgUnit06Arms + 15 + int(this.UNIT[param1].ATTACKANI[_loc2_ + Unit.MAX_UNITATTACK] >> 1) % 15,this.UNIT[param1].ATTACKARMSPOSX[_loc2_],this.UNIT[param1].ATTACKARMSPOSY[_loc2_],_loc3_,_loc3_,BOTTOM | HCENTER);
                              }
                              if(!this.bGameMenu)
                              {
                                 this.UNIT[param1].SUBATTACKARMSPOSX[_loc2_] = this.UNIT[param1].ATTACKARMSPOSX[_loc2_];
                                 this.UNIT[param1].ATTACKARMSPOSX[_loc2_] += this.UNIT[param1].ATTACKARRIVEPOS[_loc2_] / (FPS >> 1) * (1 + this.nLeakFrame);
                              }
                           }
                           else if(this.UNIT[param1].ATTACKANI[_loc2_] == Unit.NORMAL_ATTACK)
                           {
                              this.lib.drawImgZoomDodge(imgExplosion_s + int((this.UNIT[param1].ATTACKANI[_loc2_ + Unit.MAX_UNITATTACK] >> 1) - 15),this.UNIT[param1].ATTACKARMSPOSX[_loc2_],this.UNIT[param1].ATTACKARMSPOSY[_loc2_],_loc3_,_loc3_,BlendMode.NORMAL,BOTTOM | HCENTER);
                           }
                           else
                           {
                              this.lib.drawImgZoomDodge(imgExplosion_b + int((this.UNIT[param1].ATTACKANI[_loc2_ + Unit.MAX_UNITATTACK] >> 1) - 15),this.UNIT[param1].ATTACKARMSPOSX[_loc2_],this.UNIT[param1].ATTACKARMSPOSY[_loc2_],_loc3_,_loc3_,BlendMode.NORMAL,BOTTOM | HCENTER);
                           }
                           if(!this.bGameMenu)
                           {
                              this.nBeforeAtkFrame = this.UNIT[param1].ATTACKANI[_loc2_ + Unit.MAX_UNITATTACK];
                              this.UNIT[param1].ATTACKANI[_loc2_ + Unit.MAX_UNITATTACK] += 1 + this.nLeakFrame;
                              if(this.nBeforeAtkFrame < 30 && this.UNIT[param1].ATTACKANI[_loc2_ + Unit.MAX_UNITATTACK] >= 30)
                              {
                                 if(this.UNIT[param1].ATTACKANI[_loc2_] == Unit.NORMAL_ATTACK)
                                 {
                                    this.lib.playEffect(46);
                                 }
                                 else
                                 {
                                    this.lib.playEffect(47);
                                 }
                                 this.ope.enemyDmgFromUnit(param1,true,_loc2_);
                              }
                              if(int(this.UNIT[param1].ATTACKANI[_loc2_ + Unit.MAX_UNITATTACK] >> 1) >= 29)
                              {
                                 this.ope.resetUnitAttack(param1,_loc2_);
                              }
                           }
                        }
                        _loc2_++;
                     }
               }
               _loc2_ = 0;
               while(_loc2_ < Unit.MAX_DMG)
               {
                  switch(this.UNIT[param1].DMGKIND[_loc2_])
                  {
                     case ENEMY_DARKZOMBIE:
                        if(int(this.UNIT[param1].DMGANIFRAME[_loc2_] >> 1) <= 14)
                        {
                           this.lib.drawImgZoomDodge(imgEnemyE10Eff + int(this.UNIT[param1].DMGANIFRAME[_loc2_] >> 1),this.UNIT[param1].DMGPOSX[_loc2_],this.UNIT[param1].DMGPOSY[_loc2_],_loc3_,_loc3_,BlendMode.NORMAL,BOTTOM | HCENTER);
                        }
                        if(!this.bGameMenu)
                        {
                           this.UNIT[param1].DMGANIFRAME[_loc2_] += 1 + this.nLeakFrame;
                        }
                        break;
                     case ENEMY_DARKZOMBIE2:
                        if(int(this.UNIT[param1].DMGANIFRAME[_loc2_] >> 1) <= 14)
                        {
                           this.lib.drawImgZoomDodge(imgEnemyE30Eff + int(this.UNIT[param1].DMGANIFRAME[_loc2_] >> 1),this.UNIT[param1].DMGPOSX[_loc2_],this.UNIT[param1].DMGPOSY[_loc2_],_loc3_,_loc3_,BlendMode.NORMAL,BOTTOM | HCENTER);
                        }
                        if(!this.bGameMenu)
                        {
                           this.UNIT[param1].DMGANIFRAME[_loc2_] += 1 + this.nLeakFrame;
                        }
                        break;
                     case ENEMY_BOSSMANDEVIL:
                        this.lib.drawImgZoomDodge(imgEnemyBoss10Magic + int(this.UNIT[param1].DMGANIFRAME[_loc2_] >> 1),this.UNIT[param1].DMGPOSX[_loc2_],this.UNIT[param1].DMGPOSY[_loc2_],_loc3_,_loc3_,BlendMode.ADD,BOTTOM | HCENTER);
                        if(!this.bGameMenu)
                        {
                           this.nBeforeAtkFrame = this.UNIT[param1].DMGANIFRAME[_loc2_];
                           this.UNIT[param1].DMGANIFRAME[_loc2_] += 1 + this.nLeakFrame;
                           if(this.nBeforeAtkFrame < 29 && this.UNIT[param1].DMGANIFRAME[_loc2_] >= 29)
                           {
                              _loc9_ = int(this.ENEMY[this.UNIT[param1].DMGFROMENEMY[_loc2_]].nAttack);
                              if(this.lib.getRand(100) < 20)
                              {
                                 _loc9_ = 100000;
                              }
                              this.ope.unitDmg(param1,_loc9_,this.UNIT[param1].DMGFROMENEMY[_loc2_]);
                           }
                        }
                        if(this.UNIT[param1].DMGANIFRAME[_loc2_] >= 60)
                        {
                           this.UNIT[param1].DMGKIND[_loc2_] = INITDATA;
                           this.UNIT[param1].DMGPOSX[_loc2_] = INITDATA;
                           this.UNIT[param1].DMGPOSY[_loc2_] = INITDATA;
                           this.UNIT[param1].DMGANIFRAME[_loc2_] = 0;
                           this.UNIT[param1].DMGFROMENEMY[_loc2_] = INITDATA;
                        }
                        break;
                     case ENEMY_PUMPKIN:
                        this.lib.drawImgZoomDodge(imgEnemyE14Arms + int(this.UNIT[param1].DMGANIFRAME[_loc2_] >> 1),this.UNIT[param1].DMGPOSX[_loc2_],this.UNIT[param1].DMGPOSY[_loc2_],_loc3_,_loc3_,BlendMode.NORMAL,BOTTOM | HCENTER);
                        if(!this.bGameMenu)
                        {
                           this.nBeforeAtkFrame = this.UNIT[param1].DMGANIFRAME[_loc2_];
                           this.UNIT[param1].DMGANIFRAME[_loc2_] += 1 + this.nLeakFrame;
                           if(this.nBeforeAtkFrame < 13 && this.UNIT[param1].DMGANIFRAME[_loc2_] >= 13)
                           {
                              _loc10_ = int(this.ENEMY[this.UNIT[param1].DMGFROMENEMY[_loc2_]].nAttack);
                              this.ope.unitDmg(param1,_loc10_,this.UNIT[param1].DMGFROMENEMY[_loc2_]);
                           }
                        }
                        if(this.UNIT[param1].DMGANIFRAME[_loc2_] >= 30)
                        {
                           this.UNIT[param1].DMGKIND[_loc2_] = INITDATA;
                           this.UNIT[param1].DMGPOSX[_loc2_] = INITDATA;
                           this.UNIT[param1].DMGPOSY[_loc2_] = INITDATA;
                           this.UNIT[param1].DMGANIFRAME[_loc2_] = 0;
                           this.UNIT[param1].DMGFROMENEMY[_loc2_] = INITDATA;
                        }
                        break;
                     case ENEMY_PUMPKIN2:
                        this.lib.drawImgZoomDodge(imgEnemyE34Arms + int(this.UNIT[param1].DMGANIFRAME[_loc2_] >> 1),this.UNIT[param1].DMGPOSX[_loc2_],this.UNIT[param1].DMGPOSY[_loc2_],_loc3_,_loc3_,BlendMode.NORMAL,BOTTOM | HCENTER);
                        if(!this.bGameMenu)
                        {
                           this.nBeforeAtkFrame = this.UNIT[param1].DMGANIFRAME[_loc2_];
                           this.UNIT[param1].DMGANIFRAME[_loc2_] += 1 + this.nLeakFrame;
                           if(this.nBeforeAtkFrame < 13 && this.UNIT[param1].DMGANIFRAME[_loc2_] >= 13)
                           {
                              _loc11_ = int(this.ENEMY[this.UNIT[param1].DMGFROMENEMY[_loc2_]].nAttack);
                              this.ope.unitDmg(param1,_loc11_,this.UNIT[param1].DMGFROMENEMY[_loc2_]);
                           }
                        }
                        if(this.UNIT[param1].DMGANIFRAME[_loc2_] >= 30)
                        {
                           this.UNIT[param1].DMGKIND[_loc2_] = INITDATA;
                           this.UNIT[param1].DMGPOSX[_loc2_] = INITDATA;
                           this.UNIT[param1].DMGPOSY[_loc2_] = INITDATA;
                           this.UNIT[param1].DMGANIFRAME[_loc2_] = 0;
                           this.UNIT[param1].DMGFROMENEMY[_loc2_] = INITDATA;
                        }
                  }
                  _loc2_++;
               }
               if(this.UNIT[param1].bHealing)
               {
                  if(int(this.UNIT[param1].nHealingFrame >> 1) < 19)
                  {
                     this.lib.drawImgZoomDodge(this.player.ARMSANIIMG[MACE_HEAL * Player.MACEACT_NUM + Player.MACEACT_EFFB] + int(this.UNIT[param1].nHealingFrame >> 1),this.UNIT[param1].nPosX,this.UNIT[param1].nPosY + 10,_loc3_,_loc3_,BlendMode.ADD,BOTTOM | HCENTER);
                  }
                  if(!this.bGameMenu)
                  {
                     this.UNIT[param1].nHealingFrame += 1 + this.nLeakFrame;
                     if(this.UNIT[param1].nHealingFrame >= this.player.MACEATTACKTOTALFRAME[MACE_HEAL])
                     {
                        this.UNIT[param1].nHealingFrame = 0;
                        this.UNIT[param1].bHealing = false;
                     }
                  }
               }
            }
            else if(this.UNIT[param1].bDieAni)
            {
               if(!this.bGameMenu)
               {
                  if(this.UNIT[param1].nDieFrame == 0)
                  {
                     this.ope.unitDieSnd(param1);
                  }
               }
               _loc2_ = 0;
               while(_loc2_ < Unit.MAX_DMG)
               {
                  switch(this.UNIT[param1].DMGKIND[_loc2_])
                  {
                     case ENEMY_DARKZOMBIE:
                        this.lib.drawImgZoomAlpha(imgEnemyE10Arms + 14,this.UNIT[param1].DMGPOSX[_loc2_],this.UNIT[param1].DMGPOSY[_loc2_],_loc3_,_loc3_,1.5 * this.UNIT[param1].DMGANIFRAME[_loc2_],BOTTOM | HCENTER);
                        if(this.UNIT[param1].DMGANIFRAME[_loc2_] >= FPS)
                        {
                           this.ope.resetUnitDmgEff(param1,_loc2_);
                        }
                        break;
                     case ENEMY_DARKZOMBIE2:
                        this.lib.drawImgZoomAlpha(imgEnemyE30Arms + 14,this.UNIT[param1].DMGPOSX[_loc2_],this.UNIT[param1].DMGPOSY[_loc2_],_loc3_,_loc3_,1.5 * this.UNIT[param1].DMGANIFRAME[_loc2_],BOTTOM | HCENTER);
                        if(this.UNIT[param1].DMGANIFRAME[_loc2_] >= FPS)
                        {
                           this.ope.resetUnitDmgEff(param1,_loc2_);
                        }
                  }
                  _loc2_++;
               }
               if(this.UNIT[param1].nDieFrame < this.player.UNITKNOCKDOWNTOTALFRAME[this.UNIT[param1].nType])
               {
                  _loc6_ = this.UNITIMG[this.UNIT[param1].nType * UNITIMG_TYPE + UNITIMG_DEAD] + int(this.UNIT[param1].nDieFrame >> 1);
                  if(this.UNIT[param1].bFrog)
                  {
                     _loc6_ = imgEnemyBoss02FrogDown + int(this.UNIT[param1].nDieFrame >> 1);
                  }
                  this.lib.drawImgZoomAlpha(imgShadow,this.UNIT[param1].nPosX,this.UNIT[param1].nPosY - _loc4_,this.player.UNITSHADOWWIDTH[this.UNIT[param1].nType] * _loc3_ / 100,this.player.UNITSHADOWWIDTH[this.UNIT[param1].nType] * _loc3_ / 100,60,VCENTER | HCENTER);
                  if(Boolean(this.UNIT[param1].bAttacked) && this.ope.bDrawDmgEff(Player.UNITATTACKED,param1))
                  {
                     this.lib.drawObjDmgZoom(_loc6_,this.UNIT[param1].nPosX,this.UNIT[param1].nPosY + 10,_loc3_,_loc3_,BOTTOM | HCENTER);
                  }
                  else
                  {
                     this.lib.drawImgZoom(_loc6_,this.UNIT[param1].nPosX,this.UNIT[param1].nPosY + 10,_loc3_,_loc3_,BOTTOM | HCENTER);
                  }
                  this.drawAttackedEff(Player.UNITATTACKED,param1);
                  this.ope.resetAttacked(Player.UNITATTACKED,param1);
                  if(this.UNIT[param1].bWagon)
                  {
                     if(this.UNIT[param1].nDieFrame == 0)
                     {
                        this.UNIT[param1].nDiePos = this.UNIT[param1].nPosX;
                     }
                     if(this.UNIT[param1].nDieFrame < 30)
                     {
                        this.lib.drawImgZoomDodge(imgExplosion_b + int(this.UNIT[param1].nDieFrame >> 1),this.UNIT[param1].nPosX,this.UNIT[param1].nPosY + 10,_loc3_,_loc3_,BlendMode.NORMAL,BOTTOM | HCENTER);
                     }
                  }
                  if(!this.bGameMenu)
                  {
                     _loc5_ = int(this.UNIT[param1].nKnockDownDistance);
                     if(this.player.nGameMode == MODE_WARROAD)
                     {
                        _loc5_ >>= 1;
                     }
                     this.UNIT[param1].nPosX -= _loc5_ * (1 + this.nLeakFrame);
                     if(this.UNIT[param1].nPosX <= 0)
                     {
                        this.UNIT[param1].nPosX = 0;
                     }
                  }
               }
               else if(this.UNIT[param1].nDieFrame < this.player.UNITGHOSTUPTOTALFRAME[this.UNIT[param1].nType])
               {
                  _loc6_ = this.UNITIMG[this.UNIT[param1].nType * UNITIMG_TYPE + UNITIMG_DEAD] + int(this.player.UNITKNOCKDOWNTOTALFRAME[this.UNIT[param1].nType] - 1 >> 1);
                  if(this.UNIT[param1].bFrog)
                  {
                     _loc6_ = imgEnemyBoss02FrogDown + int(this.player.UNITKNOCKDOWNTOTALFRAME[this.UNIT[param1].nType] - 1 >> 1);
                  }
                  this.lib.drawImgZoomAlpha(imgShadow,this.UNIT[param1].nPosX,this.UNIT[param1].nPosY - _loc4_,this.player.UNITSHADOWWIDTH[this.UNIT[param1].nType] * _loc3_ / 100,this.player.UNITSHADOWWIDTH[this.UNIT[param1].nType] * _loc3_ / 100,60,VCENTER | HCENTER);
                  this.lib.drawImgZoom(_loc6_,this.UNIT[param1].nPosX,this.UNIT[param1].nPosY + 10,_loc3_,_loc3_,BOTTOM | HCENTER);
                  if(!this.UNIT[param1].bWagon)
                  {
                     this.lib.drawImgZoomDodge(imgUnitDie + int(this.UNIT[param1].nDieFrame - this.player.UNITKNOCKDOWNTOTALFRAME[this.UNIT[param1].nType] >> 1),this.UNIT[param1].nPosX,this.UNIT[param1].nPosY - 10,_loc3_,_loc3_,BlendMode.ADD,BOTTOM | HCENTER);
                  }
               }
               else
               {
                  _loc6_ = this.UNITIMG[this.UNIT[param1].nType * UNITIMG_TYPE + UNITIMG_DEAD] + int(this.player.UNITKNOCKDOWNTOTALFRAME[this.UNIT[param1].nType] - 1 >> 1);
                  if(this.UNIT[param1].bFrog)
                  {
                     _loc6_ = imgEnemyBoss02FrogDown + int(this.player.UNITKNOCKDOWNTOTALFRAME[this.UNIT[param1].nType] - 1 >> 1);
                  }
                  this.lib.drawImgZoomAlpha(imgShadow,this.UNIT[param1].nPosX,this.UNIT[param1].nPosY - _loc4_,this.player.UNITSHADOWWIDTH[this.UNIT[param1].nType] * _loc3_ / 100,this.player.UNITSHADOWWIDTH[this.UNIT[param1].nType] * _loc3_ / 100,60 - (this.UNIT[param1].nDieFrame - this.player.UNITGHOSTUPTOTALFRAME[this.UNIT[param1].nType]),VCENTER | HCENTER);
                  this.lib.drawImgZoomAlpha(this.UNITIMG[this.UNIT[param1].nType * UNITIMG_TYPE + UNITIMG_DEAD] + int(this.player.UNITKNOCKDOWNTOTALFRAME[this.UNIT[param1].nType] - 1 >> 1),this.UNIT[param1].nPosX,this.UNIT[param1].nPosY + 10,_loc3_,_loc3_,100 - (this.UNIT[param1].nDieFrame - this.player.UNITGHOSTUPTOTALFRAME[this.UNIT[param1].nType] << 1),BOTTOM | HCENTER);
               }
               _loc2_ = 0;
               while(_loc2_ < Unit.MAX_DMG)
               {
                  switch(this.UNIT[param1].DMGKIND[_loc2_])
                  {
                     case ENEMY_DARKZOMBIE:
                        if(int(this.UNIT[param1].DMGANIFRAME[_loc2_] >> 1) <= 14)
                        {
                           this.lib.drawImgZoomDodge(imgEnemyE10Eff + int(this.UNIT[param1].DMGANIFRAME[_loc2_] >> 1),this.ENEMY[param1].DMGPOSX[_loc2_],this.ENEMY[param1].DMGPOSY[_loc2_],_loc3_,_loc3_,BlendMode.NORMAL,BOTTOM | HCENTER);
                        }
                        if(!this.bGameMenu)
                        {
                           this.UNIT[param1].DMGANIFRAME[_loc2_] += 1 + this.nLeakFrame;
                        }
                        break;
                     case ENEMY_DARKZOMBIE2:
                        if(int(this.UNIT[param1].DMGANIFRAME[_loc2_] >> 1) <= 14)
                        {
                           this.lib.drawImgZoomDodge(imgEnemyE30Eff + int(this.UNIT[param1].DMGANIFRAME[_loc2_] >> 1),this.ENEMY[param1].DMGPOSX[_loc2_],this.ENEMY[param1].DMGPOSY[_loc2_],_loc3_,_loc3_,BlendMode.NORMAL,BOTTOM | HCENTER);
                        }
                        if(!this.bGameMenu)
                        {
                           this.UNIT[param1].DMGANIFRAME[_loc2_] += 1 + this.nLeakFrame;
                        }
                        break;
                     case ENEMY_BOSSMANDEVIL:
                        this.lib.drawImgZoomDodge(imgEnemyBoss10Magic + int(this.UNIT[param1].DMGANIFRAME[_loc2_] >> 1),this.UNIT[param1].DMGPOSX[_loc2_],this.UNIT[param1].DMGPOSY[_loc2_],_loc3_,_loc3_,BlendMode.ADD,BOTTOM | HCENTER);
                        if(!this.bGameMenu)
                        {
                           this.UNIT[param1].DMGANIFRAME[_loc2_] += 1 + this.nLeakFrame;
                        }
                        if(this.UNIT[param1].DMGANIFRAME[_loc2_] >= 60)
                        {
                           this.UNIT[param1].DMGKIND[_loc2_] = INITDATA;
                           this.UNIT[param1].DMGPOSX[_loc2_] = INITDATA;
                           this.UNIT[param1].DMGPOSY[_loc2_] = INITDATA;
                           this.UNIT[param1].DMGANIFRAME[_loc2_] = 0;
                           this.UNIT[param1].DMGFROMENEMY[_loc2_] = INITDATA;
                        }
                        break;
                     case ENEMY_PUMPKIN:
                        this.lib.drawImgZoomDodge(imgEnemyE14Arms + int(this.UNIT[param1].DMGANIFRAME[_loc2_] >> 1),this.UNIT[param1].DMGPOSX[_loc2_],this.UNIT[param1].DMGPOSY[_loc2_],_loc3_,_loc3_,BlendMode.NORMAL,BOTTOM | HCENTER);
                        if(!this.bGameMenu)
                        {
                           this.UNIT[param1].DMGANIFRAME[_loc2_] += 1 + this.nLeakFrame;
                        }
                        if(this.UNIT[param1].DMGANIFRAME[_loc2_] >= 30)
                        {
                           this.UNIT[param1].DMGKIND[_loc2_] = INITDATA;
                           this.UNIT[param1].DMGPOSX[_loc2_] = INITDATA;
                           this.UNIT[param1].DMGPOSY[_loc2_] = INITDATA;
                           this.UNIT[param1].DMGANIFRAME[_loc2_] = 0;
                           this.UNIT[param1].DMGFROMENEMY[_loc2_] = INITDATA;
                        }
                        break;
                     case ENEMY_PUMPKIN2:
                        this.lib.drawImgZoomDodge(imgEnemyE34Arms + int(this.UNIT[param1].DMGANIFRAME[_loc2_] >> 1),this.UNIT[param1].DMGPOSX[_loc2_],this.UNIT[param1].DMGPOSY[_loc2_],_loc3_,_loc3_,BlendMode.NORMAL,BOTTOM | HCENTER);
                        if(!this.bGameMenu)
                        {
                           this.UNIT[param1].DMGANIFRAME[_loc2_] += 1 + this.nLeakFrame;
                        }
                        if(this.UNIT[param1].DMGANIFRAME[_loc2_] >= 30)
                        {
                           this.UNIT[param1].DMGKIND[_loc2_] = INITDATA;
                           this.UNIT[param1].DMGPOSX[_loc2_] = INITDATA;
                           this.UNIT[param1].DMGPOSY[_loc2_] = INITDATA;
                           this.UNIT[param1].DMGANIFRAME[_loc2_] = 0;
                           this.UNIT[param1].DMGFROMENEMY[_loc2_] = INITDATA;
                        }
                  }
                  _loc2_++;
               }
               if(!this.bGameMenu)
               {
                  this.UNIT[param1].nDieFrame += 1 + this.nLeakFrame;
                  if(this.UNIT[param1].nDieFrame >= this.player.UNITDIETOTALFRAME[this.UNIT[param1].nType])
                  {
                     this.UNIT[param1].bDieAni = false;
                  }
               }
            }
            else
            {
               this.UNIT[param1].bAppear = false;
               this.UNIT[param1].bAttack = false;
               this.UNIT[param1].nAttackDelayStartTime = INITDATA;
               this.UNIT[param1].nAtkFrame = 0;
               this.UNIT[param1].nAttackEnemy = INITDATA;
               this.UNIT[param1].bMove = false;
               this.UNIT[param1].bFrog = false;
               this.UNIT[param1].bReturnFromFrog = false;
               this.UNIT[param1].nFrogStartTime = INITDATA;
               this.UNIT[param1].nFrogTime = INITDATA;
               this.UNIT[param1].nFrogAniFrame = 0;
               this.UNIT[param1].bPoison = false;
               this.UNIT[param1].nPoisonStartTime = INITDATA;
               this.UNIT[param1].nPoisonTime = INITDATA;
               this.UNIT[param1].nPoisonDpsTime = INITDATA;
               this.UNIT[param1].nPoisonDps = INITDATA;
               _loc2_ = 0;
               while(_loc2_ < Unit.MAX_DMG)
               {
                  this.UNIT[param1].DMGKIND[_loc2_] = INITDATA;
                  this.UNIT[param1].DMGPOSX[_loc2_] = INITDATA;
                  this.UNIT[param1].DMGPOSY[_loc2_] = INITDATA;
                  this.UNIT[param1].DMGANIFRAME[_loc2_] = 0;
                  this.UNIT[param1].DMGFROMENEMY[_loc2_] = INITDATA;
                  _loc2_++;
               }
               this.UNIT[param1].bKnockDown = false;
               this.UNIT[param1].nKnockDownDistance = 0;
               this.UNIT[param1].nKnockDownAniFrame = 0;
               this.UNIT[param1].nPosY = Player.UNITDIEPOSY;
            }
            this.UNIT[param1].nPosY = this.UNIT[param1]._nPosY;
         }
         else if(this.UNIT[param1].bArrive)
         {
            this.UNIT[param1]._nPosY = this.UNIT[param1].nPosY;
            this.UNIT[param1].nPosY += this.player.nBgEffPosY;
            this.lib.drawImgDodge(imgWarRoadUnitGoal + int(this.UNIT[param1].nDieFrame >> 1),this.nLcdW,this.UNIT[param1].nPosY,BlendMode.ADD,VCENTER | RIGHT);
            this.UNIT[param1].nPosY = this.UNIT[param1]._nPosY;
            if(!this.bGameMenu)
            {
               this.UNIT[param1].nDieFrame += 1 + this.nLeakFrame;
               if(this.UNIT[param1].nDieFrame >= 36)
               {
                  this.UNIT[param1].bArrive = false;
                  this.UNIT[param1].bAppear = false;
                  this.UNIT[param1].bAlive = false;
                  this.UNIT[param1].bMove = false;
                  this.UNIT[param1].bAttack = false;
                  this.UNIT[param1].nAttackDelayStartTime = INITDATA;
                  this.UNIT[param1].nAtkFrame = 0;
                  this.UNIT[param1].nAttackEnemy = INITDATA;
                  this.UNIT[param1].bFrog = false;
                  this.UNIT[param1].bReturnFromFrog = false;
                  this.UNIT[param1].nFrogStartTime = INITDATA;
                  this.UNIT[param1].nFrogTime = INITDATA;
                  this.UNIT[param1].nFrogAniFrame = 0;
                  this.UNIT[param1].bPoison = false;
                  this.UNIT[param1].nPoisonStartTime = INITDATA;
                  this.UNIT[param1].nPoisonTime = INITDATA;
                  this.UNIT[param1].nPoisonDpsTime = INITDATA;
                  this.UNIT[param1].nPoisonDps = INITDATA;
                  this.UNIT[param1].bKnockDown = false;
                  this.UNIT[param1].nKnockDownDistance = 0;
                  this.UNIT[param1].nKnockDownAniFrame = 0;
                  _loc2_ = 0;
                  while(_loc2_ < Unit.MAX_DMG)
                  {
                     this.UNIT[param1].DMGKIND[_loc2_] = INITDATA;
                     this.UNIT[param1].DMGPOSX[_loc2_] = INITDATA;
                     this.UNIT[param1].DMGPOSY[_loc2_] = INITDATA;
                     this.UNIT[param1].DMGANIFRAME[_loc2_] = 0;
                     this.UNIT[param1].DMGFROMENEMY[_loc2_] = INITDATA;
                     _loc2_++;
                  }
                  this.UNIT[param1].nPosY = Player.UNITDIEPOSY;
                  --this.player.nWarRoadEnemyHp;
                  this.lib.playEffect(82);
                  if(this.player.nWarRoadEnemyHp <= 0)
                  {
                     this.player.nWarRoadEnemyHp = 0;
                  }
               }
            }
         }
      }
      
      public function drawHero() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(this.nGameScene < Player.PALADOGDIESCENE)
         {
            this.player._nPosY = this.player.nPosY;
            this.player.nPosY += this.player.nBgEffPosY;
            if(this.player.nGameMode == MODE_WARROAD)
            {
               if(this.player.bAttack)
               {
                  this.lib.drawASEAni(Ani_Mace,Player.ANI_ATT,imgMace01 + 1,this.player.nArmsAniFrame % 20,this.player.nPosX,this.player.nPosY - 8,50,50,false);
               }
               else
               {
                  this.lib.drawASEAni(Ani_Mace,Player.ANI_WAIT,imgMace01 + 1,this.nGameFrame % 24,this.player.nPosX,this.player.nPosY - 8,50,50,false);
               }
               if(this.player.bAttack)
               {
                  this.lib.drawASEAni(Ani_Paladog,Player.ANI_ATT,imgPaladog,this.player.nArmsAniFrame,this.player.nPosX,this.player.nPosY - 8,50,50,false);
                  if(!this.bGameMenu)
                  {
                     this.player.nArmsAniFrame += 1 + this.nLeakFrame;
                  }
                  if(this.player.nArmsAniFrame >= Player.MAX_ARMSFRAME)
                  {
                     this.player.nArmsAniFrame = 0;
                     this.player.bAttack = false;
                  }
               }
               else
               {
                  this.lib.drawASEAni(Ani_Paladog,Player.ANI_WAIT,imgPaladog,this.nGameFrame % 24,this.player.nPosX,this.player.nPosY - 8,50,50,false);
               }
            }
            else
            {
               if(this.player.nNowArms > INITDATA)
               {
                  if(this.player.bMoveLeft)
                  {
                     this.lib.drawASEAniMirror(Ani_Mace,Player.ANI_WALK,imgMace01 + this.player.nNowArms,this.nGameFrame % 24,this.player.nPosX,this.player.nPosY - 5,100,100,false);
                  }
                  else if(this.player.bMoveRight)
                  {
                     this.lib.drawASEAni(Ani_Mace,Player.ANI_WALK,imgMace01 + this.player.nNowArms,this.nGameFrame % 24,this.player.nPosX,this.player.nPosY - 5,100,100,false);
                  }
                  else if(this.player.bAttack)
                  {
                     this.lib.drawASEAni(Ani_Mace,Player.ANI_ATT,imgMace01 + this.player.nNowArms,this.player.nArmsAniFrame % 20,this.player.nPosX,this.player.nPosY - 5,100,100,false);
                  }
                  else
                  {
                     this.lib.drawASEAni(Ani_Mace,Player.ANI_WAIT,imgMace01 + this.player.nNowArms,this.nGameFrame % 24,this.player.nPosX,this.player.nPosY - 5,100,100,false);
                  }
               }
               if(this.player.bMoveLeft)
               {
                  if(this.player.bAttacked && this.ope.bDrawDmgEff(Player.PALADOGATTACKED,INITDATA))
                  {
                     this.lib.drawASEAniMirror(Ani_Paladog,Player.ANI_WALK,imgPaladog,this.nGameFrame % 24,this.player.nPosX,this.player.nPosY - 5,100,100,true);
                  }
                  else
                  {
                     this.lib.drawASEAniMirror(Ani_Paladog,Player.ANI_WALK,imgPaladog,this.nGameFrame % 24,this.player.nPosX,this.player.nPosY - 5,100,100,false);
                  }
                  this.drawAttackedEff(Player.PALADOGATTACKED,INITDATA);
                  this.ope.resetAttacked(Player.PALADOGATTACKED,INITDATA);
               }
               else if(this.player.bMoveRight)
               {
                  if(this.player.bAttacked && this.ope.bDrawDmgEff(Player.PALADOGATTACKED,INITDATA))
                  {
                     this.lib.drawASEAni(Ani_Paladog,Player.ANI_WALK,imgPaladog,this.nGameFrame % 24,this.player.nPosX,this.player.nPosY - 5,100,100,true);
                  }
                  else
                  {
                     this.lib.drawASEAni(Ani_Paladog,Player.ANI_WALK,imgPaladog,this.nGameFrame % 24,this.player.nPosX,this.player.nPosY - 5,100,100,false);
                  }
                  this.drawAttackedEff(Player.PALADOGATTACKED,INITDATA);
                  this.ope.resetAttacked(Player.PALADOGATTACKED,INITDATA);
               }
               else if(this.player.bAttack)
               {
                  if(this.player.bAttacked && this.ope.bDrawDmgEff(Player.PALADOGATTACKED,INITDATA))
                  {
                     this.lib.drawASEAni(Ani_Paladog,Player.ANI_ATT,imgPaladog,this.player.nArmsAniFrame,this.player.nPosX,this.player.nPosY - 5,100,100,true);
                  }
                  else
                  {
                     this.lib.drawASEAni(Ani_Paladog,Player.ANI_ATT,imgPaladog,this.player.nArmsAniFrame,this.player.nPosX,this.player.nPosY - 5,100,100,false);
                  }
                  this.drawAttackedEff(Player.PALADOGATTACKED,INITDATA);
                  this.ope.resetAttacked(Player.PALADOGATTACKED,INITDATA);
                  if(!this.bGameMenu)
                  {
                     this.player.nArmsAniFrame += 1 + this.nLeakFrame;
                  }
                  if(this.player.nArmsAniFrame >= Player.MAX_ARMSFRAME)
                  {
                     this.player.nArmsAniFrame = 0;
                     this.player.bAttack = false;
                     if(this.player.nMoveDirection == MOVE_LEFT)
                     {
                        this.player.bMoveLeft = true;
                     }
                     else if(this.player.nMoveDirection == MOVE_RIGHT)
                     {
                        this.player.bMoveRight = true;
                     }
                     this.player.nMoveDirection = INITDATA;
                  }
               }
               else
               {
                  if(this.player.bAttacked && this.ope.bDrawDmgEff(Player.PALADOGATTACKED,INITDATA))
                  {
                     this.lib.drawASEAni(Ani_Paladog,Player.ANI_WAIT,imgPaladog,this.nGameFrame % 24,this.player.nPosX,this.player.nPosY - 5,100,100,true);
                  }
                  else
                  {
                     this.lib.drawASEAni(Ani_Paladog,Player.ANI_WAIT,imgPaladog,this.nGameFrame % 24,this.player.nPosX,this.player.nPosY - 5,100,100,false);
                  }
                  this.drawAttackedEff(Player.PALADOGATTACKED,INITDATA);
                  this.ope.resetAttacked(Player.PALADOGATTACKED,INITDATA);
               }
               if(this.player.nHp < this.ope.playerHp())
               {
                  this.lib.fillRect(this.player.nPosX - 25,this.player.nPosY - 150,50,3,14474460,TOP | LEFT);
                  this.lib.fillRect(this.player.nPosX - 25,this.player.nPosY - 150,50 * this.player.nHp / this.ope.playerHp(),3,255,TOP | LEFT);
               }
            }
            if(this.player.bPoison)
            {
               this.lib.drawImgDodge(imgEnemyBoss09Eff + int((this.nGameFrame >> 1) % 29),this.player.nPosX,this.player.nPosY,BlendMode.ADD,BOTTOM | HCENTER);
               this.player.nNowTime = getTimer();
               _loc2_ = (this.player.nNowTime - this.player.nPoisonDpsTime) * (1 + this.player.nGameSpeed);
               _loc2_ = 1000 / _loc2_;
               _loc2_ = this.player.nPoisonDps / _loc2_;
               this.player.nHp -= _loc2_;
               this.player.nPoisonDpsTime = getTimer();
               if(this.player.nHp <= 1)
               {
                  this.player.nHp = 1;
                  this.ope.detoxication(Player.PALADOGATTACKED,INITDATA);
               }
               if((this.player.nNowTime - this.player.nPoisonStartTime) * (1 + this.player.nGameSpeed) >= this.player.nPoisonTime)
               {
                  this.ope.detoxication(Player.PALADOGATTACKED,INITDATA);
               }
            }
            _loc1_ = 0;
            while(_loc1_ < Player.MAX_DMG)
            {
               switch(this.player.DMGKIND[_loc1_])
               {
                  case ENEMY_DARKZOMBIE:
                     if(int(this.player.DMGANIFRAME[_loc1_] >> 1) <= 14)
                     {
                        this.lib.drawImgDodge(imgEnemyE10Eff + int(this.player.DMGANIFRAME[_loc1_] >> 1),this.player.DMGPOSX[_loc1_],this.player.DMGPOSY[_loc1_],BlendMode.NORMAL,BOTTOM | HCENTER);
                     }
                     if(!this.bGameMenu)
                     {
                        this.player.DMGANIFRAME[_loc1_] += 1 + this.nLeakFrame;
                     }
                     if(this.player.DMGANIFRAME[_loc1_] >= FPS)
                     {
                        this.player.DMGKIND[_loc1_] = INITDATA;
                        this.player.DMGPOSX[_loc1_] = INITDATA;
                        this.player.DMGPOSY[_loc1_] = INITDATA;
                        this.player.DMGANIFRAME[_loc1_] = 0;
                     }
                     break;
                  case ENEMY_DARKZOMBIE2:
                     if(int(this.player.DMGANIFRAME[_loc1_] >> 1) <= 14)
                     {
                        this.lib.drawImgDodge(imgEnemyE30Eff + int(this.player.DMGANIFRAME[_loc1_] >> 1),this.player.DMGPOSX[_loc1_],this.player.DMGPOSY[_loc1_],BlendMode.NORMAL,BOTTOM | HCENTER);
                     }
                     if(!this.bGameMenu)
                     {
                        this.player.DMGANIFRAME[_loc1_] += 1 + this.nLeakFrame;
                     }
                     if(this.player.DMGANIFRAME[_loc1_] >= FPS)
                     {
                        this.player.DMGKIND[_loc1_] = INITDATA;
                        this.player.DMGPOSX[_loc1_] = INITDATA;
                        this.player.DMGPOSY[_loc1_] = INITDATA;
                        this.player.DMGANIFRAME[_loc1_] = 0;
                     }
                     break;
                  case ENEMY_BOSSMANDEVIL:
                     this.lib.drawImgDodge(imgEnemyBoss10Magic + int(this.player.DMGANIFRAME[_loc1_] >> 1),this.player.DMGPOSX[_loc1_],this.player.DMGPOSY[_loc1_],BlendMode.ADD,BOTTOM | HCENTER);
                     if(!this.bGameMenu)
                     {
                        this.nBeforeAtkFrame = this.player.DMGANIFRAME[_loc1_];
                        this.player.DMGANIFRAME[_loc1_] += 1 + this.nLeakFrame;
                        if(this.nBeforeAtkFrame < 29 && this.player.DMGANIFRAME[_loc1_] >= 29)
                        {
                           _loc3_ = int(this.ENEMY[this.player.DMGFROMENEMY[_loc1_]].nAttack);
                           if(this.lib.getRand(100) < 100)
                           {
                              _loc3_ = this.player.nHp - 1;
                           }
                           this.ope.paladogDmg(_loc3_,true);
                        }
                     }
                     if(this.player.DMGANIFRAME[_loc1_] >= FPS)
                     {
                        this.player.DMGKIND[_loc1_] = INITDATA;
                        this.player.DMGPOSX[_loc1_] = INITDATA;
                        this.player.DMGPOSY[_loc1_] = INITDATA;
                        this.player.DMGANIFRAME[_loc1_] = 0;
                        this.player.DMGFROMENEMY[_loc1_] = INITDATA;
                     }
                     break;
                  case ENEMY_PUMPKIN:
                     this.lib.drawImgDodge(imgEnemyE14Arms + int(this.player.DMGANIFRAME[_loc1_] >> 1),this.player.DMGPOSX[_loc1_],this.player.DMGPOSY[_loc1_],BlendMode.NORMAL,BOTTOM | HCENTER);
                     if(!this.bGameMenu)
                     {
                        this.nBeforeAtkFrame = this.player.DMGANIFRAME[_loc1_];
                        this.player.DMGANIFRAME[_loc1_] += 1 + this.nLeakFrame;
                        if(this.nBeforeAtkFrame < 13 && this.player.DMGANIFRAME[_loc1_] >= 13)
                        {
                           _loc4_ = int(this.ENEMY[this.player.DMGFROMENEMY[_loc1_]].nAttack);
                           this.lib.playEffect(56);
                           this.ope.paladogDmg(_loc4_,false);
                        }
                     }
                     if(this.player.DMGANIFRAME[_loc1_] >= FPS >> 1)
                     {
                        this.player.DMGKIND[_loc1_] = INITDATA;
                        this.player.DMGPOSX[_loc1_] = INITDATA;
                        this.player.DMGPOSY[_loc1_] = INITDATA;
                        this.player.DMGANIFRAME[_loc1_] = 0;
                        this.player.DMGFROMENEMY[_loc1_] = INITDATA;
                     }
                     break;
                  case ENEMY_PUMPKIN2:
                     this.lib.drawImgDodge(imgEnemyE34Arms + int(this.player.DMGANIFRAME[_loc1_] >> 1),this.player.DMGPOSX[_loc1_],this.player.DMGPOSY[_loc1_],BlendMode.NORMAL,BOTTOM | HCENTER);
                     if(!this.bGameMenu)
                     {
                        this.nBeforeAtkFrame = this.player.DMGANIFRAME[_loc1_];
                        this.player.DMGANIFRAME[_loc1_] += 1 + this.nLeakFrame;
                        if(this.nBeforeAtkFrame < 13 && this.player.DMGANIFRAME[_loc1_] >= 13)
                        {
                           _loc5_ = int(this.ENEMY[this.player.DMGFROMENEMY[_loc1_]].nAttack);
                           this.lib.playEffect(56);
                           this.ope.paladogDmg(_loc5_,false);
                        }
                     }
                     if(this.player.DMGANIFRAME[_loc1_] >= FPS >> 1)
                     {
                        this.player.DMGKIND[_loc1_] = INITDATA;
                        this.player.DMGPOSX[_loc1_] = INITDATA;
                        this.player.DMGPOSY[_loc1_] = INITDATA;
                        this.player.DMGANIFRAME[_loc1_] = 0;
                        this.player.DMGFROMENEMY[_loc1_] = INITDATA;
                     }
               }
               _loc1_++;
            }
            this.player.nPosY = this.player._nPosY;
         }
         else
         {
            if(this.player.nGameMode == MODE_WARROAD)
            {
               this.lib.drawImgZoomAlpha(imgShadow,this.player.nPosX,this.player.nPosY + 5 - ((Player.CHAIMG_HEIGHT >> 2) - (Player.SHADOWIMG_POS >> 1)),16 + 16 / Player.PALADOGDIETOTALFRAME * this.player.nPaladogDieFrame,20 + 20 / Player.PALADOGDIETOTALFRAME * this.player.nPaladogDieFrame,60,VCENTER | HCENTER);
            }
            else
            {
               this.lib.drawImgZoomAlpha(imgShadow,this.player.nPosX,this.player.nPosY + 10 - ((Player.CHAIMG_HEIGHT >> 1) - Player.SHADOWIMG_POS),32,40,60,VCENTER | HCENTER);
            }
            if(this.player.nGameMode != MODE_WARROAD)
            {
               this.lib.drawImgZoomDodge(imgAura + int(this.nGameFrame / 6) % 6,this.player.nPosX,this.player.nPosY + 10 - ((Player.CHAIMG_HEIGHT >> 1) - Player.SHADOWIMG_POS),75 + this.player.HEROSKILL[Player.SKILL_AREAAURA] * 25,75 + this.player.HEROSKILL[Player.SKILL_AREAAURA] * 25,BlendMode.ADD,VCENTER | HCENTER);
            }
         }
         if(this.player.nGameMode == MODE_WARROAD)
         {
            _loc1_ = 0;
            for(; _loc1_ < Player.MAX_ATTACK; _loc1_++)
            {
               if(this.player.ATTACKANI[_loc1_] <= INITDATA)
               {
                  continue;
               }
               switch(this.player.ATTACKANI[_loc1_])
               {
                  case ATTACK_HEAL:
                     if(int(this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] >> 1) < 19)
                     {
                        this.lib.drawImgZoomDodge(this.player.ARMSANIIMG[MACE_HEAL * Player.MACEACT_NUM + Player.MACEACT_EFFA] + int(this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] >> 1),this.player.ATTACKPOSX[_loc1_],this.player.ATTACKPOSY[_loc1_],50,50,BlendMode.ADD,BOTTOM | HCENTER);
                     }
               }
            }
         }
         else
         {
            _loc1_ = 0;
            for(; _loc1_ < Player.MAX_ATTACK; _loc1_++)
            {
               if(this.player.ATTACKANI[_loc1_] <= INITDATA)
               {
                  continue;
               }
               switch(this.player.ATTACKANI[_loc1_])
               {
                  case MACE_GODPUNCH:
                     if(int(this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] >> 1) < 14)
                     {
                        this.lib.drawImgDodge(this.player.ARMSANIIMG[this.player.ATTACKANI[_loc1_] * Player.MACEACT_NUM + Player.MACEACT_EFFA] + int(this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] >> 1),this.player.ATTACKPOSX[_loc1_],this.player.ATTACKPOSY[_loc1_],BlendMode.ADD,BOTTOM | HCENTER);
                     }
                     break;
                  case MACE_HEAL:
                     if(int(this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] >> 1) < 19)
                     {
                        this.lib.drawImgDodge(this.player.ARMSANIIMG[this.player.ATTACKANI[_loc1_] * Player.MACEACT_NUM + Player.MACEACT_EFFA] + int(this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] >> 1),this.player.ATTACKPOSX[_loc1_],this.player.ATTACKPOSY[_loc1_],BlendMode.ADD,BOTTOM | HCENTER);
                     }
                     break;
                  case MACE_LIGHT:
                     this.lib.drawImgDodge(this.player.ARMSANIIMG[this.player.ATTACKANI[_loc1_] * Player.MACEACT_NUM + Player.MACEACT_EFFA] + int(this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] >> 1),this.player.ATTACKPOSX[_loc1_],this.player.ATTACKPOSY[_loc1_],BlendMode.ADD,BOTTOM | HCENTER);
                     break;
                  case MACE_FIRE:
                     this.lib.drawImgDodge(this.player.ARMSANIIMG[this.player.ATTACKANI[_loc1_] * Player.MACEACT_NUM + Player.MACEACT_EFFA] + int(this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] >> 1),this.player.ATTACKPOSX[_loc1_],this.player.ATTACKPOSY[_loc1_],BlendMode.ADD,BOTTOM | HCENTER);
                     break;
                  case MACE_METEO:
                     if(int(this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] >> 1) < 20)
                     {
                        this.lib.drawImgDodge(this.player.ARMSANIIMG[this.player.ATTACKANI[_loc1_] * Player.MACEACT_NUM + Player.MACEACT_EFFA] + int(this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] >> 1),this.player.ATTACKPOSX[_loc1_],this.player.ATTACKPOSY[_loc1_],BlendMode.ADD,BOTTOM | HCENTER);
                     }
                     if(this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] > METEO_ATTACKPOINT)
                     {
                        this.lib.drawImgZoomDodge(imgExplosion_b + int(this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] - (METEO_ATTACKPOINT + 1) >> 1),this.player.ATTACKPOSX[_loc1_],this.player.ATTACKPOSY[_loc1_],100,100,BlendMode.NORMAL,BOTTOM | HCENTER);
                     }
                     break;
                  case MACE_WIND:
                     this.lib.drawImgZoomDodge(this.player.ARMSANIIMG[this.player.ATTACKANI[_loc1_] * Player.MACEACT_NUM + Player.MACEACT_EFFA] + int(this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] >> 1),this.player.ATTACKPOSX[_loc1_],this.player.ATTACKPOSY[_loc1_],100,100,BlendMode.ADD,BOTTOM | HCENTER);
                     break;
                  case MACE_FOOD:
                     this.lib.drawImgDodge(this.player.ARMSANIIMG[this.player.ATTACKANI[_loc1_] * Player.MACEACT_NUM + Player.MACEACT_EFFA] + int(this.player.ATTACKANI[_loc1_ + Player.MAX_ATTACK] >> 1),this.player.ATTACKPOSX[_loc1_],this.player.ATTACKPOSY[_loc1_],BlendMode.ADD,BOTTOM | HCENTER);
               }
            }
         }
         if(this.player.bLevelUp)
         {
            if(!this.player.bDrawLevelUpTurn)
            {
               if(this.player.nGameMode == MODE_WARROAD)
               {
                  this.lib.drawASEAni(Ani_LevelUp,3,imgLevelUpEff,this.player.nLevelUpFrame,this.player.nPosX,this.player.nPosY - ((Player.CHAIMG_HEIGHT >> 2) - (Player.SHADOWIMG_POS >> 1)),50,50,false);
                  this.lib.drawASEAniEffect(Ani_LevelUp,4,imgLevelUpEff,this.player.nLevelUpFrame,this.player.nPosX,this.player.nPosY - ((Player.CHAIMG_HEIGHT >> 2) - (Player.SHADOWIMG_POS >> 1)),50,50,false);
               }
               else
               {
                  this.lib.drawASEAni(Ani_LevelUp,3,imgLevelUpEff,this.player.nLevelUpFrame,this.player.nPosX,this.player.nPosY + 10 - ((Player.CHAIMG_HEIGHT >> 1) - Player.SHADOWIMG_POS),100,100,false);
                  this.lib.drawASEAniEffect(Ani_LevelUp,4,imgLevelUpEff,this.player.nLevelUpFrame,this.player.nPosX,this.player.nPosY + 10 - ((Player.CHAIMG_HEIGHT >> 1) - Player.SHADOWIMG_POS),100,100,false);
               }
            }
            else if(this.player.bDrawLevelUpTurn && this.nGameState != GAME_LEVELUP)
            {
               if(this.player.nGameMode == MODE_WARROAD)
               {
                  this.lib.drawASEAni(Ani_LevelUp,0,imgLevelUpEff,FPS - this.player.nLevelUpFrame,this.player.nPosX,this.player.nPosY - ((Player.CHAIMG_HEIGHT >> 2) - (Player.SHADOWIMG_POS >> 1)),50,50,false);
                  this.lib.drawASEAniEffect(Ani_LevelUp,1,imgLevelUpEff,FPS - this.player.nLevelUpFrame,this.player.nPosX,this.player.nPosY - ((Player.CHAIMG_HEIGHT >> 2) - (Player.SHADOWIMG_POS >> 1)),50,50,false);
               }
               else
               {
                  this.lib.drawASEAni(Ani_LevelUp,0,imgLevelUpEff,FPS - this.player.nLevelUpFrame,this.player.nPosX,this.player.nPosY + 10 - ((Player.CHAIMG_HEIGHT >> 1) - Player.SHADOWIMG_POS),100,100,false);
                  this.lib.drawASEAniEffect(Ani_LevelUp,1,imgLevelUpEff,FPS - this.player.nLevelUpFrame,this.player.nPosX,this.player.nPosY + 10 - ((Player.CHAIMG_HEIGHT >> 1) - Player.SHADOWIMG_POS),100,100,false);
               }
            }
         }
      }
      
      public function drawTopUi() : void
      {
         if(this.nTopUiState != this.nBeforeTopUiState)
         {
            this.nBeforeTopUiState = this.nTopUiState;
            this.nTopUiScene = 0;
            this.nBeforeTopUiScene = 0;
            this.nTopUiFrame = 0;
         }
         else if(this.nTopUiScene != this.nBeforeTopUiScene)
         {
            this.nBeforeTopUiScene = this.nTopUiScene;
            this.nTopUiFrame = 0;
         }
         switch(this.nTopUiState)
         {
            case TOPUI_CARD:
               this.topUiCard();
               break;
            case TOPUI_EMBLEM:
               this.topUiEmblem();
               break;
            case TOPUI_ACHIEVE:
               this.topUiAchieve();
               break;
            case TOPUI_RANKING:
               this.topUiRanking();
               break;
            case TOPUI_ADDGEM:
               this.topUiAddGem();
               break;
            case TOPUI_OPTION:
               this.topUiOption();
         }
         this.topUiDraw();
         this.nTopUiFrame += 1 + this.nLeakFrame;
      }
      
      public function topUiDraw() : void
      {
         var _loc1_:int = 0;
         switch(this.nTopUiScene)
         {
            case 0:
               this.lib.fillRect(0,0,this.nLcdW,Player.BG_BASEPOSY,0,TOP | LEFT);
               if(this.nMainState == MAIN_GAME)
               {
                  this.lib.drawImg(imgUi + 78,0,0,TOP | LEFT);
                  this.lib.drawImg(imgUi + 89,0,0,TOP | LEFT);
                  this.ope.searchQuestComplete();
               }
               else if(this.nMainState == MAIN_STAGESELECT)
               {
               }
               this.lib.drawImg(imgUi + 77,0,0,TOP | LEFT);
               if(this.bCardBtn)
               {
                  this.lib.drawImg(imgUi + 3,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bCardBtn = false;
                     if(this.nMainState == MAIN_GAME)
                     {
                        if(this.nGameState == GAME_PLAY)
                        {
                           this.nGameState = GAME_MENU;
                        }
                     }
                     this.nTopUiState = TOPUI_CARD;
                     this.player.nCardBookPage = 0;
                  }
               }
               else if(!this.bCardOver)
               {
                  this.lib.drawImgZoom(imgUi + 5,0,0,90,90,TOP | LEFT);
               }
               else
               {
                  this.lib.drawImgZoom(imgUi + 5,-2,-2,100,100,TOP | LEFT);
               }
               this.lib.drawImg(imgUi + 4,0,0,TOP | LEFT);
               if(this.bEmblemBtn)
               {
                  this.lib.drawImg(imgUi + 6,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bEmblemBtn = false;
                     this.nTopUiState = TOPUI_EMBLEM;
                  }
               }
               else if(!this.bEmblemOver)
               {
                  this.lib.drawImgZoom(imgUi + 8,0,0,90,90,TOP | LEFT);
               }
               else
               {
                  this.lib.drawImgZoom(imgUi + 8,-6,-2,100,100,TOP | LEFT);
               }
               this.lib.drawImg(imgUi + 7,0,0,TOP | LEFT);
               if(this.bAchieveBtn)
               {
                  this.lib.drawImg(imgUi,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bAchieveBtn = false;
                     this.nTopUiState = TOPUI_ACHIEVE;
                  }
               }
               else if(!this.bAchieveOver)
               {
                  this.lib.drawImg(imgUi + 2,0,0,TOP | LEFT);
               }
               else
               {
                  this.lib.drawImgZoom(imgUi + 2,-8,-2,110,110,TOP | LEFT);
               }
               this.lib.drawImg(imgUi + 1,0,0,TOP | LEFT);
               if(this.bRankingBtn)
               {
                  this.lib.drawImg(imgUi + 23,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bRankingBtn = false;
                     this.nTopUiState = TOPUI_RANKING;
                  }
               }
               else if(!this.bRankingOver)
               {
                  this.lib.drawImg(imgUi + 25,0,0,TOP | LEFT);
               }
               else
               {
                  this.lib.drawImgZoom(imgUi + 25,-11,-1,110,110,TOP | LEFT);
               }
               this.lib.drawImg(imgUi + 24,0,0,TOP | LEFT);
               if(this.bAddGemBtn)
               {
                  this.lib.drawImg(imgUi + 12,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bAddGemBtn = false;
                     this.nTopUiState = TOPUI_ADDGEM;
                  }
               }
               else
               {
                  this.lib.drawImg(imgUi + 13,0,0,TOP | LEFT);
               }
               this.lib.drawNumImg("" + this.lib.setStrMoney(this.player.nGem),this.nLcdW - 112,18,NUM_MONEY,TOP | RIGHT);
               if(this.nMainState == MAIN_GAME)
               {
                  if(this.bPauseBtn)
                  {
                     this.lib.drawImg(imgUi + 21,0,0,TOP | LEFT);
                     this.nBtnFrame += 1 + this.nLeakFrame;
                     if(this.nBtnFrame > MAX_BTNFRAME)
                     {
                        this.nBtnFrame = 0;
                        this.bPauseBtn = false;
                        this.nGameState = GAME_MENU;
                     }
                  }
                  else
                  {
                     this.lib.drawImg(imgUi + 22,0,0,TOP | LEFT);
                  }
               }
               else if(this.bOptionBtn)
               {
                  this.lib.drawImg(imgUi + 71,0,0,TOP | LEFT);
                  this.nBtnFrame += 1 + this.nLeakFrame;
                  if(this.nBtnFrame > MAX_BTNFRAME)
                  {
                     this.nBtnFrame = 0;
                     this.bOptionBtn = false;
                     this.nTopUiState = TOPUI_OPTION;
                  }
               }
               else
               {
                  this.lib.drawImg(imgUi + 72,0,0,TOP | LEFT);
               }
         }
      }
      
      public function topUiCard() : void
      {
         var _loc1_:int = 0;
         switch(this.nTopUiScene)
         {
            case 0:
               this.lib.fillRect(0,Player.BG_BASEPOSY,this.nLcdW,this.nLcdH - Player.BG_BASEPOSY,0,TOP | LEFT);
               this.lib.drawImg(imgCardUi,0,Player.BG_BASEPOSY,TOP | LEFT);
               _loc1_ = 0;
               while(_loc1_ < 3)
               {
                  this.lib.drawBorderString(this.CARDBOOKDB[this.player.nCardBookPage].strCardSetName,388,Player.BG_BASEPOSY + 63,0,16777215,100,VCENTER | HCENTER);
                  if(this.player.CARDBAG[this.CARDBOOKDB[this.player.nCardBookPage].nCardIndex[_loc1_]] >= this.CARDBOOKDB[this.player.nCardBookPage].nCardNum[_loc1_])
                  {
                     this.lib.drawImg(imgCard + this.CARDBOOKDB[this.player.nCardBookPage].nCardIndex[_loc1_],206 + _loc1_ * 176,Player.BG_BASEPOSY + 196,VCENTER | HCENTER);
                  }
                  else
                  {
                     this.lib.drawImgAlpha(imgCard + this.CARDBOOKDB[this.player.nCardBookPage].nCardIndex[_loc1_],206 + _loc1_ * 176,Player.BG_BASEPOSY + 196,50,VCENTER | HCENTER);
                  }
                  this.lib.drawBorderString("" + this.CARDBOOKDB[this.player.nCardBookPage].nCardNum[_loc1_],185 + _loc1_ * 176,Player.BG_BASEPOSY + 318,0,16777215,100,VCENTER | HCENTER);
                  this.lib.drawBorderString("" + this.player.CARDBAG[this.CARDBOOKDB[this.player.nCardBookPage].nCardIndex[_loc1_]],235 + _loc1_ * 176,Player.BG_BASEPOSY + 318,0,16777215,100,VCENTER | HCENTER);
                  _loc1_++;
               }
               this.lib.drawBorderString("" + this.CARDBOOKDB[this.player.nCardBookPage].nRewardNum,330,Player.BG_BASEPOSY + 400,0,16777215,100,VCENTER | HCENTER);
               this.lib.drawBorderString("" + (this.player.nCardBookPage + 1) + " / " + Player.CARDBOOK_PAGE,this.nLcdWC,Player.BG_BASEPOSY + 460,0,16777215,100,VCENTER | HCENTER);
               this.lib.drawImg(imgCardUi + 2,512,Player.BG_BASEPOSY + 400,VCENTER | HCENTER);
               this.lib.drawImg(imgCardUi + 1,10,this.nLcdHC,VCENTER | LEFT);
               this.lib.drawImg(imgCardUi + 1,this.nLcdW - 10,this.nLcdHC,VCENTER | RIGHT);
               this.lib.drawImg(imgCardUi + 1,720,Player.BG_BASEPOSY + 38,VCENTER | HCENTER);
               this.bActive = false;
         }
      }
      
      public function topUiEmblem() : void
      {
      }
      
      public function topUiAchieve() : void
      {
      }
      
      public function topUiRanking() : void
      {
      }
      
      public function topUiAddGem() : void
      {
      }
      
      public function topUiOption() : void
      {
      }
      
      public function drawUi() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         _loc6_ = 0;
         if(GAME_CHEAT)
         {
            if(this.bGameSave)
            {
               this.lib.drawBorderString("Chế Độ Lưu",100,Player.BG_BASEPOSY + 15,6041349,16776960,100,TOP | LEFT);
            }
         }
         this.lib.drawImg(imgUi + 73,0,Player.BG_BASEPOSY,TOP | LEFT);
         this.lib.fillRect(23,Player.BG_BASEPOSY + 25,22,11,3351309,TOP | LEFT);
         this.lib.drawNumImg("" + this.player.nLevel,26,Player.BG_BASEPOSY + 2,NUM_MANA,TOP | LEFT);
         _loc7_ = 11 * this.player.nExp / this.ope.nextExp();
         if(_loc7_ >= 11)
         {
            _loc7_ = 11;
         }
         this.lib.fillRect(23,Player.BG_BASEPOSY + 36 - _loc7_,22,_loc7_,2031360,TOP | LEFT);
         this.lib.drawNumImg("" + this.lib.setStrMoney(this.player.nMoney),this.nLcdW - 80,Player.BG_BASEPOSY + 15,NUM_MONEY,TOP | RIGHT);
         this.lib.drawImg(imgUi + 90,this.nMoneyDrawPosX - 2,Player.BG_BASEPOSY + 10,TOP | RIGHT);
         if(this.bPauseBtn)
         {
            this.lib.drawImg(imgUi + 21,0,Player.BG_BASEPOSY,TOP | LEFT);
            this.nBtnFrame += 1 + this.nLeakFrame;
            if(this.nBtnFrame > MAX_BTNFRAME)
            {
               this.nBtnFrame = 0;
               this.bPauseBtn = false;
               this.nGameState = GAME_MENU;
            }
         }
         else
         {
            this.lib.drawImg(imgUi + 22,0,Player.BG_BASEPOSY,TOP | LEFT);
         }
         switch(this.player.nGameMode)
         {
            case MODE_WARROAD:
               this.lib.fillRect(59,446,207,11,0,TOP | LEFT);
               this.lib.gradationV(59,446,207 * this.player.nFood / this.ope.playerFood(),11,16709888,13401088,TOP | LEFT);
               this.lib.fillRect(496,446,207,11,0,TOP | LEFT);
               this.lib.gradationV(703 - 207 * this.player.nMana / this.ope.playerMana(),446,207 * this.player.nMana / this.ope.playerMana(),11,64509,36476,TOP | LEFT);
               this.lib.drawImg(imgWarRoad + 1,0,0,TOP | LEFT);
               this.lib.drawNumImg("" + int(this.player.nFood),115,432,NUM_MANA,TOP | RIGHT);
               this.lib.drawNumImg("" + int(this.ope.playerFood()),130,432,NUM_MANA,TOP | LEFT);
               this.lib.drawNumImg("" + int(this.player.nMana),630,432,NUM_MANA,TOP | RIGHT);
               this.lib.drawNumImg("" + int(this.ope.playerMana()),645,432,NUM_MANA,TOP | LEFT);
               this.lib.fillRect(290,20,178,10,647673,TOP | LEFT);
               this.lib.fillRect(468 - 178 * this.player.nWarRoadEnemyHp / Player.nWarRoadEnemyMaxHp,20,178 * this.player.nWarRoadEnemyHp / Player.nWarRoadEnemyMaxHp + 1,10,16711680,TOP | LEFT);
               this.lib.drawImg(imgWarRoad + 2,0,0,TOP | LEFT);
               if(this.player.bWarRoadSelectUnit)
               {
                  this.lib.drawImg(imgWarRoad + 12,0,0,TOP | LEFT);
               }
               _loc1_ = 0;
               while(_loc1_ < MAX_UNITKIND)
               {
                  if(this.player.UNITEQUIP[_loc1_])
                  {
                     if(this.player.UNITBTN[_loc1_])
                     {
                        this.lib.drawImg(imgUi + 38 + _loc1_ * 3,0,71,TOP | LEFT);
                        this.player.UNITBTNFRAME[_loc1_] += 1 + this.nLeakFrame;
                        if(this.player.UNITBTNFRAME[_loc1_] > MAX_BTNFRAME)
                        {
                           this.player.UNITBTN[_loc1_] = false;
                           this.player.UNITBTNFRAME[_loc1_] = 0;
                        }
                     }
                     else if(this.player.UNITCHARGED[_loc1_])
                     {
                        if(this.player.UNITCOOLING[_loc1_])
                        {
                           this.lib.drawImg(imgUi + 37 + _loc1_ * 3,0,71,TOP | LEFT);
                        }
                        else
                        {
                           this.lib.drawImg(imgUi + 39 + _loc1_ * 3,0,71,TOP | LEFT);
                        }
                     }
                     else
                     {
                        this.lib.drawImg(imgUi + 37 + _loc1_ * 3,0,71,TOP | LEFT);
                     }
                     if(this.player.UNITCOOLING[_loc1_])
                     {
                        this.lib.drawImg(imgUnitGage + this.player.UNITCOOLINGFRAME[_loc1_],20 + _loc1_ * 81,470,TOP | LEFT);
                        _loc5_ = 1;
                        this.player.nNowTime = getTimer();
                        if(this.bGameMenu)
                        {
                           this.player.UNITCOOLINGTIME[_loc1_] += this.player.nNowTime - this.nUiPassTime[_loc1_];
                           this.nUiPassTime[_loc1_] = getTimer();
                        }
                        _loc2_ = this.UNITDB[_loc1_].nCoolTime * ((6 - this.player.HEROSKILL[Player.SKILL_LEADERSHIP]) / 6) * 1000;
                        _loc2_ /= _loc5_;
                        _loc3_ = (this.player.nNowTime - this.player.UNITCOOLINGTIME[_loc1_]) * (1 + this.player.nGameSpeed);
                        _loc4_ = _loc3_ / _loc2_;
                        if(this.player.UNITCOOLINGFRAME[_loc1_] <= int(Player.UNIT_COOLFRAME * _loc4_))
                        {
                           this.player.UNITCOOLINGFRAME[_loc1_] = int(Player.UNIT_COOLFRAME * _loc4_);
                        }
                        if(this.player.UNITCOOLINGFRAME[_loc1_] >= Player.UNIT_COOLFRAME)
                        {
                           this.player.UNITCOOLINGFRAME[_loc1_] = 0;
                           this.player.UNITCOOLING[_loc1_] = false;
                        }
                     }
                  }
                  else
                  {
                     this.lib.drawImg(imgUi + 64,_loc1_ * 81,71,TOP | LEFT);
                  }
                  _loc1_++;
               }
               _loc1_ = 0;
               while(_loc1_ < Player.EQUIPARMS_NUM)
               {
                  if(this.player.EQUIPINVEN[_loc1_] > INITDATA)
                  {
                     if(this.player.FIREBTN[_loc1_])
                     {
                        this.lib.drawImg(imgWarRoad + 9 + _loc1_,0,0,TOP | LEFT);
                        this.player.FIREBTNFRAME[_loc1_] += 1 + this.nLeakFrame;
                        if(this.player.FIREBTNFRAME[_loc1_] > MAX_BTNFRAME)
                        {
                           this.player.FIREBTN[_loc1_] = false;
                           this.player.FIREBTNFRAME[_loc1_] = 0;
                        }
                     }
                     else if(this.player.ARMSCHARGED[_loc1_])
                     {
                        this.lib.drawImg(imgWarRoad + 6 + _loc1_,0,0,TOP | LEFT);
                     }
                     else
                     {
                        this.lib.drawImg(imgWarRoad + 3 + _loc1_,0,0,TOP | LEFT);
                     }
                  }
                  _loc1_++;
               }
               this.lib.drawImg(imgUi + 69,0,71,TOP | LEFT);
               this.lib.drawImg(imgWarRoad + 14,0,0,TOP | LEFT);
               break;
            case MODE_NORMAL:
            case MODE_WAGON:
            case MODE_BOSS:
            case MODE_SURVIVAL:
               this.lib.fillRect(59,375,207,11,0,TOP | LEFT);
               this.lib.gradationV(59,375,207 * this.player.nFood / this.ope.playerFood(),11,16709888,13401088,TOP | LEFT);
               this.lib.fillRect(497,375,206,11,0,TOP | LEFT);
               this.lib.gradationV(703 - 206 * this.player.nMana / this.ope.playerMana(),375,206 * this.player.nMana / this.ope.playerMana(),11,64509,36476,TOP | LEFT);
               this.lib.drawImg(imgUi + 74,0,0,TOP | LEFT);
               this.lib.drawNumImg("" + int(this.player.nFood),116,361,NUM_MANA,TOP | RIGHT);
               this.lib.drawNumImg("" + int(this.ope.playerFood()),130,361,NUM_MANA,TOP | LEFT);
               this.lib.drawNumImg("" + int(this.player.nMana),630,361,NUM_MANA,TOP | RIGHT);
               this.lib.drawNumImg("" + int(this.ope.playerMana()),645,361,NUM_MANA,TOP | LEFT);
               if(this.player.nGameMode == MODE_WAGON)
               {
                  this.lib.fillRect(288,Player.BG_BASEPOSY + 34,168,8,6375461,TOP | LEFT);
                  this.lib.drawImg(imgWagon,0,0,TOP | LEFT);
                  _loc6_ = 168 * (this.UNIT[Player.WAGONPOS].nPosX + Player.WAGON_STARTPOS - this.player.nBgPosX) / (Player.BG_W - Player.WAGON_GOALPOS + 60);
                  if(_loc6_ >= 168)
                  {
                     _loc6_ = 168;
                  }
                  this.lib.fillRect(288,Player.BG_BASEPOSY + 34,_loc6_,8,647673,TOP | LEFT);
                  this.lib.drawImgZoom(imgWagon + 1,288 + _loc6_,Player.BG_BASEPOSY + 18,43,43,TOP | HCENTER);
                  this.lib.drawImgRotationZoom(imgHeroPos + int(this.nGameFrame >> 1) % 21,288 + 178 * (this.player.nPosX - this.player.nBgPosX) / Player.BG_W,Player.BG_BASEPOSY + 42,50,50,TOP | HCENTER);
               }
               else if(this.player.nGameMode != MODE_SURVIVAL)
               {
                  this.lib.fillRect(290,Player.BG_BASEPOSY + 20,178,10,6375461,TOP | LEFT);
                  this.lib.drawImg(imgUi + 75,0,5,TOP | LEFT);
                  this.lib.fillRect(368 - 78 * this.player.nHp / this.ope.playerHp(),Player.BG_BASEPOSY + 20,78 * this.player.nHp / this.ope.playerHp(),10,647673,TOP | LEFT);
                  if(this.player.nGameMode == MODE_BOSS)
                  {
                     if(this.player.bEnemyStationCrashed || this.player.bBossEnemyAppear)
                     {
                        this.lib.fillRect(391,Player.BG_BASEPOSY + 20,77 * this.ENEMY[this.player.nBossEnemyIndex].nHp / this.ENEMY[this.player.nBossEnemyIndex].nMaxHp,10,16711680,TOP | LEFT);
                     }
                     else
                     {
                        this.lib.fillRect(391,Player.BG_BASEPOSY + 20,77 * this.player.nEnemyStationHp / this.player.nEnemyStationMaxHp,10,16711680,TOP | LEFT);
                     }
                  }
                  else
                  {
                     this.lib.fillRect(391,Player.BG_BASEPOSY + 20,77 * this.player.nEnemyStationHp / this.player.nEnemyStationMaxHp,10,16711680,TOP | LEFT);
                  }
                  this.lib.drawImgZoom(imgHeroPos + int(this.nGameFrame >> 1) % 21,184 * (this.player.nPosX - this.player.nBgPosX) / Player.BG_W + 287,Player.BG_BASEPOSY + 20,50,50,BOTTOM | HCENTER);
               }
               if(this.bBossDialog)
               {
                  _loc8_ = 0;
                  _loc1_ = 0;
                  while(_loc1_ < this.BOSSDIALOGDB[int(this.player.nStage / 12) + this.player.nChapter * 2].STRBOSSDIALOG.length)
                  {
                     if(this.BOSSDIALOGDB[int(this.player.nStage / 12) + this.player.nChapter * 2].STRBOSSDIALOG[_loc1_] != null)
                     {
                        _loc8_++;
                     }
                     _loc1_++;
                  }
                  this.lib.drawImg(imgDiaWindow + 1,-20,50,TOP | LEFT);
                  _loc1_ = 0;
                  for(; _loc1_ < this.BOSSDIALOGDB[int(this.player.nStage / 12) + this.player.nChapter * 2].STRBOSSDIALOG.length; _loc1_++)
                  {
                     if(this.BOSSDIALOGDB[int(this.player.nStage / 12) + this.player.nChapter * 2].STRBOSSDIALOG[_loc1_] == null)
                     {
                        continue;
                     }
                     switch(_loc8_)
                     {
                        case 1:
                           this.lib.drawBorderString(this.BOSSDIALOGDB[int(this.player.nStage / 12) + this.player.nChapter * 2].STRBOSSDIALOG[_loc1_],250,103,0,16777215,100,TOP | LEFT);
                           break;
                        case 2:
                           this.lib.drawBorderString(this.BOSSDIALOGDB[int(this.player.nStage / 12) + this.player.nChapter * 2].STRBOSSDIALOG[_loc1_],250,93 + _loc1_ * 20,0,16777215,100,TOP | LEFT);
                           break;
                        case 3:
                           this.lib.drawBorderString(this.BOSSDIALOGDB[int(this.player.nStage / 12) + this.player.nChapter * 2].STRBOSSDIALOG[_loc1_],250,83 + _loc1_ * 20,0,16777215,100,TOP | LEFT);
                           break;
                        case 4:
                           this.lib.drawBorderString(this.BOSSDIALOGDB[int(this.player.nStage / 12) + this.player.nChapter * 2].STRBOSSDIALOG[_loc1_],250,73 + _loc1_ * 20,0,16777215,100,TOP | LEFT);
                     }
                  }
               }
               _loc1_ = 0;
               while(_loc1_ < MAX_UNITKIND)
               {
                  if(this.player.UNITEQUIP[_loc1_])
                  {
                     if(this.player.UNITBTN[_loc1_])
                     {
                        this.lib.drawImg(imgUi + 38 + _loc1_ * 3,0,0,TOP | LEFT);
                        this.player.UNITBTNFRAME[_loc1_] += 1 + this.nLeakFrame;
                        if(this.player.UNITBTNFRAME[_loc1_] > MAX_BTNFRAME)
                        {
                           this.player.UNITBTN[_loc1_] = false;
                           this.player.UNITBTNFRAME[_loc1_] = 0;
                        }
                     }
                     else if(this.player.UNITCHARGED[_loc1_])
                     {
                        if(this.player.UNITCOOLING[_loc1_])
                        {
                           this.lib.drawImg(imgUi + 37 + _loc1_ * 3,0,0,TOP | LEFT);
                        }
                        else
                        {
                           this.lib.drawImg(imgUi + 39 + _loc1_ * 3,0,0,TOP | LEFT);
                        }
                     }
                     else
                     {
                        this.lib.drawImg(imgUi + 37 + _loc1_ * 3,0,0,TOP | LEFT);
                     }
                     if(this.player.UNITCOOLING[_loc1_])
                     {
                        this.lib.drawImg(imgUnitGage + this.player.UNITCOOLINGFRAME[_loc1_],20 + _loc1_ * 81,399,TOP | LEFT);
                        _loc5_ = 1;
                        this.player.nNowTime = getTimer();
                        if(this.bBossDiaEvent || this.bBossDialog || this.bGameMenu)
                        {
                           this.player.UNITCOOLINGTIME[_loc1_] += this.player.nNowTime - this.nUiPassTime[_loc1_];
                           this.nUiPassTime[_loc1_] = getTimer();
                        }
                        _loc2_ = this.UNITDB[_loc1_].nCoolTime * ((6 - this.player.HEROSKILL[Player.SKILL_LEADERSHIP]) / 6) * 1000;
                        _loc2_ /= _loc5_;
                        _loc3_ = (this.player.nNowTime - this.player.UNITCOOLINGTIME[_loc1_]) * (1 + this.player.nGameSpeed);
                        _loc4_ = _loc3_ / _loc2_;
                        if(this.player.UNITCOOLINGFRAME[_loc1_] <= int(Player.UNIT_COOLFRAME * _loc4_))
                        {
                           this.player.UNITCOOLINGFRAME[_loc1_] = int(Player.UNIT_COOLFRAME * _loc4_);
                        }
                        if(this.player.UNITCOOLINGFRAME[_loc1_] >= Player.UNIT_COOLFRAME)
                        {
                           this.player.UNITCOOLINGFRAME[_loc1_] = 0;
                           this.player.UNITCOOLING[_loc1_] = false;
                        }
                     }
                  }
                  else
                  {
                     this.lib.drawImg(imgUi + 64,_loc1_ * 81,0,TOP | LEFT);
                  }
                  _loc1_++;
               }
               _loc1_ = 0;
               while(_loc1_ < Player.EQUIPARMS_NUM)
               {
                  if(this.player.EQUIPINVEN[_loc1_] > INITDATA)
                  {
                     if(this.player.FIREBTN[_loc1_])
                     {
                        this.lib.drawImg(imgUi + this.UI_MACEICONIMG[3 + _loc1_],0,0,TOP | LEFT);
                        this.player.FIREBTNFRAME[_loc1_] += 1 + this.nLeakFrame;
                        if(this.player.FIREBTNFRAME[_loc1_] > MAX_BTNFRAME)
                        {
                           this.player.FIREBTN[_loc1_] = false;
                           this.player.FIREBTNFRAME[_loc1_] = 0;
                        }
                     }
                     else if(this.player.ARMSCHARGED[_loc1_])
                     {
                        this.lib.drawImg(imgUi + this.UI_MACEICONIMG[6 + _loc1_],0,0,TOP | LEFT);
                     }
                     else
                     {
                        this.lib.drawImg(imgUi + this.UI_MACEICONIMG[_loc1_],0,0,TOP | LEFT);
                     }
                     if(this.player.ARMSCHARGED[_loc1_])
                     {
                        this.lib.drawImgZoom(imgMaceIcon + this.player.EQUIPINVEN[_loc1_],420 + _loc1_ * 120,490,100,100,TOP | LEFT);
                     }
                     else
                     {
                        this.lib.drawGrayImg(imgMaceIcon + this.player.EQUIPINVEN[_loc1_],420 + _loc1_ * 120,490,TOP | LEFT);
                     }
                     if(this.player.EQUIPINVEN[_loc1_ + Player.EQUIPINVEN_LEVELPOS] > 0)
                     {
                        this.lib.drawNumImg("/" + this.player.EQUIPINVEN[_loc1_ + Player.EQUIPINVEN_LEVELPOS],470 + _loc1_ * 120,490,NUM_ITEMLEVEL,TOP | LEFT);
                     }
                     this.lib.drawNumImg("" + int(this.ope.getArmsChargeMana(this.player.EQUIPINVEN[_loc1_])),415 + _loc1_ * 120,525,NUM_MANA,TOP | LEFT);
                  }
                  else
                  {
                     this.lib.drawImg(imgUi + this.UI_MACEICONIMG[_loc1_],0,0,TOP | LEFT);
                  }
                  _loc1_++;
               }
               this.lib.drawImg(imgUi + 69,0,0,TOP | LEFT);
               this.lib.drawImg(imgUi + 76,0,0,TOP | LEFT);
               this.lib.drawImg(imgUi + 70,0,0,TOP | LEFT);
               if(this.player.bMoveLeft)
               {
                  this.lib.drawImg(imgUi + 17,Player.nArrowPosX,Player.nArrowPosY,TOP | LEFT);
               }
               else
               {
                  this.lib.drawImg(imgUi + 18,Player.nArrowPosX,Player.nArrowPosY,TOP | LEFT);
               }
               if(this.player.bMoveRight)
               {
                  this.lib.drawImg(imgUi + 26,Player.nArrowPosX,Player.nArrowPosY,TOP | LEFT);
               }
               else
               {
                  this.lib.drawImg(imgUi + 27,Player.nArrowPosX,Player.nArrowPosY,TOP | LEFT);
               }
               break;
            case MODE_DESTINY:
               this.lib.fillRect(288,Player.BG_BASEPOSY + 24,168,8,6375461,TOP | LEFT);
               this.lib.drawImg(imgDestiny + 1,0,0,TOP | LEFT);
               this.lib.fillRect(288,Player.BG_BASEPOSY + 24,168 * this.player.nDestinyTotalDieEnemy / Player.DESTINYTOTALENEMYNUM,8,647673,TOP | LEFT);
               this.lib.drawImgRotationZoom(imgHeroPos + int(this.nGameFrame >> 1) % 21,288 + 168 * this.player.nDestinyTotalDieEnemy / Player.DESTINYTOTALENEMYNUM,Player.BG_BASEPOSY + 32,50,50,TOP | HCENTER);
               this.lib.drawImg(imgDestiny + 4,0,0,TOP | LEFT);
               _loc1_ = 0;
               while(_loc1_ < MAX_DESTINYICONNUM)
               {
                  if(this.DESTINYICON[_loc1_].bAppear)
                  {
                     if(this.player.UNITBTN[_loc1_])
                     {
                        if(this.DESTINYICON[_loc1_].nType == DestinyIcon.ICON_MACE)
                        {
                           this.lib.drawImg(imgDestiny + 2,this.DESTINYICON[_loc1_].nPosX,this.DESTINYICON[_loc1_].nPosY,TOP | LEFT);
                           this.lib.drawImgZoom(imgMaceIcon + this.DESTINYICON[_loc1_].nKind,this.DESTINYICON[_loc1_].nPosX + 38,this.DESTINYICON[_loc1_].nPosY + 39,100,100,VCENTER | HCENTER);
                        }
                        else
                        {
                           this.lib.drawImg(imgDestiny + 6 + this.DESTINYICON[_loc1_].nKind * 2,this.DESTINYICON[_loc1_].nPosX,this.DESTINYICON[_loc1_].nPosY,TOP | LEFT);
                        }
                        this.player.UNITBTNFRAME[_loc1_] += 1 + this.nLeakFrame;
                        if(this.player.UNITBTNFRAME[_loc1_] > MAX_BTNFRAME)
                        {
                           this.player.UNITBTN[_loc1_] = false;
                           this.player.UNITBTNFRAME[_loc1_] = 0;
                           this.ope.sortDestinyIcon(_loc1_);
                        }
                     }
                     else if(this.DESTINYICON[_loc1_].nType == DestinyIcon.ICON_MACE)
                     {
                        this.lib.drawImg(imgDestiny + 3,this.DESTINYICON[_loc1_].nPosX,this.DESTINYICON[_loc1_].nPosY,TOP | LEFT);
                        this.lib.drawImgZoom(imgMaceIcon + this.DESTINYICON[_loc1_].nKind,this.DESTINYICON[_loc1_].nPosX + 38,this.DESTINYICON[_loc1_].nPosY + 39,100,100,VCENTER | HCENTER);
                     }
                     else
                     {
                        this.lib.drawImg(imgDestiny + 7 + this.DESTINYICON[_loc1_].nKind * 2,this.DESTINYICON[_loc1_].nPosX,this.DESTINYICON[_loc1_].nPosY,TOP | LEFT);
                     }
                  }
                  _loc1_++;
               }
               this.lib.drawImg(imgDestiny + 5,0,0,TOP | LEFT);
         }
         _loc1_ = 0;
         while(_loc1_ < Player.MAX_DRAWDROPITEM)
         {
            _loc9_ = this.nLcdH - 245;
            if(this.player.nGameMode == MODE_WARROAD)
            {
               _loc9_ += 80;
            }
            if(this.player.DRAWDROPITEM[_loc1_])
            {
               if(this.player.DRAWDROPITEMBAG[_loc1_ + Player.MAX_DRAWDROPITEM] == INITDATA)
               {
                  this.lib.drawImg(imgCard + Player.MAX_CARDNUM + this.player.DRAWDROPITEMBAG[_loc1_],this.nLcdW - 10 - _loc1_ * 80,_loc9_,BOTTOM | RIGHT);
               }
               else
               {
                  this.lib.drawImg(imgMaceIcon + this.player.DRAWDROPITEMBAG[_loc1_],this.nLcdW - 10 - _loc1_ * 80,_loc9_,BOTTOM | RIGHT);
                  if(this.player.DRAWDROPITEMBAG[_loc1_ + Player.MAX_DRAWDROPITEM] > 0)
                  {
                     this.lib.drawNumImg("/" + this.player.DRAWDROPITEMBAG[_loc1_ + Player.MAX_DRAWDROPITEM],this.nLcdW - 5 - _loc1_ * 80,_loc9_ - 48,NUM_ITEMLEVEL,TOP | RIGHT);
                  }
               }
               this.player.nNowTime = getTimer();
               if((this.player.nNowTime - this.player.DRAWDROPITEMTIME[_loc1_]) * (1 + this.player.nGameSpeed) >= Player.EATITEM_DRAWTIME)
               {
                  this.ope.sortDrawDropItem(_loc1_);
               }
            }
            _loc1_++;
         }
         if(this.player.bLevelUp)
         {
            if(!this.player.bDrawLevelUpTurn)
            {
               if(this.player.nLevelUpFrame >= 40)
               {
                  this.lib.drawImgAlpha(imgLevelUp,0,0,(this.player.nLevelUpFrame - 40) * 5,TOP | LEFT);
                  this.lib.drawImgAlpha(imgLevelUp + 1,0,0,(this.player.nLevelUpFrame - 40) * 5,TOP | LEFT);
                  _loc1_ = 0;
                  while(_loc1_ < 3)
                  {
                     if(this.player.SKILLINDEX[_loc1_] > INITDATA)
                     {
                        this.lib.drawImgAlpha(imgSkillInfor + 23,_loc1_ * 236,0,(this.player.nLevelUpFrame - 40) * 5,TOP | LEFT);
                        if(this.player.SKILLINDEX[_loc1_] < Player.SKILL_MOUSE)
                        {
                           this.lib.drawImgAlpha(imgSkillInfor + this.player.SKILLINDEX[_loc1_],_loc1_ * 236,0,(this.player.nLevelUpFrame - 40) * 5,TOP | LEFT);
                        }
                        else
                        {
                           this.lib.drawImgAlpha(imgSkillInfor + 25,_loc1_ * 236,0,(this.player.nLevelUpFrame - 40) * 5,TOP | LEFT);
                           this.lib.drawImgAlpha(imgSkillInfor + 3 + this.player.SKILLINDEX[_loc1_],_loc1_ * 236,0,(this.player.nLevelUpFrame - 40) * 5,TOP | LEFT);
                        }
                        if(this.player.SKILLINDEX[_loc1_] < Player.SKILL_MOUSE)
                        {
                           this.lib.drawNumImgAlpha("" + this.player.HEROSKILL[this.player.SKILLINDEX[_loc1_]],160 + _loc1_ * 236,441,NUM_LEVELUPPOINT,(this.player.nLevelUpFrame - 40) * 5,TOP | RIGHT);
                           if(this.player.nGameMode == MODE_SURVIVAL)
                           {
                              this.lib.drawNumImgAlpha("" + this.player.HEROSURVIVALMAXSKILL[this.player.SKILLINDEX[_loc1_]],185 + _loc1_ * 236,443,NUM_LEVELUPMAX,(this.player.nLevelUpFrame - 40) * 5,TOP | LEFT);
                           }
                           else
                           {
                              this.lib.drawNumImgAlpha("" + this.player.HEROMAXSKILL[this.player.SKILLINDEX[_loc1_]],185 + _loc1_ * 236,443,NUM_LEVELUPMAX,(this.player.nLevelUpFrame - 40) * 5,TOP | LEFT);
                           }
                        }
                        else
                        {
                           this.lib.drawNumImgAlpha("" + this.player.UNITUPGRADE[this.player.SKILLINDEX[_loc1_] - Player.SKILL_MOUSE],160 + _loc1_ * 236,441,NUM_LEVELUPPOINT,(this.player.nLevelUpFrame - 40) * 5,TOP | RIGHT);
                           this.lib.drawNumImgAlpha("" + Player.MAX_UNITSKILL,185 + _loc1_ * 236,443,NUM_LEVELUPMAX,(this.player.nLevelUpFrame - 40) * 5,TOP | LEFT);
                        }
                     }
                     _loc1_++;
                  }
                  this.lib.drawImgAlpha(imgSkillInfor + 24,0,0,(this.player.nLevelUpFrame - 40) * 5,TOP | LEFT);
               }
               if(!this.bGameMenu)
               {
                  this.player.nLevelUpFrame += 1 + this.nLeakFrame;
               }
               if(this.player.nLevelUpFrame >= FPS)
               {
                  this.player.bDrawLevelUpTurn = true;
                  this.nGameState = GAME_LEVELUP;
                  this.player.bDrawLevelUp = true;
                  this.player.nLevelUpFrame = FPS;
               }
            }
            else if(this.player.bDrawLevelUpTurn && this.nGameState != GAME_LEVELUP)
            {
               if(this.player.nLevelUpFrame > 40)
               {
                  this.lib.drawImgAlpha(imgLevelUp,0,0,100 - (FPS - this.player.nLevelUpFrame) * 5,TOP | LEFT);
                  this.lib.drawImgAlpha(imgLevelUp + 1,0,0,100 - (FPS - this.player.nLevelUpFrame) * 5,TOP | LEFT);
                  _loc1_ = 0;
                  while(_loc1_ < 3)
                  {
                     if(this.player.SKILLINDEX[_loc1_] > INITDATA)
                     {
                        if(_loc1_ != this.player.nLevelUpSkill)
                        {
                           this.lib.drawImgAlpha(imgSkillInfor + 23,_loc1_ * 236,0,100 - (FPS - this.player.nLevelUpFrame) * 5,TOP | LEFT);
                           if(this.player.SKILLINDEX[_loc1_] < Player.SKILL_MOUSE)
                           {
                              this.lib.drawImgAlpha(imgSkillInfor + this.player.SKILLINDEX[_loc1_],_loc1_ * 236,0,100 - (FPS - this.player.nLevelUpFrame) * 5,TOP | LEFT);
                           }
                           else
                           {
                              this.lib.drawImgAlpha(imgSkillInfor + 25,_loc1_ * 236,0,100 - (FPS - this.player.nLevelUpFrame) * 5,TOP | LEFT);
                              this.lib.drawImgAlpha(imgSkillInfor + 3 + this.player.SKILLINDEX[_loc1_],_loc1_ * 236,0,100 - (FPS - this.player.nLevelUpFrame) * 5,TOP | LEFT);
                           }
                           if(this.player.SKILLINDEX[_loc1_] < Player.SKILL_MOUSE)
                           {
                              this.lib.drawNumImgAlpha("" + this.player.HEROSKILL[this.player.SKILLINDEX[_loc1_]],160 + _loc1_ * 236,441,NUM_LEVELUPPOINT,100 - (FPS - this.player.nLevelUpFrame) * 5,TOP | RIGHT);
                              if(this.player.nGameMode == MODE_SURVIVAL)
                              {
                                 this.lib.drawNumImgAlpha("" + this.player.HEROSURVIVALMAXSKILL[this.player.SKILLINDEX[_loc1_]],185 + _loc1_ * 236,443,NUM_LEVELUPMAX,100 - (FPS - this.player.nLevelUpFrame) * 5,TOP | LEFT);
                              }
                              else
                              {
                                 this.lib.drawNumImgAlpha("" + this.player.HEROMAXSKILL[this.player.SKILLINDEX[_loc1_]],185 + _loc1_ * 236,443,NUM_LEVELUPMAX,100 - (FPS - this.player.nLevelUpFrame) * 5,TOP | LEFT);
                              }
                           }
                           else
                           {
                              this.lib.drawNumImgAlpha("" + this.player.UNITUPGRADE[this.player.SKILLINDEX[_loc1_] - Player.SKILL_MOUSE],160 + _loc1_ * 236,441,NUM_LEVELUPPOINT,100 - (FPS - this.player.nLevelUpFrame) * 5,TOP | RIGHT);
                              this.lib.drawNumImgAlpha("" + Player.MAX_UNITSKILL,185 + _loc1_ * 236,443,NUM_LEVELUPMAX,100 - (FPS - this.player.nLevelUpFrame) * 5,TOP | LEFT);
                           }
                        }
                     }
                     _loc1_++;
                  }
                  this.lib.drawImgAlpha(imgSkillInfor + 24,0,0,100 - (FPS - this.player.nLevelUpFrame) * 5,TOP | LEFT);
               }
               this.lib.drawImgAlpha(imgSkillInfor + 23,this.player.nLevelUpSkill * 236,0 - (FPS - this.player.nLevelUpFrame << 1),100 - (FPS - this.player.nLevelUpFrame) * (100 / 60),TOP | LEFT);
               if(this.player.SKILLINDEX[this.player.nLevelUpSkill] < Player.SKILL_MOUSE)
               {
                  this.lib.drawImgAlpha(imgSkillInfor + this.player.SKILLINDEX[this.player.nLevelUpSkill],this.player.nLevelUpSkill * 236,0 - (FPS - this.player.nLevelUpFrame << 1),100 - (FPS - this.player.nLevelUpFrame) * (100 / 60),TOP | LEFT);
               }
               else
               {
                  this.lib.drawImgAlpha(imgSkillInfor + 25,this.player.nLevelUpSkill * 236,0 - (FPS - this.player.nLevelUpFrame << 1),100 - (FPS - this.player.nLevelUpFrame) * (100 / 60),TOP | LEFT);
                  this.lib.drawImgAlpha(imgSkillInfor + 3 + this.player.SKILLINDEX[this.player.nLevelUpSkill],this.player.nLevelUpSkill * 236,0 - (FPS - this.player.nLevelUpFrame << 1),100 - (FPS - this.player.nLevelUpFrame) * (100 / 60),TOP | LEFT);
               }
               if(this.player.SKILLINDEX[this.player.nLevelUpSkill] < Player.SKILL_MOUSE)
               {
                  this.lib.drawNumImgAlpha("" + this.player.HEROSKILL[this.player.SKILLINDEX[this.player.nLevelUpSkill]],160 + this.player.nLevelUpSkill * 236,441 - (FPS - this.player.nLevelUpFrame << 1),NUM_LEVELUPPOINT,100 - (FPS - this.player.nLevelUpFrame) * (100 / 60),TOP | RIGHT);
                  if(this.player.nGameMode == MODE_SURVIVAL)
                  {
                     this.lib.drawNumImgAlpha("" + this.player.HEROSURVIVALMAXSKILL[this.player.SKILLINDEX[this.player.nLevelUpSkill]],185 + this.player.nLevelUpSkill * 236,443 - (FPS - this.player.nLevelUpFrame << 1),NUM_LEVELUPMAX,100 - (FPS - this.player.nLevelUpFrame) * (100 / 60),TOP | LEFT);
                  }
                  else
                  {
                     this.lib.drawNumImgAlpha("" + this.player.HEROMAXSKILL[this.player.SKILLINDEX[this.player.nLevelUpSkill]],185 + this.player.nLevelUpSkill * 236,443 - (FPS - this.player.nLevelUpFrame << 1),NUM_LEVELUPMAX,100 - (FPS - this.player.nLevelUpFrame) * (100 / 60),TOP | LEFT);
                  }
               }
               else
               {
                  this.lib.drawNumImgAlpha("" + this.player.UNITUPGRADE[this.player.SKILLINDEX[_loc1_] - Player.SKILL_MOUSE],160 + this.player.nLevelUpSkill * 236,441 - (FPS - this.player.nLevelUpFrame << 1),NUM_LEVELUPPOINT,100 - (FPS - this.player.nLevelUpFrame) * (100 / 60),TOP | RIGHT);
                  this.lib.drawNumImgAlpha("" + Player.MAX_UNITSKILL,185 + this.player.nLevelUpSkill * 236,443 - (FPS - this.player.nLevelUpFrame << 1),NUM_LEVELUPMAX,100 - (FPS - this.player.nLevelUpFrame) * (100 / 60),TOP | LEFT);
               }
               this.player.nLevelUpFrame -= 1 + this.nLeakFrame;
               if(this.player.nLevelUpFrame <= 0)
               {
                  this.player.nLevelUpFrame = 0;
                  this.player.nLevelUpSkill = INITDATA;
                  this.player.bDrawLevelUpTurn = false;
                  this.player.bLevelUp = false;
               }
            }
         }
      }
      
      public function drawReady(param1:int) : void
      {
         switch(param1)
         {
            case 0:
               this.drawReadyCenter();
               this.nAniX += 30;
               this.nAniX += 30 * this.nLeakFrame;
               this.nSubAniX += 30;
               this.nSubAniX += 30 * this.nLeakFrame;
               this.nSubAniX2 += 30;
               this.nSubAniX2 += 30 * this.nLeakFrame;
               if(this.nSubAniX >= this.nLcdW + 580)
               {
                  this.bStartBg = false;
                  ++this.nGameScene;
               }
               break;
            case 1:
               this.drawReadyCenter();
               if(this.player.nGameMode == MODE_SURVIVAL)
               {
                  this.lib.drawBorderString("ĐỢT QUÁI   " + (this.player.nSurvivalWave + 1),this.nLcdWC,this.nLcdHC - 100,16777215,16711680,100,TOP | HCENTER);
               }
               else if(this.player.nStage + 1 < 10)
               {
                  this.lib.drawNumImg(this.player.nChapter + 1 + "/0" + (this.player.nStage + 1),this.nLcdWC,this.nLcdHC - 120,NUM_START,VCENTER | HCENTER);
               }
               else
               {
                  this.lib.drawNumImg(this.player.nChapter + 1 + "/" + (this.player.nStage + 1),this.nLcdWC,this.nLcdHC - 120,NUM_START,VCENTER | HCENTER);
               }
               this.lib.drawImg(imgStart + 1,0,0,TOP | LEFT);
               if(this.nGameFrame >= 110)
               {
                  if(!this.bStartBg)
                  {
                     if(this.player.nGameMode == MODE_BOSS)
                     {
                        this.lib.playMusic(Library.MUSIC_BOSS,true);
                     }
                     else
                     {
                        this.lib.playMusic(Library.MUSIC_STAGE,true);
                     }
                     this.bStartBg = true;
                  }
               }
               if(this.nGameFrame >= 150)
               {
                  ++this.nGameScene;
               }
               break;
            case 2:
               this.drawReadyCenter();
               this.nAniX += 30;
               this.nAniX += 30 * this.nLeakFrame;
               this.nSubAniX += 30;
               this.nSubAniX += 30 * this.nLeakFrame;
               this.nSubAniX2 += 30;
               this.nSubAniX2 += 30 * this.nLeakFrame;
               if(this.nSubAniX2 >= this.nLcdW + 2280)
               {
                  this.bStartBg = false;
                  this.nGameState = GAME_PLAY;
               }
         }
      }
      
      public function drawReadyCenter() : void
      {
         this.lib.drawImgZoomAlpha(imgStart,this.nAniX,0,300,100,50,TOP | RIGHT);
         this.lib.drawImgZoomAlpha(imgStart,this.nSubAniX,0,300,100,50,TOP | RIGHT);
         this.lib.drawImgZoomAlpha(imgStart,this.nSubAniX2,0,300,100,50,TOP | RIGHT);
      }
      
      public function drawAttackedEff(param1:int, param2:int) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         _loc3_ = 100;
         _loc4_ = 100;
         if(this.player.nGameMode == MODE_WARROAD)
         {
            _loc3_ = 50;
            _loc4_ = 50;
         }
         switch(param1)
         {
            case Player.PALADOGATTACKED:
               if(this.player.bDrawAttackedEff)
               {
                  this.lib.drawAttackedImgZoomDodge(false,imgAttackedEff + 10 + this.player.nDrawAttackedEffKind * 5 + int(this.player.nDrawAttackedEffFrame >> 1),this.player.nDrawAttackedEffPosX,this.player.nDrawAttackedEffPosY,_loc3_,_loc4_,BlendMode.ADD,BOTTOM | HCENTER);
                  this.player.nDrawAttackedEffFrame += 1 + this.nLeakFrame;
                  if(this.player.nDrawAttackedEffFrame >= Player.DRAWATTACKEDEFFTOTALFRAME)
                  {
                     this.player.nDrawAttackedEffFrame = 0;
                     this.player.bDrawAttackedEff = false;
                  }
               }
               break;
            case Player.UNITATTACKED:
               if(this.UNIT[param2].bDrawAttackedEff)
               {
                  this.lib.drawAttackedImgZoomDodge(false,imgAttackedEff + 10 + this.UNIT[param2].nDrawAttackedEffKind * 5 + int(this.UNIT[param2].nDrawAttackedEffFrame >> 1),this.UNIT[param2].nDrawAttackedEffPosX,this.UNIT[param2].nDrawAttackedEffPosY + 10,_loc3_,_loc4_,BlendMode.ADD,BOTTOM | HCENTER);
                  this.UNIT[param2].nDrawAttackedEffFrame += 1 + this.nLeakFrame;
                  if(this.UNIT[param2].nDrawAttackedEffFrame >= Player.DRAWATTACKEDEFFTOTALFRAME)
                  {
                     this.UNIT[param2].nDrawAttackedEffFrame = 0;
                     this.UNIT[param2].bDrawAttackedEff = false;
                  }
               }
               break;
            case Player.ENEMYATTACKED:
               if(this.ENEMY[param2].bDrawAttackedEff)
               {
                  this.lib.drawAttackedImgZoomDodge(true,imgAttackedEff + this.ENEMY[param2].nDrawAttackedEffKind * 5 + int(this.ENEMY[param2].nDrawAttackedEffFrame >> 1),this.ENEMY[param2].nDrawAttackedEffPosX,this.ENEMY[param2].nDrawAttackedEffPosY + 10,_loc3_,_loc4_,BlendMode.ADD,BOTTOM | HCENTER);
                  this.ENEMY[param2].nDrawAttackedEffFrame += 1 + this.nLeakFrame;
                  if(this.ENEMY[param2].nDrawAttackedEffFrame >= Player.DRAWATTACKEDEFFTOTALFRAME)
                  {
                     this.ENEMY[param2].nDrawAttackedEffFrame = 0;
                     this.ENEMY[param2].bDrawAttackedEff = false;
                  }
               }
         }
      }
      
      public function drawEndingTxt(param1:int, param2:int) : void
      {
         var _loc3_:int = 0;
         _loc3_ = 100;
         if(param2 >= 0 && param2 < 30)
         {
            _loc3_ = 100 / 30 * param2;
         }
         else if(param2 >= 30 && param2 < 330)
         {
            _loc3_ = 100;
         }
         else if(param2 >= 330 && param2 < 360)
         {
            _loc3_ = 100 - 100 / 30 * (param2 - 330);
         }
         switch(param1)
         {
            case 1:
               this.lib.drawIntroString("Chuột đấu sĩ đã bỏ thói quậy phá,",this.nLcdWC + 15,this.nLcdHC + 190,0,16777215,_loc3_,VCENTER | HCENTER);
               this.lib.drawIntroString("mở một xưởng làm phô mai thơm ngon",this.nLcdWC + 15,this.nLcdHC + 220,0,16777215,_loc3_,VCENTER | HCENTER);
               this.lib.drawIntroString("nổi tiếng khắp Critterland.",this.nLcdWC + 15,this.nLcdHC + 250,0,16777215,_loc3_,VCENTER | HCENTER);
               break;
            case 2:
               this.lib.drawIntroString("Thỏ cung thủ sống an bình, chăm chỉ trồng cây",this.nLcdWC + 15,this.nLcdHC + 190,0,16777215,_loc3_,VCENTER | HCENTER);
               this.lib.drawIntroString("để phủ xanh lại những cánh rừng.",this.nLcdWC + 15,this.nLcdHC + 220,0,16777215,_loc3_,VCENTER | HCENTER);
               break;
            case 3:
               this.lib.drawIntroString("Gấu cận vệ tự rèn luyện bản thân mỗi ngày",this.nLcdWC + 15,this.nLcdHC + 190,0,16777215,_loc3_,VCENTER | HCENTER);
               this.lib.drawIntroString("để bảo vệ hòa bình cho muôn loài.",this.nLcdWC + 15,this.nLcdHC + 220,0,16777215,_loc3_,VCENTER | HCENTER);
               break;
            case 4:
               this.lib.drawIntroString("Chuột túi quyền anh lại tiếp tục lên đường,",this.nLcdWC + 15,this.nLcdHC + 190,0,16777215,_loc3_,VCENTER | HCENTER);
               this.lib.drawIntroString("tìm kiếm những đối thủ mạnh mẽ hơn.",this.nLcdWC + 15,this.nLcdHC + 220,0,16777215,_loc3_,VCENTER | HCENTER);
               break;
            case 5:
               this.lib.drawIntroString("Rùa phòng thủ trở về với biển cả quê hương,",this.nLcdWC + 15,this.nLcdHC + 190,0,16777215,_loc3_,VCENTER | HCENTER);
               this.lib.drawIntroString("vui vẻ kể lại chuyến phiêu lưu cho bạn bè nghe.",this.nLcdWC + 30,this.nLcdHC + 220,0,16777215,_loc3_,VCENTER | HCENTER);
               break;
            case 6:
               this.lib.drawIntroString("Khỉ hải tặc giương buồm ra khơi tìm kho báu",this.nLcdWC + 15,this.nLcdHC + 190,0,16777215,_loc3_,VCENTER | HCENTER);
               this.lib.drawIntroString("theo tấm bản đồ được tặng thưởng.",this.nLcdWC + 15,this.nLcdHC + 220,0,16777215,_loc3_,VCENTER | HCENTER);
               break;
            case 7:
               this.lib.drawIntroString("Tê giác sắt kiên trì rèn luyện",this.nLcdWC + 15,this.nLcdHC + 190,0,16777215,_loc3_,VCENTER | HCENTER);
               this.lib.drawIntroString("để kiềm chế tính nóng nảy của mình.",this.nLcdWC + 15,this.nLcdHC + 220,0,16777215,_loc3_,VCENTER | HCENTER);
               break;
            case 8:
               this.lib.drawIntroString("Cánh cụt pháp sư cất gậy phép,",this.nLcdWC + 15,this.nLcdHC + 190,0,16777215,_loc3_,VCENTER | HCENTER);
               this.lib.drawIntroString("trở về học viện tiếp tục nghiên cứu ma thuật.",this.nLcdWC + 15,this.nLcdHC + 220,0,16777215,_loc3_,VCENTER | HCENTER);
               break;
            case 9:
               this.lib.drawIntroString("Rồng hồng kết thúc chuyến phiêu lưu",this.nLcdWC + 15,this.nLcdHC + 190,0,16777215,_loc3_,VCENTER | HCENTER);
               this.lib.drawIntroString("và bay trở về vùng đất của loài rồng.",this.nLcdWC + 15,this.nLcdHC + 220,0,16777215,_loc3_,VCENTER | HCENTER);
               break;
            case 10:
               this.lib.drawIntroString("Và Paladog đã cưới nàng công chúa xinh đẹp,",this.nLcdWC + 15,this.nLcdHC + 190,0,16777215,_loc3_,VCENTER | HCENTER);
               this.lib.drawIntroString("sống hạnh phúc trọn đời bên nhau cùng",this.nLcdWC + 15,this.nLcdHC + 220,0,16777215,_loc3_,VCENTER | HCENTER);
               this.lib.drawIntroString("sáu người con trai và sáu người con gái.",this.nLcdWC + 15,this.nLcdHC + 250,0,16777215,_loc3_,VCENTER | HCENTER);
         }
      }
      
      public function drawEvent(param1:int, param2:Boolean) : void
      {
         this.lib.fillRect(0,0,this.nLcdW,this.nLcdH,0,TOP | LEFT);
         if(param2)
         {
            this.lib.drawASEAni(Ani_Event01_Bg,this.nEventScene,imgBg,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
            this.lib.drawASEAni(Ani_Event01_shadow,this.nEventScene,imgShadow,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
            switch(this.nEventScene)
            {
               case 0:
                  this.lib.drawASEAni(Ani_Event01_npc,3,imgCinema01,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  this.lib.drawASEAni(Ani_Event01_enemy,2,imgEnemyE01Att,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  this.lib.drawASEAni(Ani_Event01_npc,2,imgCinema01,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  this.lib.drawASEAni(Ani_Event01_enemy,1,imgEnemyE01Att,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  this.lib.drawASEAni(Ani_Event01_npc,1,imgCinema01,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  this.lib.drawASEAni(Ani_Event01_enemy,0,imgEnemyE01Att,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  this.lib.drawASEAni(Ani_Event01_npc,0,imgCinema01,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  break;
               case 1:
                  this.lib.drawASEAni(Ani_Event01_npc,7,imgCinema01,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  this.lib.drawASEAni(Ani_Event01_enemy,5,imgEnemyE01Att,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  this.lib.drawASEAni(Ani_Event01_npc,6,imgCinema01,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  this.lib.drawASEAni(Ani_Event01_enemy,4,imgEnemyE01Att,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  this.lib.drawASEAni(Ani_Event01_npc,5,imgCinema01,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  this.lib.drawASEAni(Ani_Event01_enemy,3,imgEnemyE01Att,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  this.lib.drawASEAni(Ani_Event01_npc,4,imgCinema01,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  break;
               case 2:
                  this.lib.drawASEAni(Ani_Event01_npc,11,imgCinema01,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  this.lib.drawASEAni(Ani_Event01_enemy,8,imgEnemyE01Att,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  this.lib.drawASEAniEffect(Ani_Event01_eff,2,imgExplosion_a,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  this.lib.drawASEAni(Ani_Event01_npc,10,imgCinema01,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  this.lib.drawASEAni(Ani_Event01_mace,0,imgMace01,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  this.lib.drawASEAni(Ani_Event01_paladog,0,imgPaladog,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  this.lib.drawASEAniEffect(Ani_Event01_maceeff,1,imgMace01_Effa,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  this.lib.drawASEAni(Ani_Event01_enemy,7,imgEnemyE01Att,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  this.lib.drawASEAniEffect(Ani_Event01_eff,1,imgExplosion_a,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  this.lib.drawASEAni(Ani_Event01_npc,9,imgCinema01,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  this.lib.drawASEAniEffect(Ani_Event01_maceeff,0,imgMace01_Effa,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  this.lib.drawASEAni(Ani_Event01_enemy,6,imgEnemyE01Att,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  this.lib.drawASEAniEffect(Ani_Event01_eff,0,imgExplosion_a,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  this.lib.drawASEAni(Ani_Event01_npc,8,imgCinema01,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  break;
               case 3:
                  this.lib.drawASEAni(Ani_Event01_mace,1,imgMace01,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  this.lib.drawASEAni(Ani_Event01_paladog,1,imgPaladog,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  this.lib.drawASEAni(Ani_Event01_npc,12,imgCinema01,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  this.lib.drawASEAni(Ani_Event01_enemy,9,imgEnemyE01Att,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  break;
               case 4:
                  this.lib.drawASEAni(Ani_Event01_npc,14,imgCinema01,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  this.lib.drawASEAni(Ani_Event01_mace,2,imgMace01,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  this.lib.drawASEAni(Ani_Event01_paladog,2,imgPaladog,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  this.lib.drawASEAni(Ani_Event01_npc,13,imgCinema01,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  this.lib.drawASEAni(Ani_Event01_enemy,10,imgEnemyE01Att,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
            }
            this.lib.drawASEAni(Ani_Event01_ui,this.nEventScene,imgCinemaUi,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
            if(this.bEventSkipBtn)
            {
               this.lib.drawImg(imgEventBtn + 2,0,0,TOP | LEFT);
               this.nBtnFrame += 1 + this.nLeakFrame;
               if(this.nBtnFrame > MAX_BTNFRAME)
               {
                  this.nBtnFrame = 0;
                  this.bEventSkipBtn = false;
                  this.lib.stopMusic();
                  if(this.bTutorial)
                  {
                     this.nMainScene = 10;
                  }
                  else
                  {
                     this.ope.startStage();
                  }
               }
            }
            else
            {
               this.lib.drawImg(imgEventBtn + 3,0,0,TOP | LEFT);
            }
            if(this.bEventNextBtn)
            {
               this.lib.drawImg(imgEventBtn,0,0,TOP | LEFT);
               this.nBtnFrame += 1 + this.nLeakFrame;
               if(this.nBtnFrame > MAX_BTNFRAME)
               {
                  this.nBtnFrame = 0;
                  this.bEventNextBtn = false;
                  switch(this.nEventScene)
                  {
                     case 1:
                        ++this.nEventScene;
                        this.nEventFrame = 0;
                        break;
                     case 3:
                        ++this.nDialogStep;
                        this.nEventFrame = 0;
                        if(this.nDialogStep >= 3)
                        {
                           this.nDialogStep = 0;
                           ++this.nEventScene;
                           this.nEventFrame = 0;
                        }
                  }
               }
            }
            else if(this.nEventScene == 1 || this.nEventScene == 3)
            {
               this.lib.drawImg(imgEventBtn + 1,0,0,TOP | LEFT);
            }
            ++this.nEventFrame;
            switch(this.nEventScene)
            {
               case 0:
                  if(this.nEventFrame >= 360)
                  {
                     this.nEventFrame = 0;
                     ++this.nEventScene;
                  }
                  break;
               case 2:
                  if(this.nEventFrame == 0 || this.nEventFrame == 10 || this.nEventFrame == 20 || this.nEventFrame == 30 || this.nEventFrame == 40 || this.nEventFrame == 50 || this.nEventFrame == 60 || this.nEventFrame == 70 || this.nEventFrame == 80 || this.nEventFrame == 90)
                  {
                     this.lib.playEffect(103);
                  }
                  else if(this.nEventFrame == 6 || this.nEventFrame == 16 || this.nEventFrame == 36 || this.nEventFrame == 46 || this.nEventFrame == 56 || this.nEventFrame == 66 || this.nEventFrame == 76 || this.nEventFrame == 86)
                  {
                     this.lib.playEffect(56);
                  }
                  else if(this.nEventFrame == 2 || this.nEventFrame == 26)
                  {
                     this.lib.playEffect(61);
                  }
                  else if(this.nEventFrame == 100)
                  {
                     this.lib.playEffect(49);
                  }
                  else if(this.nEventFrame == 120 || this.nEventFrame == 124 || this.nEventFrame == 128)
                  {
                     this.lib.playEffect(104);
                  }
                  if(this.nEventFrame >= 200)
                  {
                     this.nEventFrame = 0;
                     ++this.nEventScene;
                  }
                  break;
               case 3:
                  switch(this.nDialogStep)
                  {
                     case 0:
                        this.lib.drawString("Cảm ơn bạn đã cứu tôi!",210,135,0,100,TOP | LEFT);
                        this.lib.drawString("Lũ quái vật bất ngờ tấn công",210,155,0,100,TOP | LEFT);
                        this.lib.drawString("khiến cả làng gặp nguy hiểm!",210,175,0,100,TOP | LEFT);
                        break;
                     case 1:
                        this.lib.drawString("Đằng sau có một tên trùm,",210,135,0,100,TOP | LEFT);
                        this.lib.drawString("hắn chỉ cần vung tay",210,155,0,100,TOP | LEFT);
                        this.lib.drawString("là tạo ra cả bầy quái vật!",210,175,0,100,TOP | LEFT);
                        break;
                     case 2:
                        this.lib.drawString("Tôi nghĩ hắn là tên trùm.",210,135,0,100,TOP | LEFT);
                        this.lib.drawString("Xin hãy đánh bại chúng",210,155,0,100,TOP | LEFT);
                        this.lib.drawString("để cứu ngôi làng của chúng tôi!",210,175,0,100,TOP | LEFT);
                  }
                  if(this.nEventFrame >= 20)
                  {
                     this.nEventFrame = 0;
                  }
                  break;
               case 4:
                  if(this.nEventFrame >= 210)
                  {
                     this.lib.stopMusic();
                     if(this.bTutorial)
                     {
                        this.nMainScene = 10;
                     }
                     else
                     {
                        this.ope.startStage();
                     }
                  }
                  break;
               case 1:
                  if(this.nEventSoundCount <= 0)
                  {
                     if(this.nEventFrame == 0 || this.nEventFrame == 10 || this.nEventFrame == 20)
                     {
                        this.lib.playEffect(103);
                     }
                     else if(this.nEventFrame == 6 || this.nEventFrame == 16 || this.nEventFrame == 36)
                     {
                        this.lib.playEffect(56);
                     }
                  }
                  this.lib.drawString("Cứu mạng! Cứu mạng với!",280,155,0,100,TOP | LEFT);
                  if(this.nEventFrame >= 40)
                  {
                     ++this.nEventSoundCount;
                     this.nEventFrame = 0;
                  }
            }
         }
         else
         {
            switch(param1)
            {
               case 0:
                  this.lib.drawASEAni(Ani_Event02_Bg,this.nEventScene,imgBg + 3,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  this.lib.drawASEAni(Ani_Event02_shadow,this.nEventScene,imgShadow,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  if(this.nEventScene == 11)
                  {
                     this.lib.drawASEAniEffect(Ani_Event02_maceeff,this.nEventScene - 10,imgMace02_Effa,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  }
                  if(this.nEventScene < 7)
                  {
                     this.lib.drawASEAni(Ani_Event02_beaver01,this.nEventScene,imgCinema02,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  }
                  else if(this.nEventScene > 8)
                  {
                     this.lib.drawASEAni(Ani_Event02_beaver02,this.nEventScene - 9,imgCinema02,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  }
                  if(this.nEventScene > 1 && this.nEventScene < 9)
                  {
                     this.lib.drawASEAni(Ani_Event02_boss,this.nEventScene - 2,imgEnemyBoss03,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  }
                  if(this.nEventScene > 10)
                  {
                     this.lib.drawASEAni(Ani_Event02_mace,this.nEventScene - 11,imgMace01,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  }
                  if(this.nEventScene > 10)
                  {
                     this.lib.drawASEAni(Ani_Event02_paladog,this.nEventScene - 11,imgPaladog,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  }
                  if(this.nEventScene == 11)
                  {
                     this.lib.drawASEAniEffect(Ani_Event02_maceeff,this.nEventScene - 11,imgMace02_Effa,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  }
                  this.lib.drawASEAni(Ani_Event02_ui,this.nEventScene,imgCinemaUi,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  if(this.bEventSkipBtn)
                  {
                     this.lib.drawImg(imgEventBtn + 2,0,0,TOP | LEFT);
                     this.nBtnFrame += 1 + this.nLeakFrame;
                     if(this.nBtnFrame > MAX_BTNFRAME)
                     {
                        this.nBtnFrame = 0;
                        this.bEventSkipBtn = false;
                        this.lib.stopMusic();
                        this.lib.playMusic(Library.MUSIC_TITLE,true);
                        this.bOpenUnitTab = true;
                        this.nMainState = MAIN_AD;
                     }
                  }
                  else
                  {
                     this.lib.drawImg(imgEventBtn + 3,0,0,TOP | LEFT);
                  }
                  if(this.bEventNextBtn)
                  {
                     this.lib.drawImg(imgEventBtn,0,0,TOP | LEFT);
                     this.nBtnFrame += 1 + this.nLeakFrame;
                     if(this.nBtnFrame > MAX_BTNFRAME)
                     {
                        this.nBtnFrame = 0;
                        this.bEventNextBtn = false;
                        switch(this.nEventScene)
                        {
                           case 12:
                              ++this.nDialogStep;
                              this.nEventFrame = 0;
                              if(this.nDialogStep >= 4)
                              {
                                 this.nDialogStep = 0;
                                 ++this.nEventScene;
                                 this.nEventFrame = 0;
                              }
                              break;
                           default:
                              ++this.nEventScene;
                              this.nEventFrame = 0;
                        }
                     }
                  }
                  else if(this.nEventScene == 1 || this.nEventScene == 3 || this.nEventScene == 5 || this.nEventScene == 7 || this.nEventScene == 10 || this.nEventScene == 12)
                  {
                     this.lib.drawImg(imgEventBtn + 1,0,0,TOP | LEFT);
                  }
                  ++this.nEventFrame;
                  switch(this.nEventScene)
                  {
                     case 0:
                        if(this.nEventFrame >= 420)
                        {
                           this.nEventFrame = 0;
                           ++this.nEventScene;
                        }
                        break;
                     case 2:
                     case 4:
                     case 11:
                        if(this.nEventScene == 11)
                        {
                           if(this.nEventFrame == 1 || this.nEventFrame == 25)
                           {
                              this.lib.playEffect(61);
                           }
                           else if(this.nEventFrame == 69)
                           {
                              this.lib.playEffect(54);
                           }
                        }
                        if(this.nEventFrame >= 140)
                        {
                           this.nEventFrame = 0;
                           ++this.nEventScene;
                        }
                        break;
                     case 6:
                        if(this.nEventFrame == 5)
                        {
                           this.lib.playEffect(4);
                        }
                        if(this.nEventFrame >= 20)
                        {
                           this.nEventFrame = 0;
                           ++this.nEventScene;
                        }
                        break;
                     case 8:
                        if(this.nEventFrame >= 30)
                        {
                           this.nEventFrame = 0;
                           ++this.nEventScene;
                        }
                        break;
                     case 9:
                        if(this.nEventFrame == 299 || this.nEventFrame == 339 || this.nEventFrame == 359)
                        {
                           this.lib.playEffect(56);
                        }
                        if(this.nEventFrame >= 360)
                        {
                           this.nEventFrame = 0;
                           ++this.nEventScene;
                        }
                        break;
                     case 13:
                        if(this.nEventFrame == 119)
                        {
                           this.lib.playEffect(60);
                        }
                        else if(this.nEventFrame == 179 || this.nEventFrame == 203 || this.nEventFrame == 227 || this.nEventFrame == 251 || this.nEventFrame == 275)
                        {
                           this.lib.playEffect(61);
                        }
                        if(this.nEventFrame >= 300)
                        {
                           this.lib.stopMusic();
                           this.lib.playMusic(Library.MUSIC_TITLE,true);
                           this.bOpenUnitTab = true;
                           this.nMainState = MAIN_AD;
                        }
                        break;
                     case 1:
                     case 3:
                     case 5:
                     case 7:
                     case 10:
                     case 12:
                        switch(this.nEventScene)
                        {
                           case 1:
                              this.lib.drawString("A! Nấm thuốc đây rồi!",320,135,0,100,TOP | LEFT);
                              this.lib.drawString("Cây nấm này sẽ cứu con tôi!!",320,155,0,100,TOP | LEFT);
                              break;
                           case 3:
                              this.lib.drawString("Ối chà!",375,130,0,100,TOP | LEFT);
                              this.lib.drawString("Ngứa chân muốn sút bóng quá!",375,150,0,100,TOP | LEFT);
                              break;
                           case 5:
                              this.lib.drawString("HÁ HÁ HÁ HÁ!!",88,135,0,100,TOP | LEFT);
                              this.lib.drawString("Đỡ cú sút siêu mạnh của ta đây!!",88,155,0,100,TOP | LEFT);
                              break;
                           case 7:
                              this.lib.drawString("Hí hí!",160,135,0,100,TOP | LEFT);
                              this.lib.drawString("Cú sút của ta là đỉnh nhất!!",160,155,0,100,TOP | LEFT);
                              break;
                           case 10:
                              this.lib.drawString("Ư HỰ!",500,245,0,100,TOP | LEFT);
                              break;
                           case 12:
                              switch(this.nDialogStep)
                              {
                                 case 0:
                                    this.lib.drawString("Cảm ơn bạn rất nhiều!!",365,135,0,100,TOP | LEFT);
                                    this.lib.drawString("Tôi vào Rừng Tối tìm nấm,",365,155,0,100,TOP | LEFT);
                                    this.lib.drawString("suýt bị quái đá bóng tóm!",365,175,0,100,TOP | LEFT);
                                    break;
                                 case 1:
                                    this.lib.drawString("Cây cỏ ở đây là thuốc quý,",370,135,0,100,TOP | LEFT);
                                    this.lib.drawString("nhưng vì quái vật quậy phá",370,155,0,100,TOP | LEFT);
                                    this.lib.drawString("khiến nhiều người bệnh gặp nạn.",370,175,0,100,TOP | LEFT);
                                    break;
                                 case 2:
                                    this.lib.drawString("Xin hãy cứu lấy Rừng Tối!",380,155,0,100,TOP | LEFT);
                                    break;
                                 case 3:
                                    this.lib.drawString("Tôi phải mang nấm về nhanh",380,135,0,100,TOP | LEFT);
                                    this.lib.drawString("cho con của tôi đây.",380,155,0,100,TOP | LEFT);
                                    this.lib.drawString("Bạn nhớ cẩn thận nhé!",380,175,0,100,TOP | LEFT);
                              }
                        }
                        if(this.nEventFrame >= 20)
                        {
                           this.nEventFrame = 0;
                        }
                  }
                  break;
               case 1:
                  this.lib.drawASEAni(Ani_Event03_Bg,this.nEventScene,imgBg + 9,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  this.lib.drawASEAni(Ani_Event03_shadow,this.nEventScene,imgShadow,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  if(this.nEventScene < 15)
                  {
                     this.lib.drawASEAni(Ani_Event03_u03,this.nEventScene,imgUnit03Atk1,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  }
                  if(this.nEventScene < 15)
                  {
                     this.lib.drawASEAni(Ani_Event03_u04,this.nEventScene,imgUnit04Arms,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  }
                  if(this.nEventScene < 15)
                  {
                     this.lib.drawASEAni(Ani_Event03_mace,this.nEventScene,imgMace01,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  }
                  if(this.nEventScene < 15)
                  {
                     this.lib.drawASEAni(Ani_Event03_paladog,this.nEventScene,imgPaladog,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  }
                  if(this.nEventScene > 6 && this.nEventScene < 10)
                  {
                     this.lib.drawASEAni(Ani_Event03_b05,this.nEventScene - 7,imgEnemyBoss05,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  }
                  else if(this.nEventScene > 14 && this.nEventScene < 20)
                  {
                     this.lib.drawASEAni(Ani_Event03_b05,this.nEventScene - 12,imgEnemyBoss05,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  }
                  if(this.nEventScene > 14 && this.nEventScene < 20)
                  {
                     this.lib.drawASEAni(Ani_Event03_b06,this.nEventScene - 15,imgEnemyBoss06,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  }
                  if(this.nEventScene < 15)
                  {
                     this.lib.drawASEAni(Ani_Event03_b04,this.nEventScene,imgEnemyBoss04,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  }
                  if(this.nEventScene < 15)
                  {
                     this.lib.drawASEAni(Ani_Event03_u01,this.nEventScene,imgUnit01Atk1,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  }
                  if(this.nEventScene < 15)
                  {
                     this.lib.drawASEAni(Ani_Event03_u02,this.nEventScene,imgUnit02Arms,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  }
                  if(this.nEventScene < 10)
                  {
                     this.lib.drawASEAni(Ani_Event03_key,this.nEventScene,imgCinema03,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  }
                  else if(this.nEventScene > 14 && this.nEventScene < 18)
                  {
                     this.lib.drawASEAni(Ani_Event03_key,this.nEventScene - 5,imgCinema03,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  }
                  this.lib.drawASEAni(Ani_Event03_ui,this.nEventScene,imgCinemaUi,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  if(this.bEventSkipBtn)
                  {
                     this.lib.drawImg(imgEventBtn + 2,0,0,TOP | LEFT);
                     this.nBtnFrame += 1 + this.nLeakFrame;
                     if(this.nBtnFrame > MAX_BTNFRAME)
                     {
                        this.nBtnFrame = 0;
                        this.bEventSkipBtn = false;
                        this.lib.stopMusic();
                        this.lib.playMusic(Library.MUSIC_TITLE,true);
                        this.bOpenUnitTab = true;
                        this.nMainState = MAIN_AD;
                     }
                  }
                  else
                  {
                     this.lib.drawImg(imgEventBtn + 3,0,0,TOP | LEFT);
                  }
                  if(this.bEventNextBtn)
                  {
                     this.lib.drawImg(imgEventBtn,0,0,TOP | LEFT);
                     this.nBtnFrame += 1 + this.nLeakFrame;
                     if(this.nBtnFrame > MAX_BTNFRAME)
                     {
                        this.nBtnFrame = 0;
                        this.bEventNextBtn = false;
                        ++this.nEventScene;
                        this.nEventFrame = 0;
                     }
                  }
                  else if(this.nEventScene == 1 || this.nEventScene == 3 || this.nEventScene == 4 || this.nEventScene == 5 || this.nEventScene == 6 || this.nEventScene == 8 || this.nEventScene == 10 || this.nEventScene == 11 || this.nEventScene == 12 || this.nEventScene == 13 || this.nEventScene == 16 || this.nEventScene == 18)
                  {
                     this.lib.drawImg(imgEventBtn + 1,0,0,TOP | LEFT);
                  }
                  ++this.nEventFrame;
                  switch(this.nEventScene)
                  {
                     case 0:
                        if(this.nEventFrame == 30)
                        {
                           this.lib.playEffect(28);
                        }
                        else if(this.nEventFrame == 78 || this.nEventFrame == 98)
                        {
                           this.lib.playEffect(56);
                        }
                        if(this.nEventFrame >= 100)
                        {
                           this.nEventFrame = 0;
                           ++this.nEventScene;
                        }
                        break;
                     case 2:
                        if(this.nEventFrame >= 160)
                        {
                           this.nEventFrame = 0;
                           ++this.nEventScene;
                        }
                        break;
                     case 7:
                        if(this.nEventFrame >= 60)
                        {
                           this.nEventFrame = 0;
                           ++this.nEventScene;
                        }
                        break;
                     case 9:
                        if(this.nEventFrame == 60)
                        {
                           this.lib.playEffect(6);
                        }
                        if(this.nEventFrame >= 100)
                        {
                           this.nEventFrame = 0;
                           ++this.nEventScene;
                        }
                        break;
                     case 14:
                        if(this.nEventFrame == 2)
                        {
                           this.lib.playEffect(60);
                        }
                        else if(this.nEventFrame == 60 || this.nEventFrame == 84 || this.nEventFrame == 108 || this.nEventFrame == 132 || this.nEventFrame == 156 || this.nEventFrame == 180)
                        {
                           this.lib.playEffect(61);
                        }
                        if(this.nEventFrame >= 200)
                        {
                           this.nEventFrame = 0;
                           ++this.nEventScene;
                        }
                        break;
                     case 15:
                        if(this.nEventFrame == 2)
                        {
                           this.lib.playEffect(6);
                        }
                        if(this.nEventFrame >= 120)
                        {
                           this.nEventFrame = 0;
                           ++this.nEventScene;
                        }
                        break;
                     case 17:
                        if(this.nEventFrame == 2)
                        {
                           this.lib.playEffect(6);
                        }
                        else if(this.nEventFrame == 100 || this.nEventFrame == 160 || this.nEventFrame == 220 || this.nEventFrame == 280)
                        {
                           this.lib.playEffect(7);
                        }
                        if(this.nEventFrame >= 320)
                        {
                           this.nEventFrame = 0;
                           ++this.nEventScene;
                        }
                        break;
                     case 19:
                        if(this.nEventFrame == 2)
                        {
                           this.lib.playEffect(6);
                        }
                        else if(this.nEventFrame == 22)
                        {
                           this.lib.playEffect(7);
                        }
                        if(this.nEventFrame >= 40)
                        {
                           this.lib.stopMusic();
                           this.lib.playMusic(Library.MUSIC_TITLE,true);
                           this.bOpenUnitTab = true;
                           this.nMainState = MAIN_AD;
                        }
                        break;
                     case 1:
                     case 5:
                     case 6:
                     case 11:
                     case 13:
                        if(this.nEventSoundCount <= 0)
                        {
                           if(this.nEventScene == 1)
                           {
                              if(this.nEventFrame == 2 || this.nEventFrame == 22)
                              {
                                 this.lib.playEffect(31);
                              }
                           }
                           else if(this.nEventScene == 5)
                           {
                              if(this.nEventFrame == 2)
                              {
                                 this.lib.playEffect(90);
                              }
                           }
                           else if(this.nEventScene == 6)
                           {
                              if(this.nEventFrame == 2)
                              {
                                 this.lib.playEffect(91);
                              }
                           }
                           else if(this.nEventScene == 11)
                           {
                              if(this.nEventFrame == 2)
                              {
                                 this.lib.playEffect(90);
                              }
                           }
                           else if(this.nEventScene == 13)
                           {
                              if(this.nEventFrame == 2)
                              {
                                 this.lib.playEffect(91);
                              }
                           }
                        }
                        switch(this.nEventScene)
                        {
                           case 1:
                              this.lib.drawString("Ô kìa! Vật gì thế kia?",143,250,0,100,TOP | LEFT);
                              break;
                           case 5:
                              this.lib.drawString("Cùng tiến vào lâu đài",160,135,0,100,TOP | LEFT);
                              this.lib.drawString("đánh bại Chúa Tể Hắc Ám nào!",160,155,0,100,TOP | LEFT);
                              break;
                           case 6:
                              this.lib.drawString("ĐƯỢC RỒI!!",320,135,0,100,TOP | LEFT);
                              this.lib.drawString("Tiến lên giành chiến thắng nào!",320,155,0,100,TOP | LEFT);
                              this.lib.drawString("Tôi nóng lòng xung trận lắm rồi!",320,175,0,100,TOP | LEFT);
                              break;
                           case 11:
                              this.lib.drawString("Quái lạ, hắn biến đâu mất rồi?!",240,155,0,100,TOP | LEFT);
                              break;
                           case 13:
                              this.lib.drawString("Còn chờ gì nữa!",315,148,0,100,TOP | LEFT);
                              this.lib.drawString("Mau đuổi theo lấy lại chìa khóa!!",315,168,0,100,TOP | LEFT);
                        }
                        if(this.nEventFrame >= 40)
                        {
                           ++this.nEventSoundCount;
                           this.nEventFrame = 0;
                        }
                        break;
                     case 3:
                     case 4:
                     case 8:
                     case 10:
                     case 12:
                     case 16:
                     case 18:
                        if(this.nEventSoundCount <= 0)
                        {
                           if(this.nEventScene == 3)
                           {
                              if(this.nEventFrame == 2)
                              {
                                 this.lib.playEffect(31);
                              }
                           }
                           else if(this.nEventScene == 4)
                           {
                              if(this.nEventFrame == 2)
                              {
                                 this.lib.playEffect(32);
                              }
                           }
                           else if(this.nEventScene == 10)
                           {
                              if(this.nEventFrame == 2)
                              {
                                 this.lib.playEffect(31);
                              }
                           }
                           else if(this.nEventScene == 12)
                           {
                              if(this.nEventFrame == 2)
                              {
                                 this.lib.playEffect(32);
                              }
                           }
                        }
                        switch(this.nEventScene)
                        {
                           case 3:
                              this.lib.drawString("Chìa Khóa Lâu Đài!!",160,250,0,100,TOP | LEFT);
                              break;
                           case 4:
                              this.lib.drawString("Đây là chiếc chìa khóa",15,257,0,100,TOP | LEFT);
                              this.lib.drawString("để mở cổng Lâu Đài Hắc Ám!",15,277,0,100,TOP | LEFT);
                              break;
                           case 8:
                              this.lib.drawString("HÁ HÁ HÁ HÁ HÁ!",197,135,0,100,TOP | LEFT);
                              this.lib.drawString("Đừng hòng!! Chìa khóa giờ là của ta!!",197,155,0,100,TOP | LEFT);
                              break;
                           case 10:
                              this.lib.drawString("Quái vật cướp mất chìa khóa rồi!!",120,250,0,100,TOP | LEFT);
                              break;
                           case 12:
                              this.lib.drawString("Hắn kìa, ở đằng kia,",40,230,0,100,TOP | LEFT);
                              this.lib.drawString("ngay tại Hẻm Núi Băng!!",40,250,0,100,TOP | LEFT);
                              break;
                           case 16:
                              this.lib.drawString("Muốn tới lâu đài Chúa Tể Hắc Ám,",310,138,0,100,TOP | LEFT);
                              this.lib.drawString("ngươi phải hạ ta trước đã!!",310,158,0,100,TOP | LEFT);
                              break;
                           case 18:
                              this.lib.drawString("Đói quá! Đói quá đi!",485,233,0,100,TOP | LEFT);
                        }
                        if(this.nEventFrame >= 20)
                        {
                           ++this.nEventSoundCount;
                           this.nEventFrame = 0;
                        }
                  }
                  break;
               case 2:
                  if(this.nEventScene < 8)
                  {
                     this.lib.drawASEAni(Ani_Event04_Bg_0,this.nEventScene,imgBg + 15,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  }
                  else
                  {
                     this.lib.drawASEAni(Ani_Event04_Bg_1,this.nEventScene - 8,imgBg + 18,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  }
                  this.lib.drawASEAni(Ani_Event04_shadow,this.nEventScene,imgShadow,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  if(this.nEventScene < 12)
                  {
                     this.lib.drawASEAni(Ani_Event04_mirror,this.nEventScene,imgCinema04,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  }
                  if(this.nEventScene > 8 && this.nEventScene < 12)
                  {
                     this.lib.drawASEAniEffect(Ani_Event04_b07,this.nEventScene - 9,imgEnemyBoss07,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  }
                  if(this.nEventScene < 7)
                  {
                     this.lib.drawASEAni(Ani_Event04_u03,this.nEventScene,imgUnit03Atk1,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                     this.lib.drawASEAni(Ani_Event04_u05,this.nEventScene,imgUnit05Atk1,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                     this.lib.drawASEAni(Ani_Event04_mace,this.nEventScene,imgMace01,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                     this.lib.drawASEAni(Ani_Event04_paladog,this.nEventScene,imgPaladog,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  }
                  if(this.nEventScene < 7)
                  {
                     this.lib.drawASEAni(Ani_Event04_b06,this.nEventScene,imgEnemyBoss06,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  }
                  if(this.nEventScene < 7)
                  {
                     this.lib.drawASEAni(Ani_Event04_u01,this.nEventScene,imgUnit01Atk1,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  }
                  if(this.nEventScene == 4)
                  {
                     this.lib.drawASEAni(Ani_Event04_bomb,this.nEventScene - 4,imgUnit06Arms,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  }
                  if(this.nEventScene < 7)
                  {
                     this.lib.drawASEAni(Ani_Event04_u06,this.nEventScene,imgUnit06Arms,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                     if(this.nEventScene == 4)
                     {
                        this.lib.drawASEAni(Ani_Event04_eff,this.nEventScene - 4,imgExplosion_a,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                     }
                     this.lib.drawASEAni(Ani_Event04_key,this.nEventScene,imgCinema03,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                     this.lib.drawASEAni(Ani_Event04_u04,this.nEventScene,imgUnit04Arms,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  }
                  else if(this.nEventScene < 9)
                  {
                     this.lib.drawASEAni(Ani_Event04_key,this.nEventScene,imgCinema03,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  }
                  if(this.nEventScene == 7)
                  {
                     this.lib.drawASEAni(Ani_Event04_b06,this.nEventScene,imgEnemyBoss06,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  }
                  this.lib.drawASEAni(Ani_Event04_ui,this.nEventScene,imgCinemaUi,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  if(this.bEventSkipBtn)
                  {
                     this.lib.drawImg(imgEventBtn + 2,0,0,TOP | LEFT);
                     this.nBtnFrame += 1 + this.nLeakFrame;
                     if(this.nBtnFrame > MAX_BTNFRAME)
                     {
                        this.nBtnFrame = 0;
                        this.bEventSkipBtn = false;
                        this.lib.stopMusic();
                        this.lib.playMusic(Library.MUSIC_TITLE,true);
                        this.bOpenUnitTab = true;
                        this.nMainState = MAIN_AD;
                     }
                  }
                  else
                  {
                     this.lib.drawImg(imgEventBtn + 3,0,0,TOP | LEFT);
                  }
                  if(this.bEventNextBtn)
                  {
                     this.lib.drawImg(imgEventBtn,0,0,TOP | LEFT);
                     this.nBtnFrame += 1 + this.nLeakFrame;
                     if(this.nBtnFrame > MAX_BTNFRAME)
                     {
                        this.nBtnFrame = 0;
                        this.bEventNextBtn = false;
                        ++this.nEventScene;
                        this.nEventFrame = 0;
                     }
                  }
                  else if(this.nEventScene == 1 || this.nEventScene == 2 || this.nEventScene == 3 || this.nEventScene == 4 || this.nEventScene == 5 || this.nEventScene == 10)
                  {
                     this.lib.drawImg(imgEventBtn + 1,0,0,TOP | LEFT);
                  }
                  ++this.nEventFrame;
                  switch(this.nEventScene)
                  {
                     case 0:
                     case 9:
                        if(this.nEventScene == 0)
                        {
                           if(this.nEventFrame == 50)
                           {
                              this.lib.playEffect(40);
                           }
                           else if(this.nEventFrame == 110 || this.nEventFrame == 130)
                           {
                              this.lib.playEffect(31);
                           }
                        }
                        if(this.nEventFrame >= 300)
                        {
                           this.nEventFrame = 0;
                           ++this.nEventScene;
                        }
                        break;
                     case 6:
                        if(this.nEventFrame == 2)
                        {
                           this.lib.playEffect(60);
                        }
                        else if(this.nEventFrame == 60 || this.nEventFrame == 84 || this.nEventFrame == 108 || this.nEventFrame == 132 || this.nEventFrame == 156 || this.nEventFrame == 180)
                        {
                           this.lib.playEffect(61);
                        }
                        if(this.nEventFrame >= 200)
                        {
                           this.nEventFrame = 0;
                           ++this.nEventScene;
                        }
                        break;
                     case 7:
                     case 8:
                        if(this.nEventScene == 7)
                        {
                           if(this.nEventFrame == 2)
                           {
                              this.lib.playEffect(54);
                           }
                           else if(this.nEventFrame == 180)
                           {
                              this.lib.playEffect(50);
                           }
                           else if(this.nEventFrame == 240 || this.nEventFrame == 260 || this.nEventFrame == 280 || this.nEventFrame == 300 || this.nEventFrame == 320 || this.nEventFrame == 340 || this.nEventFrame == 360 || this.nEventFrame == 380 || this.nEventFrame == 400 || this.nEventFrame == 420 || this.nEventFrame == 440 || this.nEventFrame == 460)
                           {
                              this.lib.playEffect(65);
                           }
                        }
                        else if(this.nEventScene == 8)
                        {
                           if(this.nEventFrame == 20 || this.nEventFrame == 40 || this.nEventFrame == 60 || this.nEventFrame == 80 || this.nEventFrame == 100 || this.nEventFrame == 120 || this.nEventFrame == 140 || this.nEventFrame == 160 || this.nEventFrame == 180 || this.nEventFrame == 200 || this.nEventFrame == 220)
                           {
                              this.lib.playEffect(65);
                           }
                           else if(this.nEventFrame == 280)
                           {
                              this.lib.playEffect(50);
                           }
                           else if(this.nEventFrame == 320)
                           {
                              this.lib.playEffect(54);
                           }
                        }
                        if(this.nEventFrame >= 480)
                        {
                           this.nEventFrame = 0;
                           ++this.nEventScene;
                        }
                        break;
                     case 11:
                        if(this.nEventFrame >= 40)
                        {
                           this.lib.stopMusic();
                           this.lib.playMusic(Library.MUSIC_TITLE,true);
                           this.bOpenUnitTab = true;
                           this.nMainState = MAIN_AD;
                        }
                        break;
                     case 1:
                     case 10:
                        if(this.nEventSoundCount <= 0)
                        {
                           if(this.nEventScene == 1)
                           {
                              if(this.nEventFrame == 2)
                              {
                                 this.lib.playEffect(31);
                              }
                           }
                           else if(this.nEventScene == 10)
                           {
                              if(this.nEventFrame == 2)
                              {
                                 this.lib.playEffect(49);
                              }
                           }
                        }
                        switch(this.nEventScene)
                        {
                           case 1:
                              this.lib.drawString("Tuyệt vời, đã lấy lại chìa khóa!",90,238,0,100,TOP | LEFT);
                              this.lib.drawString("Tiến vào lâu đài ngay thôi!!",90,258,0,100,TOP | LEFT);
                              break;
                           case 10:
                              this.lib.drawString("HÁ HÁ HÁ, Paladog!!",125,132,0,100,TOP | LEFT);
                              this.lib.drawString("Ngươi sẽ phải đấu với bản sao bóng tối!",125,152,0,100,TOP | LEFT);
                              this.lib.drawString("Xem ngươi có tự thắng nổi mình không!",125,172,0,100,TOP | LEFT);
                        }
                        if(this.nEventFrame >= 20)
                        {
                           ++this.nEventSoundCount;
                           this.nEventFrame = 0;
                        }
                        break;
                     case 2:
                     case 3:
                     case 5:
                        if(this.nEventSoundCount <= 0)
                        {
                           if(this.nEventScene == 2)
                           {
                              if(this.nEventFrame == 2)
                              {
                                 this.lib.playEffect(90);
                              }
                           }
                           else if(this.nEventScene == 3)
                           {
                              if(this.nEventFrame == 2)
                              {
                                 this.lib.playEffect(36);
                              }
                           }
                           else if(this.nEventScene == 5)
                           {
                              if(this.nEventFrame == 2)
                              {
                                 this.lib.playEffect(91);
                              }
                           }
                        }
                        switch(this.nEventScene)
                        {
                           case 2:
                              this.lib.drawString("Băng qua hang động đằng kia là",150,133,0,100,TOP | LEFT);
                              this.lib.drawString("đường tắt tới Lâu Đài Hắc Ám.",150,153,0,100,TOP | LEFT);
                              break;
                           case 3:
                              this.lib.drawString("Nhưng từ trước khi có chiến tranh,",310,165,0,100,TOP | LEFT);
                              this.lib.drawString("trong hang đã đầy quái vật rồi!!",310,185,0,100,TOP | LEFT);
                              break;
                           case 5:
                              this.lib.drawString("Bất kể con quái nào xuất hiện,",290,219,0,100,TOP | LEFT);
                              this.lib.drawString("ta nhất định sẽ thắng! Xông lên!!",290,239,0,100,TOP | LEFT);
                        }
                        if(this.nEventFrame >= 40)
                        {
                           ++this.nEventSoundCount;
                           this.nEventFrame = 0;
                        }
                        break;
                     case 4:
                        if(this.nEventSoundCount <= 0)
                        {
                           if(this.nEventFrame == 2)
                           {
                              this.lib.playEffect(92);
                           }
                           else if(this.nEventFrame == 42)
                           {
                              this.lib.playEffect(46);
                           }
                        }
                        this.lib.drawString("Lũ quái vật kia",50,223,0,100,TOP | LEFT);
                        this.lib.drawString("sao chịu nổi bom của ta!",50,243,0,100,TOP | LEFT);
                        this.lib.drawString("BÙM một phát! Khẹc khẹc khẹc!",50,263,0,100,TOP | LEFT);
                        if(this.nEventFrame >= 80)
                        {
                           ++this.nEventSoundCount;
                           this.nEventFrame = 0;
                        }
                  }
                  break;
               case 3:
                  if(this.nEventScene > 6)
                  {
                     this.lib.drawASEAni(Ani_Event05_Bg,this.nEventScene - 7,imgBg + 24,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  }
                  if(this.nEventScene > 7)
                  {
                     this.lib.drawASEAni(Ani_Event05_shadow,this.nEventScene - 8,imgShadow,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  }
                  if(this.nEventScene < 8)
                  {
                     this.lib.drawASEAni(Ani_Event05_ui,this.nEventScene * 2 + 1,imgCinemaUi,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                     this.lib.drawASEAni(Ani_Event05_door,this.nEventScene,imgCinema05,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                     this.lib.drawASEAni(Ani_Event05_ui,this.nEventScene * 2,imgCinemaUi,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  }
                  else
                  {
                     if(this.nEventScene < 20)
                     {
                        if(this.nEventScene > 11)
                        {
                           this.lib.drawASEAni(Ani_Event05_u03_01,this.nEventScene - 12,imgUnit03Atk1,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                        }
                        if(this.nEventScene > 15)
                        {
                           this.lib.drawASEAni(Ani_Event05_u05_01,this.nEventScene - 16,imgUnit05Atk1,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                        }
                        this.lib.drawASEAni(Ani_Event05_u01_01,this.nEventScene - 8,imgUnit01Atk1,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                        if(this.nEventScene > 9)
                        {
                           this.lib.drawASEAni(Ani_Event05_u02_01,this.nEventScene - 10,imgUnit02Arms,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                        }
                        if(this.nEventScene > 17)
                        {
                           this.lib.drawASEAni(Ani_Event05_u06_01,this.nEventScene - 18,imgUnit06Arms,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                        }
                        if(this.nEventScene > 13)
                        {
                           this.lib.drawASEAni(Ani_Event05_u04_01,this.nEventScene - 14,imgUnit04Arms,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                        }
                     }
                     else
                     {
                        if(this.nEventScene > 23)
                        {
                           this.lib.drawASEAni(Ani_Event05_u09,this.nEventScene - 24,imgUnit09Atk1,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                        }
                        if(this.nEventScene > 26 && this.nEventScene < 31)
                        {
                           this.lib.drawASEAni(Ani_Event05_mace,this.nEventScene - 27,imgMace01,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                           this.lib.drawASEAni(Ani_Event05_paladog,this.nEventScene - 27,imgPaladog,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                        }
                        this.lib.drawASEAni(Ani_Event05_u03_02,this.nEventScene - 20,imgUnit03Atk1,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                        this.lib.drawASEAni(Ani_Event05_u07,this.nEventScene - 20,imgUnit07Atk1,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                        this.lib.drawASEAni(Ani_Event05_u05_02,this.nEventScene - 20,imgUnit05Atk1,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                        this.lib.drawASEAni(Ani_Event05_u01_02,this.nEventScene - 20,imgUnit01Atk1,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                        this.lib.drawASEAni(Ani_Event05_u02_02,this.nEventScene - 20,imgUnit02Arms,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                        this.lib.drawASEAni(Ani_Event05_u06_02,this.nEventScene - 20,imgUnit06Arms,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                        if(this.nEventScene > 21)
                        {
                           this.lib.drawASEAni(Ani_Event05_u08,this.nEventScene - 22,imgUnit08Arms,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                        }
                        this.lib.drawASEAni(Ani_Event05_u04_02,this.nEventScene - 20,imgUnit04Arms,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                     }
                     this.lib.drawASEAni(Ani_Event05_ui,this.nEventScene + 8,imgCinemaUi,this.nEventFrame,this.nLcdWC,this.nLcdHC,100,100,false);
                  }
                  if(this.bEventSkipBtn)
                  {
                     this.lib.drawImg(imgEventBtn + 2,0,0,TOP | LEFT);
                     this.nBtnFrame += 1 + this.nLeakFrame;
                     if(this.nBtnFrame > MAX_BTNFRAME)
                     {
                        this.nBtnFrame = 0;
                        this.bEventSkipBtn = false;
                        this.lib.stopMusic();
                        this.lib.playMusic(Library.MUSIC_TITLE,true);
                        this.bOpenUnitTab = true;
                        this.nMainState = MAIN_AD;
                     }
                  }
                  else
                  {
                     this.lib.drawImg(imgEventBtn + 3,0,0,TOP | LEFT);
                  }
                  if(this.bEventNextBtn)
                  {
                     this.lib.drawImg(imgEventBtn,0,0,TOP | LEFT);
                     this.nBtnFrame += 1 + this.nLeakFrame;
                     if(this.nBtnFrame > MAX_BTNFRAME)
                     {
                        this.nBtnFrame = 0;
                        this.bEventNextBtn = false;
                        switch(this.nEventScene)
                        {
                           case 1:
                              ++this.nDialogStep;
                              this.nEventFrame = 0;
                              if(this.nDialogStep >= 3)
                              {
                                 this.nDialogStep = 0;
                                 ++this.nEventScene;
                                 this.nEventFrame = 0;
                              }
                              break;
                           case 5:
                              ++this.nDialogStep;
                              this.nEventFrame = 0;
                              if(this.nDialogStep >= 6)
                              {
                                 this.nDialogStep = 0;
                                 ++this.nEventScene;
                                 this.nEventFrame = 0;
                              }
                              break;
                           default:
                              ++this.nEventScene;
                              this.nEventFrame = 0;
                        }
                     }
                  }
                  else if(this.nEventScene == 1 || this.nEventScene == 3 || this.nEventScene == 5 || this.nEventScene == 9 || this.nEventScene == 11 || this.nEventScene == 13 || this.nEventScene == 15 || this.nEventScene == 17 || this.nEventScene == 19 || this.nEventScene == 21 || this.nEventScene == 23 || this.nEventScene == 25 || this.nEventScene == 28)
                  {
                     this.lib.drawImg(imgEventBtn + 1,0,0,TOP | LEFT);
                  }
                  ++this.nEventFrame;
                  switch(this.nEventScene)
                  {
                     case 0:
                     case 2:
                     case 29:
                        if(this.nEventScene == 29)
                        {
                           if(this.nEventFrame == 2)
                           {
                              this.lib.playEffect(60);
                           }
                        }
                        if(this.nEventFrame >= 60)
                        {
                           this.nEventFrame = 0;
                           ++this.nEventScene;
                        }
                        break;
                     case 4:
                        if(this.nEventFrame == 100)
                        {
                           this.lib.playEffect(45);
                        }
                        else if(this.nEventFrame == 110)
                        {
                           this.lib.playEffect(44);
                        }
                        if(this.nEventFrame >= 140)
                        {
                           this.nEventFrame = 0;
                           ++this.nEventScene;
                        }
                        break;
                     case 6:
                     case 8:
                     case 10:
                     case 12:
                     case 14:
                     case 16:
                     case 18:
                     case 20:
                     case 22:
                     case 24:
                        if(this.nEventScene == 6)
                        {
                           if(this.nEventFrame == 2)
                           {
                              this.lib.playEffect(42);
                           }
                        }
                        if(this.nEventFrame >= 80)
                        {
                           this.nEventFrame = 0;
                           ++this.nEventScene;
                        }
                        break;
                     case 7:
                        if(this.nEventFrame >= 400)
                        {
                           this.nEventFrame = 0;
                           ++this.nEventScene;
                        }
                        break;
                     case 26:
                        if(this.nEventFrame >= 40)
                        {
                           this.nEventFrame = 0;
                           ++this.nEventScene;
                        }
                        break;
                     case 27:
                        if(this.nEventFrame == 2 || this.nEventFrame == 26 || this.nEventFrame == 50)
                        {
                           this.lib.playEffect(61);
                        }
                        if(this.nEventFrame >= 60)
                        {
                           this.nEventFrame = 0;
                           ++this.nEventScene;
                        }
                        break;
                     case 30:
                        if(this.nEventFrame == 2 || this.nEventFrame == 26 || this.nEventFrame == 50 || this.nEventFrame == 74 || this.nEventFrame == 98 || this.nEventFrame == 122)
                        {
                           this.lib.playEffect(61);
                        }
                        if(this.nEventFrame >= 140)
                        {
                           this.lib.stopMusic();
                           this.lib.playMusic(Library.MUSIC_TITLE,true);
                           this.bOpenUnitTab = true;
                           this.nMainState = MAIN_AD;
                        }
                        break;
                     case 1:
                     case 3:
                     case 5:
                     case 28:
                        if(this.nEventSoundCount <= 0)
                        {
                           if(this.nEventScene == 1)
                           {
                              if(this.nDialogStep == 2)
                              {
                                 if(this.nEventFrame == 2)
                                 {
                                    this.lib.playEffect(10);
                                 }
                              }
                           }
                           else if(this.nEventScene == 5)
                           {
                              if(this.nDialogStep == 5)
                              {
                                 if(this.nEventFrame == 2)
                                 {
                                    this.lib.playEffect(10);
                                 }
                              }
                           }
                        }
                        switch(this.nEventScene)
                        {
                           case 1:
                              switch(this.nDialogStep)
                              {
                                 case 0:
                                    this.lib.drawString("Khá đấy, tới được tận đây cơ à!",220,138,0,100,TOP | LEFT);
                                    break;
                                 case 1:
                                    this.lib.drawString("Không có chìa khóa thì đừng hòng qua!!",220,138,0,100,TOP | LEFT);
                                    break;
                                 case 2:
                                    this.lib.drawString("HÁ HÁ HÁ HÁ!!",300,138,0,100,TOP | LEFT);
                              }
                              break;
                           case 3:
                              this.lib.drawString("GÀO Ô Ô!! Sao ngươi có chìa khóa đó?!",215,138,0,100,TOP | LEFT);
                              break;
                           case 5:
                              switch(this.nDialogStep)
                              {
                                 case 0:
                                    this.lib.drawString("Dù ngươi có chìa khóa đi nữa,",250,138,0,100,TOP | LEFT);
                                    break;
                                 case 1:
                                    this.lib.drawString("chuyến phiêu lưu của ngươi cũng dừng ở đây thôi!!",180,138,0,100,TOP | LEFT);
                                    break;
                                 case 2:
                                    this.lib.drawString("Những quái vật đáng sợ nhất xưa nay",210,138,0,100,TOP | LEFT);
                                    break;
                                 case 3:
                                    this.lib.drawString("đang chờ ngươi bên trong!",270,138,0,100,TOP | LEFT);
                                    break;
                                 case 4:
                                    this.lib.drawString("Hãy hối hận vì mở cánh cổng này đi!",230,138,0,100,TOP | LEFT);
                                    break;
                                 case 5:
                                    this.lib.drawString("HÁ HÁ HÁ HÁ!!",300,140,0,100,TOP | LEFT);
                              }
                              break;
                           case 28:
                              this.lib.drawString("Đánh bại quái vật, bảo vệ muôn loài!!",170,142,0,100,TOP | LEFT);
                        }
                        if(this.nEventFrame >= 20)
                        {
                           ++this.nEventSoundCount;
                           this.nEventFrame = 0;
                        }
                        break;
                     case 9:
                     case 11:
                     case 13:
                     case 15:
                     case 17:
                     case 19:
                     case 21:
                     case 23:
                     case 25:
                        if(this.nEventSoundCount <= 0)
                        {
                           if(this.nEventScene == 9)
                           {
                              if(this.nEventFrame == 2)
                              {
                                 this.lib.playEffect(88);
                              }
                           }
                           else if(this.nEventScene == 11)
                           {
                              if(this.nEventFrame == 2)
                              {
                                 this.lib.playEffect(89);
                              }
                           }
                           else if(this.nEventScene == 13)
                           {
                              if(this.nEventFrame == 2)
                              {
                                 this.lib.playEffect(90);
                              }
                           }
                           else if(this.nEventScene == 15)
                           {
                              if(this.nEventFrame == 2)
                              {
                                 this.lib.playEffect(91);
                              }
                           }
                           else if(this.nEventScene == 17)
                           {
                              if(this.nEventFrame == 2)
                              {
                                 this.lib.playEffect(36);
                              }
                           }
                           else if(this.nEventScene == 19)
                           {
                              if(this.nEventFrame == 2)
                              {
                                 this.lib.playEffect(92);
                              }
                           }
                           else if(this.nEventScene == 21)
                           {
                              if(this.nEventFrame == 2)
                              {
                                 this.lib.playEffect(93);
                              }
                           }
                           else if(this.nEventScene == 23)
                           {
                              if(this.nEventFrame == 2)
                              {
                                 this.lib.playEffect(94);
                              }
                           }
                           else if(this.nEventScene == 25)
                           {
                              if(this.nEventFrame == 2)
                              {
                                 this.lib.playEffect(95);
                              }
                           }
                        }
                        switch(this.nEventScene)
                        {
                           case 9:
                              this.lib.drawString("Cuối cùng chúng ta cũng tới đây!!",320,185,0,100,TOP | LEFT);
                              this.lib.drawString("Không có bạn, việc này khó thành.",320,205,0,100,TOP | LEFT);
                              this.lib.drawString("Cùng kết thúc trận chiến cuối nào!",320,225,0,100,TOP | LEFT);
                              break;
                           case 11:
                              this.lib.drawString("Dù có dọn sạch lũ quái vật,",120,205,0,100,TOP | LEFT);
                              this.lib.drawString("khu rừng bị cháy cũng khó phục hồi ngay.",120,225,0,100,TOP | LEFT);
                              this.lib.drawString("Nhưng tôi sẽ chiến đấu bảo vệ rừng!",120,245,0,100,TOP | LEFT);
                              break;
                           case 13:
                              this.lib.drawString("Tôi sẵn sàng chiến đấu",120,135,0,100,TOP | LEFT);
                              this.lib.drawString("để bảo vệ hòa bình cho muôn thú!",120,155,0,100,TOP | LEFT);
                              this.lib.drawString("TIẾN LÊN NÀO!!!",120,175,0,100,TOP | LEFT);
                              break;
                           case 15:
                              this.lib.drawString("Tôi từng đấu với rất nhiều kẻ mạnh,",50,193,0,100,TOP | LEFT);
                              this.lib.drawString("nhưng tôi vẫn muốn rèn luyện thêm.",50,213,0,100,TOP | LEFT);
                              this.lib.drawString("Tôi muốn đấu với kẻ mạnh nhất!",50,233,0,100,TOP | LEFT);
                              break;
                           case 17:
                              this.lib.drawString("Cuối cùng đã tới sào huyệt trùm cuối!",80,135,0,100,TOP | LEFT);
                              this.lib.drawString("Trận này sẽ rất cam go, đừng lo,",80,155,0,100,TOP | LEFT);
                              this.lib.drawString("tôi nhất định sẽ bảo vệ cả đội!!",80,175,0,100,TOP | LEFT);
                              break;
                           case 19:
                              this.lib.drawString("Tôi chẳng quan tâm nhiều đâu,",80,215,0,100,TOP | LEFT);
                              this.lib.drawString("nhưng đã nhận tiền thì tôi sẽ hạ trùm!",80,235,0,100,TOP | LEFT);
                              this.lib.drawString("Xong sớm để tôi đi tìm kho báu! He he!",80,255,0,100,TOP | LEFT);
                              break;
                           case 21:
                              this.lib.drawString("Vùng đất này quá ít cướp bóc,",30,135,0,100,TOP | LEFT);
                              this.lib.drawString("khiến tôi chưa trổ hết tài năng!!",30,155,0,100,TOP | LEFT);
                              this.lib.drawString("Đừng nói nhiều nữa, xông lên nào!!",30,175,0,100,TOP | LEFT);
                              break;
                           case 23:
                              this.lib.drawString("Tôi vốn chẳng thích đánh nhau chút nào,",100,230,0,100,TOP | LEFT);
                              this.lib.drawString("chỉ muốn mau mau kết thúc cuộc chiến,",100,250,0,100,TOP | LEFT);
                              this.lib.drawString("để về học viện nghiên cứu phép thuật thôi.",100,270,0,100,TOP | LEFT);
                              break;
                           case 25:
                              this.lib.drawString("GÀO Ù Ù...",203,132,0,100,TOP | LEFT);
                              this.lib.drawString("GÀO Ô Ô Ô Ô Ô...",203,152,0,100,TOP | LEFT);
                              this.lib.drawString("GRRRRRR...",203,172,0,100,TOP | LEFT);
                        }
                        if(this.nEventFrame >= 40)
                        {
                           ++this.nEventSoundCount;
                           this.nEventFrame = 0;
                        }
                  }
            }
         }
      }
   }
}

