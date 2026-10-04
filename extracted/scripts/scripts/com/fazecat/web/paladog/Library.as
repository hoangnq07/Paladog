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
   import flash.text.TextFieldAutoSize;
   import flash.ui.*;
   import flash.utils.*;
   
   public class Library
   {
      
      public static const GAMESCALE:int = 150;
      
      public static const MAXSIZE_IMG:int = 9000;
      
      public static const MAXSIZE_EMBEDIMG:int = 10;
      
      public static const MAXSIZE_EMBEDDATA:int = 150;
      
      public static const MAXSIZE_EMBEDANI:int = 129;
      
      public static const MAXSIZE_EMBEDSND:int = 129;
      
      public static const MAXSIZE_EMBEDDB:int = 7;
      
      public static const armor_att:int = 0;
      
      public static const arrow:int = 1;
      
      public static const b01:int = 2;
      
      public static const b02:int = 3;
      
      public static const b03:int = 4;
      
      public static const b04:int = 5;
      
      public static const b05:int = 6;
      
      public static const b06:int = 7;
      
      public static const b08:int = 8;
      
      public static const b09:int = 9;
      
      public static const b10:int = 10;
      
      public static const b10_effsnd:int = 11;
      
      public static const beholder:int = 12;
      
      public static const bg_boss:int = 13;
      
      public static const bg_stage:int = 14;
      
      public static const bg_title:int = 15;
      
      public static const bombghost_att:int = 16;
      
      public static const burn:int = 17;
      
      public static const button:int = 18;
      
      public static const buy:int = 19;
      
      public static const buy_coin:int = 20;
      
      public static const buy_jam:int = 21;
      
      public static const c_crash:int = 22;
      
      public static const c_dead:int = 23;
      
      public static const c_hit:int = 24;
      
      public static const cat:int = 25;
      
      public static const cloaking:int = 26;
      
      public static const coin_mace:int = 27;
      
      public static const cold_wind:int = 28;
      
      public static const cyclops:int = 29;
      
      public static const die_ghost:int = 30;
      
      public static const die_man:int = 31;
      
      public static const die_monster:int = 32;
      
      public static const die_paladog:int = 33;
      
      public static const die_u01:int = 34;
      
      public static const die_u02:int = 35;
      
      public static const die_u03:int = 36;
      
      public static const die_u04:int = 37;
      
      public static const die_u05:int = 38;
      
      public static const die_u06:int = 39;
      
      public static const die_u07:int = 40;
      
      public static const die_u08:int = 41;
      
      public static const die_u09:int = 42;
      
      public static const die_woman:int = 43;
      
      public static const dragon:int = 44;
      
      public static const enchantbear_talk_01:int = 45;
      
      public static const enchantbear_talk_02:int = 46;
      
      public static const enchantbear_talk_03:int = 47;
      
      public static const ending_eft_01:int = 48;
      
      public static const ending_eft_02:int = 49;
      
      public static const equip_mace:int = 50;
      
      public static const equip_ring:int = 51;
      
      public static const explosion_01:int = 52;
      
      public static const explosion_02:int = 53;
      
      public static const fire:int = 54;
      
      public static const fistofgod:int = 55;
      
      public static const food:int = 56;
      
      public static const franken_att:int = 57;
      
      public static const freeze:int = 58;
      
      public static const gemcat_talk_01:int = 59;
      
      public static const gemcat_talk_02:int = 60;
      
      public static const gemcat_talk_03:int = 61;
      
      public static const ghost_att:int = 62;
      
      public static const heal:int = 63;
      
      public static const heart:int = 64;
      
      public static const herobug_talk_01:int = 65;
      
      public static const herobug_talk_02:int = 66;
      
      public static const herobug_talk_03:int = 67;
      
      public static const hit_01:int = 68;
      
      public static const hit_02:int = 69;
      
      public static const hit_03:int = 70;
      
      public static const hit_04:int = 71;
      
      public static const hit_05:int = 72;
      
      public static const hit_back:int = 73;
      
      public static const hit_metal:int = 74;
      
      public static const horse_cry:int = 75;
      
      public static const horse_run:int = 76;
      
      public static const ice:int = 77;
      
      public static const lighting_01:int = 78;
      
      public static const lighting_02:int = 79;
      
      public static const macesnd:int = 80;
      
      public static const meteo:int = 81;
      
      public static const miner_att:int = 82;
      
      public static const mouse_over:int = 83;
      
      public static const movemove:int = 84;
      
      public static const newrecord:int = 85;
      
      public static const ok_button:int = 86;
      
      public static const paper:int = 87;
      
      public static const popup_01:int = 88;
      
      public static const popup_02:int = 89;
      
      public static const pumpkin_att:int = 90;
      
      public static const punch:int = 91;
      
      public static const quest_caution:int = 92;
      
      public static const quest_fail:int = 93;
      
      public static const quest_succes:int = 94;
      
      public static const rail_select:int = 95;
      
      public static const shoppig_talk_01:int = 96;
      
      public static const shoppig_talk_02:int = 97;
      
      public static const shoppig_talk_03:int = 98;
      
      public static const spear:int = 99;
      
      public static const stage_clear:int = 100;
      
      public static const stage_fail:int = 101;
      
      public static const start:int = 102;
      
      public static const start_battle:int = 103;
      
      public static const sword_01:int = 104;
      
      public static const sword_02:int = 105;
      
      public static const t_lost:int = 106;
      
      public static const t_score:int = 107;
      
      public static const temptation:int = 108;
      
      public static const tmode_skill_btn:int = 109;
      
      public static const tozombie_att:int = 110;
      
      public static const turnundead:int = 111;
      
      public static const tv_att:int = 112;
      
      public static const u01_skill:int = 113;
      
      public static const u02_skill:int = 114;
      
      public static const u03_skill:int = 115;
      
      public static const u04_skill:int = 116;
      
      public static const u05_skill:int = 117;
      
      public static const u07_skill:int = 118;
      
      public static const u08_skill:int = 119;
      
      public static const u09_skill:int = 120;
      
      public static const unequip:int = 121;
      
      public static const unit_active:int = 122;
      
      public static const unit_create:int = 123;
      
      public static const wagon_dead:int = 124;
      
      public static const wagon_move:int = 125;
      
      public static const wave_clear:int = 126;
      
      public static const wind:int = 127;
      
      public static const zombie_att:int = 128;
      
      public static const snd0:Class = Library_snd0;
      
      public static const snd1:Class = Library_snd1;
      
      public static const snd2:Class = Library_snd2;
      
      public static const snd3:Class = Library_snd3;
      
      public static const snd4:Class = Library_snd4;
      
      public static const snd5:Class = Library_snd5;
      
      public static const snd6:Class = Library_snd6;
      
      public static const snd7:Class = Library_snd7;
      
      public static const snd8:Class = Library_snd8;
      
      public static const snd9:Class = Library_snd9;
      
      public static const snd10:Class = Library_snd10;
      
      public static const snd11:Class = Library_snd11;
      
      public static const snd12:Class = Library_snd12;
      
      public static const snd13:Class = Library_snd13;
      
      public static const snd14:Class = Library_snd14;
      
      public static const snd15:Class = Library_snd15;
      
      public static const snd16:Class = Library_snd16;
      
      public static const snd17:Class = Library_snd17;
      
      public static const snd18:Class = Library_snd18;
      
      public static const snd19:Class = Library_snd19;
      
      public static const snd20:Class = Library_snd20;
      
      public static const snd21:Class = Library_snd21;
      
      public static const snd22:Class = Library_snd22;
      
      public static const snd23:Class = Library_snd23;
      
      public static const snd24:Class = Library_snd24;
      
      public static const snd25:Class = Library_snd25;
      
      public static const snd26:Class = Library_snd26;
      
      public static const snd27:Class = Library_snd27;
      
      public static const snd28:Class = Library_snd28;
      
      public static const snd29:Class = Library_snd29;
      
      public static const snd30:Class = Library_snd30;
      
      public static const snd31:Class = Library_snd31;
      
      public static const snd32:Class = Library_snd32;
      
      public static const snd33:Class = Library_snd33;
      
      public static const snd34:Class = Library_snd34;
      
      public static const snd35:Class = Library_snd35;
      
      public static const snd36:Class = Library_snd36;
      
      public static const snd37:Class = Library_snd37;
      
      public static const snd38:Class = Library_snd38;
      
      public static const snd39:Class = Library_snd39;
      
      public static const snd40:Class = Library_snd40;
      
      public static const snd41:Class = Library_snd41;
      
      public static const snd42:Class = Library_snd42;
      
      public static const snd43:Class = Library_snd43;
      
      public static const snd44:Class = Library_snd44;
      
      public static const snd45:Class = Library_snd45;
      
      public static const snd46:Class = Library_snd46;
      
      public static const snd47:Class = Library_snd47;
      
      public static const snd48:Class = Library_snd48;
      
      public static const snd49:Class = Library_snd49;
      
      public static const snd50:Class = Library_snd50;
      
      public static const snd51:Class = Library_snd51;
      
      public static const snd52:Class = Library_snd52;
      
      public static const snd53:Class = Library_snd53;
      
      public static const snd54:Class = Library_snd54;
      
      public static const snd55:Class = Library_snd55;
      
      public static const snd56:Class = Library_snd56;
      
      public static const snd57:Class = Library_snd57;
      
      public static const snd58:Class = Library_snd58;
      
      public static const snd59:Class = Library_snd59;
      
      public static const snd60:Class = Library_snd60;
      
      public static const snd61:Class = Library_snd61;
      
      public static const snd62:Class = Library_snd62;
      
      public static const snd63:Class = Library_snd63;
      
      public static const snd64:Class = Library_snd64;
      
      public static const snd65:Class = Library_snd65;
      
      public static const snd66:Class = Library_snd66;
      
      public static const snd67:Class = Library_snd67;
      
      public static const snd68:Class = Library_snd68;
      
      public static const snd69:Class = Library_snd69;
      
      public static const snd70:Class = Library_snd70;
      
      public static const snd71:Class = Library_snd71;
      
      public static const snd72:Class = Library_snd72;
      
      public static const snd73:Class = Library_snd73;
      
      public static const snd74:Class = Library_snd74;
      
      public static const snd75:Class = Library_snd75;
      
      public static const snd76:Class = Library_snd76;
      
      public static const snd77:Class = Library_snd77;
      
      public static const snd78:Class = Library_snd78;
      
      public static const snd79:Class = Library_snd79;
      
      public static const snd80:Class = Library_snd80;
      
      public static const snd81:Class = Library_snd81;
      
      public static const snd82:Class = Library_snd82;
      
      public static const snd83:Class = Library_snd83;
      
      public static const snd84:Class = Library_snd84;
      
      public static const snd85:Class = Library_snd85;
      
      public static const snd86:Class = Library_snd86;
      
      public static const snd87:Class = Library_snd87;
      
      public static const snd88:Class = Library_snd88;
      
      public static const snd89:Class = Library_snd89;
      
      public static const snd90:Class = Library_snd90;
      
      public static const snd91:Class = Library_snd91;
      
      public static const snd92:Class = Library_snd92;
      
      public static const snd93:Class = Library_snd93;
      
      public static const snd94:Class = Library_snd94;
      
      public static const snd95:Class = Library_snd95;
      
      public static const snd96:Class = Library_snd96;
      
      public static const snd97:Class = Library_snd97;
      
      public static const snd98:Class = Library_snd98;
      
      public static const snd99:Class = Library_snd99;
      
      public static const snd100:Class = Library_snd100;
      
      public static const snd101:Class = Library_snd101;
      
      public static const snd102:Class = Library_snd102;
      
      public static const snd103:Class = Library_snd103;
      
      public static const snd104:Class = Library_snd104;
      
      public static const snd105:Class = Library_snd105;
      
      public static const snd106:Class = Library_snd106;
      
      public static const snd107:Class = Library_snd107;
      
      public static const snd108:Class = Library_snd108;
      
      public static const snd109:Class = Library_snd109;
      
      public static const snd110:Class = Library_snd110;
      
      public static const snd111:Class = Library_snd111;
      
      public static const snd112:Class = Library_snd112;
      
      public static const snd113:Class = Library_snd113;
      
      public static const snd114:Class = Library_snd114;
      
      public static const snd115:Class = Library_snd115;
      
      public static const snd116:Class = Library_snd116;
      
      public static const snd117:Class = Library_snd117;
      
      public static const snd118:Class = Library_snd118;
      
      public static const snd119:Class = Library_snd119;
      
      public static const snd120:Class = Library_snd120;
      
      public static const snd121:Class = Library_snd121;
      
      public static const snd122:Class = Library_snd122;
      
      public static const snd123:Class = Library_snd123;
      
      public static const snd124:Class = Library_snd124;
      
      public static const snd125:Class = Library_snd125;
      
      public static const snd126:Class = Library_snd126;
      
      public static const snd127:Class = Library_snd127;
      
      public static const snd128:Class = Library_snd128;
      
      public static const Logo00Img:Class = Library_Logo00Img;
      
      public static const Logo01Img:Class = Library_Logo01Img;
      
      public static const Logo02Img:Class = Library_Logo02Img;
      
      public static const bossDialog:int = 0;
      
      public static const destinyDB:int = 1;
      
      public static const enemyDB:int = 2;
      
      public static const stageDB:int = 3;
      
      public static const storeinfor:int = 4;
      
      public static const unitDB:int = 5;
      
      public static const unitinfor:int = 6;
      
      public static const DB0:Class = Library_DB0;
      
      public static const DB1:Class = Library_DB1;
      
      public static const DB2:Class = Library_DB2;
      
      public static const DB3:Class = Library_DB3;
      
      public static const DB4:Class = Library_DB4;
      
      public static const DB5:Class = Library_DB5;
      
      public static const DB6:Class = Library_DB6;
      
      public static const ad:int = 0;
      
      public static const attackedeff:int = 1;
      
      public static const aura:int = 2;
      
      public static const b01_ani:int = 3;
      
      public static const b01_eff:int = 4;
      
      public static const b02_ani:int = 5;
      
      public static const b02_eff:int = 6;
      
      public static const b03_ani:int = 7;
      
      public static const b04_ani:int = 8;
      
      public static const b04_eff:int = 9;
      
      public static const b05_ani:int = 10;
      
      public static const b06_ani:int = 11;
      
      public static const b07_ani:int = 12;
      
      public static const b07_eff:int = 13;
      
      public static const b08_ani:int = 14;
      
      public static const b08_eff:int = 15;
      
      public static const b09_ani:int = 16;
      
      public static const b09_eff:int = 17;
      
      public static const b10_ani:int = 18;
      
      public static const b10_eff:int = 19;
      
      public static const background0:int = 20;
      
      public static const background1:int = 21;
      
      public static const background2:int = 22;
      
      public static const background3:int = 23;
      
      public static const background4:int = 24;
      
      public static const background5:int = 25;
      
      public static const background6:int = 26;
      
      public static const background7:int = 27;
      
      public static const background8:int = 28;
      
      public static const background9:int = 29;
      
      public static const badenergy:int = 30;
      
      public static const btn:int = 31;
      
      public static const burnice:int = 32;
      
      public static const chapterclear:int = 33;
      
      public static const cinema01:int = 34;
      
      public static const cinema02:int = 35;
      
      public static const cinema03:int = 36;
      
      public static const cinema04:int = 37;
      
      public static const cinema05:int = 38;
      
      public static const cinemabtn:int = 39;
      
      public static const cinemaui:int = 40;
      
      public static const destiny:int = 41;
      
      public static const diawindow:int = 42;
      
      public static const dragonfire:int = 43;
      
      public static const e01:int = 44;
      
      public static const e02:int = 45;
      
      public static const e03:int = 46;
      
      public static const e04:int = 47;
      
      public static const e05:int = 48;
      
      public static const e06:int = 49;
      
      public static const e07:int = 50;
      
      public static const e08:int = 51;
      
      public static const e09:int = 52;
      
      public static const e10:int = 53;
      
      public static const e11:int = 54;
      
      public static const e12:int = 55;
      
      public static const e13:int = 56;
      
      public static const e14:int = 57;
      
      public static const e15:int = 58;
      
      public static const e16:int = 59;
      
      public static const e17:int = 60;
      
      public static const e18:int = 61;
      
      public static const e19:int = 62;
      
      public static const e20:int = 63;
      
      public static const e21:int = 64;
      
      public static const e22:int = 65;
      
      public static const e23:int = 66;
      
      public static const e24:int = 67;
      
      public static const e25:int = 68;
      
      public static const e26:int = 69;
      
      public static const e27:int = 70;
      
      public static const e28:int = 71;
      
      public static const e29:int = 72;
      
      public static const e30:int = 73;
      
      public static const e31:int = 74;
      
      public static const e32:int = 75;
      
      public static const e33:int = 76;
      
      public static const e34:int = 77;
      
      public static const e35:int = 78;
      
      public static const e36:int = 79;
      
      public static const e37:int = 80;
      
      public static const e38:int = 81;
      
      public static const e39:int = 82;
      
      public static const e40:int = 83;
      
      public static const ending:int = 84;
      
      public static const endingbg:int = 85;
      
      public static const enemydie:int = 86;
      
      public static const enemygoal:int = 87;
      
      public static const enemyhitcrash:int = 88;
      
      public static const enemystation:int = 89;
      
      public static const eventBtn:int = 90;
      
      public static const explosion:int = 91;
      
      public static const fail:int = 92;
      
      public static const heroposition:int = 93;
      
      public static const itemicon:int = 94;
      
      public static const larva:int = 95;
      
      public static const levelup:int = 96;
      
      public static const levelupeff:int = 97;
      
      public static const linkBtn:int = 98;
      
      public static const loading:int = 99;
      
      public static const m01eff:int = 100;
      
      public static const m02eff:int = 101;
      
      public static const m03eff_0:int = 102;
      
      public static const m03eff_1:int = 103;
      
      public static const m04eff:int = 104;
      
      public static const m05eff:int = 105;
      
      public static const m06eff:int = 106;
      
      public static const m07eff:int = 107;
      
      public static const m08eff:int = 108;
      
      public static const m09eff:int = 109;
      
      public static const m10eff:int = 110;
      
      public static const mace:int = 111;
      
      public static const menu:int = 112;
      
      public static const num:int = 113;
      
      public static const opening:int = 114;
      
      public static const option:int = 115;
      
      public static const paladog:int = 116;
      
      public static const pause:int = 117;
      
      public static const pig:int = 118;
      
      public static const shadow:int = 119;
      
      public static const skillinfor:int = 120;
      
      public static const stageclear:int = 121;
      
      public static const stageselect:int = 122;
      
      public static const store:int = 123;
      
      public static const stun:int = 124;
      
      public static const title:int = 125;
      
      public static const titlebtn:int = 126;
      
      public static const titlelogo:int = 127;
      
      public static const towerkey:int = 128;
      
      public static const tutorial0:int = 129;
      
      public static const tutorial1:int = 130;
      
      public static const tutorial2:int = 131;
      
      public static const tutorial3:int = 132;
      
      public static const tutorial4:int = 133;
      
      public static const u01:int = 134;
      
      public static const u02:int = 135;
      
      public static const u03:int = 136;
      
      public static const u04:int = 137;
      
      public static const u05:int = 138;
      
      public static const u06:int = 139;
      
      public static const u07:int = 140;
      
      public static const u08:int = 141;
      
      public static const u09:int = 142;
      
      public static const ui:int = 143;
      
      public static const unitdie:int = 144;
      
      public static const unitgage:int = 145;
      
      public static const unitgoal:int = 146;
      
      public static const w01:int = 147;
      
      public static const wagon:int = 148;
      
      public static const warroad:int = 149;
      
      public static const fDat0:Class = Library_fDat0;
      
      public static const fDat1:Class = Library_fDat1;
      
      public static const fDat2:Class = Library_fDat2;
      
      public static const fDat3:Class = Library_fDat3;
      
      public static const fDat4:Class = Library_fDat4;
      
      public static const fDat5:Class = Library_fDat5;
      
      public static const fDat6:Class = Library_fDat6;
      
      public static const fDat7:Class = Library_fDat7;
      
      public static const fDat8:Class = Library_fDat8;
      
      public static const fDat9:Class = Library_fDat9;
      
      public static const fDat10:Class = Library_fDat10;
      
      public static const fDat11:Class = Library_fDat11;
      
      public static const fDat12:Class = Library_fDat12;
      
      public static const fDat13:Class = Library_fDat13;
      
      public static const fDat14:Class = Library_fDat14;
      
      public static const fDat15:Class = Library_fDat15;
      
      public static const fDat16:Class = Library_fDat16;
      
      public static const fDat17:Class = Library_fDat17;
      
      public static const fDat18:Class = Library_fDat18;
      
      public static const fDat19:Class = Library_fDat19;
      
      public static const fDat20:Class = Library_fDat20;
      
      public static const fDat21:Class = Library_fDat21;
      
      public static const fDat22:Class = Library_fDat22;
      
      public static const fDat23:Class = Library_fDat23;
      
      public static const fDat24:Class = Library_fDat24;
      
      public static const fDat25:Class = Library_fDat25;
      
      public static const fDat26:Class = Library_fDat26;
      
      public static const fDat27:Class = Library_fDat27;
      
      public static const fDat28:Class = Library_fDat28;
      
      public static const fDat29:Class = Library_fDat29;
      
      public static const fDat30:Class = Library_fDat30;
      
      public static const fDat31:Class = Library_fDat31;
      
      public static const fDat32:Class = Library_fDat32;
      
      public static const fDat33:Class = Library_fDat33;
      
      public static const fDat34:Class = Library_fDat34;
      
      public static const fDat35:Class = Library_fDat35;
      
      public static const fDat36:Class = Library_fDat36;
      
      public static const fDat37:Class = Library_fDat37;
      
      public static const fDat38:Class = Library_fDat38;
      
      public static const fDat39:Class = Library_fDat39;
      
      public static const fDat40:Class = Library_fDat40;
      
      public static const fDat41:Class = Library_fDat41;
      
      public static const fDat42:Class = Library_fDat42;
      
      public static const fDat43:Class = Library_fDat43;
      
      public static const fDat44:Class = Library_fDat44;
      
      public static const fDat45:Class = Library_fDat45;
      
      public static const fDat46:Class = Library_fDat46;
      
      public static const fDat47:Class = Library_fDat47;
      
      public static const fDat48:Class = Library_fDat48;
      
      public static const fDat49:Class = Library_fDat49;
      
      public static const fDat50:Class = Library_fDat50;
      
      public static const fDat51:Class = Library_fDat51;
      
      public static const fDat52:Class = Library_fDat52;
      
      public static const fDat53:Class = Library_fDat53;
      
      public static const fDat54:Class = Library_fDat54;
      
      public static const fDat55:Class = Library_fDat55;
      
      public static const fDat56:Class = Library_fDat56;
      
      public static const fDat57:Class = Library_fDat57;
      
      public static const fDat58:Class = Library_fDat58;
      
      public static const fDat59:Class = Library_fDat59;
      
      public static const fDat60:Class = Library_fDat60;
      
      public static const fDat61:Class = Library_fDat61;
      
      public static const fDat62:Class = Library_fDat62;
      
      public static const fDat63:Class = Library_fDat63;
      
      public static const fDat64:Class = Library_fDat64;
      
      public static const fDat65:Class = Library_fDat65;
      
      public static const fDat66:Class = Library_fDat66;
      
      public static const fDat67:Class = Library_fDat67;
      
      public static const fDat68:Class = Library_fDat68;
      
      public static const fDat69:Class = Library_fDat69;
      
      public static const fDat70:Class = Library_fDat70;
      
      public static const fDat71:Class = Library_fDat71;
      
      public static const fDat72:Class = Library_fDat72;
      
      public static const fDat73:Class = Library_fDat73;
      
      public static const fDat74:Class = Library_fDat74;
      
      public static const fDat75:Class = Library_fDat75;
      
      public static const fDat76:Class = Library_fDat76;
      
      public static const fDat77:Class = Library_fDat77;
      
      public static const fDat78:Class = Library_fDat78;
      
      public static const fDat79:Class = Library_fDat79;
      
      public static const fDat80:Class = Library_fDat80;
      
      public static const fDat81:Class = Library_fDat81;
      
      public static const fDat82:Class = Library_fDat82;
      
      public static const fDat83:Class = Library_fDat83;
      
      public static const fDat84:Class = Library_fDat84;
      
      public static const fDat85:Class = Library_fDat85;
      
      public static const fDat86:Class = Library_fDat86;
      
      public static const fDat87:Class = Library_fDat87;
      
      public static const fDat88:Class = Library_fDat88;
      
      public static const fDat89:Class = Library_fDat89;
      
      public static const fDat90:Class = Library_fDat90;
      
      public static const fDat91:Class = Library_fDat91;
      
      public static const fDat92:Class = Library_fDat92;
      
      public static const fDat93:Class = Library_fDat93;
      
      public static const fDat94:Class = Library_fDat94;
      
      public static const fDat95:Class = Library_fDat95;
      
      public static const fDat96:Class = Library_fDat96;
      
      public static const fDat97:Class = Library_fDat97;
      
      public static const fDat98:Class = Library_fDat98;
      
      public static const fDat99:Class = Library_fDat99;
      
      public static const fDat100:Class = Library_fDat100;
      
      public static const fDat101:Class = Library_fDat101;
      
      public static const fDat102:Class = Library_fDat102;
      
      public static const fDat103:Class = Library_fDat103;
      
      public static const fDat104:Class = Library_fDat104;
      
      public static const fDat105:Class = Library_fDat105;
      
      public static const fDat106:Class = Library_fDat106;
      
      public static const fDat107:Class = Library_fDat107;
      
      public static const fDat108:Class = Library_fDat108;
      
      public static const fDat109:Class = Library_fDat109;
      
      public static const fDat110:Class = Library_fDat110;
      
      public static const fDat111:Class = Library_fDat111;
      
      public static const fDat112:Class = Library_fDat112;
      
      public static const fDat113:Class = Library_fDat113;
      
      public static const fDat114:Class = Library_fDat114;
      
      public static const fDat115:Class = Library_fDat115;
      
      public static const fDat116:Class = Library_fDat116;
      
      public static const fDat117:Class = Library_fDat117;
      
      public static const fDat118:Class = Library_fDat118;
      
      public static const fDat119:Class = Library_fDat119;
      
      public static const fDat120:Class = Library_fDat120;
      
      public static const fDat121:Class = Library_fDat121;
      
      public static const fDat122:Class = Library_fDat122;
      
      public static const fDat123:Class = Library_fDat123;
      
      public static const fDat124:Class = Library_fDat124;
      
      public static const fDat125:Class = Library_fDat125;
      
      public static const fDat126:Class = Library_fDat126;
      
      public static const fDat127:Class = Library_fDat127;
      
      public static const fDat128:Class = Library_fDat128;
      
      public static const fDat129:Class = Library_fDat129;
      
      public static const fDat130:Class = Library_fDat130;
      
      public static const fDat131:Class = Library_fDat131;
      
      public static const fDat132:Class = Library_fDat132;
      
      public static const fDat133:Class = Library_fDat133;
      
      public static const fDat134:Class = Library_fDat134;
      
      public static const fDat135:Class = Library_fDat135;
      
      public static const fDat136:Class = Library_fDat136;
      
      public static const fDat137:Class = Library_fDat137;
      
      public static const fDat138:Class = Library_fDat138;
      
      public static const fDat139:Class = Library_fDat139;
      
      public static const fDat140:Class = Library_fDat140;
      
      public static const fDat141:Class = Library_fDat141;
      
      public static const fDat142:Class = Library_fDat142;
      
      public static const fDat143:Class = Library_fDat143;
      
      public static const fDat144:Class = Library_fDat144;
      
      public static const fDat145:Class = Library_fDat145;
      
      public static const fDat146:Class = Library_fDat146;
      
      public static const fDat147:Class = Library_fDat147;
      
      public static const fDat148:Class = Library_fDat148;
      
      public static const fDat149:Class = Library_fDat149;
      
      public static const b01_aniani:int = 0;
      
      public static const b02_aniani:int = 1;
      
      public static const b03_aniani:int = 2;
      
      public static const b04_aniani:int = 3;
      
      public static const b05_aniani:int = 4;
      
      public static const b06_aniani:int = 5;
      
      public static const b07_aniani:int = 6;
      
      public static const b08_aniani:int = 7;
      
      public static const b09_aniani:int = 8;
      
      public static const b10_aniani:int = 9;
      
      public static const chapterclear1:int = 10;
      
      public static const chapterclear2:int = 11;
      
      public static const chapterclear3:int = 12;
      
      public static const chapterclear4:int = 13;
      
      public static const ending_01_01:int = 14;
      
      public static const ending_01_02:int = 15;
      
      public static const ending_01_03:int = 16;
      
      public static const ending_01_04:int = 17;
      
      public static const ending_02_01:int = 18;
      
      public static const ending_03_01:int = 19;
      
      public static const ending_03_02:int = 20;
      
      public static const ending_03_03:int = 21;
      
      public static const ending_03_04:int = 22;
      
      public static const ending_bg:int = 23;
      
      public static const ending_cha:int = 24;
      
      public static const ending_txt:int = 25;
      
      public static const event01_bg:int = 26;
      
      public static const event01_eff:int = 27;
      
      public static const event01_enemy:int = 28;
      
      public static const event01_mace:int = 29;
      
      public static const event01_maceeff:int = 30;
      
      public static const event01_npc:int = 31;
      
      public static const event01_paladog:int = 32;
      
      public static const event01_shadow:int = 33;
      
      public static const event01_ui:int = 34;
      
      public static const event02_beaver_01:int = 35;
      
      public static const event02_beaver_02:int = 36;
      
      public static const event02_bg:int = 37;
      
      public static const event02_boss:int = 38;
      
      public static const event02_mace:int = 39;
      
      public static const event02_maceeff:int = 40;
      
      public static const event02_paladog:int = 41;
      
      public static const event02_shadow:int = 42;
      
      public static const event02_ui:int = 43;
      
      public static const event03_b04:int = 44;
      
      public static const event03_b05:int = 45;
      
      public static const event03_b06:int = 46;
      
      public static const event03_bg:int = 47;
      
      public static const event03_key:int = 48;
      
      public static const event03_mace:int = 49;
      
      public static const event03_paladog:int = 50;
      
      public static const event03_shadow:int = 51;
      
      public static const event03_u01:int = 52;
      
      public static const event03_u02:int = 53;
      
      public static const event03_u03:int = 54;
      
      public static const event03_u04:int = 55;
      
      public static const event03_ui:int = 56;
      
      public static const event04_b06:int = 57;
      
      public static const event04_b07:int = 58;
      
      public static const event04_bg_0:int = 59;
      
      public static const event04_bg_1:int = 60;
      
      public static const event04_bomb:int = 61;
      
      public static const event04_eff:int = 62;
      
      public static const event04_key:int = 63;
      
      public static const event04_mace:int = 64;
      
      public static const event04_mirror:int = 65;
      
      public static const event04_paladog:int = 66;
      
      public static const event04_shadow:int = 67;
      
      public static const event04_u01:int = 68;
      
      public static const event04_u03:int = 69;
      
      public static const event04_u04:int = 70;
      
      public static const event04_u05:int = 71;
      
      public static const event04_u06:int = 72;
      
      public static const event04_ui:int = 73;
      
      public static const event05_bg:int = 74;
      
      public static const event05_door:int = 75;
      
      public static const event05_mace:int = 76;
      
      public static const event05_paladog:int = 77;
      
      public static const event05_shadow:int = 78;
      
      public static const event05_u01_01:int = 79;
      
      public static const event05_u01_02:int = 80;
      
      public static const event05_u02_01:int = 81;
      
      public static const event05_u02_02:int = 82;
      
      public static const event05_u03_01:int = 83;
      
      public static const event05_u03_02:int = 84;
      
      public static const event05_u04_01:int = 85;
      
      public static const event05_u04_02:int = 86;
      
      public static const event05_u05_01:int = 87;
      
      public static const event05_u05_02:int = 88;
      
      public static const event05_u06_01:int = 89;
      
      public static const event05_u06_02:int = 90;
      
      public static const event05_u07:int = 91;
      
      public static const event05_u08:int = 92;
      
      public static const event05_u09:int = 93;
      
      public static const event05_ui:int = 94;
      
      public static const larvaani:int = 95;
      
      public static const levelupani:int = 96;
      
      public static const maceani:int = 97;
      
      public static const opening1:int = 98;
      
      public static const opening2:int = 99;
      
      public static const opening3:int = 100;
      
      public static const opening4:int = 101;
      
      public static const opening5:int = 102;
      
      public static const opening6:int = 103;
      
      public static const opening7:int = 104;
      
      public static const opening8:int = 105;
      
      public static const opening9:int = 106;
      
      public static const opening10:int = 107;
      
      public static const opening11:int = 108;
      
      public static const paladogani:int = 109;
      
      public static const pigani:int = 110;
      
      public static const titleani_bg_01:int = 111;
      
      public static const titleani_bg_02:int = 112;
      
      public static const titleani_bg01_loop:int = 113;
      
      public static const titleani_bg02_loop:int = 114;
      
      public static const titleani_bg03_loop:int = 115;
      
      public static const titleani_bg04_loop:int = 116;
      
      public static const titleani_bg05_loop:int = 117;
      
      public static const titleani_bg06_loop:int = 118;
      
      public static const titleani_bg07_loop:int = 119;
      
      public static const titleani_bg08_loop:int = 120;
      
      public static const titleani_logo_01:int = 121;
      
      public static const titleani_logo_loop:int = 122;
      
      public static const titleani_mace_01:int = 123;
      
      public static const titleani_mace_02:int = 124;
      
      public static const titleani_mace_loop:int = 125;
      
      public static const titleani_paladog_01:int = 126;
      
      public static const titleani_paladog_02:int = 127;
      
      public static const titleani_paladog_loop:int = 128;
      
      public static const fAni0:Class = Library_fAni0;
      
      public static const fAni1:Class = Library_fAni1;
      
      public static const fAni2:Class = Library_fAni2;
      
      public static const fAni3:Class = Library_fAni3;
      
      public static const fAni4:Class = Library_fAni4;
      
      public static const fAni5:Class = Library_fAni5;
      
      public static const fAni6:Class = Library_fAni6;
      
      public static const fAni7:Class = Library_fAni7;
      
      public static const fAni8:Class = Library_fAni8;
      
      public static const fAni9:Class = Library_fAni9;
      
      public static const fAni10:Class = Library_fAni10;
      
      public static const fAni11:Class = Library_fAni11;
      
      public static const fAni12:Class = Library_fAni12;
      
      public static const fAni13:Class = Library_fAni13;
      
      public static const fAni14:Class = Library_fAni14;
      
      public static const fAni15:Class = Library_fAni15;
      
      public static const fAni16:Class = Library_fAni16;
      
      public static const fAni17:Class = Library_fAni17;
      
      public static const fAni18:Class = Library_fAni18;
      
      public static const fAni19:Class = Library_fAni19;
      
      public static const fAni20:Class = Library_fAni20;
      
      public static const fAni21:Class = Library_fAni21;
      
      public static const fAni22:Class = Library_fAni22;
      
      public static const fAni23:Class = Library_fAni23;
      
      public static const fAni24:Class = Library_fAni24;
      
      public static const fAni25:Class = Library_fAni25;
      
      public static const fAni26:Class = Library_fAni26;
      
      public static const fAni27:Class = Library_fAni27;
      
      public static const fAni28:Class = Library_fAni28;
      
      public static const fAni29:Class = Library_fAni29;
      
      public static const fAni30:Class = Library_fAni30;
      
      public static const fAni31:Class = Library_fAni31;
      
      public static const fAni32:Class = Library_fAni32;
      
      public static const fAni33:Class = Library_fAni33;
      
      public static const fAni34:Class = Library_fAni34;
      
      public static const fAni35:Class = Library_fAni35;
      
      public static const fAni36:Class = Library_fAni36;
      
      public static const fAni37:Class = Library_fAni37;
      
      public static const fAni38:Class = Library_fAni38;
      
      public static const fAni39:Class = Library_fAni39;
      
      public static const fAni40:Class = Library_fAni40;
      
      public static const fAni41:Class = Library_fAni41;
      
      public static const fAni42:Class = Library_fAni42;
      
      public static const fAni43:Class = Library_fAni43;
      
      public static const fAni44:Class = Library_fAni44;
      
      public static const fAni45:Class = Library_fAni45;
      
      public static const fAni46:Class = Library_fAni46;
      
      public static const fAni47:Class = Library_fAni47;
      
      public static const fAni48:Class = Library_fAni48;
      
      public static const fAni49:Class = Library_fAni49;
      
      public static const fAni50:Class = Library_fAni50;
      
      public static const fAni51:Class = Library_fAni51;
      
      public static const fAni52:Class = Library_fAni52;
      
      public static const fAni53:Class = Library_fAni53;
      
      public static const fAni54:Class = Library_fAni54;
      
      public static const fAni55:Class = Library_fAni55;
      
      public static const fAni56:Class = Library_fAni56;
      
      public static const fAni57:Class = Library_fAni57;
      
      public static const fAni58:Class = Library_fAni58;
      
      public static const fAni59:Class = Library_fAni59;
      
      public static const fAni60:Class = Library_fAni60;
      
      public static const fAni61:Class = Library_fAni61;
      
      public static const fAni62:Class = Library_fAni62;
      
      public static const fAni63:Class = Library_fAni63;
      
      public static const fAni64:Class = Library_fAni64;
      
      public static const fAni65:Class = Library_fAni65;
      
      public static const fAni66:Class = Library_fAni66;
      
      public static const fAni67:Class = Library_fAni67;
      
      public static const fAni68:Class = Library_fAni68;
      
      public static const fAni69:Class = Library_fAni69;
      
      public static const fAni70:Class = Library_fAni70;
      
      public static const fAni71:Class = Library_fAni71;
      
      public static const fAni72:Class = Library_fAni72;
      
      public static const fAni73:Class = Library_fAni73;
      
      public static const fAni74:Class = Library_fAni74;
      
      public static const fAni75:Class = Library_fAni75;
      
      public static const fAni76:Class = Library_fAni76;
      
      public static const fAni77:Class = Library_fAni77;
      
      public static const fAni78:Class = Library_fAni78;
      
      public static const fAni79:Class = Library_fAni79;
      
      public static const fAni80:Class = Library_fAni80;
      
      public static const fAni81:Class = Library_fAni81;
      
      public static const fAni82:Class = Library_fAni82;
      
      public static const fAni83:Class = Library_fAni83;
      
      public static const fAni84:Class = Library_fAni84;
      
      public static const fAni85:Class = Library_fAni85;
      
      public static const fAni86:Class = Library_fAni86;
      
      public static const fAni87:Class = Library_fAni87;
      
      public static const fAni88:Class = Library_fAni88;
      
      public static const fAni89:Class = Library_fAni89;
      
      public static const fAni90:Class = Library_fAni90;
      
      public static const fAni91:Class = Library_fAni91;
      
      public static const fAni92:Class = Library_fAni92;
      
      public static const fAni93:Class = Library_fAni93;
      
      public static const fAni94:Class = Library_fAni94;
      
      public static const fAni95:Class = Library_fAni95;
      
      public static const fAni96:Class = Library_fAni96;
      
      public static const fAni97:Class = Library_fAni97;
      
      public static const fAni98:Class = Library_fAni98;
      
      public static const fAni99:Class = Library_fAni99;
      
      public static const fAni100:Class = Library_fAni100;
      
      public static const fAni101:Class = Library_fAni101;
      
      public static const fAni102:Class = Library_fAni102;
      
      public static const fAni103:Class = Library_fAni103;
      
      public static const fAni104:Class = Library_fAni104;
      
      public static const fAni105:Class = Library_fAni105;
      
      public static const fAni106:Class = Library_fAni106;
      
      public static const fAni107:Class = Library_fAni107;
      
      public static const fAni108:Class = Library_fAni108;
      
      public static const fAni109:Class = Library_fAni109;
      
      public static const fAni110:Class = Library_fAni110;
      
      public static const fAni111:Class = Library_fAni111;
      
      public static const fAni112:Class = Library_fAni112;
      
      public static const fAni113:Class = Library_fAni113;
      
      public static const fAni114:Class = Library_fAni114;
      
      public static const fAni115:Class = Library_fAni115;
      
      public static const fAni116:Class = Library_fAni116;
      
      public static const fAni117:Class = Library_fAni117;
      
      public static const fAni118:Class = Library_fAni118;
      
      public static const fAni119:Class = Library_fAni119;
      
      public static const fAni120:Class = Library_fAni120;
      
      public static const fAni121:Class = Library_fAni121;
      
      public static const fAni122:Class = Library_fAni122;
      
      public static const fAni123:Class = Library_fAni123;
      
      public static const fAni124:Class = Library_fAni124;
      
      public static const fAni125:Class = Library_fAni125;
      
      public static const fAni126:Class = Library_fAni126;
      
      public static const fAni127:Class = Library_fAni127;
      
      public static const fAni128:Class = Library_fAni128;
      
      public static const MAXSIZE_MUSIC:int = 6;
      
      public static const MAXSIZE_MUSICCHANNEL:int = 6;
      
      public static const ANI_SMOOTHLEVEL:int = 2;
      
      public static const VALUE_LEN:int = 10;
      
      public static const ANIVALUE_IMGINDEX:int = 0;
      
      public static const ANIVALUE_POSX:int = 1;
      
      public static const ANIVALUE_POSY:int = 2;
      
      public static const ANIVALUE_POSZ:int = 3;
      
      public static const ANIVALUE_ANGLE:int = 4;
      
      public static const ANIVALUE_SCALEX:int = 5;
      
      public static const ANIVALUE_SCALEY:int = 6;
      
      public static const ANIVALUE_ALPHA:int = 7;
      
      public static const ANIVALUE_FLIPX:int = 8;
      
      public static const ANIVALUE_FLIPY:int = 9;
      
      public static const SND_OFF:int = 0;
      
      public static const MAXSIZE_SNDEFFECT:int = 123;
      
      public static const MAXSIZE_EFFECTCHANNEL:int = 26;
      
      public static const FLASHIMG_DATALEN:int = 8;
      
      public static const SND_QUESTCOMPLETE:int = 109;
      
      public static const SND_QUESTFAIL:int = 108;
      
      public static const SND_QUESTWARNING:int = 107;
      
      public static const SND_MOUSEOVER:int = 110;
      
      public static const MUSIC_TITLE:int = 0;
      
      public static const MUSIC_BATTLE:int = 1;
      
      public static const MUSIC_CLEAR:int = 2;
      
      public static const MUSIC_FAIL:int = 3;
      
      public static const MUSIC_STAGE:int = 4;
      
      public static const MUSIC_BOSS:int = 5;
      
      public static const LOADLOGOIMG_LEN:int = 54;
      
      public static const LOADLOGOANI_LEN:int = 104;
      
      public static const LOADSTAGESELECTIMG_LEN:int = 3;
      
      public static const LOADSTOREIMG_LEN:int = 4;
      
      public static const LOADMACEIMG_LEN:int = 1;
      
      public static const LOADMACEEFFIMG_LEN:int = 12;
      
      public static const LOADUNITIMG_LEN:int = 9;
      
      public static const LOADSTARTIMG_LEN:int = 19;
      
      public static const LOADGAMEIMG_LEN:int = 5;
      
      public static const LOADGAMEMOBIMG_LEN:int = 5;
      
      public static const LOADSTORECHAIMG_LEN:int = 2;
      
      public static const LOADPALADOGIMG_LEN:int = 1;
      
      public static const LOADBOSSANIIMG_LEN:int = 20;
      
      public static const MACEANI_LEN:int = 1;
      
      public static const PALADOGANI_LEN:int = 1;
      
      public static const STORECHAANI_LEN:int = 2;
      
      public static const BOSS_3DMAXANILEN:int = 4;
      
      private var draw:Drawing;
      
      public var BMP_FILTER:Boolean = true;
      
      public var EMBEDIMG:Array = new Array(MAXSIZE_EMBEDIMG);
      
      public var EMBEDDATA:Array = new Array(MAXSIZE_EMBEDDATA);
      
      public var EMBEDANI:Array = new Array(MAXSIZE_EMBEDANI);
      
      public var EMBEDSND:Array = new Array(MAXSIZE_EMBEDSND);
      
      public var EMBEDDB:Array = new Array(MAXSIZE_EMBEDDB);
      
      public var IMAGE:Array = new Array(MAXSIZE_IMG);
      
      public var sndFileData:ByteArray;
      
      public var dbFileData:ByteArray;
      
      public var imgFileData:ByteArray;
      
      public var aniFileData:ByteArray;
      
      public var MUSIC:Array = new Array(MAXSIZE_MUSIC);
      
      public var MUSICCHANNEL:Array = new Array(MAXSIZE_MUSICCHANNEL);
      
      public var nPlayingMusic:int = -10000;
      
      public var nMusicVolume:int;
      
      public var nMusicPosition:Number;
      
      public var nSaveMusicVolume:int;
      
      public var nSaveEffectVolume:int;
      
      public var SNDEFFECT:Array = new Array(MAXSIZE_SNDEFFECT);
      
      public var EFFECTCHANNEL:Array = new Array(MAXSIZE_EFFECTCHANNEL);
      
      public var bPlayingSndEff:Array = new Array(MAXSIZE_SNDEFFECT);
      
      public var nSndEffStartTime:Array = new Array(MAXSIZE_SNDEFFECT);
      
      public var nEffectVolume:int;
      
      public var nEffectChannelPos:int = 0;
      
      public var sharedFile:SharedObject = null;
      
      public var dataBase:ByteArray = null;
      
      public var nDBPos:uint = 0;
      
      public var nIntSize:uint = 4;
      
      public var nDBSize:uint = 0;
      
      public var loadStr:String = null;
      
      public var bLoaded:Boolean;
      
      public var bLoading:Boolean;
      
      public var bLoadByte:Boolean;
      
      public var imgLoader:Loader = null;
      
      public var bmpLoader:Loader = null;
      
      public var datLoader:URLLoader = null;
      
      public var IMGDATAPOS:Array = null;
      
      public var nTotalImgFromfdat:int;
      
      public var nLoadImgIndex:int;
      
      public var nLoadImgCount:int;
      
      public var nRectX:int;
      
      public var nRectY:int;
      
      public var nRectW:int;
      
      public var nRectH:int;
      
      public var buffer:ByteArray = new ByteArray();
      
      public var nPos:int;
      
      public var xmlData:XML;
      
      public var URL_RESOURCE:String = "";
      
      public var MUSICNAME:Array = new Array(bg_title,start_battle,stage_clear,stage_fail,bg_stage,bg_boss);
      
      public var SNDEFFECTNAME:Array = new Array(armor_att,arrow,b01,b02,b03,b04,b05,b06,b08,b09,b10,b10_effsnd,beholder,bombghost_att,burn,button,buy,buy_coin,buy_jam,c_crash,c_dead,c_hit,cat,cloaking,coin_mace,cold_wind,cyclops,die_ghost,die_man,die_monster,die_paladog,die_u01,die_u02,die_u03,die_u04,die_u05,die_u06,die_u07,die_u08,die_u09,die_woman,dragon,ending_eft_01,ending_eft_02,equip_mace,equip_ring,explosion_01,explosion_02,fire,fistofgod,food,franken_att,freeze,ghost_att,heal,heart,hit_01,hit_02,hit_03,hit_metal,horse_cry,horse_run,ice,lighting_01,lighting_02,macesnd,meteo,miner_att,movemove,newrecord,ok_button,paper,popup_01,popup_02,pumpkin_att,punch,rail_select,spear,start,sword_01,sword_02,t_lost,t_score,temptation,tmode_skill_btn,tozombie_att,turnundead,tv_att,u01_skill,u02_skill,u03_skill,u04_skill,u05_skill,u07_skill,u08_skill,u09_skill,unequip,unit_active,unit_create,wagon_dead,wagon_move,wave_clear,wind,zombie_att,hit_04,hit_05,hit_back,quest_caution,quest_fail,quest_succes
      ,mouse_over,enchantbear_talk_01,enchantbear_talk_02,enchantbear_talk_03,gemcat_talk_01,gemcat_talk_02,gemcat_talk_03,herobug_talk_01,herobug_talk_02,herobug_talk_03,shoppig_talk_01,shoppig_talk_02,shoppig_talk_03);
      
      public var LOADOPENINGIMG:Array = new Array(opening,opening);
      
      public var LOADOPENINGIMGINDEX:Array = new Array(Drawing.imgOpening,0);
      
      public var LOADBACKGROUNDIMG:Array = new Array(background0,background1,background2,background3,background4,background5,background6,background7,background8,background9);
      
      public var LOADBACKGROUNDIMGINDEX:Array = new Array(Drawing.imgBg,Drawing.imgBg + 3,Drawing.imgBg + 6,Drawing.imgBg + 9,Drawing.imgBg + 12,Drawing.imgBg + 15,Drawing.imgBg + 18,Drawing.imgBg + 21,Drawing.imgBg + 24,Drawing.imgBg + 27);
      
      public var LOADLOGOIMG:Array = new Array(btn,loading,menu,ui,num,option,titlelogo,title,paladog,mace,titlebtn,endingbg,ending,diawindow,chapterclear,cinemaui,cinema01,cinema02,cinema03,cinema04,cinema05,eventBtn,tutorial3,tutorial0,tutorial1,tutorial2,tutorial4,linkBtn,levelupeff,e07,towerkey,ad,background6,background8,b01_ani,b01_eff,b02_ani,b02_eff,b03_ani,b03_ani,b04_ani,b04_eff,b05_ani,b05_ani,b06_ani,b06_ani,b07_ani,b07_eff,b08_ani,b08_eff,b09_ani,b09_eff,b10_ani,b10_eff);
      
      public var LOADLOGOIMGINDEX:Array = new Array(Drawing.imgCancel,Drawing.imgLoading,Drawing.imgMenu,Drawing.imgUi,Drawing.imgNum,Drawing.imgOption,Drawing.imgTitleLogo,Drawing.imgTitle,Drawing.imgPaladog,Drawing.imgMace01,Drawing.imgTitleBtn,Drawing.imgEndingBg,Drawing.imgEnding,Drawing.imgDiaWindow,Drawing.imgChapterClear,Drawing.imgCinemaUi,Drawing.imgCinema01,Drawing.imgCinema02,Drawing.imgCinema03,Drawing.imgCinema04,Drawing.imgCinema05,Drawing.imgEventBtn,Drawing.imgTutorial + 21,Drawing.imgTutorial,Drawing.imgTutorial + 9,Drawing.imgTutorial + 15,Drawing.imgTutorial + 26,Drawing.imgLinkBtn,Drawing.imgLevelUpEff,Drawing.imgEnemyE07Att,Drawing.imgTowerKey,Drawing.imgAd,Drawing.imgBg + 18,Drawing.imgBg + 24,Drawing.imgEnemyBoss01,Drawing.imgEnemyBoss01Eff,Drawing.imgEnemyBoss02,Drawing.imgEnemyBoss02FrogDown,Drawing.imgEnemyBoss03,Drawing.imgEnemyBoss03,Drawing.imgEnemyBoss04,Drawing.imgEnemyBoss04Eff,Drawing.imgEnemyBoss05,Drawing.imgEnemyBoss05,Drawing.imgEnemyBoss06,Drawing.imgEnemyBoss06
      ,Drawing.imgEnemyBoss07,Drawing.imgEnemyBoss07Effa,Drawing.imgEnemyBoss08,Drawing.imgEnemyBoss08Fire,Drawing.imgEnemyBoss09,Drawing.imgEnemyBoss09Arms,Drawing.imgEnemyBoss10,Drawing.imgEnemyBoss10Eff);
      
      public var LOADLOGOANI:Array = new Array(titleani_bg_01,titleani_bg_02,titleani_paladog_01,titleani_paladog_02,titleani_paladog_loop,titleani_mace_01,titleani_mace_02,titleani_mace_loop,titleani_bg01_loop,titleani_bg02_loop,titleani_bg03_loop,titleani_bg04_loop,titleani_bg05_loop,titleani_bg06_loop,titleani_bg07_loop,titleani_bg08_loop,titleani_logo_01,titleani_logo_loop,ending_01_01,ending_01_02,ending_01_03,ending_01_04,ending_02_01,ending_03_01,ending_03_02,ending_03_03,ending_03_04,ending_bg,ending_cha,ending_txt,event02_bg,event02_ui,event02_beaver_01,event02_shadow,event02_boss,event02_paladog,event02_mace,event02_maceeff,event03_bg,event03_ui,event03_shadow,event04_bg_0,event04_ui,event04_shadow,event05_bg,event05_ui,event05_shadow,event01_bg,event01_ui,event01_shadow,event02_beaver_02,event01_eff,event01_enemy,event01_mace,event01_maceeff,event01_npc,event01_paladog,event03_b04,event03_paladog,event03_mace,event03_b05,event03_b06,event03_key,event03_u01,event03_u02,event03_u03,event03_u04
      ,event04_b06,event04_b07,event04_bomb,event04_eff,event04_key,event04_mace,event04_mirror,event04_paladog,event04_u01,event04_u03,event04_u04,event04_u05,event04_u06,event05_mace,event05_paladog,event05_door,event05_u01_01,event05_u01_02,event05_u02_01,event05_u02_02,event05_u03_01,event05_u03_02,event05_u04_01,event05_u04_02,event05_u05_01,event05_u05_02,event05_u06_01,event05_u06_02,event05_u07,event05_u08,event05_u09,event04_bg_1,chapterclear1,chapterclear2,chapterclear3,chapterclear4,levelupani);
      
      public var LOADLOGOANIINDEX:Array = new Array(Drawing.Ani_TitleBg_01,Drawing.Ani_TitleBg_02,Drawing.Ani_TitlePaladog_01,Drawing.Ani_TitlePaladog_02,Drawing.Ani_TitlePaladog_Loop,Drawing.Ani_TitleMace_01,Drawing.Ani_TitleMace_02,Drawing.Ani_TitleMace_Loop,Drawing.Ani_TitleBg01_Loop,Drawing.Ani_TitleBg02_Loop,Drawing.Ani_TitleBg03_Loop,Drawing.Ani_TitleBg04_Loop,Drawing.Ani_TitleBg05_Loop,Drawing.Ani_TitleBg06_Loop,Drawing.Ani_TitleBg07_Loop,Drawing.Ani_TitleBg08_Loop,Drawing.Ani_TitleLogo_01,Drawing.Ani_TitleLogo_Loop,Drawing.Ani_Ending01,Drawing.Ani_Ending01 + 1,Drawing.Ani_Ending01 + 2,Drawing.Ani_Ending01 + 3,Drawing.Ani_Ending02,Drawing.Ani_Ending03,Drawing.Ani_Ending03 + 1,Drawing.Ani_Ending03 + 2,Drawing.Ani_Ending03 + 3,Drawing.Ani_EndingBg,Drawing.Ani_EndingCha,Drawing.Ani_EndingTxt,Drawing.Ani_Event02_Bg,Drawing.Ani_Event02_ui,Drawing.Ani_Event02_beaver01,Drawing.Ani_Event02_shadow,Drawing.Ani_Event02_boss,Drawing.Ani_Event02_paladog,Drawing.Ani_Event02_mace,Drawing.Ani_Event02_maceeff
      ,Drawing.Ani_Event03_Bg,Drawing.Ani_Event03_ui,Drawing.Ani_Event03_shadow,Drawing.Ani_Event04_Bg_0,Drawing.Ani_Event04_ui,Drawing.Ani_Event04_shadow,Drawing.Ani_Event05_Bg,Drawing.Ani_Event05_ui,Drawing.Ani_Event05_shadow,Drawing.Ani_Event01_Bg,Drawing.Ani_Event01_ui,Drawing.Ani_Event01_shadow,Drawing.Ani_Event02_beaver02,Drawing.Ani_Event01_eff,Drawing.Ani_Event01_enemy,Drawing.Ani_Event01_mace,Drawing.Ani_Event01_maceeff,Drawing.Ani_Event01_npc,Drawing.Ani_Event01_paladog,Drawing.Ani_Event03_b04,Drawing.Ani_Event03_paladog,Drawing.Ani_Event03_mace,Drawing.Ani_Event03_b05,Drawing.Ani_Event03_b06,Drawing.Ani_Event03_key,Drawing.Ani_Event03_u01,Drawing.Ani_Event03_u02,Drawing.Ani_Event03_u03,Drawing.Ani_Event03_u04,Drawing.Ani_Event04_b06,Drawing.Ani_Event04_b07,Drawing.Ani_Event04_bomb,Drawing.Ani_Event04_eff,Drawing.Ani_Event04_key,Drawing.Ani_Event04_mace,Drawing.Ani_Event04_mirror,Drawing.Ani_Event04_paladog,Drawing.Ani_Event04_u01,Drawing.Ani_Event04_u03,Drawing.Ani_Event04_u04,Drawing
      .Ani_Event04_u05,Drawing.Ani_Event04_u06,Drawing.Ani_Event05_mace,Drawing.Ani_Event05_paladog,Drawing.Ani_Event05_door,Drawing.Ani_Event05_u01_01,Drawing.Ani_Event05_u01_02,Drawing.Ani_Event05_u02_01,Drawing.Ani_Event05_u02_02,Drawing.Ani_Event05_u03_01,Drawing.Ani_Event05_u03_02,Drawing.Ani_Event05_u04_01,Drawing.Ani_Event05_u04_02,Drawing.Ani_Event05_u05_01,Drawing.Ani_Event05_u05_02,Drawing.Ani_Event05_u06_01,Drawing.Ani_Event05_u06_02,Drawing.Ani_Event05_u07,Drawing.Ani_Event05_u08,Drawing.Ani_Event05_u09,Drawing.Ani_Event04_Bg_1,Drawing.Ani_ChapterClear_01,Drawing.Ani_ChapterClear_01 + 1,Drawing.Ani_ChapterClear_01 + 2,Drawing.Ani_ChapterClear_01 + 3,Drawing.Ani_LevelUp);
      
      public var LOADLOGOANIIMGINDEX:Array = new Array(Drawing.imgTitle,Drawing.imgTitle,Drawing.imgPaladog,Drawing.imgPaladog,Drawing.imgPaladog,Drawing.imgMace01,Drawing.imgMace01,Drawing.imgMace01,Drawing.imgMace01,Drawing.imgMace01,Drawing.imgMace01,Drawing.imgMace01,Drawing.imgMace01,Drawing.imgMace01,Drawing.imgMace01,Drawing.imgMace01,Drawing.imgTitleLogo,Drawing.imgTitleLogo,Drawing.imgEnding,Drawing.imgPaladog,Drawing.imgMace01,Drawing.imgTitle,Drawing.imgEnding,Drawing.imgEnding,Drawing.imgPaladog,Drawing.imgMace01,Drawing.imgTitle,Drawing.imgEndingBg,Drawing.imgEnding,Drawing.imgEnding,Drawing.imgBg + 3,Drawing.imgCinemaUi,Drawing.imgCinema02,Drawing.imgShadow,Drawing.imgEnemyBoss03,Drawing.imgPaladog,Drawing.imgMace01,Drawing.imgMace02_Effa,Drawing.imgBg + 9,Drawing.imgCinemaUi,Drawing.imgShadow,Drawing.imgBg + 15,Drawing.imgCinemaUi,Drawing.imgShadow,Drawing.imgBg + 24,Drawing.imgCinemaUi,Drawing.imgShadow,Drawing.imgBg,Drawing.imgCinemaUi,Drawing.imgShadow,Drawing.imgCinema02,Drawing
      .imgExplosion_a,Drawing.imgEnemyE01Att,Drawing.imgMace01,Drawing.imgMace01_Effa,Drawing.imgCinema01,Drawing.imgPaladog,Drawing.imgEnemyBoss04,Drawing.imgPaladog,Drawing.imgMace01,Drawing.imgEnemyBoss05,Drawing.imgEnemyBoss06,Drawing.imgCinema03,Drawing.imgUnit01Atk1,Drawing.imgUnit02Arms,Drawing.imgUnit03Atk1,Drawing.imgUnit04Arms,Drawing.imgEnemyBoss06,Drawing.imgEnemyBoss07,Drawing.imgUnit06Arms,Drawing.imgExplosion_a,Drawing.imgCinema03,Drawing.imgMace01,Drawing.imgCinema04,Drawing.imgPaladog,Drawing.imgUnit01Atk1,Drawing.imgUnit03Atk1,Drawing.imgUnit04Arms,Drawing.imgUnit05Atk1,Drawing.imgUnit06Arms,Drawing.imgMace01,Drawing.imgPaladog,Drawing.imgCinema05,Drawing.imgUnit01Atk1,Drawing.imgUnit01Atk1,Drawing.imgUnit02Arms,Drawing.imgUnit02Arms,Drawing.imgUnit03Atk1,Drawing.imgUnit03Atk1,Drawing.imgUnit04Arms,Drawing.imgUnit04Arms,Drawing.imgUnit05Atk1,Drawing.imgUnit05Atk1,Drawing.imgUnit06Arms,Drawing.imgUnit06Arms,Drawing.imgUnit07Atk1,Drawing.imgUnit08Arms,Drawing.imgUnit09Atk1,Drawing
      .imgBg + 18,Drawing.imgChapterClear,Drawing.imgChapterClear,Drawing.imgChapterClear,Drawing.imgChapterClear,Drawing.imgLevelUpEff);
      
      public var LOADSTAGESELECTIMG:Array = new Array(stageselect,aura,shadow);
      
      public var LOADSTAGESELECTIMGINDEX:Array = new Array(Drawing.imgStageSelect,Drawing.imgAura,Drawing.imgShadow);
      
      public var LOADSTOREIMG:Array = new Array(store,itemicon,itemicon,itemicon);
      
      public var LOADSTOREIMGINDEX:Array = new Array(Drawing.imgStore,Drawing.imgMaceIcon,Drawing.imgMaceIcon,Drawing.imgMaceIcon);
      
      public var LOADTUTORIALIMG:Array = new Array(tutorial0,tutorial1,tutorial2,tutorial3);
      
      public var LOADTUTORIALIMGINDEX:Array = new Array(Drawing.imgTutorial,Drawing.imgTutorial + 9,Drawing.imgTutorial + 15,Drawing.imgTutorial + 21);
      
      public var LOADMACEEFFIMG:Array = new Array(m01eff,m02eff,m03eff_0,m04eff,m05eff,m06eff,m07eff,m08eff,m09eff,m10eff,m10eff,m03eff_1);
      
      public var LOADMACEEFFIMGINDEX:Array = new Array(Drawing.imgMace01_Effa,Drawing.imgMace02_Effa,Drawing.imgMace03_Effa,Drawing.imgMace04_Effa,Drawing.imgMace05_Effa,Drawing.imgMace06_Effa,Drawing.imgMace07_Effa,Drawing.imgMace08_Effa,Drawing.imgMace09_Effa,Drawing.imgMace10_Effa,Drawing.imgMace10_Effa,Drawing.imgMace03_Effa + 69);
      
      public var LOADMACEIMG:Array = new Array(mace,mace);
      
      public var LOADMACEIMGINDEX:Array = new Array(Drawing.imgMace01,0);
      
      public var LOADSTORECHAIMG:Array = new Array(pig,larva);
      
      public var LOADSTORECHAIMGINDEX:Array = new Array(Drawing.imgPig,Drawing.imgLarva);
      
      public var LOADPALADOGIMG:Array = new Array(paladog,paladog);
      
      public var LOADPALADOGIMGINDEX:Array = new Array(Drawing.imgPaladog,0);
      
      public var MACEANINAME:Array = new Array(maceani,maceani);
      
      public var MACEANIINDEX:Array = new Array(Drawing.imgMace01,0);
      
      public var STORECHAANINAME:Array = new Array(pigani,larvaani);
      
      public var STORECHAANIINDEX:Array = new Array(Drawing.imgPig,Drawing.imgLarva);
      
      public var PALADOGANINAME:Array = new Array(paladogani,paladogani);
      
      public var PALADOGANIINDEX:Array = new Array(Drawing.imgPaladog,0);
      
      public var LOADUNITIMG:Array = new Array(u01,u02,u03,u04,u05,u06,u07,u08,u09,w01);
      
      public var LOADUNITIMGINDEX:Array = new Array(Drawing.imgUnit01Atk1,Drawing.imgUnit02Arms,Drawing.imgUnit03Atk1,Drawing.imgUnit04Arms,Drawing.imgUnit05Atk1,Drawing.imgUnit06Arms,Drawing.imgUnit07Atk1,Drawing.imgUnit08Arms,Drawing.imgUnit09Atk1,Drawing.imgWagonDead);
      
      public var LOADSTARTIMG:Array = new Array(attackedeff,badenergy,burnice,enemydie,enemyhitcrash,enemystation,explosion,fail,heroposition,itemicon,levelup,pause,skillinfor,stageclear,stun,ui,unitdie,unitgage,dragonfire);
      
      public var LOADSTARTIMGINDEX:Array = new Array(Drawing.imgAttackedEff,Drawing.imgBadEnergy,Drawing.imgBurn,Drawing.imgEnemyDie,Drawing.imgEnemyStationCrash,Drawing.imgEnemyStation,Drawing.imgExplosion_a,Drawing.imgFail,Drawing.imgHeroPos,Drawing.imgMaceIcon,Drawing.imgLevelUp,Drawing.imgPause,Drawing.imgSkillInfor,Drawing.imgStageClear,Drawing.imgStun,Drawing.imgUi,Drawing.imgUnitDie,Drawing.imgUnitGage,Drawing.imgDragonFire);
      
      public var LOADGAMEIMG:Array = new Array(destiny,mace,mace,mace,mace,wagon,w01,w01,w01,w01,b01_ani,warroad,unitgoal,enemygoal,mace,b01_ani,e01,e01,e01,e01,destiny,mace,mace,mace,mace,wagon,w01,w01,w01,w01,b02_ani,warroad,unitgoal,enemygoal,mace,b02_ani,b02_ani,b02_ani,b02_ani,b02_ani,destiny,mace,mace,mace,mace,wagon,w01,w01,w01,w01,b03_ani,warroad,unitgoal,enemygoal,mace,b03_ani,b03_ani,b03_ani,b03_ani,b03_ani,destiny,mace,mace,mace,mace,wagon,w01,w01,w01,w01,b04_ani,warroad,unitgoal,enemygoal,mace,b04_ani,e07,e07,e07,e07,destiny,mace,mace,mace,mace,wagon,w01,w01,w01,w01,b05_ani,warroad,unitgoal,enemygoal,mace,b05_ani,b05_ani,b05_ani,b05_ani,b05_ani,destiny,mace,mace,mace,mace,wagon,w01,w01,w01,w01,b06_ani,warroad,unitgoal,enemygoal,mace,b06_ani,b06_ani,b06_ani,b06_ani,b06_ani,destiny,mace,mace,mace,mace,wagon,w01,w01,w01,w01,b07_ani,warroad,unitgoal,enemygoal,mace,b07_ani,b07_ani,b07_ani,b07_ani,b07_ani,destiny,mace,mace,mace,mace,wagon,w01,w01,w01,w01,b08_ani,warroad,unitgoal,enemygoal
      ,mace,b08_ani,b08_ani,b08_ani,b08_ani,b08_ani,destiny,mace,mace,mace,mace,wagon,w01,w01,w01,w01,b09_ani,warroad,unitgoal,enemygoal,mace,b09_ani,b09_ani,b09_ani,b09_ani,b09_ani,destiny,mace,mace,mace,mace,wagon,w01,w01,w01,w01,b10_ani,warroad,unitgoal,enemygoal,mace,b10_ani,b10_ani,b10_ani,b10_ani,b10_ani);
      
      public var LOADGAMEIMGINDEX:Array = new Array(Drawing.imgDestiny,Drawing.imgMace + 725,Drawing.imgMace + 435,Drawing.imgMace + 290,Drawing.imgMace + 290,Drawing.imgWagon,Drawing.imgWagonDead,Drawing.imgWagonDead,Drawing.imgWagonDead,Drawing.imgWagonDead,Drawing.imgEnemyBoss01,Drawing.imgWarRoad,Drawing.imgWarRoadUnitGoal,Drawing.imgWarRoadEnemyGoal,Drawing.imgMace + 145,Drawing.imgEnemyBoss01,Drawing.imgEnemyE01Att,Drawing.imgEnemyE01Att,Drawing.imgEnemyE01Att,Drawing.imgEnemyE01Att,Drawing.imgDestiny,Drawing.imgMace + 580,Drawing.imgMace + 1305,Drawing.imgMace + 870,Drawing.imgMace + 870,Drawing.imgWagon,Drawing.imgWagonDead,Drawing.imgWagonDead,Drawing.imgWagonDead,Drawing.imgWagonDead,Drawing.imgEnemyBoss02,Drawing.imgWarRoad,Drawing.imgWarRoadUnitGoal,Drawing.imgWarRoadEnemyGoal,Drawing.imgMace + 145,Drawing.imgEnemyBoss02,Drawing.imgEnemyBoss02,Drawing.imgEnemyBoss02,Drawing.imgEnemyBoss02,Drawing.imgEnemyBoss02,Drawing.imgDestiny,Drawing.imgMace + 725,Drawing.imgMace,Drawing.imgMace + 290
      ,Drawing.imgMace + 290,Drawing.imgWagon,Drawing.imgWagonDead,Drawing.imgWagonDead,Drawing.imgWagonDead,Drawing.imgWagonDead,Drawing.imgEnemyBoss03,Drawing.imgWarRoad,Drawing.imgWarRoadUnitGoal,Drawing.imgWarRoadEnemyGoal,Drawing.imgMace + 145,Drawing.imgEnemyBoss03,Drawing.imgEnemyBoss03,Drawing.imgEnemyBoss03,Drawing.imgEnemyBoss03,Drawing.imgEnemyBoss03,Drawing.imgDestiny,Drawing.imgMace + 580,Drawing.imgMace + 435,Drawing.imgMace + 870,Drawing.imgMace + 870,Drawing.imgWagon,Drawing.imgWagonDead,Drawing.imgWagonDead,Drawing.imgWagonDead,Drawing.imgWagonDead,Drawing.imgEnemyBoss04,Drawing.imgWarRoad,Drawing.imgWarRoadUnitGoal,Drawing.imgWarRoadEnemyGoal,Drawing.imgMace + 145,Drawing.imgEnemyBoss04,Drawing.imgEnemyE07Att,Drawing.imgEnemyE07Att,Drawing.imgEnemyE07Att,Drawing.imgEnemyE07Att,Drawing.imgDestiny,Drawing.imgMace + 435,Drawing.imgMace + 1305,Drawing.imgMace + 290,Drawing.imgMace + 290,Drawing.imgWagon,Drawing.imgWagonDead,Drawing.imgWagonDead,Drawing.imgWagonDead,Drawing.imgWagonDead
      ,Drawing.imgEnemyBoss05,Drawing.imgWarRoad,Drawing.imgWarRoadUnitGoal,Drawing.imgWarRoadEnemyGoal,Drawing.imgMace + 145,Drawing.imgEnemyBoss05,Drawing.imgEnemyBoss05,Drawing.imgEnemyBoss05,Drawing.imgEnemyBoss05,Drawing.imgEnemyBoss05,Drawing.imgDestiny,Drawing.imgMace + 580,Drawing.imgMace,Drawing.imgMace + 870,Drawing.imgMace + 870,Drawing.imgWagon,Drawing.imgWagonDead,Drawing.imgWagonDead,Drawing.imgWagonDead,Drawing.imgWagonDead,Drawing.imgEnemyBoss06,Drawing.imgWarRoad,Drawing.imgWarRoadUnitGoal,Drawing.imgWarRoadEnemyGoal,Drawing.imgMace + 145,Drawing.imgEnemyBoss06,Drawing.imgEnemyBoss06,Drawing.imgEnemyBoss06,Drawing.imgEnemyBoss06,Drawing.imgEnemyBoss06,Drawing.imgDestiny,Drawing.imgMace + 725,Drawing.imgMace + 435,Drawing.imgMace + 290,Drawing.imgMace + 290,Drawing.imgWagon,Drawing.imgWagonDead,Drawing.imgWagonDead,Drawing.imgWagonDead,Drawing.imgWagonDead,Drawing.imgEnemyBoss07,Drawing.imgWarRoad,Drawing.imgWarRoadUnitGoal,Drawing.imgWarRoadEnemyGoal,Drawing.imgMace + 145,Drawing
      .imgEnemyBoss07,Drawing.imgEnemyBoss07,Drawing.imgEnemyBoss07,Drawing.imgEnemyBoss07,Drawing.imgEnemyBoss07,Drawing.imgDestiny,Drawing.imgMace + 580,Drawing.imgMace + 1305,Drawing.imgMace + 870,Drawing.imgMace + 870,Drawing.imgWagon,Drawing.imgWagonDead,Drawing.imgWagonDead,Drawing.imgWagonDead,Drawing.imgWagonDead,Drawing.imgEnemyBoss08,Drawing.imgWarRoad,Drawing.imgWarRoadUnitGoal,Drawing.imgWarRoadEnemyGoal,Drawing.imgMace + 145,Drawing.imgEnemyBoss08,Drawing.imgEnemyBoss08,Drawing.imgEnemyBoss08,Drawing.imgEnemyBoss08,Drawing.imgEnemyBoss08,Drawing.imgDestiny,Drawing.imgMace + 725,Drawing.imgMace,Drawing.imgMace + 290,Drawing.imgMace + 290,Drawing.imgWagon,Drawing.imgWagonDead,Drawing.imgWagonDead,Drawing.imgWagonDead,Drawing.imgWagonDead,Drawing.imgEnemyBoss09,Drawing.imgWarRoad,Drawing.imgWarRoadUnitGoal,Drawing.imgWarRoadEnemyGoal,Drawing.imgMace + 145,Drawing.imgEnemyBoss09,Drawing.imgEnemyBoss09,Drawing.imgEnemyBoss09,Drawing.imgEnemyBoss09,Drawing.imgEnemyBoss09,Drawing.imgDestiny
      ,Drawing.imgMace + 580,Drawing.imgMace + 435,Drawing.imgMace + 870,Drawing.imgMace + 870,Drawing.imgWagon,Drawing.imgWagonDead,Drawing.imgWagonDead,Drawing.imgWagonDead,Drawing.imgWagonDead,Drawing.imgEnemyBoss10,Drawing.imgWarRoad,Drawing.imgWarRoadUnitGoal,Drawing.imgWarRoadEnemyGoal,Drawing.imgMace + 145,Drawing.imgEnemyBoss10,Drawing.imgEnemyBoss10,Drawing.imgEnemyBoss10,Drawing.imgEnemyBoss10,Drawing.imgEnemyBoss10);
      
      public var MOBIMGDATNAME:Array = new Array(e01,e02,e03,e04,e05,e06,e07,e08,e09,e10,e11,e12,e13,e14,e15,e16,e17,e18,e19,e20,e21,e22,e23,e24,e25,e26,e27,e28,e29,e30,e31,e32,e33,e34,e35,e36,e37,e38,e39,e40,b01_ani,b02_ani,b03_ani,b04_ani,b05_ani,b06_ani,b07_ani,b08_ani,b09_ani,b10_ani);
      
      public var MOBIMGDATINDEX:Array = new Array(Drawing.imgEnemyE01Att,Drawing.imgEnemyE02Att,Drawing.imgEnemyE03Att,Drawing.imgEnemyE04Att,Drawing.imgEnemyE05Att,Drawing.imgEnemyE06Arms,Drawing.imgEnemyE07Att,Drawing.imgEnemyE08Att,Drawing.imgEnemyE09Att,Drawing.imgEnemyE10Att,Drawing.imgEnemyE11Att,Drawing.imgEnemyE12Att,Drawing.imgEnemyE13Att,Drawing.imgEnemyE14Att,Drawing.imgEnemyE15Att,Drawing.imgEnemyE16Att,Drawing.imgEnemyE17Att,Drawing.imgEnemyE18Att,Drawing.imgEnemyE19Att,Drawing.imgEnemyE20Att,Drawing.imgEnemyE21Att,Drawing.imgEnemyE22Att,Drawing.imgEnemyE23Att,Drawing.imgEnemyE24Att,Drawing.imgEnemyE25Att,Drawing.imgEnemyE26Arms,Drawing.imgEnemyE27Att,Drawing.imgEnemyE28Att,Drawing.imgEnemyE29Att,Drawing.imgEnemyE30Att,Drawing.imgEnemyE31Att,Drawing.imgEnemyE32Att,Drawing.imgEnemyE33Att,Drawing.imgEnemyE34Att,Drawing.imgEnemyE35Att,Drawing.imgEnemyE36Att,Drawing.imgEnemyE37Att,Drawing.imgEnemyE38Att,Drawing.imgEnemyE39Att,Drawing.imgEnemyE40Att,Drawing.imgEnemyBoss01,Drawing.imgEnemyBoss02
      ,Drawing.imgEnemyBoss03,Drawing.imgEnemyBoss04,Drawing.imgEnemyBoss05,Drawing.imgEnemyBoss06,Drawing.imgEnemyBoss07,Drawing.imgEnemyBoss08,Drawing.imgEnemyBoss09,Drawing.imgEnemyBoss10);
      
      public var n3DMaxBossAniCount:int;
      
      public var n3DMaxBossAniNameIndex:int;
      
      public var n3DMaxBossAniCreateImgIndex:int;
      
      public var BOSSANIDATNAME:Array = new Array(b01_aniani,b01_eff,b02_aniani,b02_eff,b03_aniani,b03_aniani,b04_aniani,b04_eff,b05_aniani,b05_aniani,b06_aniani,b06_aniani,b07_aniani,b07_eff,b08_aniani,b08_eff,b09_aniani,b09_eff,b10_aniani,b10_eff);
      
      public var BOSSANIDATINDEX:Array = new Array(Drawing.imgEnemyBoss01,Drawing.imgEnemyBoss01Eff,Drawing.imgEnemyBoss02,Drawing.imgEnemyBoss02FrogDown,Drawing.imgEnemyBoss03,Drawing.imgEnemyBoss03,Drawing.imgEnemyBoss04,Drawing.imgEnemyBoss04Eff,Drawing.imgEnemyBoss05,Drawing.imgEnemyBoss05,Drawing.imgEnemyBoss06,Drawing.imgEnemyBoss06,Drawing.imgEnemyBoss07,Drawing.imgEnemyBoss07Effa,Drawing.imgEnemyBoss08,Drawing.imgEnemyBoss08Fire,Drawing.imgEnemyBoss09,Drawing.imgEnemyBoss09Arms,Drawing.imgEnemyBoss10,Drawing.imgEnemyBoss10Eff);
      
      public function Library(param1:Drawing)
      {
         var _loc2_:int = 0;
         super();
         this.draw = param1;
         this.nEffectChannelPos = 0;
         _loc2_ = 0;
         while(_loc2_ < MAXSIZE_SNDEFFECT)
         {
            this.bPlayingSndEff[_loc2_] = false;
            this.nSndEffStartTime[_loc2_] = Drawing.INITDATA;
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < MAXSIZE_IMG)
         {
            this.IMAGE[_loc2_] = new BmpImage();
            _loc2_++;
         }
      }
      
      public function getHorAlign(param1:int, param2:int) : int
      {
         if((param2 & 0xF0) == 32)
         {
            return param1;
         }
         if((param2 & 0xF0) == 48)
         {
            return param1 >> 1;
         }
         return 0;
      }
      
      public function getVerAlign(param1:int, param2:int) : int
      {
         if((param2 & 0x0F) == 2)
         {
            return param1;
         }
         if((param2 & 0x0F) == 3)
         {
            return param1 >> 1;
         }
         return 0;
      }
      
      public function fillRect(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         param1 -= this.getHorAlign(param3,param6);
         param2 -= this.getVerAlign(param4,param6);
         var _loc7_:Rectangle = new Rectangle(param1,param2,param3,param4);
         param5 += 4278190080;
         this.draw.backBuffer.bitmapData.fillRect(_loc7_,param5);
      }
      
      public function fillRectAlpha(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
         param5 += 4278190080;
         var _loc8_:BitmapData = new BitmapData(param3,param4,true,param5);
         var _loc9_:Matrix = new Matrix();
         var _loc10_:ColorTransform = new ColorTransform();
         _loc10_.alphaMultiplier = param6 / 100;
         param1 -= this.getHorAlign(param3,param7);
         param2 -= this.getVerAlign(param4,param7);
         _loc9_.translate(param1,param2);
         this.draw.backBuffer.bitmapData.draw(_loc8_,_loc9_,_loc10_,null,null,this.BMP_FILTER);
         _loc8_.dispose();
         _loc9_ = null;
      }
      
      public function gradationH(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         _loc8_ = (param5 & 0xFF0000) >> 16;
         _loc9_ = (param5 & 0xFF00) >> 8;
         _loc10_ = param5 & 0xFF;
         _loc11_ = (param6 & 0xFF0000) >> 16;
         _loc12_ = (param6 & 0xFF00) >> 8;
         _loc13_ = param6 & 0xFF;
         var _loc18_:int = 0;
         while(_loc18_ < param3)
         {
            _loc14_ = (_loc11_ - _loc8_) * _loc18_ / param3 + _loc8_;
            _loc15_ = (_loc12_ - _loc9_) * _loc18_ / param3 + _loc9_;
            _loc16_ = (_loc13_ - _loc10_) * _loc18_ / param3 + _loc10_;
            _loc17_ = (_loc14_ << 16) + (_loc15_ << 8) + _loc16_;
            this.fillRect(param1 + _loc18_,param2,1,param4,_loc17_,param7);
            _loc18_++;
         }
      }
      
      public function gradationHAlpha(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
         var _loc8_:int = 0;
         while(_loc8_ < param3)
         {
            this.fillRectAlpha(param1 + _loc8_,param2,1,param4,param5,param6 * _loc8_ / param3,param7);
            _loc8_++;
         }
      }
      
      public function gradationV(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         _loc8_ = (param5 & 0xFF0000) >> 16;
         _loc9_ = (param5 & 0xFF00) >> 8;
         _loc10_ = param5 & 0xFF;
         _loc11_ = (param6 & 0xFF0000) >> 16;
         _loc12_ = (param6 & 0xFF00) >> 8;
         _loc13_ = param6 & 0xFF;
         var _loc18_:int = 0;
         while(_loc18_ < param4)
         {
            _loc14_ = (_loc11_ - _loc8_) * _loc18_ / param4 + _loc8_;
            _loc15_ = (_loc12_ - _loc9_) * _loc18_ / param4 + _loc9_;
            _loc16_ = (_loc13_ - _loc10_) * _loc18_ / param4 + _loc10_;
            _loc17_ = (_loc14_ << 16) + (_loc15_ << 8) + _loc16_;
            this.fillRect(param1,param2 + _loc18_,param3,1,_loc17_,param7);
            _loc18_++;
         }
      }
      
      public function loadEmbedImg() : void
      {
         this.EMBEDIMG.splice(Drawing.imgLogo,1,Logo00Img);
         this.EMBEDIMG.splice(Drawing.imgLogo + 1,1,Logo01Img);
         this.EMBEDIMG.splice(Drawing.imgLogo + 2,1,Logo02Img);
      }
      
      public function loadGameDB() : void
      {
         this.EMBEDDB.splice(0,1,DB0);
         this.EMBEDDB.splice(1,1,DB1);
         this.EMBEDDB.splice(2,1,DB2);
         this.EMBEDDB.splice(3,1,DB3);
         this.EMBEDDB.splice(4,1,DB4);
         this.EMBEDDB.splice(5,1,DB5);
         this.EMBEDDB.splice(6,1,DB6);
      }
      
      public function loadGameSnd() : void
      {
         this.EMBEDSND.splice(0,1,snd0);
         this.EMBEDSND.splice(1,1,snd1);
         this.EMBEDSND.splice(2,1,snd2);
         this.EMBEDSND.splice(3,1,snd3);
         this.EMBEDSND.splice(4,1,snd4);
         this.EMBEDSND.splice(5,1,snd5);
         this.EMBEDSND.splice(6,1,snd6);
         this.EMBEDSND.splice(7,1,snd7);
         this.EMBEDSND.splice(8,1,snd8);
         this.EMBEDSND.splice(9,1,snd9);
         this.EMBEDSND.splice(10,1,snd10);
         this.EMBEDSND.splice(11,1,snd11);
         this.EMBEDSND.splice(12,1,snd12);
         this.EMBEDSND.splice(13,1,snd13);
         this.EMBEDSND.splice(14,1,snd14);
         this.EMBEDSND.splice(15,1,snd15);
         this.EMBEDSND.splice(16,1,snd16);
         this.EMBEDSND.splice(17,1,snd17);
         this.EMBEDSND.splice(18,1,snd18);
         this.EMBEDSND.splice(19,1,snd19);
         this.EMBEDSND.splice(20,1,snd20);
         this.EMBEDSND.splice(21,1,snd21);
         this.EMBEDSND.splice(22,1,snd22);
         this.EMBEDSND.splice(23,1,snd23);
         this.EMBEDSND.splice(24,1,snd24);
         this.EMBEDSND.splice(25,1,snd25);
         this.EMBEDSND.splice(26,1,snd26);
         this.EMBEDSND.splice(27,1,snd27);
         this.EMBEDSND.splice(28,1,snd28);
         this.EMBEDSND.splice(29,1,snd29);
         this.EMBEDSND.splice(30,1,snd30);
         this.EMBEDSND.splice(31,1,snd31);
         this.EMBEDSND.splice(32,1,snd32);
         this.EMBEDSND.splice(33,1,snd33);
         this.EMBEDSND.splice(34,1,snd34);
         this.EMBEDSND.splice(35,1,snd35);
         this.EMBEDSND.splice(36,1,snd36);
         this.EMBEDSND.splice(37,1,snd37);
         this.EMBEDSND.splice(38,1,snd38);
         this.EMBEDSND.splice(39,1,snd39);
         this.EMBEDSND.splice(40,1,snd40);
         this.EMBEDSND.splice(41,1,snd41);
         this.EMBEDSND.splice(42,1,snd42);
         this.EMBEDSND.splice(43,1,snd43);
         this.EMBEDSND.splice(44,1,snd44);
         this.EMBEDSND.splice(45,1,snd45);
         this.EMBEDSND.splice(46,1,snd46);
         this.EMBEDSND.splice(47,1,snd47);
         this.EMBEDSND.splice(48,1,snd48);
         this.EMBEDSND.splice(49,1,snd49);
         this.EMBEDSND.splice(50,1,snd50);
         this.EMBEDSND.splice(51,1,snd51);
         this.EMBEDSND.splice(52,1,snd52);
         this.EMBEDSND.splice(53,1,snd53);
         this.EMBEDSND.splice(54,1,snd54);
         this.EMBEDSND.splice(55,1,snd55);
         this.EMBEDSND.splice(56,1,snd56);
         this.EMBEDSND.splice(57,1,snd57);
         this.EMBEDSND.splice(58,1,snd58);
         this.EMBEDSND.splice(59,1,snd59);
         this.EMBEDSND.splice(60,1,snd60);
         this.EMBEDSND.splice(61,1,snd61);
         this.EMBEDSND.splice(62,1,snd62);
         this.EMBEDSND.splice(63,1,snd63);
         this.EMBEDSND.splice(64,1,snd64);
         this.EMBEDSND.splice(65,1,snd65);
         this.EMBEDSND.splice(66,1,snd66);
         this.EMBEDSND.splice(67,1,snd67);
         this.EMBEDSND.splice(68,1,snd68);
         this.EMBEDSND.splice(69,1,snd69);
         this.EMBEDSND.splice(70,1,snd70);
         this.EMBEDSND.splice(71,1,snd71);
         this.EMBEDSND.splice(72,1,snd72);
         this.EMBEDSND.splice(73,1,snd73);
         this.EMBEDSND.splice(74,1,snd74);
         this.EMBEDSND.splice(75,1,snd75);
         this.EMBEDSND.splice(76,1,snd76);
         this.EMBEDSND.splice(77,1,snd77);
         this.EMBEDSND.splice(78,1,snd78);
         this.EMBEDSND.splice(79,1,snd79);
         this.EMBEDSND.splice(80,1,snd80);
         this.EMBEDSND.splice(81,1,snd81);
         this.EMBEDSND.splice(82,1,snd82);
         this.EMBEDSND.splice(83,1,snd83);
         this.EMBEDSND.splice(84,1,snd84);
         this.EMBEDSND.splice(85,1,snd85);
         this.EMBEDSND.splice(86,1,snd86);
         this.EMBEDSND.splice(87,1,snd87);
         this.EMBEDSND.splice(88,1,snd88);
         this.EMBEDSND.splice(89,1,snd89);
         this.EMBEDSND.splice(90,1,snd90);
         this.EMBEDSND.splice(91,1,snd91);
         this.EMBEDSND.splice(92,1,snd92);
         this.EMBEDSND.splice(93,1,snd93);
         this.EMBEDSND.splice(94,1,snd94);
         this.EMBEDSND.splice(95,1,snd95);
         this.EMBEDSND.splice(96,1,snd96);
         this.EMBEDSND.splice(97,1,snd97);
         this.EMBEDSND.splice(98,1,snd98);
         this.EMBEDSND.splice(99,1,snd99);
         this.EMBEDSND.splice(100,1,snd100);
         this.EMBEDSND.splice(101,1,snd101);
         this.EMBEDSND.splice(102,1,snd102);
         this.EMBEDSND.splice(103,1,snd103);
         this.EMBEDSND.splice(104,1,snd104);
         this.EMBEDSND.splice(105,1,snd105);
         this.EMBEDSND.splice(106,1,snd106);
         this.EMBEDSND.splice(107,1,snd107);
         this.EMBEDSND.splice(108,1,snd108);
         this.EMBEDSND.splice(109,1,snd109);
         this.EMBEDSND.splice(110,1,snd110);
         this.EMBEDSND.splice(111,1,snd111);
         this.EMBEDSND.splice(112,1,snd112);
         this.EMBEDSND.splice(113,1,snd113);
         this.EMBEDSND.splice(114,1,snd114);
         this.EMBEDSND.splice(115,1,snd115);
         this.EMBEDSND.splice(116,1,snd116);
         this.EMBEDSND.splice(117,1,snd117);
         this.EMBEDSND.splice(118,1,snd118);
         this.EMBEDSND.splice(119,1,snd119);
         this.EMBEDSND.splice(120,1,snd120);
         this.EMBEDSND.splice(121,1,snd121);
         this.EMBEDSND.splice(122,1,snd122);
         this.EMBEDSND.splice(123,1,snd123);
         this.EMBEDSND.splice(124,1,snd124);
         this.EMBEDSND.splice(125,1,snd125);
         this.EMBEDSND.splice(126,1,snd126);
         this.EMBEDSND.splice(127,1,snd127);
         this.EMBEDSND.splice(128,1,snd128);
      }
      
      public function loadGameAni() : void
      {
         this.EMBEDANI.splice(0,1,fAni0);
         this.EMBEDANI.splice(1,1,fAni1);
         this.EMBEDANI.splice(2,1,fAni2);
         this.EMBEDANI.splice(3,1,fAni3);
         this.EMBEDANI.splice(4,1,fAni4);
         this.EMBEDANI.splice(5,1,fAni5);
         this.EMBEDANI.splice(6,1,fAni6);
         this.EMBEDANI.splice(7,1,fAni7);
         this.EMBEDANI.splice(8,1,fAni8);
         this.EMBEDANI.splice(9,1,fAni9);
         this.EMBEDANI.splice(10,1,fAni10);
         this.EMBEDANI.splice(11,1,fAni11);
         this.EMBEDANI.splice(12,1,fAni12);
         this.EMBEDANI.splice(13,1,fAni13);
         this.EMBEDANI.splice(14,1,fAni14);
         this.EMBEDANI.splice(15,1,fAni15);
         this.EMBEDANI.splice(16,1,fAni16);
         this.EMBEDANI.splice(17,1,fAni17);
         this.EMBEDANI.splice(18,1,fAni18);
         this.EMBEDANI.splice(19,1,fAni19);
         this.EMBEDANI.splice(20,1,fAni20);
         this.EMBEDANI.splice(21,1,fAni21);
         this.EMBEDANI.splice(22,1,fAni22);
         this.EMBEDANI.splice(23,1,fAni23);
         this.EMBEDANI.splice(24,1,fAni24);
         this.EMBEDANI.splice(25,1,fAni25);
         this.EMBEDANI.splice(26,1,fAni26);
         this.EMBEDANI.splice(27,1,fAni27);
         this.EMBEDANI.splice(28,1,fAni28);
         this.EMBEDANI.splice(29,1,fAni29);
         this.EMBEDANI.splice(30,1,fAni30);
         this.EMBEDANI.splice(31,1,fAni31);
         this.EMBEDANI.splice(32,1,fAni32);
         this.EMBEDANI.splice(33,1,fAni33);
         this.EMBEDANI.splice(34,1,fAni34);
         this.EMBEDANI.splice(35,1,fAni35);
         this.EMBEDANI.splice(36,1,fAni36);
         this.EMBEDANI.splice(37,1,fAni37);
         this.EMBEDANI.splice(38,1,fAni38);
         this.EMBEDANI.splice(39,1,fAni39);
         this.EMBEDANI.splice(40,1,fAni40);
         this.EMBEDANI.splice(41,1,fAni41);
         this.EMBEDANI.splice(42,1,fAni42);
         this.EMBEDANI.splice(43,1,fAni43);
         this.EMBEDANI.splice(44,1,fAni44);
         this.EMBEDANI.splice(45,1,fAni45);
         this.EMBEDANI.splice(46,1,fAni46);
         this.EMBEDANI.splice(47,1,fAni47);
         this.EMBEDANI.splice(48,1,fAni48);
         this.EMBEDANI.splice(49,1,fAni49);
         this.EMBEDANI.splice(50,1,fAni50);
         this.EMBEDANI.splice(51,1,fAni51);
         this.EMBEDANI.splice(52,1,fAni52);
         this.EMBEDANI.splice(53,1,fAni53);
         this.EMBEDANI.splice(54,1,fAni54);
         this.EMBEDANI.splice(55,1,fAni55);
         this.EMBEDANI.splice(56,1,fAni56);
         this.EMBEDANI.splice(57,1,fAni57);
         this.EMBEDANI.splice(58,1,fAni58);
         this.EMBEDANI.splice(59,1,fAni59);
         this.EMBEDANI.splice(60,1,fAni60);
         this.EMBEDANI.splice(61,1,fAni61);
         this.EMBEDANI.splice(62,1,fAni62);
         this.EMBEDANI.splice(63,1,fAni63);
         this.EMBEDANI.splice(64,1,fAni64);
         this.EMBEDANI.splice(65,1,fAni65);
         this.EMBEDANI.splice(66,1,fAni66);
         this.EMBEDANI.splice(67,1,fAni67);
         this.EMBEDANI.splice(68,1,fAni68);
         this.EMBEDANI.splice(69,1,fAni69);
         this.EMBEDANI.splice(70,1,fAni70);
         this.EMBEDANI.splice(71,1,fAni71);
         this.EMBEDANI.splice(72,1,fAni72);
         this.EMBEDANI.splice(73,1,fAni73);
         this.EMBEDANI.splice(74,1,fAni74);
         this.EMBEDANI.splice(75,1,fAni75);
         this.EMBEDANI.splice(76,1,fAni76);
         this.EMBEDANI.splice(77,1,fAni77);
         this.EMBEDANI.splice(78,1,fAni78);
         this.EMBEDANI.splice(79,1,fAni79);
         this.EMBEDANI.splice(80,1,fAni80);
         this.EMBEDANI.splice(81,1,fAni81);
         this.EMBEDANI.splice(82,1,fAni82);
         this.EMBEDANI.splice(83,1,fAni83);
         this.EMBEDANI.splice(84,1,fAni84);
         this.EMBEDANI.splice(85,1,fAni85);
         this.EMBEDANI.splice(86,1,fAni86);
         this.EMBEDANI.splice(87,1,fAni87);
         this.EMBEDANI.splice(88,1,fAni88);
         this.EMBEDANI.splice(89,1,fAni89);
         this.EMBEDANI.splice(90,1,fAni90);
         this.EMBEDANI.splice(91,1,fAni91);
         this.EMBEDANI.splice(92,1,fAni92);
         this.EMBEDANI.splice(93,1,fAni93);
         this.EMBEDANI.splice(94,1,fAni94);
         this.EMBEDANI.splice(95,1,fAni95);
         this.EMBEDANI.splice(96,1,fAni96);
         this.EMBEDANI.splice(97,1,fAni97);
         this.EMBEDANI.splice(98,1,fAni98);
         this.EMBEDANI.splice(99,1,fAni99);
         this.EMBEDANI.splice(100,1,fAni100);
         this.EMBEDANI.splice(101,1,fAni101);
         this.EMBEDANI.splice(102,1,fAni102);
         this.EMBEDANI.splice(103,1,fAni103);
         this.EMBEDANI.splice(104,1,fAni104);
         this.EMBEDANI.splice(105,1,fAni105);
         this.EMBEDANI.splice(106,1,fAni106);
         this.EMBEDANI.splice(107,1,fAni107);
         this.EMBEDANI.splice(108,1,fAni108);
         this.EMBEDANI.splice(109,1,fAni109);
         this.EMBEDANI.splice(110,1,fAni110);
         this.EMBEDANI.splice(111,1,fAni111);
         this.EMBEDANI.splice(112,1,fAni112);
         this.EMBEDANI.splice(113,1,fAni113);
         this.EMBEDANI.splice(114,1,fAni114);
         this.EMBEDANI.splice(115,1,fAni115);
         this.EMBEDANI.splice(116,1,fAni116);
         this.EMBEDANI.splice(117,1,fAni117);
         this.EMBEDANI.splice(118,1,fAni118);
         this.EMBEDANI.splice(119,1,fAni119);
         this.EMBEDANI.splice(120,1,fAni120);
         this.EMBEDANI.splice(121,1,fAni121);
         this.EMBEDANI.splice(122,1,fAni122);
         this.EMBEDANI.splice(123,1,fAni123);
         this.EMBEDANI.splice(124,1,fAni124);
         this.EMBEDANI.splice(125,1,fAni125);
         this.EMBEDANI.splice(126,1,fAni126);
         this.EMBEDANI.splice(127,1,fAni127);
         this.EMBEDANI.splice(128,1,fAni128);
      }
      
      public function loadGameData() : void
      {
         this.EMBEDDATA.splice(0,1,fDat0);
         this.EMBEDDATA.splice(1,1,fDat1);
         this.EMBEDDATA.splice(2,1,fDat2);
         this.EMBEDDATA.splice(3,1,fDat3);
         this.EMBEDDATA.splice(4,1,fDat4);
         this.EMBEDDATA.splice(5,1,fDat5);
         this.EMBEDDATA.splice(6,1,fDat6);
         this.EMBEDDATA.splice(7,1,fDat7);
         this.EMBEDDATA.splice(8,1,fDat8);
         this.EMBEDDATA.splice(9,1,fDat9);
         this.EMBEDDATA.splice(10,1,fDat10);
         this.EMBEDDATA.splice(11,1,fDat11);
         this.EMBEDDATA.splice(12,1,fDat12);
         this.EMBEDDATA.splice(13,1,fDat13);
         this.EMBEDDATA.splice(14,1,fDat14);
         this.EMBEDDATA.splice(15,1,fDat15);
         this.EMBEDDATA.splice(16,1,fDat16);
         this.EMBEDDATA.splice(17,1,fDat17);
         this.EMBEDDATA.splice(18,1,fDat18);
         this.EMBEDDATA.splice(19,1,fDat19);
         this.EMBEDDATA.splice(20,1,fDat20);
         this.EMBEDDATA.splice(21,1,fDat21);
         this.EMBEDDATA.splice(22,1,fDat22);
         this.EMBEDDATA.splice(23,1,fDat23);
         this.EMBEDDATA.splice(24,1,fDat24);
         this.EMBEDDATA.splice(25,1,fDat25);
         this.EMBEDDATA.splice(26,1,fDat26);
         this.EMBEDDATA.splice(27,1,fDat27);
         this.EMBEDDATA.splice(28,1,fDat28);
         this.EMBEDDATA.splice(29,1,fDat29);
         this.EMBEDDATA.splice(30,1,fDat30);
         this.EMBEDDATA.splice(31,1,fDat31);
         this.EMBEDDATA.splice(32,1,fDat32);
         this.EMBEDDATA.splice(33,1,fDat33);
         this.EMBEDDATA.splice(34,1,fDat34);
         this.EMBEDDATA.splice(35,1,fDat35);
         this.EMBEDDATA.splice(36,1,fDat36);
         this.EMBEDDATA.splice(37,1,fDat37);
         this.EMBEDDATA.splice(38,1,fDat38);
         this.EMBEDDATA.splice(39,1,fDat39);
         this.EMBEDDATA.splice(40,1,fDat40);
         this.EMBEDDATA.splice(41,1,fDat41);
         this.EMBEDDATA.splice(42,1,fDat42);
         this.EMBEDDATA.splice(43,1,fDat43);
         this.EMBEDDATA.splice(44,1,fDat44);
         this.EMBEDDATA.splice(45,1,fDat45);
         this.EMBEDDATA.splice(46,1,fDat46);
         this.EMBEDDATA.splice(47,1,fDat47);
         this.EMBEDDATA.splice(48,1,fDat48);
         this.EMBEDDATA.splice(49,1,fDat49);
         this.EMBEDDATA.splice(50,1,fDat50);
         this.EMBEDDATA.splice(51,1,fDat51);
         this.EMBEDDATA.splice(52,1,fDat52);
         this.EMBEDDATA.splice(53,1,fDat53);
         this.EMBEDDATA.splice(54,1,fDat54);
         this.EMBEDDATA.splice(55,1,fDat55);
         this.EMBEDDATA.splice(56,1,fDat56);
         this.EMBEDDATA.splice(57,1,fDat57);
         this.EMBEDDATA.splice(58,1,fDat58);
         this.EMBEDDATA.splice(59,1,fDat59);
         this.EMBEDDATA.splice(60,1,fDat60);
         this.EMBEDDATA.splice(61,1,fDat61);
         this.EMBEDDATA.splice(62,1,fDat62);
         this.EMBEDDATA.splice(63,1,fDat63);
         this.EMBEDDATA.splice(64,1,fDat64);
         this.EMBEDDATA.splice(65,1,fDat65);
         this.EMBEDDATA.splice(66,1,fDat66);
         this.EMBEDDATA.splice(67,1,fDat67);
         this.EMBEDDATA.splice(68,1,fDat68);
         this.EMBEDDATA.splice(69,1,fDat69);
         this.EMBEDDATA.splice(70,1,fDat70);
         this.EMBEDDATA.splice(71,1,fDat71);
         this.EMBEDDATA.splice(72,1,fDat72);
         this.EMBEDDATA.splice(73,1,fDat73);
         this.EMBEDDATA.splice(74,1,fDat74);
         this.EMBEDDATA.splice(75,1,fDat75);
         this.EMBEDDATA.splice(76,1,fDat76);
         this.EMBEDDATA.splice(77,1,fDat77);
         this.EMBEDDATA.splice(78,1,fDat78);
         this.EMBEDDATA.splice(79,1,fDat79);
         this.EMBEDDATA.splice(80,1,fDat80);
         this.EMBEDDATA.splice(81,1,fDat81);
         this.EMBEDDATA.splice(82,1,fDat82);
         this.EMBEDDATA.splice(83,1,fDat83);
         this.EMBEDDATA.splice(84,1,fDat84);
         this.EMBEDDATA.splice(85,1,fDat85);
         this.EMBEDDATA.splice(86,1,fDat86);
         this.EMBEDDATA.splice(87,1,fDat87);
         this.EMBEDDATA.splice(88,1,fDat88);
         this.EMBEDDATA.splice(89,1,fDat89);
         this.EMBEDDATA.splice(90,1,fDat90);
         this.EMBEDDATA.splice(91,1,fDat91);
         this.EMBEDDATA.splice(92,1,fDat92);
         this.EMBEDDATA.splice(93,1,fDat93);
         this.EMBEDDATA.splice(94,1,fDat94);
         this.EMBEDDATA.splice(95,1,fDat95);
         this.EMBEDDATA.splice(96,1,fDat96);
         this.EMBEDDATA.splice(97,1,fDat97);
         this.EMBEDDATA.splice(98,1,fDat98);
         this.EMBEDDATA.splice(99,1,fDat99);
         this.EMBEDDATA.splice(100,1,fDat100);
         this.EMBEDDATA.splice(101,1,fDat101);
         this.EMBEDDATA.splice(102,1,fDat102);
         this.EMBEDDATA.splice(103,1,fDat103);
         this.EMBEDDATA.splice(104,1,fDat104);
         this.EMBEDDATA.splice(105,1,fDat105);
         this.EMBEDDATA.splice(106,1,fDat106);
         this.EMBEDDATA.splice(107,1,fDat107);
         this.EMBEDDATA.splice(108,1,fDat108);
         this.EMBEDDATA.splice(109,1,fDat109);
         this.EMBEDDATA.splice(110,1,fDat110);
         this.EMBEDDATA.splice(111,1,fDat111);
         this.EMBEDDATA.splice(112,1,fDat112);
         this.EMBEDDATA.splice(113,1,fDat113);
         this.EMBEDDATA.splice(114,1,fDat114);
         this.EMBEDDATA.splice(115,1,fDat115);
         this.EMBEDDATA.splice(116,1,fDat116);
         this.EMBEDDATA.splice(117,1,fDat117);
         this.EMBEDDATA.splice(118,1,fDat118);
         this.EMBEDDATA.splice(119,1,fDat119);
         this.EMBEDDATA.splice(120,1,fDat120);
         this.EMBEDDATA.splice(121,1,fDat121);
         this.EMBEDDATA.splice(122,1,fDat122);
         this.EMBEDDATA.splice(123,1,fDat123);
         this.EMBEDDATA.splice(124,1,fDat124);
         this.EMBEDDATA.splice(125,1,fDat125);
         this.EMBEDDATA.splice(126,1,fDat126);
         this.EMBEDDATA.splice(127,1,fDat127);
         this.EMBEDDATA.splice(128,1,fDat128);
         this.EMBEDDATA.splice(129,1,fDat129);
         this.EMBEDDATA.splice(130,1,fDat130);
         this.EMBEDDATA.splice(131,1,fDat131);
         this.EMBEDDATA.splice(132,1,fDat132);
         this.EMBEDDATA.splice(133,1,fDat133);
         this.EMBEDDATA.splice(134,1,fDat134);
         this.EMBEDDATA.splice(135,1,fDat135);
         this.EMBEDDATA.splice(136,1,fDat136);
         this.EMBEDDATA.splice(137,1,fDat137);
         this.EMBEDDATA.splice(138,1,fDat138);
         this.EMBEDDATA.splice(139,1,fDat139);
         this.EMBEDDATA.splice(140,1,fDat140);
         this.EMBEDDATA.splice(141,1,fDat141);
         this.EMBEDDATA.splice(142,1,fDat142);
         this.EMBEDDATA.splice(143,1,fDat143);
         this.EMBEDDATA.splice(144,1,fDat144);
         this.EMBEDDATA.splice(145,1,fDat145);
         this.EMBEDDATA.splice(146,1,fDat146);
         this.EMBEDDATA.splice(147,1,fDat147);
         this.EMBEDDATA.splice(148,1,fDat148);
         this.EMBEDDATA.splice(149,1,fDat149);
      }
      
      public function loadStageDB(param1:int) : void
      {
         if(!this.bLoading)
         {
            if(this.dbFileData != null)
            {
               this.dbFileData = null;
            }
            this.dbFileData = new this.EMBEDDB[param1]() as ByteArray;
            this.bLoading = true;
            this.stageDBLoadDone();
         }
      }
      
      public function stageDBLoadDone() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(Drawing.RES_COMPRESS)
         {
            this.dbFileData.uncompress();
         }
         this.nDBPos = 0;
         _loc3_ = this.readInt32Len(this.dbFileData,this.nDBPos);
         this.nDBPos += 4;
         _loc4_ = this.readInt32Len(this.dbFileData,this.nDBPos);
         this.nDBPos += 4;
         _loc1_ = 0;
         while(_loc1_ < _loc3_)
         {
            this.draw.STAGEDB[_loc1_] = new StageDB();
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < _loc3_)
         {
            this.draw.STAGEDB[_loc1_].strStageName = this.readColumn(this.dbFileData,this.nDBPos);
            this.draw.STAGEDB[_loc1_].nTableID = this.strToInt(this.readColumn(this.dbFileData,this.nDBPos));
            this.draw.STAGEDB[_loc1_].nFileVersion = this.strToNumber(this.readColumn(this.dbFileData,this.nDBPos));
            this.draw.STAGEDB[_loc1_].nMobCreateMinTime_First = this.strToInt(this.readColumn(this.dbFileData,this.nDBPos));
            this.draw.STAGEDB[_loc1_].nMobCreateMaxTime_First = this.strToInt(this.readColumn(this.dbFileData,this.nDBPos));
            this.draw.STAGEDB[_loc1_].nTurningPoint = this.strToInt(this.readColumn(this.dbFileData,this.nDBPos));
            this.draw.STAGEDB[_loc1_].nMobCreateMinTime_Last = this.strToInt(this.readColumn(this.dbFileData,this.nDBPos));
            this.draw.STAGEDB[_loc1_].nMobCreateMaxTime_Last = this.strToInt(this.readColumn(this.dbFileData,this.nDBPos));
            this.draw.STAGEDB[_loc1_].nEnemyStationHp = this.strToInt(this.readColumn(this.dbFileData,this.nDBPos));
            _loc2_ = 0;
            while(_loc2_ < StageDB.MAX_APPEARMOBKIND)
            {
               this.draw.STAGEDB[_loc1_].APPEARMOBKIND[_loc2_] = this.strToInt(this.readColumn(this.dbFileData,this.nDBPos));
               this.draw.STAGEDB[_loc1_].APPEARMOBCHANCE[_loc2_] = this.strToInt(this.readColumn(this.dbFileData,this.nDBPos));
               _loc2_++;
            }
            this.draw.STAGEDB[_loc1_].nStageClearMoney = this.strToInt(this.readColumn(this.dbFileData,this.nDBPos));
            this.draw.STAGEDB[_loc1_].nStageClearLimitTime = this.strToInt(this.readColumn(this.dbFileData,this.nDBPos));
            this.draw.STAGEDB[_loc1_].nStageClearLevelTime = this.strToInt(this.readColumn(this.dbFileData,this.nDBPos));
            this.readColumn(this.dbFileData,this.nDBPos);
            _loc1_++;
         }
         this.bLoading = false;
         ++this.draw.nMainScene;
      }
      
      public function loadDestinyDB(param1:int) : void
      {
         if(!this.bLoading)
         {
            if(this.dbFileData != null)
            {
               this.dbFileData = null;
            }
            this.dbFileData = new this.EMBEDDB[param1]() as ByteArray;
            this.bLoading = true;
            this.destinyDBLoadDone();
         }
      }
      
      public function destinyDBLoadDone() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(Drawing.RES_COMPRESS)
         {
            this.dbFileData.uncompress();
         }
         this.nDBPos = 0;
         _loc3_ = this.readInt32Len(this.dbFileData,this.nDBPos);
         this.nDBPos += 4;
         _loc4_ = this.readInt32Len(this.dbFileData,this.nDBPos);
         this.nDBPos += 4;
         _loc1_ = 0;
         while(_loc1_ < _loc3_)
         {
            this.draw.DESTINYDB[_loc1_] = new DestinyDB();
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < _loc3_)
         {
            this.draw.DESTINYDB[_loc1_].strStageName = this.readColumn(this.dbFileData,this.nDBPos);
            this.draw.DESTINYDB[_loc1_].nTableID = this.strToInt(this.readColumn(this.dbFileData,this.nDBPos));
            this.draw.DESTINYDB[_loc1_].nFileVersion = this.strToNumber(this.readColumn(this.dbFileData,this.nDBPos));
            this.draw.DESTINYDB[_loc1_].nCreateTime = this.strToInt(this.readColumn(this.dbFileData,this.nDBPos));
            this.readColumn(this.dbFileData,this.nDBPos);
            this.readColumn(this.dbFileData,this.nDBPos);
            this.readColumn(this.dbFileData,this.nDBPos);
            this.readColumn(this.dbFileData,this.nDBPos);
            this.readColumn(this.dbFileData,this.nDBPos);
            _loc2_ = 0;
            while(_loc2_ < DestinyDB.MAX_APPEARDATAKIND)
            {
               this.draw.DESTINYDB[_loc1_].APPEARDATAKIND[_loc2_] = this.strToInt(this.readColumn(this.dbFileData,this.nDBPos));
               this.draw.DESTINYDB[_loc1_].APPEARDATACHANCE[_loc2_] = this.strToInt(this.readColumn(this.dbFileData,this.nDBPos));
               _loc2_++;
            }
            this.readColumn(this.dbFileData,this.nDBPos);
            this.readColumn(this.dbFileData,this.nDBPos);
            this.readColumn(this.dbFileData,this.nDBPos);
            _loc1_++;
         }
         this.bLoading = false;
         ++this.draw.nMainScene;
      }
      
      public function loadUnitDB(param1:int) : void
      {
         if(!this.bLoading)
         {
            if(this.dbFileData != null)
            {
               this.dbFileData = null;
            }
            this.dbFileData = new this.EMBEDDB[param1]() as ByteArray;
            this.bLoading = true;
            this.unitDBLoadDone();
         }
      }
      
      public function unitDBLoadDone() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(Drawing.RES_COMPRESS)
         {
            this.dbFileData.uncompress();
         }
         this.nDBPos = 0;
         _loc3_ = this.readInt32Len(this.dbFileData,this.nDBPos);
         this.nDBPos += 4;
         _loc4_ = this.readInt32Len(this.dbFileData,this.nDBPos);
         this.nDBPos += 4;
         _loc1_ = 0;
         while(_loc1_ < _loc3_)
         {
            this.draw.UNITDB[_loc1_] = new UnitDB();
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < _loc3_)
         {
            this.draw.UNITDB[_loc1_].strUnitName = this.readColumn(this.dbFileData,this.nDBPos);
            this.draw.UNITDB[_loc1_].nTableID = this.strToInt(this.readColumn(this.dbFileData,this.nDBPos));
            this.draw.UNITDB[_loc1_].nFileVersion = this.strToNumber(this.readColumn(this.dbFileData,this.nDBPos));
            this.readColumn(this.dbFileData,this.nDBPos);
            this.readColumn(this.dbFileData,this.nDBPos);
            this.draw.UNITDB[_loc1_].nUseMana = this.strToInt(this.readColumn(this.dbFileData,this.nDBPos));
            this.draw.UNITDB[_loc1_].nCoolTime = this.strToInt(this.readColumn(this.dbFileData,this.nDBPos));
            this.draw.UNITDB[_loc1_].nHp = this.strToInt(this.readColumn(this.dbFileData,this.nDBPos));
            this.draw.UNITDB[_loc1_].nMove_pps = this.strToInt(this.readColumn(this.dbFileData,this.nDBPos));
            this.draw.UNITDB[_loc1_].nAttackDistance = this.strToInt(this.readColumn(this.dbFileData,this.nDBPos));
            this.draw.UNITDB[_loc1_].nAttackedRange = this.strToInt(this.readColumn(this.dbFileData,this.nDBPos));
            this.draw.UNITDB[_loc1_].nAttackMobNum = this.strToInt(this.readColumn(this.dbFileData,this.nDBPos));
            this.draw.UNITDB[_loc1_].nAttack = this.strToInt(this.readColumn(this.dbFileData,this.nDBPos));
            this.draw.UNITDB[_loc1_].nAttackDelay = this.strToNumber(this.readColumn(this.dbFileData,this.nDBPos)) * 1000;
            this.draw.UNITDB[_loc1_].nSkillDistance = this.strToInt(this.readColumn(this.dbFileData,this.nDBPos));
            this.draw.UNITDB[_loc1_].nSkillAttack = this.strToNumber(this.readColumn(this.dbFileData,this.nDBPos));
            this.draw.UNITDB[_loc1_].nSkillChance = this.strToNumber(this.readColumn(this.dbFileData,this.nDBPos));
            this.draw.UNITDB[_loc1_].nSkillKnockDownChance = this.strToNumber(this.readColumn(this.dbFileData,this.nDBPos));
            this.readColumn(this.dbFileData,this.nDBPos);
            this.readColumn(this.dbFileData,this.nDBPos);
            this.draw.UNITDB[_loc1_].nCreateLine = this.strToInt(this.readColumn(this.dbFileData,this.nDBPos));
            this.readColumn(this.dbFileData,this.nDBPos);
            this.readColumn(this.dbFileData,this.nDBPos);
            this.readColumn(this.dbFileData,this.nDBPos);
            this.readColumn(this.dbFileData,this.nDBPos);
            this.readColumn(this.dbFileData,this.nDBPos);
            this.readColumn(this.dbFileData,this.nDBPos);
            this.readColumn(this.dbFileData,this.nDBPos);
            this.readColumn(this.dbFileData,this.nDBPos);
            this.readColumn(this.dbFileData,this.nDBPos);
            this.readColumn(this.dbFileData,this.nDBPos);
            this.readColumn(this.dbFileData,this.nDBPos);
            this.readColumn(this.dbFileData,this.nDBPos);
            _loc1_++;
         }
         this.bLoading = false;
         ++this.draw.nMainScene;
      }
      
      public function loadHeroDB(param1:String) : void
      {
         var _loc2_:String = null;
         var _loc3_:URLRequest = null;
         if(!this.bLoading)
         {
            _loc2_ = this.URL_RESOURCE + "" + param1 + ".dat" + this.draw.RES_VERSION;
            this.datLoader = new URLLoader();
            this.datLoader.dataFormat = URLLoaderDataFormat.BINARY;
            _loc3_ = new URLRequest(_loc2_);
            this.bLoading = true;
            this.datLoader.addEventListener(Event.COMPLETE,this.heroDBLoadDone);
            this.datLoader.load(_loc3_);
         }
      }
      
      public function heroDBLoadDone(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(Drawing.RES_COMPRESS)
         {
            this.datLoader.data.uncompress();
         }
         this.nDBPos = 0;
         _loc4_ = this.readInt32Len(this.datLoader.data,this.nDBPos);
         this.nDBPos += 4;
         _loc5_ = this.readInt32Len(this.datLoader.data,this.nDBPos);
         this.nDBPos += 4;
         _loc2_ = 0;
         while(_loc2_ < _loc4_)
         {
            this.draw.HERODB[_loc2_] = new HeroDB();
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc4_)
         {
            this.draw.HERODB[_loc2_].strHeroName = this.readColumn(this.datLoader.data,this.nDBPos);
            this.draw.HERODB[_loc2_].nTableID = this.strToInt(this.readColumn(this.datLoader.data,this.nDBPos));
            this.draw.HERODB[_loc2_].nFileVersion = this.strToNumber(this.readColumn(this.datLoader.data,this.nDBPos));
            this.readColumn(this.datLoader.data,this.nDBPos);
            this.readColumn(this.datLoader.data,this.nDBPos);
            this.draw.HERODB[_loc2_].nMana = this.strToInt(this.readColumn(this.datLoader.data,this.nDBPos));
            this.draw.HERODB[_loc2_].nCoolTime = this.strToInt(this.readColumn(this.datLoader.data,this.nDBPos));
            this.draw.HERODB[_loc2_].nHp = this.strToInt(this.readColumn(this.datLoader.data,this.nDBPos));
            this.draw.HERODB[_loc2_].nMove_pps = this.strToInt(this.readColumn(this.datLoader.data,this.nDBPos));
            this.draw.HERODB[_loc2_].nAttackDistance = this.strToInt(this.readColumn(this.datLoader.data,this.nDBPos));
            this.draw.HERODB[_loc2_].nAttackedRange = this.strToInt(this.readColumn(this.datLoader.data,this.nDBPos));
            this.draw.HERODB[_loc2_].nAttackMobNum = this.strToInt(this.readColumn(this.datLoader.data,this.nDBPos));
            this.draw.HERODB[_loc2_].nAttack = this.strToInt(this.readColumn(this.datLoader.data,this.nDBPos));
            this.draw.HERODB[_loc2_].nAttackDelay = this.strToInt(this.readColumn(this.datLoader.data,this.nDBPos));
            this.draw.HERODB[_loc2_].nSkillDistance = this.strToInt(this.readColumn(this.datLoader.data,this.nDBPos));
            this.draw.HERODB[_loc2_].nSkillAttack = this.strToInt(this.readColumn(this.datLoader.data,this.nDBPos));
            this.draw.HERODB[_loc2_].nSkillChance = this.strToInt(this.readColumn(this.datLoader.data,this.nDBPos));
            this.draw.HERODB[_loc2_].nSkillKnockDownChance = this.strToInt(this.readColumn(this.datLoader.data,this.nDBPos));
            this.readColumn(this.datLoader.data,this.nDBPos);
            this.readColumn(this.datLoader.data,this.nDBPos);
            this.draw.HERODB[_loc2_].nCreateLine = this.strToInt(this.readColumn(this.datLoader.data,this.nDBPos));
            this.readColumn(this.datLoader.data,this.nDBPos);
            this.readColumn(this.datLoader.data,this.nDBPos);
            this.readColumn(this.datLoader.data,this.nDBPos);
            this.readColumn(this.datLoader.data,this.nDBPos);
            this.readColumn(this.datLoader.data,this.nDBPos);
            this.readColumn(this.datLoader.data,this.nDBPos);
            this.readColumn(this.datLoader.data,this.nDBPos);
            this.readColumn(this.datLoader.data,this.nDBPos);
            this.readColumn(this.datLoader.data,this.nDBPos);
            this.readColumn(this.datLoader.data,this.nDBPos);
            this.readColumn(this.datLoader.data,this.nDBPos);
            this.readColumn(this.datLoader.data,this.nDBPos);
            this.readColumn(this.datLoader.data,this.nDBPos);
            this.readColumn(this.datLoader.data,this.nDBPos);
            this.readColumn(this.datLoader.data,this.nDBPos);
            _loc2_++;
         }
         this.datLoader.removeEventListener(Event.COMPLETE,this.heroDBLoadDone);
         this.bLoading = false;
         ++this.draw.nMainScene;
      }
      
      public function loadEnemyDB(param1:int) : void
      {
         if(!this.bLoading)
         {
            if(this.dbFileData != null)
            {
               this.dbFileData = null;
            }
            this.dbFileData = new this.EMBEDDB[param1]() as ByteArray;
            this.bLoading = true;
            this.enemyDBLoadDone();
         }
      }
      
      public function enemyDBLoadDone() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(Drawing.RES_COMPRESS)
         {
            this.dbFileData.uncompress();
         }
         this.nDBPos = 0;
         _loc3_ = this.readInt32Len(this.dbFileData,this.nDBPos);
         this.nDBPos += 4;
         _loc4_ = this.readInt32Len(this.dbFileData,this.nDBPos);
         this.nDBPos += 4;
         _loc1_ = 0;
         while(_loc1_ < _loc3_)
         {
            this.draw.ENEMYDB[_loc1_] = new EnemyDB();
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < _loc3_)
         {
            this.draw.ENEMYDB[_loc1_].strMobName = this.readColumn(this.dbFileData,this.nDBPos);
            this.draw.ENEMYDB[_loc1_].nTableID = this.strToInt(this.readColumn(this.dbFileData,this.nDBPos));
            this.draw.ENEMYDB[_loc1_].nFileVersion = this.strToNumber(this.readColumn(this.dbFileData,this.nDBPos));
            this.readColumn(this.dbFileData,this.nDBPos);
            this.readColumn(this.dbFileData,this.nDBPos);
            this.draw.ENEMYDB[_loc1_].nHp = this.strToInt(this.readColumn(this.dbFileData,this.nDBPos));
            this.draw.ENEMYDB[_loc1_].nMove_pps = this.strToInt(this.readColumn(this.dbFileData,this.nDBPos));
            this.draw.ENEMYDB[_loc1_].nAttackDistance = this.strToInt(this.readColumn(this.dbFileData,this.nDBPos));
            this.draw.ENEMYDB[_loc1_].nAttackedRange = this.strToInt(this.readColumn(this.dbFileData,this.nDBPos));
            this.draw.ENEMYDB[_loc1_].nAttackMobNum = this.strToInt(this.readColumn(this.dbFileData,this.nDBPos));
            this.draw.ENEMYDB[_loc1_].nAttack = this.strToInt(this.readColumn(this.dbFileData,this.nDBPos));
            this.draw.ENEMYDB[_loc1_].nAttackDelay = this.strToNumber(this.readColumn(this.dbFileData,this.nDBPos)) * 1000;
            this.draw.ENEMYDB[_loc1_].nSkillDistance = this.strToInt(this.readColumn(this.dbFileData,this.nDBPos));
            this.draw.ENEMYDB[_loc1_].nSkillAttack = this.strToNumber(this.readColumn(this.dbFileData,this.nDBPos));
            this.draw.ENEMYDB[_loc1_].nSkillChance = this.strToNumber(this.readColumn(this.dbFileData,this.nDBPos));
            this.draw.ENEMYDB[_loc1_].nSkillKnockDownChance = this.strToNumber(this.readColumn(this.dbFileData,this.nDBPos));
            this.draw.ENEMYDB[_loc1_].nMoney = this.strToInt(this.readColumn(this.dbFileData,this.nDBPos));
            this.draw.ENEMYDB[_loc1_].nExp = this.strToInt(this.readColumn(this.dbFileData,this.nDBPos));
            this.readColumn(this.dbFileData,this.nDBPos);
            this.readColumn(this.dbFileData,this.nDBPos);
            this.draw.ENEMYDB[_loc1_].nCreateLine = this.strToInt(this.readColumn(this.dbFileData,this.nDBPos));
            this.readColumn(this.dbFileData,this.nDBPos);
            this.readColumn(this.dbFileData,this.nDBPos);
            this.readColumn(this.dbFileData,this.nDBPos);
            this.readColumn(this.dbFileData,this.nDBPos);
            this.readColumn(this.dbFileData,this.nDBPos);
            this.readColumn(this.dbFileData,this.nDBPos);
            this.readColumn(this.dbFileData,this.nDBPos);
            this.readColumn(this.dbFileData,this.nDBPos);
            this.readColumn(this.dbFileData,this.nDBPos);
            this.readColumn(this.dbFileData,this.nDBPos);
            this.readColumn(this.dbFileData,this.nDBPos);
            this.readColumn(this.dbFileData,this.nDBPos);
            _loc1_++;
         }
         this.bLoading = false;
         ++this.draw.nMainScene;
      }
      
      public function loadCardBookDB(param1:String) : void
      {
         var _loc2_:String = null;
         var _loc3_:URLRequest = null;
         if(!this.bLoading)
         {
            _loc2_ = this.URL_RESOURCE + "" + param1 + ".dat" + this.draw.RES_VERSION;
            this.datLoader = new URLLoader();
            this.datLoader.dataFormat = URLLoaderDataFormat.BINARY;
            _loc3_ = new URLRequest(_loc2_);
            this.bLoading = true;
            this.datLoader.addEventListener(Event.COMPLETE,this.cardBookDBLoadDone);
            this.datLoader.load(_loc3_);
         }
      }
      
      public function cardBookDBLoadDone(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(Drawing.RES_COMPRESS)
         {
            this.datLoader.data.uncompress();
         }
         this.nDBPos = 0;
         _loc4_ = this.readInt32Len(this.datLoader.data,this.nDBPos);
         this.nDBPos += 4;
         _loc5_ = this.readInt32Len(this.datLoader.data,this.nDBPos);
         this.nDBPos += 4;
         _loc2_ = 0;
         while(_loc2_ < _loc4_)
         {
            this.draw.CARDBOOKDB[_loc2_] = new CardBookDB();
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc4_)
         {
            this.draw.CARDBOOKDB[_loc2_].nSetIndex = this.strToInt(this.readColumn(this.datLoader.data,this.nDBPos));
            this.draw.CARDBOOKDB[_loc2_].strCardSetName = this.readColumn(this.datLoader.data,this.nDBPos);
            _loc3_ = 0;
            while(_loc3_ < CardBookDB.MAX_SETNUM)
            {
               this.draw.CARDBOOKDB[_loc2_].nCardIndex[_loc3_] = this.strToInt(this.readColumn(this.datLoader.data,this.nDBPos));
               if(this.draw.CARDBOOKDB[_loc2_].nCardIndex[_loc3_] > Player.CARDINDEX_BOSS)
               {
                  this.draw.CARDBOOKDB[_loc2_].nCardIndex[_loc3_] -= Player.CARDINDEX_BOSS + 1;
               }
               else
               {
                  this.draw.CARDBOOKDB[_loc2_].nCardIndex[_loc3_] = this.draw.CARDBOOKDB[_loc2_].nCardIndex[_loc3_] - 1 + 10;
               }
               this.draw.CARDBOOKDB[_loc2_].nCardNum[_loc3_] = this.strToInt(this.readColumn(this.datLoader.data,this.nDBPos));
               _loc3_++;
            }
            this.draw.CARDBOOKDB[_loc2_].strRewardName = this.readColumn(this.datLoader.data,this.nDBPos);
            this.draw.CARDBOOKDB[_loc2_].nRewardNum = this.strToInt(this.readColumn(this.datLoader.data,this.nDBPos));
            _loc2_++;
         }
         this.datLoader.removeEventListener(Event.COMPLETE,this.cardBookDBLoadDone);
         this.bLoading = false;
         ++this.draw.nMainScene;
      }
      
      public function loadQuestIconDB(param1:String) : void
      {
         var _loc2_:String = null;
         var _loc3_:URLRequest = null;
         if(!this.bLoading)
         {
            _loc2_ = this.URL_RESOURCE + "" + param1 + ".dat" + this.draw.RES_VERSION;
            this.datLoader = new URLLoader();
            this.datLoader.dataFormat = URLLoaderDataFormat.BINARY;
            _loc3_ = new URLRequest(_loc2_);
            this.bLoading = true;
            this.datLoader.addEventListener(Event.COMPLETE,this.questIconDBLoadDone);
            this.datLoader.load(_loc3_);
         }
      }
      
      public function questIconDBLoadDone(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(Drawing.RES_COMPRESS)
         {
            this.datLoader.data.uncompress();
         }
         this.nDBPos = 0;
         _loc4_ = this.readInt32Len(this.datLoader.data,this.nDBPos);
         this.nDBPos += 4;
         _loc5_ = this.readInt32Len(this.datLoader.data,this.nDBPos);
         this.nDBPos += 4;
         _loc2_ = 0;
         while(_loc2_ < _loc4_)
         {
            this.draw.QUESTICONDB[_loc2_] = new QuestIcon();
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc4_)
         {
            this.draw.QUESTICONDB[_loc2_].strChaNameIndex = this.readColumn(this.datLoader.data,this.nDBPos);
            this.draw.QUESTICONDB[_loc2_].strChaName = this.readColumn(this.datLoader.data,this.nDBPos);
            if(this.draw.QUESTICONDB[_loc2_].strChaName == "0")
            {
               this.draw.QUESTICONDB[_loc2_].strChaName = null;
            }
            _loc2_++;
         }
         this.datLoader.removeEventListener(Event.COMPLETE,this.questIconDBLoadDone);
         this.bLoading = false;
         ++this.draw.nMainScene;
      }
      
      public function loadStoreInforDB(param1:int) : void
      {
         if(!this.bLoading)
         {
            if(this.dbFileData != null)
            {
               this.dbFileData = null;
            }
            this.dbFileData = new this.EMBEDDB[param1]() as ByteArray;
            this.bLoading = true;
            this.storeInforDBLoadDone();
         }
      }
      
      public function storeInforDBLoadDone() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(Drawing.RES_COMPRESS)
         {
            this.dbFileData.uncompress();
         }
         this.nDBPos = 0;
         _loc3_ = this.readInt32Len(this.dbFileData,this.nDBPos);
         this.nDBPos += 4;
         _loc4_ = this.readInt32Len(this.dbFileData,this.nDBPos);
         this.nDBPos += 4;
         _loc1_ = 0;
         while(_loc1_ < _loc3_)
         {
            this.draw.STOREINFORDB[_loc1_] = new StoreInforDB();
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < _loc3_)
         {
            this.draw.STOREINFORDB[_loc1_].strStoreTypeIndex = this.readColumn(this.dbFileData,this.nDBPos);
            _loc2_ = 0;
            while(_loc2_ < _loc4_ - 1)
            {
               this.draw.STOREINFORDB[_loc1_].STRSTOREINFOR[_loc2_] = this.readColumn(this.dbFileData,this.nDBPos);
               if(this.draw.STOREINFORDB[_loc1_].STRSTOREINFOR[_loc2_] == "0")
               {
                  this.draw.STOREINFORDB[_loc1_].STRSTOREINFOR[_loc2_] = null;
               }
               _loc2_++;
            }
            _loc1_++;
         }
         this.bLoading = false;
         ++this.draw.nMainScene;
      }
      
      public function loadUnitInforDB(param1:int) : void
      {
         if(!this.bLoading)
         {
            if(this.dbFileData != null)
            {
               this.dbFileData = null;
            }
            this.dbFileData = new this.EMBEDDB[param1]() as ByteArray;
            this.bLoading = true;
            this.unitInforDBLoadDone();
         }
      }
      
      public function unitInforDBLoadDone() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(Drawing.RES_COMPRESS)
         {
            this.dbFileData.uncompress();
         }
         this.nDBPos = 0;
         _loc3_ = this.readInt32Len(this.dbFileData,this.nDBPos);
         this.nDBPos += 4;
         _loc4_ = this.readInt32Len(this.dbFileData,this.nDBPos);
         this.nDBPos += 4;
         _loc1_ = 0;
         while(_loc1_ < _loc3_)
         {
            this.draw.UNITINFORDB[_loc1_] = new UnitInforDB();
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < _loc3_)
         {
            this.draw.UNITINFORDB[_loc1_].strUnitTypeIndex = this.readColumn(this.dbFileData,this.nDBPos);
            _loc2_ = 0;
            while(_loc2_ < _loc4_ - 1)
            {
               this.draw.UNITINFORDB[_loc1_].STRUNITINFOR[_loc2_] = this.readColumn(this.dbFileData,this.nDBPos);
               if(this.draw.UNITINFORDB[_loc1_].STRUNITINFOR[_loc2_] == "0")
               {
                  this.draw.UNITINFORDB[_loc1_].STRUNITINFOR[_loc2_] = null;
               }
               _loc2_++;
            }
            _loc1_++;
         }
         this.bLoading = false;
         ++this.draw.nMainScene;
      }
      
      public function loadBossDialogDB(param1:int) : void
      {
         if(!this.bLoading)
         {
            if(this.dbFileData != null)
            {
               this.dbFileData = null;
            }
            this.dbFileData = new this.EMBEDDB[param1]() as ByteArray;
            this.bLoading = true;
            this.bossDialogDBLoadDone();
         }
      }
      
      public function bossDialogDBLoadDone() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(Drawing.RES_COMPRESS)
         {
            this.dbFileData.uncompress();
         }
         this.nDBPos = 0;
         _loc3_ = this.readInt32Len(this.dbFileData,this.nDBPos);
         this.nDBPos += 4;
         _loc4_ = this.readInt32Len(this.dbFileData,this.nDBPos);
         this.nDBPos += 4;
         _loc1_ = 0;
         while(_loc1_ < _loc3_)
         {
            this.draw.BOSSDIALOGDB[_loc1_] = new BossDialogDB();
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < _loc3_)
         {
            this.draw.BOSSDIALOGDB[_loc1_].strBossTypeIndex = this.readColumn(this.dbFileData,this.nDBPos);
            _loc2_ = 0;
            while(_loc2_ < _loc4_ - 1)
            {
               this.draw.BOSSDIALOGDB[_loc1_].STRBOSSDIALOG[_loc2_] = this.readColumn(this.dbFileData,this.nDBPos);
               if(this.draw.BOSSDIALOGDB[_loc1_].STRBOSSDIALOG[_loc2_] == "0")
               {
                  this.draw.BOSSDIALOGDB[_loc1_].STRBOSSDIALOG[_loc2_] = null;
               }
               _loc2_++;
            }
            _loc1_++;
         }
         this.bLoading = false;
         ++this.draw.nMainScene;
      }
      
      public function loadQuestTypeDB(param1:String) : void
      {
         var _loc2_:String = null;
         var _loc3_:URLRequest = null;
         if(!this.bLoading)
         {
            _loc2_ = this.URL_RESOURCE + "" + param1 + ".dat" + this.draw.RES_VERSION;
            this.datLoader = new URLLoader();
            this.datLoader.dataFormat = URLLoaderDataFormat.BINARY;
            _loc3_ = new URLRequest(_loc2_);
            this.bLoading = true;
            this.datLoader.addEventListener(Event.COMPLETE,this.questTypeDBLoadDone);
            this.datLoader.load(_loc3_);
         }
      }
      
      public function questTypeDBLoadDone(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(Drawing.RES_COMPRESS)
         {
            this.datLoader.data.uncompress();
         }
         this.nDBPos = 0;
         _loc4_ = this.readInt32Len(this.datLoader.data,this.nDBPos);
         this.nDBPos += 4;
         _loc5_ = this.readInt32Len(this.datLoader.data,this.nDBPos);
         this.nDBPos += 4;
         _loc2_ = 0;
         while(_loc2_ < _loc4_)
         {
            this.draw.QUESTTYPEDB[_loc2_] = new QuestTypeDB();
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc4_)
         {
            this.draw.QUESTTYPEDB[_loc2_].strQuestTypeIndex = this.readColumn(this.datLoader.data,this.nDBPos);
            _loc3_ = 0;
            while(_loc3_ < QuestTypeDB.MAX_QUESTLINE)
            {
               this.draw.QUESTTYPEDB[_loc2_].STRQUESTTYPE[_loc3_] = this.readColumn(this.datLoader.data,this.nDBPos);
               if(this.draw.QUESTTYPEDB[_loc2_].STRQUESTTYPE[_loc3_] == "0")
               {
                  this.draw.QUESTTYPEDB[_loc2_].STRQUESTTYPE[_loc3_] = null;
               }
               _loc3_++;
            }
            _loc2_++;
         }
         this.datLoader.removeEventListener(Event.COMPLETE,this.questTypeDBLoadDone);
         this.bLoading = false;
         ++this.draw.nMainScene;
      }
      
      public function loadQuestDB(param1:String) : void
      {
         var _loc2_:String = null;
         var _loc3_:URLRequest = null;
         if(!this.bLoading)
         {
            _loc2_ = this.URL_RESOURCE + "" + param1 + ".dat" + this.draw.RES_VERSION;
            this.datLoader = new URLLoader();
            this.datLoader.dataFormat = URLLoaderDataFormat.BINARY;
            _loc3_ = new URLRequest(_loc2_);
            this.bLoading = true;
            this.datLoader.addEventListener(Event.COMPLETE,this.questDBLoadDone);
            this.datLoader.load(_loc3_);
         }
      }
      
      public function questDBLoadDone(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:String = null;
         _loc7_ = null;
         if(Drawing.RES_COMPRESS)
         {
            this.datLoader.data.uncompress();
         }
         this.nDBPos = 0;
         _loc5_ = this.readInt32Len(this.datLoader.data,this.nDBPos);
         this.nDBPos += 4;
         _loc6_ = this.readInt32Len(this.datLoader.data,this.nDBPos);
         this.nDBPos += 4;
         _loc2_ = 0;
         while(_loc2_ < _loc5_)
         {
            this.draw.QUESTDB[_loc2_] = new QuestDB();
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc5_)
         {
            this.draw.QUESTDB[_loc2_].strStageName = this.readColumn(this.datLoader.data,this.nDBPos);
            this.draw.QUESTDB[_loc2_].nMainQuestIndex = this.strToInt(this.readColumn(this.datLoader.data,this.nDBPos)) - 1;
            _loc3_ = 0;
            while(_loc3_ < QuestDB.MAX_QUESTVALUE)
            {
               this.draw.QUESTDB[_loc2_].MAINQUESTVALUE[_loc3_] = this.readColumn(this.datLoader.data,this.nDBPos);
               _loc4_ = 0;
               while(_loc4_ < this.draw.QUESTICONDB.length)
               {
                  if(this.draw.QUESTDB[_loc2_].MAINQUESTVALUE[_loc3_] == this.draw.QUESTICONDB[_loc4_].strChaNameIndex)
                  {
                     this.draw.QUESTDB[_loc2_].MAINQUESTVALUE[_loc3_] = this.draw.QUESTICONDB[_loc4_].strChaName;
                     break;
                  }
                  _loc4_++;
               }
               _loc3_++;
            }
            _loc7_ = this.readColumn(this.datLoader.data,this.nDBPos);
            _loc3_ = 0;
            while(_loc3_ < this.draw.QUESTICONDB.length)
            {
               if(_loc7_ == this.draw.QUESTICONDB[_loc3_].strChaNameIndex)
               {
                  this.draw.QUESTDB[_loc2_].nMainQuestIcon = _loc3_;
                  break;
               }
               _loc3_++;
            }
            _loc3_ = 0;
            while(_loc3_ < QuestDB.MAX_QUESTREWARD)
            {
               this.draw.QUESTDB[_loc2_].MAINQUESTREWARD[_loc3_] = this.readColumn(this.datLoader.data,this.nDBPos);
               _loc3_++;
            }
            this.draw.QUESTDB[_loc2_].nSubQuest1Index = this.strToInt(this.readColumn(this.datLoader.data,this.nDBPos)) - 1;
            _loc3_ = 0;
            while(_loc3_ < QuestDB.MAX_QUESTVALUE)
            {
               this.draw.QUESTDB[_loc2_].SUBQUEST1VALUE[_loc3_] = this.readColumn(this.datLoader.data,this.nDBPos);
               _loc4_ = 0;
               while(_loc4_ < this.draw.QUESTICONDB.length)
               {
                  if(this.draw.QUESTDB[_loc2_].SUBQUEST1VALUE[_loc3_] == this.draw.QUESTICONDB[_loc4_].strChaNameIndex)
                  {
                     this.draw.QUESTDB[_loc2_].SUBQUEST1VALUE[_loc3_] = this.draw.QUESTICONDB[_loc4_].strChaName;
                     break;
                  }
                  _loc4_++;
               }
               _loc3_++;
            }
            _loc7_ = this.readColumn(this.datLoader.data,this.nDBPos);
            _loc3_ = 0;
            while(_loc3_ < this.draw.QUESTICONDB.length)
            {
               if(_loc7_ == this.draw.QUESTICONDB[_loc3_].strChaNameIndex)
               {
                  this.draw.QUESTDB[_loc2_].nSubQuest1Icon = _loc3_;
                  break;
               }
               _loc3_++;
            }
            _loc3_ = 0;
            while(_loc3_ < QuestDB.MAX_QUESTREWARD)
            {
               this.draw.QUESTDB[_loc2_].SUBQUEST1REWARD[_loc3_] = this.readColumn(this.datLoader.data,this.nDBPos);
               _loc3_++;
            }
            this.draw.QUESTDB[_loc2_].nSubQuest2Index = this.strToInt(this.readColumn(this.datLoader.data,this.nDBPos)) - 1;
            _loc3_ = 0;
            while(_loc3_ < QuestDB.MAX_QUESTVALUE)
            {
               this.draw.QUESTDB[_loc2_].SUBQUEST2VALUE[_loc3_] = this.readColumn(this.datLoader.data,this.nDBPos);
               _loc4_ = 0;
               while(_loc4_ < this.draw.QUESTICONDB.length)
               {
                  if(this.draw.QUESTDB[_loc2_].SUBQUEST2VALUE[_loc3_] == this.draw.QUESTICONDB[_loc4_].strChaNameIndex)
                  {
                     this.draw.QUESTDB[_loc2_].SUBQUEST2VALUE[_loc3_] = this.draw.QUESTICONDB[_loc4_].strChaName;
                     break;
                  }
                  _loc4_++;
               }
               _loc3_++;
            }
            _loc7_ = this.readColumn(this.datLoader.data,this.nDBPos);
            _loc3_ = 0;
            while(_loc3_ < this.draw.QUESTICONDB.length)
            {
               if(_loc7_ == this.draw.QUESTICONDB[_loc3_].strChaNameIndex)
               {
                  this.draw.QUESTDB[_loc2_].nSubQuest2Icon = _loc3_;
                  break;
               }
               _loc3_++;
            }
            _loc3_ = 0;
            while(_loc3_ < QuestDB.MAX_QUESTREWARD)
            {
               this.draw.QUESTDB[_loc2_].SUBQUEST2REWARD[_loc3_] = this.readColumn(this.datLoader.data,this.nDBPos);
               _loc3_++;
            }
            _loc2_++;
         }
         this.datLoader.removeEventListener(Event.COMPLETE,this.questDBLoadDone);
         this.bLoading = false;
         ++this.draw.nMainScene;
      }
      
      public function loadASEAni(param1:int, param2:int, param3:int) : void
      {
         if(!this.bLoading)
         {
            if(this.aniFileData != null)
            {
               this.aniFileData = null;
            }
            this.aniFileData = new this.EMBEDANI[param1]() as ByteArray;
            this.draw.nASEANILoadIndex = param2;
            this.draw.nASEANISetImgIndex = param3;
            this.bLoading = true;
            this.aseAniLoadDone();
         }
      }
      
      public function aseAniLoadDone() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         _loc5_ = this.draw.nASEANILoadIndex;
         var _loc6_:int = 0;
         if(Drawing.RES_COMPRESS)
         {
            this.aniFileData.uncompress();
         }
         if(this.draw.ASEANI[_loc5_] != null)
         {
            this.draw.ASEANI[_loc5_] = null;
         }
         this.draw.ASEANI[_loc5_] = new ASEData();
         this.draw.ASEANI[_loc5_].nImgIndex = this.draw.nASEANISetImgIndex;
         this.nDBPos = 0;
         _loc6_ = this.readInt32Len(this.aniFileData,this.nDBPos);
         this.nDBPos += this.nIntSize;
         this.draw.ASEANI[_loc5_].nFileVersion = this.readInt32Len(this.aniFileData,this.nDBPos);
         this.nDBPos += this.nIntSize;
         this.draw.ASEANI[_loc5_].nTotalAni = this.readInt32Len(this.aniFileData,this.nDBPos);
         this.nDBPos += this.nIntSize;
         this.draw.ASEANI[_loc5_].ANI = new Array(this.draw.ASEANI[_loc5_].nTotalAni);
         _loc1_ = 0;
         while(_loc1_ < this.draw.ASEANI[_loc5_].nTotalAni)
         {
            _loc7_ = this.readInt32Len(this.aniFileData,this.nDBPos);
            this.nDBPos += this.nIntSize;
            this.draw.ASEANI[_loc5_].ANI[_loc1_] = new Array(_loc7_);
            _loc2_ = 0;
            while(_loc2_ < _loc7_)
            {
               _loc8_ = this.readInt32Len(this.aniFileData,this.nDBPos);
               this.nDBPos += this.nIntSize;
               this.draw.ASEANI[_loc5_].ANI[_loc1_][_loc2_] = new Array(_loc8_);
               _loc3_ = 0;
               while(_loc3_ < _loc8_)
               {
                  _loc9_ = this.readInt32Len(this.aniFileData,this.nDBPos);
                  this.nDBPos += this.nIntSize;
                  this.draw.ASEANI[_loc5_].ANI[_loc1_][_loc2_][_loc3_] = new Array(_loc9_);
                  _loc4_ = 0;
                  while(_loc4_ < _loc9_)
                  {
                     this.draw.ASEANI[_loc5_].ANI[_loc1_][_loc2_][_loc3_][_loc4_] = this.readInt32Len(this.aniFileData,this.nDBPos);
                     this.nDBPos += this.nIntSize;
                     _loc4_++;
                  }
                  _loc3_++;
               }
               _loc2_++;
            }
            _loc1_++;
         }
         this.setASEDrawAni(_loc5_,ANI_SMOOTHLEVEL);
         this.bLoading = false;
         ++this.draw.nMainScene;
      }
      
      public function setASEDrawAni(param1:int, param2:int) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         this.draw.ASEANI[param1].DRAWANI = new Array(this.draw.ASEANI[param1].nTotalAni);
         _loc3_ = 0;
         while(_loc3_ < this.draw.ASEANI[param1].nTotalAni)
         {
            _loc7_ = int(this.draw.ASEANI[param1].ANI[_loc3_].length);
            this.draw.ASEANI[param1].DRAWANI[_loc3_] = new Array(_loc7_);
            _loc4_ = 0;
            while(_loc4_ < _loc7_)
            {
               _loc8_ = (this.draw.ASEANI[param1].ANI[_loc3_][_loc4_].length - 1) * param2;
               this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc4_] = new Array(_loc8_);
               _loc5_ = 0;
               while(_loc5_ < _loc8_)
               {
                  _loc9_ = int(this.draw.ASEANI[param1].ANI[_loc3_][_loc4_][int(_loc5_ / 2) + 1].length);
                  this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc4_][_loc5_] = new Array(_loc9_);
                  _loc5_++;
               }
               _loc4_++;
            }
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < this.draw.ASEANI[param1].ANI.length)
         {
            _loc4_ = 0;
            while(_loc4_ < this.draw.ASEANI[param1].ANI[_loc3_][0].length - 1)
            {
               _loc5_ = 0;
               while(_loc5_ < this.draw.ASEANI[param1].ANI[_loc3_].length)
               {
                  _loc6_ = 0;
                  while(_loc6_ < param2)
                  {
                     this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc5_][_loc4_ * param2 + _loc6_][ANIVALUE_IMGINDEX] = int(this.draw.ASEANI[param1].ANI[_loc3_][_loc5_][_loc4_ + 1][ANIVALUE_IMGINDEX]);
                     _loc6_++;
                  }
                  _loc6_ = 0;
                  while(_loc6_ < param2)
                  {
                     if(_loc6_ < param2 - 1)
                     {
                        this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc5_][_loc4_ * param2 + _loc6_][ANIVALUE_POSX] = this.draw.ASEANI[param1].ANI[_loc3_][_loc5_][_loc4_][ANIVALUE_POSX] + int((this.draw.ASEANI[param1].ANI[_loc3_][_loc5_][_loc4_ + 1][ANIVALUE_POSX] - this.draw.ASEANI[param1].ANI[_loc3_][_loc5_][_loc4_][ANIVALUE_POSX]) / param2 * (_loc6_ + 1));
                     }
                     else
                     {
                        this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc5_][_loc4_ * param2 + _loc6_][ANIVALUE_POSX] = int(this.draw.ASEANI[param1].ANI[_loc3_][_loc5_][_loc4_ + 1][ANIVALUE_POSX]);
                     }
                     _loc6_++;
                  }
                  _loc6_ = 0;
                  while(_loc6_ < param2)
                  {
                     if(_loc6_ < param2 - 1)
                     {
                        this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc5_][_loc4_ * param2 + _loc6_][ANIVALUE_POSY] = int(this.draw.ASEANI[param1].ANI[_loc3_][_loc5_][_loc4_][ANIVALUE_POSY] + (this.draw.ASEANI[param1].ANI[_loc3_][_loc5_][_loc4_ + 1][ANIVALUE_POSY] - this.draw.ASEANI[param1].ANI[_loc3_][_loc5_][_loc4_][ANIVALUE_POSY]) / param2 * (_loc6_ + 1));
                     }
                     else
                     {
                        this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc5_][_loc4_ * param2 + _loc6_][ANIVALUE_POSY] = int(this.draw.ASEANI[param1].ANI[_loc3_][_loc5_][_loc4_ + 1][ANIVALUE_POSY]);
                     }
                     _loc6_++;
                  }
                  _loc6_ = 0;
                  while(_loc6_ < param2)
                  {
                     this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc5_][_loc4_ * param2 + _loc6_][ANIVALUE_POSZ] = int(this.draw.ASEANI[param1].ANI[_loc3_][_loc5_][_loc4_ + 1][ANIVALUE_POSZ]);
                     _loc6_++;
                  }
                  _loc6_ = 0;
                  while(_loc6_ < param2)
                  {
                     if(_loc6_ < param2 - 1)
                     {
                        this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc5_][_loc4_ * param2 + _loc6_][ANIVALUE_ANGLE] = int(this.draw.ASEANI[param1].ANI[_loc3_][_loc5_][_loc4_][ANIVALUE_ANGLE] + (this.draw.ASEANI[param1].ANI[_loc3_][_loc5_][_loc4_ + 1][ANIVALUE_ANGLE] - this.draw.ASEANI[param1].ANI[_loc3_][_loc5_][_loc4_][ANIVALUE_ANGLE]) / param2 * (_loc6_ + 1));
                        this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc5_][_loc4_ * param2 + _loc6_][ANIVALUE_FLIPX] = int(this.draw.ASEANI[param1].ANI[_loc3_][_loc5_][_loc4_][ANIVALUE_FLIPX]);
                        this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc5_][_loc4_ * param2 + _loc6_][ANIVALUE_FLIPY] = int(this.draw.ASEANI[param1].ANI[_loc3_][_loc5_][_loc4_][ANIVALUE_FLIPY]);
                     }
                     else
                     {
                        this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc5_][_loc4_ * param2 + _loc6_][ANIVALUE_ANGLE] = int(this.draw.ASEANI[param1].ANI[_loc3_][_loc5_][_loc4_ + 1][ANIVALUE_ANGLE]);
                        this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc5_][_loc4_ * param2 + _loc6_][ANIVALUE_FLIPX] = int(this.draw.ASEANI[param1].ANI[_loc3_][_loc5_][_loc4_ + 1][ANIVALUE_FLIPX]);
                        this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc5_][_loc4_ * param2 + _loc6_][ANIVALUE_FLIPY] = int(this.draw.ASEANI[param1].ANI[_loc3_][_loc5_][_loc4_ + 1][ANIVALUE_FLIPY]);
                     }
                     _loc6_++;
                  }
                  _loc6_ = 0;
                  while(_loc6_ < param2)
                  {
                     if(_loc6_ < param2 - 1)
                     {
                        this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc5_][_loc4_ * param2 + _loc6_][ANIVALUE_SCALEX] = int(this.draw.ASEANI[param1].ANI[_loc3_][_loc5_][_loc4_][ANIVALUE_SCALEX] + (this.draw.ASEANI[param1].ANI[_loc3_][_loc5_][_loc4_ + 1][ANIVALUE_SCALEX] - this.draw.ASEANI[param1].ANI[_loc3_][_loc5_][_loc4_][ANIVALUE_SCALEX]) / param2 * (_loc6_ + 1));
                     }
                     else
                     {
                        this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc5_][_loc4_ * param2 + _loc6_][ANIVALUE_SCALEX] = int(this.draw.ASEANI[param1].ANI[_loc3_][_loc5_][_loc4_ + 1][ANIVALUE_SCALEX]);
                     }
                     _loc6_++;
                  }
                  _loc6_ = 0;
                  while(_loc6_ < param2)
                  {
                     if(_loc6_ < param2 - 1)
                     {
                        this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc5_][_loc4_ * param2 + _loc6_][ANIVALUE_SCALEY] = int(this.draw.ASEANI[param1].ANI[_loc3_][_loc5_][_loc4_][ANIVALUE_SCALEY] + (this.draw.ASEANI[param1].ANI[_loc3_][_loc5_][_loc4_ + 1][ANIVALUE_SCALEY] - this.draw.ASEANI[param1].ANI[_loc3_][_loc5_][_loc4_][ANIVALUE_SCALEY]) / param2 * (_loc6_ + 1));
                     }
                     else
                     {
                        this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc5_][_loc4_ * param2 + _loc6_][ANIVALUE_SCALEY] = int(this.draw.ASEANI[param1].ANI[_loc3_][_loc5_][_loc4_ + 1][ANIVALUE_SCALEY]);
                     }
                     _loc6_++;
                  }
                  _loc6_ = 0;
                  while(_loc6_ < param2)
                  {
                     if(_loc6_ < param2 - 1)
                     {
                        this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc5_][_loc4_ * param2 + _loc6_][ANIVALUE_ALPHA] = int(this.draw.ASEANI[param1].ANI[_loc3_][_loc5_][_loc4_][ANIVALUE_ALPHA] + (this.draw.ASEANI[param1].ANI[_loc3_][_loc5_][_loc4_ + 1][ANIVALUE_ALPHA] - this.draw.ASEANI[param1].ANI[_loc3_][_loc5_][_loc4_][ANIVALUE_ALPHA]) / param2 * (_loc6_ + 1));
                     }
                     else
                     {
                        this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc5_][_loc4_ * param2 + _loc6_][ANIVALUE_ALPHA] = int(this.draw.ASEANI[param1].ANI[_loc3_][_loc5_][_loc4_ + 1][ANIVALUE_ALPHA]);
                     }
                     _loc6_++;
                  }
                  _loc5_++;
               }
               _loc4_++;
            }
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < this.draw.ASEANI[param1].DRAWANI.length)
         {
            _loc4_ = 0;
            while(_loc4_ < this.draw.ASEANI[param1].DRAWANI[_loc3_].length - 1)
            {
               _loc5_ = _loc4_ + 1;
               while(_loc5_ < this.draw.ASEANI[param1].DRAWANI[_loc3_].length)
               {
                  _loc6_ = 0;
                  while(_loc6_ < this.draw.ASEANI[param1].DRAWANI[_loc3_][0].length)
                  {
                     if(this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc4_][_loc6_][ANIVALUE_POSZ] < this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc5_][_loc6_][ANIVALUE_POSZ])
                     {
                        _loc10_ = int(this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc4_][_loc6_][ANIVALUE_IMGINDEX]);
                        this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc4_][_loc6_][ANIVALUE_IMGINDEX] = this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc5_][_loc6_][ANIVALUE_IMGINDEX];
                        this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc5_][_loc6_][ANIVALUE_IMGINDEX] = _loc10_;
                        _loc10_ = int(this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc4_][_loc6_][ANIVALUE_POSX]);
                        this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc4_][_loc6_][ANIVALUE_POSX] = this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc5_][_loc6_][ANIVALUE_POSX];
                        this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc5_][_loc6_][ANIVALUE_POSX] = _loc10_;
                        _loc10_ = int(this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc4_][_loc6_][ANIVALUE_POSY]);
                        this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc4_][_loc6_][ANIVALUE_POSY] = this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc5_][_loc6_][ANIVALUE_POSY];
                        this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc5_][_loc6_][ANIVALUE_POSY] = _loc10_;
                        _loc10_ = int(this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc4_][_loc6_][ANIVALUE_POSZ]);
                        this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc4_][_loc6_][ANIVALUE_POSZ] = this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc5_][_loc6_][ANIVALUE_POSZ];
                        this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc5_][_loc6_][ANIVALUE_POSZ] = _loc10_;
                        _loc10_ = int(this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc4_][_loc6_][ANIVALUE_ANGLE]);
                        this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc4_][_loc6_][ANIVALUE_ANGLE] = this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc5_][_loc6_][ANIVALUE_ANGLE];
                        this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc5_][_loc6_][ANIVALUE_ANGLE] = _loc10_;
                        _loc10_ = int(this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc4_][_loc6_][ANIVALUE_SCALEX]);
                        this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc4_][_loc6_][ANIVALUE_SCALEX] = this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc5_][_loc6_][ANIVALUE_SCALEX];
                        this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc5_][_loc6_][ANIVALUE_SCALEX] = _loc10_;
                        _loc10_ = int(this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc4_][_loc6_][ANIVALUE_SCALEY]);
                        this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc4_][_loc6_][ANIVALUE_SCALEY] = this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc5_][_loc6_][ANIVALUE_SCALEY];
                        this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc5_][_loc6_][ANIVALUE_SCALEY] = _loc10_;
                        _loc10_ = int(this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc4_][_loc6_][ANIVALUE_ALPHA]);
                        this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc4_][_loc6_][ANIVALUE_ALPHA] = this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc5_][_loc6_][ANIVALUE_ALPHA];
                        this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc5_][_loc6_][ANIVALUE_ALPHA] = _loc10_;
                        _loc10_ = int(this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc4_][_loc6_][ANIVALUE_FLIPX]);
                        this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc4_][_loc6_][ANIVALUE_FLIPX] = this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc5_][_loc6_][ANIVALUE_FLIPX];
                        this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc5_][_loc6_][ANIVALUE_FLIPX] = _loc10_;
                        _loc10_ = int(this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc4_][_loc6_][ANIVALUE_FLIPY]);
                        this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc4_][_loc6_][ANIVALUE_FLIPY] = this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc5_][_loc6_][ANIVALUE_FLIPY];
                        this.draw.ASEANI[param1].DRAWANI[_loc3_][_loc5_][_loc6_][ANIVALUE_FLIPY] = _loc10_;
                     }
                     _loc6_++;
                  }
                  _loc5_++;
               }
               _loc4_++;
            }
            _loc3_++;
         }
      }
      
      public function load3DSMaxAni(param1:String, param2:int, param3:int) : void
      {
         var _loc4_:String = null;
         var _loc5_:URLRequest = null;
         if(!this.bLoading)
         {
            _loc4_ = this.URL_RESOURCE + "" + param1 + ".fani" + this.draw.RES_VERSION;
            this.draw.n3DSMaxAniLoadIndex = param2;
            this.draw.n3DSMaxAniSetImgIndex = param3;
            this.datLoader = new URLLoader();
            this.datLoader.dataFormat = URLLoaderDataFormat.BINARY;
            _loc5_ = new URLRequest(_loc4_);
            this.bLoading = true;
            this.datLoader.addEventListener(Event.COMPLETE,this.maxAniLoadDone);
            this.datLoader.load(_loc5_);
         }
      }
      
      public function maxAniLoadDone(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         _loc7_ = this.draw.n3DSMaxAniLoadIndex;
         var _loc8_:int = 0;
         if(Drawing.RES_COMPRESS)
         {
            this.datLoader.data.uncompress();
         }
         if(this.draw.MAXANI[_loc7_] != null)
         {
            this.draw.MAXANI[_loc7_] = null;
         }
         this.draw.MAXANI[_loc7_] = new MaxAni();
         this.draw.MAXANI[_loc7_].nOrgImgIndex = this.draw.n3DSMaxAniSetImgIndex;
         this.nDBPos = 0;
         _loc8_ = this.readInt32Len(this.datLoader.data,this.nDBPos);
         this.nDBPos += 4;
         this.draw.MAXANI[_loc7_].nFileVersion = this.strToNumber(this.readColumn(this.datLoader.data,this.nDBPos));
         _loc5_ = this.readInt32Len(this.datLoader.data,this.nDBPos);
         this.nDBPos += 4;
         _loc6_ = this.readInt32Len(this.datLoader.data,this.nDBPos);
         this.nDBPos += 4;
         this.draw.MAXANI[_loc7_].nMaxAniFrame = _loc5_;
         this.draw.MAXANI[_loc7_].nMaxObjNum = _loc6_;
         this.draw.MAXANI[_loc7_].FRAMEIMG = new Array(_loc5_);
         this.draw.MAXANI[_loc7_].FRAMEANGLE = new Array(_loc5_);
         this.draw.MAXANI[_loc7_].FRAMEX = new Array(_loc5_);
         this.draw.MAXANI[_loc7_].FRAMEY = new Array(_loc5_);
         this.draw.MAXANI[_loc7_].FRAMEZ = new Array(_loc5_);
         this.draw.MAXANI[_loc7_].FRAMESCALEX = new Array(_loc5_);
         this.draw.MAXANI[_loc7_].FRAMESCALEY = new Array(_loc5_);
         this.draw.MAXANI[_loc7_].FRAMEALPHA = new Array(_loc5_);
         _loc2_ = 0;
         while(_loc2_ < _loc5_)
         {
            this.draw.MAXANI[_loc7_].FRAMEIMG[_loc2_] = new Array(_loc6_);
            this.draw.MAXANI[_loc7_].FRAMEANGLE[_loc2_] = new Array(_loc6_);
            this.draw.MAXANI[_loc7_].FRAMEX[_loc2_] = new Array(_loc6_);
            this.draw.MAXANI[_loc7_].FRAMEY[_loc2_] = new Array(_loc6_);
            this.draw.MAXANI[_loc7_].FRAMEZ[_loc2_] = new Array(_loc6_);
            this.draw.MAXANI[_loc7_].FRAMESCALEX[_loc2_] = new Array(_loc6_);
            this.draw.MAXANI[_loc7_].FRAMESCALEY[_loc2_] = new Array(_loc6_);
            this.draw.MAXANI[_loc7_].FRAMEALPHA[_loc2_] = new Array(_loc6_);
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc5_)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc6_)
            {
               this.draw.MAXANI[_loc7_].FRAMEIMG[_loc2_][_loc3_] = this.readInt32Len(this.datLoader.data,this.nDBPos);
               this.nDBPos += 4;
               this.draw.MAXANI[_loc7_].FRAMEANGLE[_loc2_][_loc3_] = this.strToNumber(this.readColumn(this.datLoader.data,this.nDBPos));
               this.draw.MAXANI[_loc7_].FRAMEX[_loc2_][_loc3_] = this.strToNumber(this.readColumn(this.datLoader.data,this.nDBPos));
               this.draw.MAXANI[_loc7_].FRAMEY[_loc2_][_loc3_] = this.strToNumber(this.readColumn(this.datLoader.data,this.nDBPos));
               this.draw.MAXANI[_loc7_].FRAMEZ[_loc2_][_loc3_] = this.strToNumber(this.readColumn(this.datLoader.data,this.nDBPos));
               this.draw.MAXANI[_loc7_].FRAMESCALEX[_loc2_][_loc3_] = this.strToNumber(this.readColumn(this.datLoader.data,this.nDBPos));
               this.draw.MAXANI[_loc7_].FRAMESCALEY[_loc2_][_loc3_] = this.strToNumber(this.readColumn(this.datLoader.data,this.nDBPos));
               this.draw.MAXANI[_loc7_].FRAMEALPHA[_loc2_][_loc3_] = this.strToNumber(this.readColumn(this.datLoader.data,this.nDBPos));
               _loc3_++;
            }
            _loc2_++;
         }
         this.datLoader.removeEventListener(Event.COMPLETE,this.maxAniLoadDone);
         this.bLoading = false;
         ++this.draw.nMainScene;
      }
      
      public function readColumn(param1:ByteArray, param2:int) : String
      {
         var _loc3_:int = 0;
         var _loc4_:String = null;
         _loc3_ = this.readInt32Len(param1,this.nDBPos);
         this.nDBPos += 4;
         _loc4_ = this.readBytesString(param1,_loc3_,this.nDBPos);
         this.nDBPos += _loc3_;
         return _loc4_;
      }
      
      public function strToInt(param1:String) : int
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Number = NaN;
         _loc3_ = 0;
         _loc2_ = 0;
         while(_loc2_ < param1.length)
         {
            _loc4_ = param1.charCodeAt(_loc2_);
            _loc3_ *= 10;
            _loc3_ += _loc4_ - 48;
            _loc2_++;
         }
         return _loc3_;
      }
      
      public function strToNumber(param1:String) : Number
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         _loc3_ = 0;
         _loc5_ = 1;
         _loc6_ = false;
         _loc7_ = false;
         _loc8_ = false;
         _loc9_ = false;
         _loc10_ = 0;
         _loc11_ = 1;
         _loc2_ = 0;
         while(_loc2_ < param1.length)
         {
            _loc4_ = param1.charCodeAt(_loc2_);
            if(_loc4_ == 45)
            {
               if(!_loc8_)
               {
                  _loc7_ = true;
               }
               else
               {
                  _loc9_ = true;
               }
            }
            else if(_loc4_ == 69 || _loc4_ == 101)
            {
               _loc8_ = true;
            }
            else if(_loc4_ == 46)
            {
               _loc6_ = true;
            }
            else if(!_loc8_)
            {
               _loc3_ *= 10;
               _loc3_ += _loc4_ - 48;
               if(_loc6_)
               {
                  _loc5_ *= 10;
               }
            }
            else
            {
               _loc10_ *= 10;
               _loc10_ = _loc10_ + (_loc4_ - 48);
            }
            _loc2_++;
         }
         _loc3_ /= _loc5_;
         if(_loc7_)
         {
            _loc3_ = -_loc3_;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc10_)
         {
            _loc11_ *= 10;
            _loc2_++;
         }
         if(_loc9_)
         {
            _loc3_ /= _loc11_;
         }
         else
         {
            _loc3_ *= _loc11_;
         }
         return _loc3_;
      }
      
      public function loadImgFlashDat(param1:int, param2:int) : void
      {
         if(!this.bLoading)
         {
            if(this.IMAGE[param2].img == null)
            {
               if(this.imgFileData != null)
               {
                  this.imgFileData = null;
               }
               this.imgFileData = new this.EMBEDDATA[param1]() as ByteArray;
               this.bLoading = true;
               this.nLoadImgIndex = param2;
               this.nTotalImgFromfdat = 0;
               this.fdatLoadDone();
            }
            else
            {
               ++this.draw.nMainScene;
            }
         }
      }
      
      public function fdatLoadDone() : void
      {
         var _loc1_:int = 0;
         var _loc2_:uint = 0;
         _loc2_ = 0;
         if(Drawing.RES_COMPRESS)
         {
            this.imgFileData.uncompress();
         }
         this.nTotalImgFromfdat = uint(this.readInt32Len(this.imgFileData,_loc2_));
         _loc2_ += 4;
         this.loadByteFlashImg();
      }
      
      public function loadByteFlashImg() : void
      {
         this.bmpLoader = new Loader();
         this.bLoading = true;
         this.bmpLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.fbyteLoadDone);
         this.bmpLoader.loadBytes(this.createFlashBmpData(this.imgFileData));
      }
      
      public function createFlashBmpData(param1:ByteArray) : ByteArray
      {
         var _loc2_:int = 0;
         var _loc3_:uint = 0;
         var _loc4_:ByteArray = null;
         _loc3_ = FLASHIMG_DATALEN * this.nIntSize * this.nTotalImgFromfdat + this.nIntSize;
         _loc4_ = new ByteArray();
         _loc2_ = int(_loc3_);
         while(_loc2_ < this.imgFileData.length)
         {
            _loc4_[_loc2_ - _loc3_] = param1[_loc2_];
            _loc2_++;
         }
         return _loc4_;
      }
      
      public function fbyteLoadDone(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:uint = 0;
         var _loc6_:BitmapData = null;
         _loc5_ = this.nIntSize;
         _loc6_ = new BitmapData(this.bmpLoader.width,this.bmpLoader.height,true,0);
         _loc6_.draw(this.bmpLoader);
         _loc2_ = 0;
         while(_loc2_ < this.nTotalImgFromfdat)
         {
            _loc3_ = this.readInt32Len(this.imgFileData,_loc5_);
            _loc5_ += 4;
            _loc4_ = this.readInt32Len(this.imgFileData,_loc5_);
            _loc5_ += 4;
            this.IMAGE[this.nLoadImgIndex + _loc2_].nOrgW = this.readInt32Len(this.imgFileData,_loc5_);
            _loc5_ += 4;
            this.IMAGE[this.nLoadImgIndex + _loc2_].nOrgH = this.readInt32Len(this.imgFileData,_loc5_);
            _loc5_ += 4;
            this.IMAGE[this.nLoadImgIndex + _loc2_].nX = this.readInt32Len(this.imgFileData,_loc5_);
            _loc5_ += 4;
            this.IMAGE[this.nLoadImgIndex + _loc2_].nY = this.readInt32Len(this.imgFileData,_loc5_);
            _loc5_ += 4;
            this.IMAGE[this.nLoadImgIndex + _loc2_].nW = this.readInt32Len(this.imgFileData,_loc5_);
            _loc5_ += 4;
            this.IMAGE[this.nLoadImgIndex + _loc2_].nH = this.readInt32Len(this.imgFileData,_loc5_);
            _loc5_ += 4;
            this.IMAGE[this.nLoadImgIndex + _loc2_].img = new BitmapData(this.IMAGE[this.nLoadImgIndex + _loc2_].nW,this.IMAGE[this.nLoadImgIndex + _loc2_].nH,true,0);
            this.IMAGE[this.nLoadImgIndex + _loc2_].img.copyPixels(_loc6_,new Rectangle(_loc3_,_loc4_,this.IMAGE[this.nLoadImgIndex + _loc2_].nW,this.IMAGE[this.nLoadImgIndex + _loc2_].nH),new Point(0,0));
            _loc2_++;
         }
         this.bmpLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.fbyteLoadDone);
         this.bmpLoader = null;
         this.bLoading = false;
         ++this.draw.nMainScene;
      }
      
      public function loadImgDat(param1:String, param2:int) : void
      {
         var _loc3_:String = null;
         var _loc4_:URLRequest = null;
         if(!this.bLoading)
         {
            if(this.IMAGE[param2].img == null)
            {
               _loc3_ = this.URL_RESOURCE + "" + param1 + ".dat" + this.draw.RES_VERSION;
               this.datLoader = new URLLoader();
               this.datLoader.dataFormat = URLLoaderDataFormat.BINARY;
               _loc4_ = new URLRequest(_loc3_);
               this.bLoading = true;
               this.datLoader.addEventListener(Event.COMPLETE,this.datLoadDone);
               this.datLoader.load(_loc4_);
               this.nLoadImgIndex = param2;
               this.nLoadImgCount = 0;
            }
            else
            {
               ++this.draw.nMainScene;
            }
         }
      }
      
      public function datLoadDone(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         _loc3_ = 0;
         _loc4_ = 0;
         if(Drawing.RES_COMPRESS)
         {
            this.datLoader.data.uncompress();
         }
         _loc4_ = uint(this.readInt32Len(this.datLoader.data,_loc3_) + 1);
         _loc3_ += 4;
         this.IMGDATAPOS = new Array(_loc4_);
         _loc2_ = 0;
         while(_loc2_ < _loc4_)
         {
            this.IMGDATAPOS[_loc2_] = uint(this.readInt32Len(this.datLoader.data,_loc3_));
            _loc3_ += 4;
            _loc2_++;
         }
         this.datLoader.removeEventListener(Event.COMPLETE,this.datLoadDone);
         this.loadByteImg(this.nLoadImgCount);
      }
      
      public function loadByteImg(param1:int) : void
      {
         this.bmpLoader = new Loader();
         this.bLoading = true;
         this.bmpLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.byteLoadDone);
         this.bmpLoader.loadBytes(this.createBmpData(this.datLoader.data,this.IMGDATAPOS,param1));
      }
      
      public function byteLoadDone(param1:Event) : void
      {
         var _loc2_:BitmapData = null;
         _loc2_ = new BitmapData(this.bmpLoader.width,this.bmpLoader.height,true,0);
         _loc2_.draw(this.bmpLoader);
         this.IMAGE[this.nLoadImgIndex + this.nLoadImgCount].img = _loc2_;
         this.bmpLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.byteLoadDone);
         this.bmpLoader = null;
         ++this.nLoadImgCount;
         if(this.nLoadImgCount >= this.IMGDATAPOS.length - 1)
         {
            this.datLoader = null;
            this.IMGDATAPOS = null;
            this.bLoading = false;
            this.nLoadImgCount = 0;
            ++this.draw.nMainScene;
         }
         else
         {
            this.loadByteImg(this.nLoadImgCount);
         }
      }
      
      public function createBmpData(param1:ByteArray, param2:Array, param3:int) : ByteArray
      {
         var _loc4_:int = 0;
         var _loc5_:ByteArray = null;
         _loc5_ = new ByteArray();
         this.IMAGE[this.nLoadImgIndex + param3].nOrgW = this.readInt32Len(this.datLoader.data,param2[param3]);
         this.IMAGE[this.nLoadImgIndex + param3].nOrgH = this.readInt32Len(this.datLoader.data,param2[param3] + this.nIntSize);
         this.IMAGE[this.nLoadImgIndex + param3].nX = this.readInt32Len(this.datLoader.data,param2[param3] + this.nIntSize * 2);
         this.IMAGE[this.nLoadImgIndex + param3].nY = this.readInt32Len(this.datLoader.data,param2[param3] + this.nIntSize * 3);
         this.IMAGE[this.nLoadImgIndex + param3].nW = this.readInt32Len(this.datLoader.data,param2[param3] + this.nIntSize * 4);
         this.IMAGE[this.nLoadImgIndex + param3].nH = this.readInt32Len(this.datLoader.data,param2[param3] + this.nIntSize * 5);
         _loc4_ = 0;
         while(_loc4_ < param2[param3 + 1] - param2[param3] - this.nIntSize * 6)
         {
            _loc5_[_loc4_] = param1[param2[param3] + this.nIntSize * 6 + _loc4_];
            _loc4_++;
         }
         return _loc5_;
      }
      
      public function loadMusic(param1:int, param2:int) : void
      {
         var _loc3_:Sound = null;
         this.MUSIC[param2] = null;
         _loc3_ = new this.EMBEDSND[param1]();
         this.MUSIC[param2] = _loc3_;
      }
      
      public function loadEffect(param1:int, param2:int) : void
      {
         var _loc3_:Sound = null;
         this.SNDEFFECT[param2] = null;
         _loc3_ = new this.EMBEDSND[param1]();
         this.SNDEFFECT[param2] = _loc3_;
      }
      
      public function playMusic(param1:int, param2:Boolean) : void
      {
         if(param1 != this.nPlayingMusic)
         {
            if(this.MUSICCHANNEL[param1] != null)
            {
               this.MUSICCHANNEL[param1].stop();
            }
            this.MUSICCHANNEL[param1] = null;
            this.MUSICCHANNEL[param1] = new SoundChannel();
            if(param2)
            {
               this.MUSICCHANNEL[param1] = this.MUSIC[param1].play(0,2000000000);
            }
            else
            {
               this.MUSICCHANNEL[param1] = this.MUSIC[param1].play(0);
            }
            this.setMusicVolume();
            this.nPlayingMusic = param1;
         }
      }
      
      public function setMusicVolume() : void
      {
         var _loc1_:int = 0;
         var _loc2_:SoundTransform = null;
         _loc1_ = 0;
         while(_loc1_ < MAXSIZE_MUSICCHANNEL)
         {
            if(this.MUSICCHANNEL[_loc1_] != null)
            {
               _loc2_ = this.MUSICCHANNEL[_loc1_].soundTransform;
               _loc2_.volume = this.nMusicVolume / 6;
               _loc2_.pan = 0;
               this.MUSICCHANNEL[_loc1_].soundTransform = _loc2_;
            }
            _loc1_++;
         }
      }
      
      public function stopMusic() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < MAXSIZE_MUSICCHANNEL)
         {
            if(this.MUSICCHANNEL[_loc1_] != null)
            {
               this.MUSICCHANNEL[_loc1_].stop();
               this.MUSICCHANNEL[_loc1_] = null;
               this.nPlayingMusic = Drawing.INITDATA;
            }
            _loc1_++;
         }
      }
      
      public function pauseMusic(param1:int) : void
      {
         this.nMusicPosition = this.MUSICCHANNEL[param1].position;
         this.MUSICCHANNEL[param1].stop();
      }
      
      public function resumeMusic(param1:int) : void
      {
         this.MUSIC[param1].play(this.nMusicPosition);
      }
      
      public function playEffect(param1:int) : void
      {
         if(this.bPlayingSndEff[param1])
         {
            this.draw.player.nNowTime = getTimer();
            if(this.draw.player.nNowTime - this.nSndEffStartTime[param1] <= 100)
            {
               return;
            }
         }
         if(this.EFFECTCHANNEL[this.nEffectChannelPos] != null)
         {
            this.EFFECTCHANNEL[this.nEffectChannelPos].stop();
         }
         this.EFFECTCHANNEL[this.nEffectChannelPos] = null;
         this.EFFECTCHANNEL[this.nEffectChannelPos] = new SoundChannel();
         if(!this.draw.bGameMenu)
         {
            this.EFFECTCHANNEL[this.nEffectChannelPos] = this.SNDEFFECT[param1].play(0);
         }
         else if(param1 == 15)
         {
            this.EFFECTCHANNEL[this.nEffectChannelPos] = this.SNDEFFECT[param1].play(0);
         }
         this.bPlayingSndEff[param1] = true;
         this.nSndEffStartTime[param1] = getTimer();
         this.setEffectVolume(param1);
         ++this.nEffectChannelPos;
         if(this.nEffectChannelPos >= MAXSIZE_EFFECTCHANNEL)
         {
            this.nEffectChannelPos = 0;
         }
      }
      
      public function playEffectLoop(param1:int, param2:int) : void
      {
         if(this.bPlayingSndEff[param1])
         {
            this.draw.player.nNowTime = getTimer();
            if(this.draw.player.nNowTime - this.nSndEffStartTime[param1] <= 100)
            {
               return;
            }
         }
         if(this.EFFECTCHANNEL[this.nEffectChannelPos] != null)
         {
            this.EFFECTCHANNEL[this.nEffectChannelPos].stop();
         }
         this.EFFECTCHANNEL[this.nEffectChannelPos] = null;
         this.EFFECTCHANNEL[this.nEffectChannelPos] = new SoundChannel();
         if(!this.draw.bGameMenu)
         {
            this.EFFECTCHANNEL[this.nEffectChannelPos] = this.SNDEFFECT[param1].play(0,param2);
         }
         this.bPlayingSndEff[param1] = true;
         this.nSndEffStartTime[param1] = getTimer();
         this.setEffectVolume(param1);
         ++this.nEffectChannelPos;
         if(this.nEffectChannelPos >= MAXSIZE_EFFECTCHANNEL)
         {
            this.nEffectChannelPos = 0;
         }
      }
      
      public function setEffectVolume(param1:int) : void
      {
         var _loc2_:SoundTransform = null;
         _loc2_ = this.EFFECTCHANNEL[this.nEffectChannelPos].soundTransform;
         _loc2_.volume = this.nEffectVolume / 6;
         _loc2_.pan = 0;
         this.EFFECTCHANNEL[this.nEffectChannelPos].soundTransform = _loc2_;
      }
      
      public function sndEffectStop(param1:int) : void
      {
         if(this.EFFECTCHANNEL[param1] != null)
         {
            this.EFFECTCHANNEL[param1].stop();
            this.EFFECTCHANNEL[param1] = null;
         }
      }
      
      public function sndEffectAllStop() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < MAXSIZE_EFFECTCHANNEL)
         {
            if(this.EFFECTCHANNEL[_loc1_] != null)
            {
               this.EFFECTCHANNEL[_loc1_].stop();
               this.EFFECTCHANNEL[_loc1_] = null;
            }
            _loc1_++;
         }
      }
      
      public function setClip(param1:int, param2:int, param3:int, param4:int) : void
      {
         this.nRectX = param1;
         this.nRectY = param2;
         this.nRectW = param3;
         this.nRectH = param4;
      }
      
      public function resetClip() : void
      {
         this.setClip(0,0,this.draw.nLcdW,this.draw.nLcdH);
      }
      
      public function bDrawImg(param1:int, param2:int, param3:int, param4:int) : Boolean
      {
         if((param1 >= 0 && param1 < this.draw.nLcdW || param1 + param3 > 0 && param1 + param3 <= this.draw.nLcdW) && (param2 >= 0 && param2 < this.draw.nLcdH || param2 + param4 > 0 && param2 + param4 <= this.draw.nLcdH))
         {
            return true;
         }
         return true;
      }
      
      public function drawEmbedImg(param1:int, param2:int, param3:int, param4:int) : void
      {
         var _loc5_:Matrix = null;
         _loc5_ = new Matrix();
         param2 -= this.getHorAlign(Bitmap(new this.EMBEDIMG[param1]()).width,param4);
         param3 -= this.getVerAlign(Bitmap(new this.EMBEDIMG[param1]()).height,param4);
         _loc5_.translate(param2,param3);
         this.draw.backBuffer.bitmapData.draw(Bitmap(new this.EMBEDIMG[param1]()).bitmapData,_loc5_,null,null,null,this.BMP_FILTER);
         _loc5_ = null;
      }
      
      public function drawEmbedImgZoom(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         var _loc7_:Matrix = null;
         _loc7_ = new Matrix();
         param2 -= this.getHorAlign(Bitmap(new this.EMBEDIMG[param1]()).width * (param4 / 100),param6);
         param3 -= this.getVerAlign(Bitmap(new this.EMBEDIMG[param1]()).height * (param5 / 100),param6);
         _loc7_.scale(param4 / 100,param5 / 100);
         _loc7_.translate(param2,param3);
         this.draw.backBuffer.bitmapData.draw(Bitmap(new this.EMBEDIMG[param1]()).bitmapData,_loc7_,null,null,null,this.BMP_FILTER);
         _loc7_ = null;
      }
      
      public function drawEmbedImgAlpha(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         var _loc6_:Matrix = null;
         var _loc7_:ColorTransform = null;
         _loc6_ = new Matrix();
         _loc7_ = new ColorTransform();
         _loc7_.alphaMultiplier = param4 / 100;
         param2 -= this.getHorAlign(Bitmap(new this.EMBEDIMG[param1]()).width,param5);
         param3 -= this.getVerAlign(Bitmap(new this.EMBEDIMG[param1]()).height,param5);
         _loc6_.translate(param2,param3);
         this.draw.backBuffer.bitmapData.draw(Bitmap(new this.EMBEDIMG[param1]()).bitmapData,_loc6_,_loc7_,null,null,this.BMP_FILTER);
         _loc6_ = null;
      }
      
      public function drawEmbedImgZoomAlpha(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
         var _loc8_:Matrix = null;
         var _loc9_:ColorTransform = null;
         _loc8_ = new Matrix();
         _loc9_ = new ColorTransform();
         _loc9_.alphaMultiplier = param6 / 100;
         param2 -= this.getHorAlign(Bitmap(new this.EMBEDIMG[param1]()).width * (param4 / 100),param7);
         param3 -= this.getVerAlign(Bitmap(new this.EMBEDIMG[param1]()).height * (param5 / 100),param7);
         _loc8_.scale(param4 / 100,param5 / 100);
         _loc8_.translate(param2,param3);
         this.draw.backBuffer.bitmapData.draw(Bitmap(new this.EMBEDIMG[param1]()).bitmapData,_loc8_,_loc9_,null,null,this.BMP_FILTER);
         _loc8_ = null;
      }
      
      public function drawImg(param1:int, param2:int, param3:int, param4:int) : void
      {
         var _loc5_:Matrix = null;
         _loc5_ = new Matrix();
         param2 -= this.getHorAlign(this.IMAGE[param1].nOrgW,param4);
         param3 -= this.getVerAlign(this.IMAGE[param1].nOrgH,param4);
         if(!this.bDrawImg(param2 + this.IMAGE[param1].nX,param3 + this.IMAGE[param1].nY,this.IMAGE[param1].nW,this.IMAGE[param1].nH))
         {
            return;
         }
         _loc5_.translate(param2 + this.IMAGE[param1].nX,param3 + this.IMAGE[param1].nY);
         this.draw.backBuffer.bitmapData.draw(this.IMAGE[param1].img,_loc5_,null,null,null,this.BMP_FILTER);
         _loc5_ = null;
      }
      
      public function drawObjDmg(param1:int, param2:int, param3:int, param4:int) : void
      {
         var _loc5_:Matrix = null;
         var _loc6_:ColorTransform = null;
         _loc5_ = new Matrix();
         _loc6_ = new ColorTransform();
         _loc6_.greenOffset = -128;
         _loc6_.blueOffset = -128;
         param2 -= this.getHorAlign(this.IMAGE[param1].nOrgW,param4);
         param3 -= this.getVerAlign(this.IMAGE[param1].nOrgH,param4);
         if(!this.bDrawImg(param2 + this.IMAGE[param1].nX,param3 + this.IMAGE[param1].nY,this.IMAGE[param1].nW,this.IMAGE[param1].nH))
         {
            return;
         }
         _loc5_.translate(param2 + this.IMAGE[param1].nX,param3 + this.IMAGE[param1].nY);
         this.draw.backBuffer.bitmapData.draw(this.IMAGE[param1].img,_loc5_,_loc6_,null,null,this.BMP_FILTER);
         _loc5_ = null;
      }
      
      public function drawObjIceDmg(param1:int, param2:int, param3:int, param4:int) : void
      {
         var _loc5_:Matrix = null;
         var _loc6_:ColorTransform = null;
         _loc5_ = new Matrix();
         _loc6_ = new ColorTransform();
         _loc6_.redOffset = -128;
         _loc6_.greenOffset = -128;
         param2 -= this.getHorAlign(this.IMAGE[param1].nOrgW,param4);
         param3 -= this.getVerAlign(this.IMAGE[param1].nOrgH,param4);
         if(!this.bDrawImg(param2 + this.IMAGE[param1].nX,param3 + this.IMAGE[param1].nY,this.IMAGE[param1].nW,this.IMAGE[param1].nH))
         {
            return;
         }
         _loc5_.translate(param2 + this.IMAGE[param1].nX,param3 + this.IMAGE[param1].nY);
         this.draw.backBuffer.bitmapData.draw(this.IMAGE[param1].img,_loc5_,_loc6_,null,null,this.BMP_FILTER);
         _loc5_ = null;
      }
      
      public function drawClipImg(param1:int, param2:int, param3:int, param4:int) : void
      {
         var _loc5_:Matrix = null;
         var _loc6_:Rectangle = null;
         _loc5_ = new Matrix();
         param2 -= this.getHorAlign(this.IMAGE[param1].nOrgW,param4);
         param3 -= this.getVerAlign(this.IMAGE[param1].nOrgH,param4);
         if(!this.bDrawImg(param2 + this.IMAGE[param1].nX,param3 + this.IMAGE[param1].nY,this.IMAGE[param1].nW,this.IMAGE[param1].nH))
         {
            return;
         }
         _loc6_ = new Rectangle(this.nRectX,this.nRectY,this.nRectW,this.nRectH);
         _loc5_.translate(param2 + this.IMAGE[param1].nX,param3 + this.IMAGE[param1].nY);
         this.draw.backBuffer.bitmapData.draw(this.IMAGE[param1].img,_loc5_,null,null,_loc6_,this.BMP_FILTER);
         _loc5_ = null;
         _loc6_ = null;
      }
      
      public function drawClipImgAlpha(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         var _loc6_:Matrix = null;
         var _loc7_:ColorTransform = null;
         var _loc8_:Rectangle = null;
         _loc6_ = new Matrix();
         _loc7_ = new ColorTransform();
         _loc7_.alphaMultiplier = param4 / 100;
         param2 -= this.getHorAlign(this.IMAGE[param1].nOrgW,param5);
         param3 -= this.getVerAlign(this.IMAGE[param1].nOrgH,param5);
         if(!this.bDrawImg(param2 + this.IMAGE[param1].nX,param3 + this.IMAGE[param1].nY,this.IMAGE[param1].nW,this.IMAGE[param1].nH))
         {
            return;
         }
         _loc8_ = new Rectangle(this.nRectX,this.nRectY,this.nRectW,this.nRectH);
         _loc6_.translate(param2 + this.IMAGE[param1].nX,param3 + this.IMAGE[param1].nY);
         this.draw.backBuffer.bitmapData.draw(this.IMAGE[param1].img,_loc6_,_loc7_,null,_loc8_,this.BMP_FILTER);
         _loc6_ = null;
         _loc8_ = null;
      }
      
      public function drawBgBlur() : void
      {
         var _loc1_:Matrix = null;
         _loc1_ = new Matrix();
         switch(this.draw.nBlurFrame == 1)
         {
            case 0:
               ++this.draw.nBlurFrame;
               break;
            case 1:
               this.draw.backBuffer.alpha = 1;
               _loc1_.translate(0,0);
               this.draw.backBuffer2.bitmapData.draw(this.draw.backBuffer.bitmapData,_loc1_,null,null,null,this.BMP_FILTER);
               this.draw.backBuffer.alpha = 0.8;
               ++this.draw.nBlurFrame;
               break;
            case 2:
               this.draw.backBuffer2.alpha = 1;
               _loc1_.translate(0,0);
               this.draw.backBuffer3.bitmapData.draw(this.draw.backBuffer2.bitmapData,_loc1_,null,null,null,this.BMP_FILTER);
               this.draw.backBuffer.alpha = 1;
               _loc1_.translate(0,0);
               this.draw.backBuffer2.bitmapData.draw(this.draw.backBuffer.bitmapData,_loc1_,null,null,null,this.BMP_FILTER);
               this.draw.backBuffer2.alpha = 0.5;
               this.draw.backBuffer.alpha = 0.8;
         }
         _loc1_ = null;
      }
      
      public function drawImgAlpha(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         var _loc6_:Matrix = null;
         var _loc7_:ColorTransform = null;
         _loc6_ = new Matrix();
         _loc7_ = new ColorTransform();
         _loc7_.alphaMultiplier = param4 / 100;
         param2 -= this.getHorAlign(this.IMAGE[param1].nOrgW,param5);
         param3 -= this.getVerAlign(this.IMAGE[param1].nOrgH,param5);
         if(!this.bDrawImg(param2 + this.IMAGE[param1].nX,param3 + this.IMAGE[param1].nY,this.IMAGE[param1].nW,this.IMAGE[param1].nH))
         {
            return;
         }
         _loc6_.translate(param2 + this.IMAGE[param1].nX,param3 + this.IMAGE[param1].nY);
         this.draw.backBuffer.bitmapData.draw(this.IMAGE[param1].img,_loc6_,_loc7_,null,null,this.BMP_FILTER);
         _loc6_ = null;
      }
      
      public function drawImgDodge(param1:int, param2:int, param3:int, param4:String, param5:int) : void
      {
         var _loc6_:Matrix = null;
         _loc6_ = new Matrix();
         param2 -= this.getHorAlign(this.IMAGE[param1].nOrgW,param5);
         param3 -= this.getVerAlign(this.IMAGE[param1].nOrgH,param5);
         if(!this.bDrawImg(param2 + this.IMAGE[param1].nX,param3 + this.IMAGE[param1].nY,this.IMAGE[param1].nW,this.IMAGE[param1].nH))
         {
            return;
         }
         _loc6_.translate(param2 + this.IMAGE[param1].nX,param3 + this.IMAGE[param1].nY);
         this.draw.backBuffer.bitmapData.draw(this.IMAGE[param1].img,_loc6_,null,param4,null,this.BMP_FILTER);
         _loc6_ = null;
      }
      
      public function drawImgZoomDodge(param1:int, param2:int, param3:int, param4:int, param5:int, param6:String, param7:int) : void
      {
         var _loc8_:Matrix = null;
         _loc8_ = new Matrix();
         param2 -= this.getHorAlign(this.IMAGE[param1].nOrgW * (param4 / 100),param7);
         param3 -= this.getVerAlign(this.IMAGE[param1].nOrgH * (param5 / 100),param7);
         if(!this.bDrawImg(param2 + this.IMAGE[param1].nX * (param4 / 100),param3 + this.IMAGE[param1].nY * (param5 / 100),this.IMAGE[param1].nW * (param4 / 100),this.IMAGE[param1].nH * (param5 / 100)))
         {
            return;
         }
         _loc8_.scale(param4 / 100,param5 / 100);
         _loc8_.translate(param2 + this.IMAGE[param1].nX * (param4 / 100),param3 + this.IMAGE[param1].nY * (param5 / 100));
         this.draw.backBuffer.bitmapData.draw(this.IMAGE[param1].img,_loc8_,null,param6,null,this.BMP_FILTER);
         _loc8_ = null;
      }
      
      public function drawObjDmgZoomDodge(param1:int, param2:int, param3:int, param4:int, param5:int, param6:String, param7:int) : void
      {
         var _loc8_:Matrix = null;
         var _loc9_:ColorTransform = null;
         _loc8_ = new Matrix();
         _loc9_ = new ColorTransform();
         _loc9_.greenOffset = -128;
         _loc9_.blueOffset = -128;
         param2 -= this.getHorAlign(this.IMAGE[param1].nOrgW * (param4 / 100),param7);
         param3 -= this.getVerAlign(this.IMAGE[param1].nOrgH * (param5 / 100),param7);
         if(!this.bDrawImg(param2 + this.IMAGE[param1].nX * (param4 / 100),param3 + this.IMAGE[param1].nY * (param5 / 100),this.IMAGE[param1].nW * (param4 / 100),this.IMAGE[param1].nH * (param5 / 100)))
         {
            return;
         }
         _loc8_.scale(param4 / 100,param5 / 100);
         _loc8_.translate(param2 + this.IMAGE[param1].nX * (param4 / 100),param3 + this.IMAGE[param1].nY * (param5 / 100));
         this.draw.backBuffer.bitmapData.draw(this.IMAGE[param1].img,_loc8_,_loc9_,param6,null,this.BMP_FILTER);
         _loc8_ = null;
      }
      
      public function drawObjIceDmgZoomDodge(param1:int, param2:int, param3:int, param4:int, param5:int, param6:String, param7:int) : void
      {
         var _loc8_:Matrix = null;
         var _loc9_:ColorTransform = null;
         _loc8_ = new Matrix();
         _loc9_ = new ColorTransform();
         _loc9_.redOffset = -128;
         _loc9_.greenOffset = -128;
         param2 -= this.getHorAlign(this.IMAGE[param1].nOrgW * (param4 / 100),param7);
         param3 -= this.getVerAlign(this.IMAGE[param1].nOrgH * (param5 / 100),param7);
         if(!this.bDrawImg(param2 + this.IMAGE[param1].nX * (param4 / 100),param3 + this.IMAGE[param1].nY * (param5 / 100),this.IMAGE[param1].nW * (param4 / 100),this.IMAGE[param1].nH * (param5 / 100)))
         {
            return;
         }
         _loc8_.scale(param4 / 100,param5 / 100);
         _loc8_.translate(param2 + this.IMAGE[param1].nX * (param4 / 100),param3 + this.IMAGE[param1].nY * (param5 / 100));
         this.draw.backBuffer.bitmapData.draw(this.IMAGE[param1].img,_loc8_,_loc9_,param6,null,this.BMP_FILTER);
         _loc8_ = null;
      }
      
      public function drawImgZoomAlpha(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
         var _loc8_:Matrix = null;
         var _loc9_:ColorTransform = null;
         _loc8_ = new Matrix();
         _loc9_ = new ColorTransform();
         _loc9_.alphaMultiplier = param6 / 100;
         param2 -= this.getHorAlign(this.IMAGE[param1].nOrgW * (param4 / 100),param7);
         param3 -= this.getVerAlign(this.IMAGE[param1].nOrgH * (param5 / 100),param7);
         if(!this.bDrawImg(param2 + this.IMAGE[param1].nX * (param4 / 100),param3 + this.IMAGE[param1].nY * (param5 / 100),this.IMAGE[param1].nW * (param4 / 100),this.IMAGE[param1].nH * (param5 / 100)))
         {
            return;
         }
         _loc8_.scale(param4 / 100,param5 / 100);
         _loc8_.translate(param2 + this.IMAGE[param1].nX * (param4 / 100),param3 + this.IMAGE[param1].nY * (param5 / 100));
         this.draw.backBuffer.bitmapData.draw(this.IMAGE[param1].img,_loc8_,_loc9_,null,null,this.BMP_FILTER);
         _loc8_ = null;
      }
      
      public function drawImgZoom(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         var _loc7_:Matrix = null;
         _loc7_ = new Matrix();
         param2 -= this.getHorAlign(this.IMAGE[param1].nOrgW * (param4 / 100),param6);
         param3 -= this.getVerAlign(this.IMAGE[param1].nOrgH * (param5 / 100),param6);
         if(!this.bDrawImg(param2 + this.IMAGE[param1].nX * (param4 / 100),param3 + this.IMAGE[param1].nY * (param5 / 100),this.IMAGE[param1].nW * (param4 / 100),this.IMAGE[param1].nH * (param5 / 100)))
         {
            return;
         }
         _loc7_.scale(param4 / 100,param5 / 100);
         _loc7_.translate(param2 + this.IMAGE[param1].nX * (param4 / 100),param3 + this.IMAGE[param1].nY * (param5 / 100));
         this.draw.backBuffer.bitmapData.draw(this.IMAGE[param1].img,_loc7_,null,null,null,this.BMP_FILTER);
         _loc7_ = null;
      }
      
      public function drawObjDmgZoomAlpha(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
         var _loc8_:Matrix = null;
         var _loc9_:ColorTransform = null;
         _loc8_ = new Matrix();
         _loc9_ = new ColorTransform();
         _loc9_.alphaMultiplier = param6 / 100;
         _loc9_.greenOffset = -128;
         _loc9_.blueOffset = -128;
         param2 -= this.getHorAlign(this.IMAGE[param1].nOrgW * (param4 / 100),param7);
         param3 -= this.getVerAlign(this.IMAGE[param1].nOrgH * (param5 / 100),param7);
         if(!this.bDrawImg(param2 + this.IMAGE[param1].nX * (param4 / 100),param3 + this.IMAGE[param1].nY * (param5 / 100),this.IMAGE[param1].nW * (param4 / 100),this.IMAGE[param1].nH * (param5 / 100)))
         {
            return;
         }
         _loc8_.scale(param4 / 100,param5 / 100);
         _loc8_.translate(param2 + this.IMAGE[param1].nX * (param4 / 100),param3 + this.IMAGE[param1].nY * (param5 / 100));
         this.draw.backBuffer.bitmapData.draw(this.IMAGE[param1].img,_loc8_,_loc9_,null,null,this.BMP_FILTER);
         _loc8_ = null;
      }
      
      public function drawObjIceDmgZoomAlpha(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
         var _loc8_:Matrix = null;
         var _loc9_:ColorTransform = null;
         _loc8_ = new Matrix();
         _loc9_ = new ColorTransform();
         _loc9_.alphaMultiplier = param6 / 100;
         _loc9_.redOffset = -128;
         _loc9_.greenOffset = -128;
         param2 -= this.getHorAlign(this.IMAGE[param1].nOrgW * (param4 / 100),param7);
         param3 -= this.getVerAlign(this.IMAGE[param1].nOrgH * (param5 / 100),param7);
         if(!this.bDrawImg(param2 + this.IMAGE[param1].nX * (param4 / 100),param3 + this.IMAGE[param1].nY * (param5 / 100),this.IMAGE[param1].nW * (param4 / 100),this.IMAGE[param1].nH * (param5 / 100)))
         {
            return;
         }
         _loc8_.scale(param4 / 100,param5 / 100);
         _loc8_.translate(param2 + this.IMAGE[param1].nX * (param4 / 100),param3 + this.IMAGE[param1].nY * (param5 / 100));
         this.draw.backBuffer.bitmapData.draw(this.IMAGE[param1].img,_loc8_,_loc9_,null,null,this.BMP_FILTER);
         _loc8_ = null;
      }
      
      public function drawObjDmgZoom(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         var _loc7_:Matrix = null;
         var _loc8_:ColorTransform = null;
         _loc7_ = new Matrix();
         _loc8_ = new ColorTransform();
         _loc8_.greenOffset = -128;
         _loc8_.blueOffset = -128;
         param2 -= this.getHorAlign(this.IMAGE[param1].nOrgW * (param4 / 100),param6);
         param3 -= this.getVerAlign(this.IMAGE[param1].nOrgH * (param5 / 100),param6);
         if(!this.bDrawImg(param2 + this.IMAGE[param1].nX * (param4 / 100),param3 + this.IMAGE[param1].nY * (param5 / 100),this.IMAGE[param1].nW * (param4 / 100),this.IMAGE[param1].nH * (param5 / 100)))
         {
            return;
         }
         _loc7_.scale(param4 / 100,param5 / 100);
         _loc7_.translate(param2 + this.IMAGE[param1].nX * (param4 / 100),param3 + this.IMAGE[param1].nY * (param5 / 100));
         this.draw.backBuffer.bitmapData.draw(this.IMAGE[param1].img,_loc7_,_loc8_,null,null,this.BMP_FILTER);
         _loc7_ = null;
      }
      
      public function drawObjIceDmgZoom(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         var _loc7_:Matrix = null;
         var _loc8_:ColorTransform = null;
         _loc7_ = new Matrix();
         _loc8_ = new ColorTransform();
         _loc8_.redOffset = -128;
         _loc8_.greenOffset = -128;
         param2 -= this.getHorAlign(this.IMAGE[param1].nOrgW * (param4 / 100),param6);
         param3 -= this.getVerAlign(this.IMAGE[param1].nOrgH * (param5 / 100),param6);
         if(!this.bDrawImg(param2 + this.IMAGE[param1].nX * (param4 / 100),param3 + this.IMAGE[param1].nY * (param5 / 100),this.IMAGE[param1].nW * (param4 / 100),this.IMAGE[param1].nH * (param5 / 100)))
         {
            return;
         }
         _loc7_.scale(param4 / 100,param5 / 100);
         _loc7_.translate(param2 + this.IMAGE[param1].nX * (param4 / 100),param3 + this.IMAGE[param1].nY * (param5 / 100));
         this.draw.backBuffer.bitmapData.draw(this.IMAGE[param1].img,_loc7_,_loc8_,null,null,this.BMP_FILTER);
         _loc7_ = null;
      }
      
      public function drawAttackedImgZoomDodge(param1:Boolean, param2:int, param3:int, param4:int, param5:int, param6:int, param7:String, param8:int) : void
      {
         var _loc9_:Matrix = null;
         var _loc10_:ColorTransform = null;
         _loc9_ = new Matrix();
         _loc10_ = new ColorTransform();
         if(param1)
         {
            _loc10_.greenOffset = -64;
            _loc10_.blueOffset = -128;
         }
         else
         {
            _loc10_.redOffset = -32;
            _loc10_.greenOffset = -32;
         }
         param3 -= this.getHorAlign(this.IMAGE[param2].nOrgW * (param5 / 100),param8);
         param4 -= this.getVerAlign(this.IMAGE[param2].nOrgH * (param6 / 100),param8);
         if(!this.bDrawImg(param3 + this.IMAGE[param2].nX * (param5 / 100),param4 + this.IMAGE[param2].nY * (param6 / 100),this.IMAGE[param2].nW * (param5 / 100),this.IMAGE[param2].nH * (param6 / 100)))
         {
            return;
         }
         _loc9_.scale(param5 / 100,param6 / 100);
         _loc9_.translate(param3 + this.IMAGE[param2].nX * (param5 / 100),param4 + this.IMAGE[param2].nY * (param6 / 100));
         this.draw.backBuffer.bitmapData.draw(this.IMAGE[param2].img,_loc9_,_loc10_,param7,null,this.BMP_FILTER);
         _loc9_ = null;
      }
      
      public function drawImgMirror(param1:int, param2:int, param3:int, param4:int) : void
      {
         var _loc5_:int = 0;
         var _loc6_:Matrix = null;
         var _loc7_:Rectangle = null;
         param2 -= this.getHorAlign(this.IMAGE[param1].nOrgW,param4);
         param3 -= this.getVerAlign(this.IMAGE[param1].nOrgH,param4);
         if(!this.bDrawImg(param2 + this.IMAGE[param1].nX,param3 + this.IMAGE[param1].nY,this.IMAGE[param1].nW,this.IMAGE[param1].nH))
         {
            return;
         }
         _loc5_ = 0;
         while(_loc5_ < this.IMAGE[param1].nW)
         {
            _loc6_ = new Matrix();
            _loc7_ = new Rectangle(param2 + _loc5_,param3,1,this.IMAGE[param1].nH);
            _loc6_.translate(param2 - (this.IMAGE[param1].nW - 1) + _loc5_ * 2,param3);
            this.draw.backBuffer.bitmapData.draw(this.IMAGE[param1].img,_loc6_,null,null,_loc7_,this.BMP_FILTER);
            _loc6_ = null;
            _loc7_ = null;
            _loc5_++;
         }
      }
      
      public function drawObjDmgMirror(param1:int, param2:int, param3:int, param4:int) : void
      {
         var _loc5_:int = 0;
         var _loc6_:ColorTransform = null;
         var _loc7_:Matrix = null;
         var _loc8_:Rectangle = null;
         _loc6_ = new ColorTransform();
         _loc6_.greenOffset = -128;
         _loc6_.blueOffset = -128;
         param2 -= this.getHorAlign(this.IMAGE[param1].nOrgW,param4);
         param3 -= this.getVerAlign(this.IMAGE[param1].nOrgH,param4);
         if(!this.bDrawImg(param2 + this.IMAGE[param1].nX,param3 + this.IMAGE[param1].nY,this.IMAGE[param1].nW,this.IMAGE[param1].nH))
         {
            return;
         }
         _loc5_ = 0;
         while(_loc5_ < this.IMAGE[param1].nW)
         {
            _loc7_ = new Matrix();
            _loc8_ = new Rectangle(param2 + _loc5_,param3,1,this.IMAGE[param1].nH);
            _loc7_.translate(param2 - (this.IMAGE[param1].nW - 1) + _loc5_ * 2,param3);
            this.draw.backBuffer.bitmapData.draw(this.IMAGE[param1].img,_loc7_,_loc6_,null,_loc8_,this.BMP_FILTER);
            _loc7_ = null;
            _loc8_ = null;
            _loc5_++;
         }
      }
      
      public function drawImgRotationZoom(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         var _loc7_:Matrix = null;
         _loc7_ = new Matrix();
         if((param6 & 0xF0) == 32)
         {
            param2 += 0;
         }
         else if((param6 & 0xF0) == 48)
         {
            param2 += this.IMAGE[param1].nW * (param4 / 100) >> 1;
         }
         else
         {
            param2 += this.IMAGE[param1].nW * (param4 / 100);
         }
         if((param6 & 0x0F) == 2)
         {
            param3 += this.IMAGE[param1].nH * (param5 / 100) << 1;
         }
         else if((param6 & 0x0F) == 3)
         {
            param3 += this.IMAGE[param1].nH * (param5 / 100) >> 1;
         }
         else
         {
            param3 += this.IMAGE[param1].nH * (param5 / 100);
         }
         if(!this.bDrawImg(param2,param3,this.IMAGE[param1].nW * (param4 / 100),this.IMAGE[param1].nH * (param5 / 100)))
         {
            return;
         }
         _loc7_.rotate(Math.PI);
         _loc7_.scale(param4 / 100,param5 / 100);
         _loc7_.translate(param2,param3);
         this.draw.backBuffer.bitmapData.draw(this.IMAGE[param1].img,_loc7_,null,null,null,this.BMP_FILTER);
         _loc7_ = null;
      }
      
      public function drawNumImg(param1:String, param2:int, param3:int, param4:int, param5:int) : void
      {
         var _loc6_:int = 0;
         var _loc7_:Number = NaN;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:Array = null;
         var _loc12_:Array = null;
         var _loc13_:Array = null;
         var _loc14_:Array = null;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         _loc9_ = 0;
         _loc10_ = 0;
         _loc11_ = new Array(10,0,0,0,0,6,0,0,0,0);
         _loc12_ = new Array(47,57,48,57,48,57,47,57,48,57,47,57,47,57,48,57,48,57,47,57,48,57,47,57);
         _loc13_ = new Array(21,22,17,19,36,44,44,50,14,15,14,15,19,19,27,34,25,30,14,15,27,33,44,50);
         _loc14_ = new Array(16,22,13,19,36,44,44,50,12,15,11,15,13,19,25,34,23,30,14,15,25,33,40,50);
         _loc15_ = param1.length * _loc14_[param4 * 2] + (_loc13_[param4 * 2] - _loc14_[param4 * 2]);
         _loc16_ = int(_loc13_[param4 * 2 + 1]);
         switch(param4)
         {
            case Drawing.NUM_MONEY:
            case Drawing.NUM_ITEMPRICE:
               _loc9_ = 0;
               _loc6_ = 0;
               while(_loc6_ < param1.length)
               {
                  _loc7_ = param1.charCodeAt(_loc6_);
                  if(_loc7_ == 47)
                  {
                     _loc9_++;
                  }
                  _loc6_++;
               }
               _loc15_ -= _loc9_ * _loc11_[param4];
               this.draw.nMoneyDrawPosX = param2 = param2 - this.getHorAlign(_loc15_,param5);
               param3 -= this.getVerAlign(_loc16_,param5);
               _loc9_ = 0;
               _loc6_ = 0;
               while(_loc6_ < param1.length)
               {
                  _loc7_ = param1.charCodeAt(_loc6_);
                  _loc10_ = _loc14_[param4 * 2] * _loc6_ - _loc9_ * _loc11_[param4];
                  if(_loc7_ == 47)
                  {
                     _loc9_++;
                  }
                  if(_loc7_ >= _loc12_[param4 * 2] && _loc7_ <= _loc12_[param4 * 2 + 1])
                  {
                     _loc8_ = _loc7_ - _loc12_[param4 * 2];
                     this.setClip(param2 + _loc10_,param3,_loc13_[param4 * 2],_loc13_[param4 * 2 + 1]);
                     this.drawClipImg(Drawing.imgNum + param4,param2 + _loc10_ - _loc8_ * _loc13_[param4 * 2],param3,Drawing.TOP | Drawing.LEFT);
                  }
                  _loc6_++;
               }
               break;
            default:
               this.draw.nMoneyDrawPosX = param2 = param2 - this.getHorAlign(_loc15_,param5);
               param3 -= this.getVerAlign(_loc16_,param5);
               _loc6_ = 0;
               while(_loc6_ < param1.length)
               {
                  _loc7_ = param1.charCodeAt(_loc6_);
                  if(_loc7_ >= _loc12_[param4 * 2] && _loc7_ <= _loc12_[param4 * 2 + 1])
                  {
                     _loc8_ = _loc7_ - _loc12_[param4 * 2];
                     this.setClip(param2 + _loc14_[param4 * 2] * _loc6_,param3,_loc13_[param4 * 2],_loc13_[param4 * 2 + 1]);
                     this.drawClipImg(Drawing.imgNum + param4,param2 + _loc14_[param4 * 2] * _loc6_ - _loc8_ * _loc13_[param4 * 2],param3,Drawing.TOP | Drawing.LEFT);
                  }
                  _loc6_++;
               }
         }
         this.resetClip();
      }
      
      public function drawNumImgAlpha(param1:String, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         var _loc7_:Number = NaN;
         var _loc8_:int = 0;
         var _loc9_:Array = null;
         var _loc10_:Array = null;
         var _loc11_:Array = null;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         _loc9_ = new Array(47,57,48,57,48,57,47,57,48,57,47,57,47,57,48,57,48,57,47,57,47,57,47,57);
         _loc10_ = new Array(21,22,17,19,36,44,44,50,14,15,14,15,19,19,27,34,25,30,14,15,21,23,44,50);
         _loc11_ = new Array(16,22,13,19,36,44,44,50,12,15,11,15,13,19,25,34,23,30,14,15,21,23,40,50);
         _loc12_ = param1.length * _loc11_[param4 * 2] + (_loc10_[param4 * 2] - _loc11_[param4 * 2]);
         _loc13_ = int(_loc10_[param4 * 2 + 1]);
         this.draw.nMoneyDrawPosX = param2 = param2 - this.getHorAlign(_loc12_,param6);
         param3 -= this.getVerAlign(_loc13_,param6);
         _loc14_ = 0;
         while(_loc14_ < param1.length)
         {
            _loc7_ = param1.charCodeAt(_loc14_);
            if(_loc7_ >= _loc9_[param4 * 2] && _loc7_ <= _loc9_[param4 * 2 + 1])
            {
               _loc8_ = _loc7_ - _loc9_[param4 * 2];
               this.setClip(param2 + _loc11_[param4 * 2] * _loc14_,param3,_loc10_[param4 * 2],_loc10_[param4 * 2 + 1]);
               this.drawClipImgAlpha(Drawing.imgNum + param4,param2 + _loc11_[param4 * 2] * _loc14_ - _loc8_ * _loc10_[param4 * 2],param3,param5,Drawing.TOP | Drawing.LEFT);
            }
            _loc14_++;
         }
         this.resetClip();
      }
      
      public function xmlLoadDone(param1:Event) : void
      {
         this.xmlData = new XML(param1.target.data);
         this.bLoaded = true;
      }
      
      public function loadXml(param1:String) : void
      {
         var _loc2_:URLLoader = null;
         var _loc3_:URLRequest = null;
         this.bLoaded = false;
         _loc2_ = new URLLoader();
         _loc3_ = new URLRequest("http://192.168.0.251/paladog_sng/download/" + param1 + ".xml");
         _loc2_.addEventListener(Event.COMPLETE,this.xmlLoadDone);
         _loc2_.load(_loc3_);
      }
      
      public function aniLoadDone(param1:Event) : void
      {
         this.buffer = param1.target.data;
         this.bLoaded = true;
      }
      
      public function loadAni(param1:String) : void
      {
         var _loc2_:URLLoader = null;
         var _loc3_:URLRequest = null;
         this.bLoaded = false;
         _loc2_ = new URLLoader();
         _loc2_.dataFormat = URLLoaderDataFormat.BINARY;
         _loc3_ = new URLRequest("" + param1 + ".adf");
         _loc2_.addEventListener(Event.COMPLETE,this.aniLoadDone);
         _loc2_.load(_loc3_);
      }
      
      public function setAni(param1:Animation, param2:int) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         param1.nAniFrame = 0;
         param1.nDelayFrame = 0;
         this.nPos = 0;
         param1.nBmpCount = this.readByte(this.buffer) & 0xFF;
         param1.initBmpData();
         _loc3_ = 0;
         while(_loc3_ < param1.nBmpCount)
         {
            param1.imgData[_loc3_].nImageIndex = param2 + _loc3_;
            this.nPos += 2;
            _loc3_++;
         }
         param1.nTotalAniData = this.readByte(this.buffer) & 0xFF;
         param1.initAniData();
         _loc3_ = 0;
         while(_loc3_ < param1.nTotalAniData)
         {
            param1.aniData[_loc3_].nTotalFrame = this.readByte(this.buffer);
            param1.initFrameData(_loc3_);
            _loc4_ = 0;
            while(_loc4_ < param1.aniData[_loc3_].nTotalFrame)
            {
               param1.aniData[_loc3_].frameData[_loc4_].nObjectCount = this.readByte(this.buffer);
               param1.aniData[_loc3_].frameData[_loc4_].nOption = this.readByte(this.buffer);
               _loc5_ = 0;
               while(_loc5_ < param1.aniData[_loc3_].frameData[_loc4_].nObjectCount)
               {
                  param1.aniData[_loc3_].frameData[_loc4_].objectData[_loc5_ * 3] = this.readInt16(this.buffer);
                  param1.aniData[_loc3_].frameData[_loc4_].objectData[_loc5_ * 3 + 1] = this.readInt16(this.buffer);
                  param1.aniData[_loc3_].frameData[_loc4_].objectData[_loc5_ * 3 + 2] = this.readByte(this.buffer) & 0xFF;
                  _loc5_++;
               }
               _loc4_++;
            }
            _loc3_++;
         }
      }
      
      public function drawASEAni(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:Boolean) : void
      {
         var _loc10_:int = 0;
         this.draw.ASEANI[param1].nAniFrame = param4 % this.draw.ASEANI[param1].DRAWANI[param2][0].length;
         _loc10_ = 0;
         while(_loc10_ < this.draw.ASEANI[param1].DRAWANI[param2].length)
         {
            if(this.draw.ASEANI[param1].DRAWANI[param2][_loc10_][this.draw.ASEANI[param1].nAniFrame][ANIVALUE_IMGINDEX] >= 0)
            {
               this.drawASEAniFrame(this.draw.ASEANI[param1].DRAWANI[param2][_loc10_][this.draw.ASEANI[param1].nAniFrame][ANIVALUE_IMGINDEX] + param3,this.draw.ASEANI[param1].DRAWANI[param2][_loc10_][this.draw.ASEANI[param1].nAniFrame][ANIVALUE_POSX] * (param7 / 100) + param5,this.draw.ASEANI[param1].DRAWANI[param2][_loc10_][this.draw.ASEANI[param1].nAniFrame][ANIVALUE_POSY] * (param8 / 100) + param6,this.draw.ASEANI[param1].DRAWANI[param2][_loc10_][this.draw.ASEANI[param1].nAniFrame][ANIVALUE_SCALEX] / 10000,this.draw.ASEANI[param1].DRAWANI[param2][_loc10_][this.draw.ASEANI[param1].nAniFrame][ANIVALUE_SCALEY] / 10000,this.draw.ASEANI[param1].DRAWANI[param2][_loc10_][this.draw.ASEANI[param1].nAniFrame][ANIVALUE_ANGLE] / 10000,this.draw.ASEANI[param1].DRAWANI[param2][_loc10_][this.draw.ASEANI[param1].nAniFrame][ANIVALUE_ALPHA] / 100,this.draw.ASEANI[param1].DRAWANI[param2][_loc10_][this.draw.ASEANI[param1].nAniFrame][ANIVALUE_FLIPX],this.draw.ASEANI[param1].DRAWANI[param2][_loc10_][this.draw.ASEANI[param1]
               .nAniFrame][ANIVALUE_FLIPY],Drawing.VCENTER | Drawing.HCENTER,param7 / 100,param8 / 100,param9);
            }
            _loc10_++;
         }
      }
      
      public function drawASEAniMirror(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:Boolean) : void
      {
         var _loc10_:int = 0;
         this.draw.ASEANI[param1].nAniFrame = param4 % this.draw.ASEANI[param1].DRAWANI[param2][0].length;
         _loc10_ = 0;
         while(_loc10_ < this.draw.ASEANI[param1].DRAWANI[param2].length)
         {
            if(this.draw.ASEANI[param1].DRAWANI[param2][_loc10_][this.draw.ASEANI[param1].nAniFrame][ANIVALUE_IMGINDEX] >= 0)
            {
               this.drawASEAniFrameMirror(this.draw.ASEANI[param1].DRAWANI[param2][_loc10_][this.draw.ASEANI[param1].nAniFrame][ANIVALUE_IMGINDEX] + param3,this.draw.ASEANI[param1].DRAWANI[param2][_loc10_][this.draw.ASEANI[param1].nAniFrame][ANIVALUE_POSX] * (param7 / 100),this.draw.ASEANI[param1].DRAWANI[param2][_loc10_][this.draw.ASEANI[param1].nAniFrame][ANIVALUE_POSY] * (param8 / 100) + param6,this.draw.ASEANI[param1].DRAWANI[param2][_loc10_][this.draw.ASEANI[param1].nAniFrame][ANIVALUE_SCALEX] / 10000,this.draw.ASEANI[param1].DRAWANI[param2][_loc10_][this.draw.ASEANI[param1].nAniFrame][ANIVALUE_SCALEY] / 10000,this.draw.ASEANI[param1].DRAWANI[param2][_loc10_][this.draw.ASEANI[param1].nAniFrame][ANIVALUE_ANGLE] / 10000,this.draw.ASEANI[param1].DRAWANI[param2][_loc10_][this.draw.ASEANI[param1].nAniFrame][ANIVALUE_ALPHA] / 100,this.draw.ASEANI[param1].DRAWANI[param2][_loc10_][this.draw.ASEANI[param1].nAniFrame][ANIVALUE_FLIPX],this.draw.ASEANI[param1].DRAWANI[param2][_loc10_][this.draw.ASEANI[param1]
               .nAniFrame][ANIVALUE_FLIPY],Drawing.VCENTER | Drawing.HCENTER,param7 / 100,param8 / 100,param9,param5);
            }
            _loc10_++;
         }
      }
      
      public function drawASEAniBoss(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:Boolean, param10:String, param11:int) : void
      {
         var _loc12_:int = 0;
         this.draw.ASEANI[param1].nAniFrame = param4 % this.draw.ASEANI[param1].DRAWANI[param2][0].length;
         _loc12_ = 0;
         while(_loc12_ < this.draw.ASEANI[param1].DRAWANI[param2].length)
         {
            if(this.draw.ASEANI[param1].DRAWANI[param2][_loc12_][this.draw.ASEANI[param1].nAniFrame][ANIVALUE_IMGINDEX] >= 0)
            {
               this.drawASEAniFrameBoss(this.draw.ASEANI[param1].DRAWANI[param2][_loc12_][this.draw.ASEANI[param1].nAniFrame][ANIVALUE_IMGINDEX] + param3,this.draw.ASEANI[param1].DRAWANI[param2][_loc12_][this.draw.ASEANI[param1].nAniFrame][ANIVALUE_POSX] * (param7 / 100) + param5,this.draw.ASEANI[param1].DRAWANI[param2][_loc12_][this.draw.ASEANI[param1].nAniFrame][ANIVALUE_POSY] * (param8 / 100) + param6,this.draw.ASEANI[param1].DRAWANI[param2][_loc12_][this.draw.ASEANI[param1].nAniFrame][ANIVALUE_SCALEX] / 10000,this.draw.ASEANI[param1].DRAWANI[param2][_loc12_][this.draw.ASEANI[param1].nAniFrame][ANIVALUE_SCALEY] / 10000,this.draw.ASEANI[param1].DRAWANI[param2][_loc12_][this.draw.ASEANI[param1].nAniFrame][ANIVALUE_ANGLE] / 10000,this.draw.ASEANI[param1].DRAWANI[param2][_loc12_][this.draw.ASEANI[param1].nAniFrame][ANIVALUE_ALPHA] / 100,this.draw.ASEANI[param1].DRAWANI[param2][_loc12_][this.draw.ASEANI[param1].nAniFrame][ANIVALUE_FLIPX],this.draw.ASEANI[param1].DRAWANI[param2][_loc12_][this.draw.ASEANI[param1]
               .nAniFrame][ANIVALUE_FLIPY],Drawing.VCENTER | Drawing.HCENTER,param7 / 100,param8 / 100,param9,param10,param11 / 100);
            }
            _loc12_++;
         }
      }
      
      public function drawASEAniFrame(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:int, param9:int, param10:int, param11:Number, param12:Number, param13:Boolean) : void
      {
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Matrix = null;
         var _loc17_:ColorTransform = null;
         var _loc18_:Number = NaN;
         var _loc19_:int = 0;
         if(param1 >= Drawing.imgTitleLogo + 2 && param1 <= Drawing.imgTitleLogo + 7)
         {
            param7 = 20 / 100;
         }
         _loc16_ = new Matrix();
         _loc17_ = new ColorTransform();
         _loc17_.alphaMultiplier = param7;
         if(param13)
         {
            _loc17_.greenOffset = -128;
            _loc17_.blueOffset = -128;
         }
         param4 *= param11;
         param5 *= param12;
         param2 -= this.getHorAlign(this.IMAGE[param1].nOrgW * param4,param10);
         param3 -= this.getVerAlign(this.IMAGE[param1].nOrgH * param5,param10);
         _loc18_ = 0;
         if(param8 == 1)
         {
            _loc18_ = this.IMAGE[param1].nW * param4;
         }
         if(param8 == 1)
         {
            _loc14_ = -((this.IMAGE[param1].nOrgW * param4 >> 1) - (this.IMAGE[param1].nX * param4 + this.IMAGE[param1].nW * param4));
         }
         else
         {
            _loc14_ = (this.IMAGE[param1].nOrgW * param4 >> 1) - this.IMAGE[param1].nX * param4;
         }
         _loc15_ = (this.IMAGE[param1].nOrgH * param5 >> 1) - this.IMAGE[param1].nY * param5;
         if(param8 == 1)
         {
            _loc16_.scale(-param4,param5);
            _loc16_.translate(_loc18_,0);
         }
         else
         {
            _loc16_.scale(param4,param5);
         }
         _loc16_.translate(-_loc14_,-_loc15_);
         param6 = 2 * Math.PI * (param6 / 360);
         _loc16_.rotate(param6);
         if(param8 == 1)
         {
            _loc19_ = this.IMAGE[param1].nOrgW * param4 - (this.IMAGE[param1].nX * param4 + this.IMAGE[param1].nW * param4);
            _loc16_.translate(param2 + _loc19_ * param4 + _loc14_,param3 + this.IMAGE[param1].nY * param5 + _loc15_);
         }
         else
         {
            _loc16_.translate(param2 + this.IMAGE[param1].nX * param4 + _loc14_,param3 + this.IMAGE[param1].nY * param5 + _loc15_);
         }
         this.draw.backBuffer.bitmapData.draw(this.IMAGE[param1].img,_loc16_,_loc17_,null,null,this.BMP_FILTER);
         _loc16_ = null;
      }
      
      public function drawASEAniEffect(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:Boolean) : void
      {
         var _loc10_:int = 0;
         this.draw.ASEANI[param1].nAniFrame = param4 % this.draw.ASEANI[param1].DRAWANI[param2][0].length;
         _loc10_ = 0;
         while(_loc10_ < this.draw.ASEANI[param1].DRAWANI[param2].length)
         {
            if(this.draw.ASEANI[param1].DRAWANI[param2][_loc10_][this.draw.ASEANI[param1].nAniFrame][ANIVALUE_IMGINDEX] >= 0)
            {
               this.drawASEAniFrameEffect(this.draw.ASEANI[param1].DRAWANI[param2][_loc10_][this.draw.ASEANI[param1].nAniFrame][ANIVALUE_IMGINDEX] + param3,this.draw.ASEANI[param1].DRAWANI[param2][_loc10_][this.draw.ASEANI[param1].nAniFrame][ANIVALUE_POSX] * (param7 / 100) + param5,this.draw.ASEANI[param1].DRAWANI[param2][_loc10_][this.draw.ASEANI[param1].nAniFrame][ANIVALUE_POSY] * (param8 / 100) + param6,this.draw.ASEANI[param1].DRAWANI[param2][_loc10_][this.draw.ASEANI[param1].nAniFrame][ANIVALUE_SCALEX] / 10000,this.draw.ASEANI[param1].DRAWANI[param2][_loc10_][this.draw.ASEANI[param1].nAniFrame][ANIVALUE_SCALEY] / 10000,this.draw.ASEANI[param1].DRAWANI[param2][_loc10_][this.draw.ASEANI[param1].nAniFrame][ANIVALUE_ANGLE] / 10000,this.draw.ASEANI[param1].DRAWANI[param2][_loc10_][this.draw.ASEANI[param1].nAniFrame][ANIVALUE_ALPHA] / 100,this.draw.ASEANI[param1].DRAWANI[param2][_loc10_][this.draw.ASEANI[param1].nAniFrame][ANIVALUE_FLIPX],this.draw.ASEANI[param1].DRAWANI[param2][_loc10_][this.draw.ASEANI[param1]
               .nAniFrame][ANIVALUE_FLIPY],Drawing.VCENTER | Drawing.HCENTER,param7 / 100,param8 / 100,param9);
            }
            _loc10_++;
         }
      }
      
      public function drawASEAniFrameEffect(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:int, param9:int, param10:int, param11:Number, param12:Number, param13:Boolean) : void
      {
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Matrix = null;
         var _loc17_:ColorTransform = null;
         if(param1 >= Drawing.imgTitleLogo + 2 && param1 <= Drawing.imgTitleLogo + 7)
         {
            param7 = 20 / 100;
         }
         _loc16_ = new Matrix();
         _loc17_ = new ColorTransform();
         _loc17_.alphaMultiplier = param7;
         if(param13)
         {
            _loc17_.greenOffset = -128;
            _loc17_.blueOffset = -128;
         }
         param4 *= param11;
         param5 *= param12;
         param2 -= this.getHorAlign(this.IMAGE[param1].nOrgW * param4,param10);
         param3 -= this.getVerAlign(this.IMAGE[param1].nOrgH * param5,param10);
         _loc14_ = (this.IMAGE[param1].nOrgW * param4 >> 1) - this.IMAGE[param1].nX * param4;
         _loc15_ = (this.IMAGE[param1].nOrgH * param5 >> 1) - this.IMAGE[param1].nY * param5;
         _loc16_.scale(param4,param5);
         _loc16_.translate(-_loc14_,-_loc15_);
         param6 = 2 * Math.PI * (param6 / 360);
         _loc16_.rotate(param6);
         _loc16_.translate(param2 + this.IMAGE[param1].nX * param4 + _loc14_,param3 + this.IMAGE[param1].nY * param5 + _loc15_);
         this.draw.backBuffer.bitmapData.draw(this.IMAGE[param1].img,_loc16_,_loc17_,BlendMode.ADD,null,this.BMP_FILTER);
         _loc16_ = null;
      }
      
      public function drawASEAniFrameMirror(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:int, param9:int, param10:int, param11:Number, param12:Number, param13:Boolean, param14:int) : void
      {
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Matrix = null;
         var _loc19_:ColorTransform = null;
         _loc18_ = new Matrix(-1,0,0,1,this.IMAGE[param1].nW,0);
         _loc19_ = new ColorTransform();
         _loc19_.alphaMultiplier = param7;
         if(param13)
         {
            _loc19_.greenOffset = -128;
            _loc19_.blueOffset = -128;
         }
         param4 *= param11;
         param5 *= param12;
         param2 *= -1;
         param2 += param14;
         param2 -= this.getHorAlign(this.IMAGE[param1].nOrgW * param4,param10);
         param3 -= this.getVerAlign(this.IMAGE[param1].nOrgH * param5,param10);
         _loc15_ = this.IMAGE[param1].nOrgW - (this.IMAGE[param1].nX + this.IMAGE[param1].nW);
         _loc16_ = (this.IMAGE[param1].nOrgW * param4 >> 1) - _loc15_ * param4;
         _loc17_ = (this.IMAGE[param1].nOrgH * param5 >> 1) - this.IMAGE[param1].nY * param5;
         _loc18_.scale(param4,param5);
         _loc18_.translate(-_loc16_,-_loc17_);
         param6 = -(2 * Math.PI * (param6 / 360));
         _loc18_.rotate(param6);
         _loc18_.translate(param2 + _loc15_ * param4 + _loc16_,param3 + this.IMAGE[param1].nY * param5 + _loc17_);
         this.draw.backBuffer.bitmapData.draw(this.IMAGE[param1].img,_loc18_,_loc19_,null,null,this.BMP_FILTER);
         _loc18_ = null;
      }
      
      public function drawASEAniFrameBoss(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:int, param9:int, param10:int, param11:Number, param12:Number, param13:Boolean, param14:String, param15:Number) : void
      {
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Matrix = null;
         var _loc19_:ColorTransform = null;
         _loc18_ = new Matrix();
         _loc19_ = new ColorTransform();
         if(param14 == BlendMode.ALPHA)
         {
            _loc19_.alphaMultiplier = param7 * param15;
            param14 = null;
         }
         else
         {
            _loc19_.alphaMultiplier = param7;
            if(param14 != BlendMode.ADD)
            {
               param14 = null;
            }
         }
         if(param13)
         {
            _loc19_.greenOffset = -128;
            _loc19_.blueOffset = -128;
         }
         param4 *= param11;
         param5 *= param12;
         param2 -= this.getHorAlign(this.IMAGE[param1].nOrgW * param4,param10);
         param3 -= this.getVerAlign(this.IMAGE[param1].nOrgH * param5,param10);
         _loc16_ = (this.IMAGE[param1].nOrgW * param4 >> 1) - this.IMAGE[param1].nX * param4;
         _loc17_ = (this.IMAGE[param1].nOrgH * param5 >> 1) - this.IMAGE[param1].nY * param5;
         _loc18_.scale(param4,param5);
         _loc18_.translate(-_loc16_,-_loc17_);
         param6 = 2 * Math.PI * (param6 / 360);
         _loc18_.rotate(param6);
         _loc18_.translate(param2 + this.IMAGE[param1].nX * param4 + _loc16_,param3 + this.IMAGE[param1].nY * param5 + _loc17_);
         this.draw.backBuffer.bitmapData.draw(this.IMAGE[param1].img,_loc18_,_loc19_,param14,null,this.BMP_FILTER);
         _loc18_ = null;
      }
      
      public function drawAni(param1:Sprite, param2:Animation, param3:int, param4:int, param5:int) : Boolean
      {
         this.drawAniFrame(param1,param2,param2.aniData[param3],param2.nAniFrame,param4,param5);
         if(!this.draw.bGameMenu)
         {
            ++param2.nAniFrame;
         }
         if(param2.nAniFrame == param2.aniData[param3].nTotalFrame)
         {
            param2.nAniFrame = 0;
            return true;
         }
         return false;
      }
      
      public function drawAniFrame(param1:Sprite, param2:Animation, param3:AniData, param4:int, param5:int, param6:int) : void
      {
         var _loc7_:FrameData = null;
         var _loc8_:int = 0;
         _loc7_ = param3.frameData[param4];
         _loc8_ = 0;
         while(_loc8_ < _loc7_.nObjectCount)
         {
            this.drawImg(param2.imgData[param3.frameData[param4].objectData[_loc8_ * 3 + 2]].nImageIndex,param3.frameData[param4].objectData[_loc8_ * 3] + param5,param3.frameData[param4].objectData[_loc8_ * 3 + 1] + param6,Drawing.TOP | Drawing.LEFT);
            _loc8_++;
         }
      }
      
      public function drawString(param1:String, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:TextField = null;
         var _loc10_:TextFormat = null;
         var _loc11_:BitmapData = null;
         var _loc12_:Matrix = null;
         var _loc13_:ColorTransform = null;
         _loc7_ = 20;
         _loc8_ = 30;
         _loc9_ = new TextField();
         _loc9_.width = param1.length * _loc7_ + _loc7_;
         _loc9_.height = _loc8_;
         _loc9_.text = param1;
         _loc9_.antiAliasType = AntiAliasType.ADVANCED;
         _loc9_.autoSize = TextFieldAutoSize.LEFT;
         _loc9_.background = false;
         _loc10_ = new TextFormat();
         _loc10_.color = param4;
         _loc10_.size = _loc7_;
         _loc10_.bold = true;
         _loc9_.setTextFormat(_loc10_);
         _loc11_ = new BitmapData(_loc9_.width,_loc9_.height,true,0);
         _loc11_.draw(_loc9_);
         _loc12_ = new Matrix();
         _loc13_ = new ColorTransform();
         _loc13_.alphaMultiplier = param5 / 100;
         param2 -= this.getHorAlign(_loc11_.width,param6);
         param3 -= this.getVerAlign(_loc11_.height,param6);
         if(!this.bDrawImg(param2,param3,_loc11_.width,_loc11_.height))
         {
            return;
         }
         _loc12_.translate(param2,param3);
         this.draw.backBuffer.bitmapData.draw(_loc11_,_loc12_,_loc13_,null,null,this.BMP_FILTER);
         _loc11_.dispose();
         _loc12_ = null;
      }
      
      public function drawBorderString(param1:String, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
         var _loc8_:int = 0;
         _loc8_ = 0;
         while(_loc8_ < 2)
         {
            this.drawString(param1,param2 - 1 + _loc8_ * 2,param3 - 1,param4,param6,param7);
            this.drawString(param1,param2 - 1 + _loc8_ * 2,param3,param4,param6,param7);
            this.drawString(param1,param2 - 1 + _loc8_ * 2,param3 + 1,param4,param6,param7);
            _loc8_++;
         }
         this.drawString(param1,param2,param3,param5,param6,param7);
      }
      
      public function drawIntroString(param1:String, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
         var _loc8_:int = 0;
         _loc8_ = 0;
         while(_loc8_ < 2)
         {
            if(param6 < 1)
            {
               this.drawString24(param1,param2 - 2 + _loc8_ * 4,param3 - 2,param4,param6 / 90,param7);
               this.drawString24(param1,param2 - 2 + _loc8_ * 4,param3 + 2,param4,param6 / 90,param7);
            }
            else
            {
               this.drawString24(param1,param2 - 2 + _loc8_ * 4,param3 - 2,param4,param6,param7);
               this.drawString24(param1,param2 - 2 + _loc8_ * 4,param3 - 1,param4,param6,param7);
               this.drawString24(param1,param2 - 2 + _loc8_ * 4,param3,param4,param6,param7);
               this.drawString24(param1,param2 - 2 + _loc8_ * 4,param3 + 1,param4,param6,param7);
               this.drawString24(param1,param2 - 2 + _loc8_ * 4,param3 + 2,param4,param6,param7);
            }
            _loc8_++;
         }
         _loc8_ = 0;
         while(_loc8_ < 2)
         {
            if(param6 < 1)
            {
               this.drawString24(param1,param2 - 1 + _loc8_ * 2,param3 - 2,param4,param6 / 90,param7);
               this.drawString24(param1,param2 - 1 + _loc8_ * 2,param3 + 2,param4,param6 / 90,param7);
            }
            else
            {
               this.drawString24(param1,param2 - 1 + _loc8_ * 2,param3 - 2,param4,param6,param7);
               this.drawString24(param1,param2 - 1 + _loc8_ * 2,param3 - 1,param4,param6,param7);
               this.drawString24(param1,param2 - 1 + _loc8_ * 2,param3,param4,param6,param7);
               this.drawString24(param1,param2 - 1 + _loc8_ * 2,param3 + 1,param4,param6,param7);
               this.drawString24(param1,param2 - 1 + _loc8_ * 2,param3 + 2,param4,param6,param7);
            }
            _loc8_++;
         }
         this.drawString24(param1,param2,param3,param5,param6,param7);
      }
      
      public function drawString24(param1:String, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:TextField = null;
         var _loc10_:TextFormat = null;
         var _loc11_:BitmapData = null;
         var _loc12_:Matrix = null;
         var _loc13_:ColorTransform = null;
         _loc7_ = 24;
         _loc8_ = 30;
         _loc9_ = new TextField();
         _loc9_.width = param1.length * (_loc7_ - 13);
         _loc9_.height = _loc8_;
         _loc9_.text = param1;
         _loc9_.antiAliasType = AntiAliasType.NORMAL;
         _loc9_.autoSize = TextFieldAutoSize.LEFT;
         _loc9_.background = false;
         _loc10_ = new TextFormat();
         _loc10_.color = param4;
         _loc10_.size = _loc7_;
         _loc10_.bold = true;
         _loc9_.setTextFormat(_loc10_);
         _loc11_ = new BitmapData(_loc9_.width,_loc9_.height,true,0);
         _loc11_.draw(_loc9_);
         _loc12_ = new Matrix();
         _loc13_ = new ColorTransform();
         _loc13_.alphaMultiplier = param5 / 100;
         param2 -= this.getHorAlign(_loc11_.width,param6);
         param3 -= this.getVerAlign(_loc11_.height,param6);
         if(!this.bDrawImg(param2,param3,_loc11_.width,_loc11_.height))
         {
            return;
         }
         _loc12_.translate(param2,param3);
         this.draw.backBuffer.bitmapData.draw(_loc11_,_loc12_,_loc13_,null,null,this.BMP_FILTER);
         _loc11_.dispose();
         _loc12_ = null;
      }
      
      public function drawString30(param1:String, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:TextField = null;
         var _loc10_:TextFormat = null;
         var _loc11_:BitmapData = null;
         var _loc12_:Matrix = null;
         var _loc13_:ColorTransform = null;
         _loc7_ = 35;
         _loc8_ = 45;
         _loc9_ = new TextField();
         _loc9_.width = param1.length * (_loc7_ - 13);
         _loc9_.height = _loc8_;
         _loc9_.text = param1;
         _loc9_.antiAliasType = AntiAliasType.NORMAL;
         _loc9_.autoSize = TextFieldAutoSize.LEFT;
         _loc9_.background = false;
         _loc10_ = new TextFormat();
         _loc10_.color = param4;
         _loc10_.size = _loc7_;
         _loc10_.bold = true;
         _loc9_.setTextFormat(_loc10_);
         _loc11_ = new BitmapData(_loc9_.width,_loc9_.height,true,0);
         _loc11_.draw(_loc9_);
         _loc12_ = new Matrix();
         _loc13_ = new ColorTransform();
         _loc13_.alphaMultiplier = param5 / 100;
         param2 -= this.getHorAlign(_loc11_.width,param6);
         param3 -= this.getVerAlign(_loc11_.height,param6);
         if(!this.bDrawImg(param2,param3,_loc11_.width,_loc11_.height))
         {
            return;
         }
         _loc12_.translate(param2,param3);
         this.draw.backBuffer.bitmapData.draw(_loc11_,_loc12_,_loc13_,null,null,this.BMP_FILTER);
         _loc11_.dispose();
         _loc12_ = null;
      }
      
      public function getRand(param1:int) : int
      {
         return Math.floor(Math.random() * param1);
      }
      
      public function loadTxt(param1:String) : void
      {
         var _loc2_:URLLoader = null;
         var _loc3_:URLRequest = null;
         this.bLoaded = false;
         System.useCodePage = true;
         _loc2_ = new URLLoader();
         _loc2_.dataFormat = URLLoaderDataFormat.TEXT;
         _loc3_ = new URLRequest("txt/" + param1 + ".txt");
         _loc2_.addEventListener(Event.COMPLETE,this.txtLoadDone);
         _loc2_.load(_loc3_);
      }
      
      public function txtLoadDone(param1:Event) : void
      {
         this.loadStr = null;
         this.loadStr = param1.target.data;
         this.loadStr = this.loadStr.split("\r").join("");
         this.bLoaded = true;
         System.useCodePage = false;
      }
      
      public function saveFile(param1:int, param2:String) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc6_:Boolean = false;
         var _loc5_:int = 0;
         _loc6_ = true;
         this.nDBPos = 0;
         switch(param1)
         {
            case Drawing.DB_OPTION:
               this.dataBase = null;
               this.dataBase = new ByteArray();
               this.writeInt(Drawing.CLIENT_VERSION);
               this.writeInt(this.draw.lib.nMusicVolume);
               this.writeInt(this.draw.lib.nEffectVolume);
               this.writeInt(this.draw.lib.nSaveMusicVolume);
               this.writeInt(this.draw.lib.nSaveEffectVolume);
               if(this.draw.lib.BMP_FILTER)
               {
                  this.writeInt(0);
               }
               else
               {
                  this.writeInt(1);
               }
               if(this.draw.player.bDrawKeyBoardInfor)
               {
                  this.writeInt(0);
               }
               else
               {
                  this.writeInt(1);
               }
               this.sharedFile = SharedObject.getLocal(param2);
               if(this.sharedFile.size > 0)
               {
                  this.sharedFile.clear();
               }
               this.sharedFile.data[0] = this.dataBase;
               this.sharedFile.flush();
               break;
            case Drawing.DB_SLOT:
               if(this.draw.bGameSave)
               {
                  this.dataBase = null;
                  this.dataBase = new ByteArray();
                  this.writeInt(Drawing.CLIENT_VERSION);
                  this.writeInt(this.draw.player.nLevel);
                  this.writeInt(this.draw.nGameLevel);
                  this.writeInt(this.draw.nTotalStarNum);
                  this.writeInt(this.draw.player.nMoney);
                  this.writeInt(this.draw.player.nGamePlayTime);
                  this.sharedFile = SharedObject.getLocal(param2);
                  if(this.sharedFile.size > 0)
                  {
                     this.sharedFile.clear();
                  }
                  this.sharedFile.data[0] = this.dataBase;
                  this.sharedFile.flush();
               }
               break;
            case Drawing.DB_GAME:
               if(this.draw.bGameSave)
               {
                  this.dataBase = null;
                  this.dataBase = new ByteArray();
                  this.writeInt(Drawing.CLIENT_VERSION);
                  this.writeInt(this.draw.player.nLevel);
                  this.writeInt(this.draw.nGameLevel);
                  this.writeInt(this.draw.nTotalStarNum);
                  this.writeInt(this.draw.player.nMoney);
                  this.writeInt(this.draw.player.nGamePlayTime);
                  this.writeInt(this.draw.player.nExp);
                  _loc3_ = 0;
                  while(_loc3_ < Player.MAX_SKILL)
                  {
                     this.writeInt(this.draw.player.HEROSKILL[_loc3_]);
                     _loc3_++;
                  }
                  this.writeInt(this.draw.player.nChapter);
                  this.writeInt(this.draw.player.nStage);
                  this.writeInt(this.draw.player.nClearChapter);
                  this.writeInt(this.draw.player.nClearStage);
                  this.writeInt(this.draw.player.nRealClearStage);
                  _loc3_ = 0;
                  while(_loc3_ < Player.MAX_STAGE * Player.MAX_CHAPTER)
                  {
                     this.writeInt(this.draw.player.STAGECLEARRESULTSTAR[_loc3_]);
                     _loc4_ = 0;
                     while(_loc4_ < 3)
                     {
                        this.writeInt(this.draw.player.STAGECLEARRESULTTIME[_loc3_ * 3 + _loc4_]);
                        _loc4_++;
                     }
                     _loc3_++;
                  }
                  _loc3_ = 0;
                  while(_loc3_ < Drawing.MAX_UNITKIND)
                  {
                     this.writeInt(this.draw.player.UNITOPEN[_loc3_]);
                     this.writeInt(this.draw.player.UNITEQUIP[_loc3_]);
                     this.writeInt(this.draw.player.UNITUPGRADE[_loc3_]);
                     _loc3_++;
                  }
                  this.writeInt(this.draw.nRingEquipLock);
                  _loc3_ = 0;
                  while(_loc3_ < Player.INVENDATA_LEVELPOS << 1)
                  {
                     this.writeInt(this.draw.player.INVENDATA[_loc3_]);
                     _loc3_++;
                  }
                  _loc3_ = 0;
                  while(_loc3_ < Player.EQUIPINVEN_LEVELPOS << 1)
                  {
                     this.writeInt(this.draw.player.EQUIPINVEN[_loc3_]);
                     this.writeInt(this.draw.player.SAVEEQUIPINVEN[_loc3_]);
                     _loc3_++;
                  }
                  _loc3_ = 0;
                  while(_loc3_ < Player.STOREDATA_LEVELPOS << 1)
                  {
                     this.writeInt(this.draw.player.STOREDATA[_loc3_]);
                     _loc3_++;
                  }
                  _loc3_ = 0;
                  while(_loc3_ < 7)
                  {
                     this.writeInt(this.draw.nTutorial[_loc3_]);
                     _loc3_++;
                  }
                  this.sharedFile = SharedObject.getLocal(param2);
                  if(this.sharedFile.size > 0)
                  {
                     this.sharedFile.clear();
                  }
                  this.sharedFile.data[0] = this.dataBase;
                  this.sharedFile.flush();
               }
         }
         return _loc6_;
      }
      
      public function loadFile(param1:int, param2:String, param3:int) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc8_:Boolean = false;
         var _loc7_:int = 0;
         _loc8_ = true;
         this.nDBPos = 0;
         switch(param1)
         {
            case Drawing.DB_OPTION:
               this.sharedFile = SharedObject.getLocal(param2);
               if(this.sharedFile.size == 0)
               {
                  _loc8_ = false;
               }
               else
               {
                  this.dataBase = null;
                  this.dataBase = new ByteArray();
                  this.dataBase = this.sharedFile.data[0];
                  _loc7_ = this.readInt();
                  this.draw.lib.nMusicVolume = this.readInt();
                  this.draw.lib.nEffectVolume = this.readInt();
                  this.draw.lib.nSaveMusicVolume = this.readInt();
                  this.draw.lib.nSaveEffectVolume = this.readInt();
                  _loc6_ = this.readInt();
                  if(_loc6_ == 0)
                  {
                     this.draw.lib.BMP_FILTER = true;
                  }
                  else
                  {
                     this.draw.lib.BMP_FILTER = false;
                  }
                  _loc6_ = this.readInt();
                  if(_loc6_ == 0)
                  {
                     this.draw.player.bDrawKeyBoardInfor = true;
                  }
                  else
                  {
                     this.draw.player.bDrawKeyBoardInfor = false;
                  }
               }
               break;
            case Drawing.DB_SLOT:
               param2 += "" + param3;
               this.sharedFile = SharedObject.getLocal(param2);
               if(this.sharedFile.size == 0)
               {
                  _loc8_ = false;
               }
               else
               {
                  this.dataBase = null;
                  this.dataBase = new ByteArray();
                  this.dataBase = this.sharedFile.data[0];
                  _loc7_ = this.readInt();
                  this.draw.player.GAME_SLOT[param3 * 6 + 1] = this.readInt();
                  this.draw.player.GAME_SLOT[param3 * 6 + 2] = this.readInt();
                  this.draw.player.GAME_SLOT[param3 * 6 + 3] = this.readInt();
                  this.draw.player.GAME_SLOT[param3 * 6 + 4] = this.readInt();
                  this.draw.player.GAME_SLOT[param3 * 6 + 5] = this.readInt();
               }
               break;
            case Drawing.DB_GAME:
               param2 += "" + param3;
               this.sharedFile = SharedObject.getLocal(param2);
               if(this.sharedFile.size == 0)
               {
                  _loc8_ = false;
               }
               else
               {
                  this.dataBase = null;
                  this.dataBase = new ByteArray();
                  this.dataBase = this.sharedFile.data[0];
                  _loc7_ = this.readInt();
                  this.draw.player.nLevel = this.readInt();
                  this.draw.nGameLevel = this.readInt();
                  this.draw.nTotalStarNum = this.readInt();
                  this.draw.player.nMoney = this.readInt();
                  this.draw.player.nGamePlayTime = this.readInt();
                  this.draw.player.nExp = this.readInt();
                  _loc4_ = 0;
                  while(_loc4_ < Player.MAX_SKILL)
                  {
                     this.draw.player.HEROSKILL[_loc4_] = this.readInt();
                     _loc4_++;
                  }
                  this.draw.player.nChapter = this.readInt();
                  this.draw.player.nStage = this.readInt();
                  this.draw.player.nClearChapter = this.readInt();
                  this.draw.player.nClearStage = this.readInt();
                  this.draw.player.nRealClearStage = this.readInt();
                  this.draw.player.nChapter = int(this.draw.player.nRealClearStage / Player.MAX_STAGE);
                  if(this.draw.player.nChapter >= Player.MAX_CHAPTER)
                  {
                     this.draw.player.nChapter = Player.MAX_CHAPTER - 1;
                  }
                  _loc4_ = 0;
                  while(_loc4_ < Player.MAX_STAGE * Player.MAX_CHAPTER)
                  {
                     this.draw.player.STAGECLEARRESULTSTAR[_loc4_] = this.readInt();
                     _loc5_ = 0;
                     while(_loc5_ < 3)
                     {
                        this.draw.player.STAGECLEARRESULTTIME[_loc4_ * 3 + _loc5_] = this.readInt();
                        _loc5_++;
                     }
                     _loc4_++;
                  }
                  _loc4_ = 0;
                  while(_loc4_ < Drawing.MAX_UNITKIND)
                  {
                     this.draw.player.UNITOPEN[_loc4_] = this.readInt();
                     this.draw.player.UNITEQUIP[_loc4_] = this.readInt();
                     this.draw.player.UNITUPGRADE[_loc4_] = this.readInt();
                     _loc4_++;
                  }
                  this.draw.nRingEquipLock = this.readInt();
                  _loc4_ = 0;
                  while(_loc4_ < Player.INVENDATA_LEVELPOS << 1)
                  {
                     this.draw.player.INVENDATA[_loc4_] = this.readInt();
                     _loc4_++;
                  }
                  _loc4_ = 0;
                  while(_loc4_ < Player.EQUIPINVEN_LEVELPOS << 1)
                  {
                     this.draw.player.EQUIPINVEN[_loc4_] = this.readInt();
                     this.draw.player.SAVEEQUIPINVEN[_loc4_] = this.readInt();
                     _loc4_++;
                  }
                  _loc4_ = 0;
                  while(_loc4_ < Player.STOREDATA_LEVELPOS << 1)
                  {
                     this.draw.player.STOREDATA[_loc4_] = this.readInt();
                     _loc4_++;
                  }
                  _loc4_ = 0;
                  while(_loc4_ < 7)
                  {
                     this.draw.nTutorial[_loc4_] = this.readInt();
                     _loc4_++;
                  }
               }
         }
         return _loc8_;
      }
      
      public function readByte(param1:ByteArray) : int
      {
         var _loc2_:int = 0;
         _loc2_ = int(param1[this.nPos]);
         ++this.nPos;
         return _loc2_;
      }
      
      public function readBytesString(param1:ByteArray, param2:int, param3:int) : String
      {
         var _loc4_:int = 0;
         var _loc6_:ByteArray = null;
         var _loc5_:String = null;
         _loc6_ = new ByteArray();
         _loc4_ = 0;
         while(_loc4_ < param2)
         {
            _loc6_[_loc4_] = param1[param3 + _loc4_];
            _loc4_++;
         }
         return _loc6_.toString();
      }
      
      public function readInt16(param1:ByteArray) : int
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         _loc2_ += (param1[this.nPos] & 0x7F) << 8;
         _loc2_ += param1[this.nPos + 1] & 0xFF;
         if((param1[this.nPos] & 0x80) == 128)
         {
            _loc2_ *= -1;
         }
         this.nPos += 2;
         return _loc2_;
      }
      
      public function readInt() : int
      {
         var _loc1_:int = 0;
         _loc1_ = this.readInt32Len(this.dataBase,this.nDBPos);
         this.nDBPos += this.nIntSize;
         return _loc1_;
      }
      
      public function readInt32Len(param1:ByteArray, param2:int) : int
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         _loc4_ = 0;
         _loc3_ = 0;
         while(_loc3_ < 4)
         {
            _loc4_ += (param1[param2 + _loc3_] & 0xFF) << (_loc3_ << 3);
            _loc3_++;
         }
         return _loc4_;
      }
      
      public function writeInt(param1:int) : void
      {
         this.writeInt32Len(this.dataBase,this.nDBPos,param1);
         this.nDBPos += this.nIntSize;
      }
      
      public function writeInt32Len(param1:ByteArray, param2:int, param3:int) : void
      {
         var _loc4_:int = 0;
         _loc4_ = 0;
         while(_loc4_ < 4)
         {
            param1[param2 + _loc4_] = param3 >> (_loc4_ << 3) & 0xFF;
            _loc4_++;
         }
      }
      
      public function writeBoolean(param1:Boolean) : void
      {
         if(param1)
         {
            this.writeInt32Len(this.dataBase,this.nDBPos,0);
         }
         else
         {
            this.writeInt32Len(this.dataBase,this.nDBPos,1);
         }
         this.nDBPos += this.nIntSize;
      }
      
      public function readBoolean() : Boolean
      {
         var _loc1_:int = 0;
         _loc1_ = this.readInt32Len(this.dataBase,this.nDBPos);
         this.nDBPos += this.nIntSize;
         if(_loc1_ == 0)
         {
            return true;
         }
         return false;
      }
      
      public function setStrMoney(param1:int) : String
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:String = null;
         var _loc7_:String = null;
         _loc4_ = 0;
         _loc5_ = 3;
         _loc6_ = "" + param1;
         _loc7_ = "";
         _loc4_ = int((_loc6_.length - 1) / 3);
         if(_loc4_ > 0)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc4_)
            {
               _loc3_ = _loc6_.length - _loc5_ * (_loc2_ + 1);
               _loc7_ = "/" + _loc6_.substr(_loc3_,3) + _loc7_;
               _loc2_++;
            }
            _loc7_ = _loc6_.substr(0,_loc3_) + _loc7_;
         }
         else
         {
            _loc7_ = _loc6_;
         }
         return _loc7_;
      }
      
      public function drawGrayImg(param1:int, param2:int, param3:int, param4:int) : void
      {
         var _loc5_:BitmapData = null;
         var _loc6_:int = 0;
         var _loc7_:ByteArray = null;
         var _loc8_:Rectangle = null;
         var _loc9_:Matrix = null;
         var _loc10_:int = 0;
         _loc5_ = new BitmapData(this.IMAGE[param1].nW,this.IMAGE[param1].nH,true,0);
         _loc7_ = new ByteArray();
         _loc8_ = new Rectangle(0,0,this.IMAGE[param1].nW,this.IMAGE[param1].nH);
         _loc7_ = this.IMAGE[param1].img.getPixels(_loc8_);
         _loc7_.position = 0;
         _loc6_ = 0;
         while(_loc6_ < _loc7_.length)
         {
            if(_loc7_[_loc6_] != 0)
            {
               _loc10_ = (_loc7_[_loc6_ + 1] + _loc7_[_loc6_ + 2] + _loc7_[_loc6_ + 3]) / 3;
               _loc7_[_loc6_ + 1] = _loc10_;
               _loc7_[_loc6_ + 2] = _loc10_;
               _loc7_[_loc6_ + 3] = _loc10_;
            }
            _loc6_ += 4;
         }
         _loc5_.setPixels(_loc8_,_loc7_);
         _loc9_ = new Matrix();
         param2 -= this.getHorAlign(this.IMAGE[param1].nOrgW,param4);
         param3 -= this.getVerAlign(this.IMAGE[param1].nOrgH,param4);
         if(!this.bDrawImg(param2 + this.IMAGE[param1].nX,param3 + this.IMAGE[param1].nY,this.IMAGE[param1].nW,this.IMAGE[param1].nH))
         {
            return;
         }
         _loc9_.translate(param2 + this.IMAGE[param1].nX,param3 + this.IMAGE[param1].nY);
         this.draw.backBuffer.bitmapData.draw(_loc5_,_loc9_,null,null,null,this.BMP_FILTER);
         _loc5_.dispose();
         _loc9_ = null;
      }
      
      public function drawFillGray() : void
      {
         var _loc1_:int = 0;
         var _loc2_:ByteArray = null;
         var _loc3_:Rectangle = null;
         var _loc4_:int = 0;
         _loc2_ = new ByteArray();
         _loc3_ = new Rectangle(0,0,this.draw.nLcdW,this.draw.nLcdH);
         _loc2_ = this.draw.backBuffer.bitmapData.getPixels(_loc3_);
         _loc2_.position = 0;
         _loc1_ = 0;
         while(_loc1_ < _loc2_.length)
         {
            _loc2_[_loc1_] = 255;
            _loc4_ = (_loc2_[_loc1_ + 1] + _loc2_[_loc1_ + 2] + _loc2_[_loc1_ + 3]) / 3;
            _loc2_[_loc1_ + 1] = _loc4_;
            _loc2_[_loc1_ + 2] = _loc4_;
            _loc2_[_loc1_ + 3] = _loc4_;
            _loc1_ += 4;
         }
         this.draw.backBuffer.bitmapData.setPixels(_loc3_,_loc2_);
      }
      
      public function drawOptics(param1:int, param2:int, param3:int, param4:int) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:Array = null;
         var _loc12_:Array = null;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         _loc11_ = new Array();
         _loc12_ = new Array();
         var _loc13_:ByteArray = new ByteArray();
         var _loc14_:Rectangle = new Rectangle(0,0,this.IMAGE[param1].nW,this.IMAGE[param1].nH);
         param2 -= this.getHorAlign(this.IMAGE[param1].nOrgW,param4);
         param3 -= this.getVerAlign(this.IMAGE[param1].nOrgH,param4);
         if(!this.bDrawImg(param2 + this.IMAGE[param1].nX,param3 + this.IMAGE[param1].nY,this.IMAGE[param1].nW,this.IMAGE[param1].nH))
         {
            return;
         }
         _loc7_ = _loc8_ = 0;
         _loc9_ = int(this.IMAGE[param1].nW);
         _loc10_ = int(this.IMAGE[param1].nH);
         if(param2 < 0)
         {
            _loc7_ -= param2;
            param2 = 0;
         }
         if(param3 < 0)
         {
            _loc8_ -= param3;
            param3 = 0;
         }
         if(param2 + (_loc9_ - _loc7_) > this.draw.nLcdW)
         {
            _loc9_ -= param2 + (_loc9_ - _loc7_) - this.draw.nLcdW;
         }
         if(param3 + (_loc10_ - _loc8_) > this.draw.nLcdH)
         {
            _loc10_ -= param3 + (_loc10_ - _loc8_) - this.draw.nLcdH;
         }
         _loc5_ = _loc8_;
         while(_loc5_ < _loc10_)
         {
            _loc6_ = _loc7_;
            while(_loc6_ < _loc9_)
            {
               _loc11_[(_loc5_ - _loc8_) * (_loc9_ - _loc7_) + (_loc6_ - _loc7_)] = (_loc5_ - _loc8_) * (_loc9_ - _loc7_) + (_loc6_ - _loc7_);
               _loc6_++;
            }
            _loc5_++;
         }
         _loc5_ = _loc8_;
         while(_loc5_ < _loc10_ - 1)
         {
            _loc6_ = _loc7_;
            while(_loc6_ < _loc9_ - 1)
            {
               _loc15_ = (this.IMAGE[param1].img.getPixel(_loc6_ + 1,_loc5_) & 0xFF) - this.IMAGE[param1].img.getPixel(_loc6_,_loc5_) & 0xFF;
               _loc16_ = (this.IMAGE[param1].img.getPixel(_loc6_,_loc5_ + 1) & 0xFF) - this.IMAGE[param1].img.getPixel(_loc6_,_loc5_) & 0xFF;
               _loc15_ += _loc6_ - _loc7_;
               _loc16_ = (_loc16_ >> 1) + (_loc5_ - _loc8_);
               if(_loc15_ < 0)
               {
                  _loc15_ = 0;
               }
               if(_loc15_ >= _loc9_ - _loc7_)
               {
                  _loc15_ = _loc9_ - _loc7_;
               }
               if(_loc16_ < 0)
               {
                  _loc16_ = 0;
               }
               if(_loc16_ >= _loc10_ - _loc8_)
               {
                  _loc16_ = _loc10_ - _loc8_;
               }
               _loc11_[(_loc5_ - _loc8_) * (_loc9_ - _loc7_) + (_loc6_ - _loc7_)] = _loc16_ * (_loc9_ - _loc7_) + _loc15_;
               _loc6_++;
            }
            _loc5_++;
         }
         param2 += this.IMAGE[param1].nX;
         param3 += this.IMAGE[param1].nY;
         _loc5_ = param3;
         while(_loc5_ < param3 + (_loc10_ - _loc8_))
         {
            _loc6_ = param2;
            while(_loc6_ < param2 + (_loc9_ - _loc7_))
            {
               _loc12_[(_loc5_ - param3) * (_loc9_ - _loc7_) + (_loc6_ - param2)] = this.draw.backBuffer.bitmapData.getPixel(_loc6_,_loc5_);
               _loc6_++;
            }
            _loc5_++;
         }
         _loc5_ = param3;
         while(_loc5_ < param3 + (_loc10_ - _loc8_))
         {
            _loc6_ = param2;
            while(_loc6_ < param2 + (_loc9_ - _loc7_))
            {
               if(_loc11_[(_loc5_ - param3) * (_loc9_ - _loc7_) + (_loc6_ - param2)] >= 0 && _loc11_[(_loc5_ - param3) * (_loc9_ - _loc7_) + (_loc6_ - param2)] < _loc12_.length)
               {
                  this.draw.backBuffer.bitmapData.setPixel(_loc6_,_loc5_,_loc12_[_loc11_[(_loc5_ - param3) * (_loc9_ - _loc7_) + (_loc6_ - param2)]]);
               }
               _loc6_++;
            }
            _loc5_++;
         }
      }
   }
}

